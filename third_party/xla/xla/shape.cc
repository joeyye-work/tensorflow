/* Copyright 2018 The OpenXLA Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include "xla/shape.h"

#include <algorithm>
#include <cstdint>
#include <optional>
#include <ostream>
#include <string>
#include <utility>
#include <vector>

#include "absl/algorithm/container.h"
#include "absl/container/inlined_vector.h"
#include "absl/log/check.h"
#include "absl/log/log.h"
#include "absl/types/span.h"
#include "xla/layout.h"
#include "xla/layout_util.h"
#include "xla/primitive_util.h"
#include "xla/printer.h"
#include "xla/shape_util.h"
#include "xla/status_macros.h"
#include "xla/tsl/platform/logging.h"  // IWYU pragma: keep
#include "xla/tsl/platform/statusor.h"
#include "xla/util.h"
#include "xla/xla_data.pb.h"

namespace xla {

DynExpr* ExprFromProto(const ExpressionProto& proto) {
  switch (proto.node_type_case()) {
    case ExpressionProto::kConstantValue:
      return DynExpr::_(proto.constant_value());

    case ExpressionProto::kVariableId:
      return DynExpr::V(proto.variable_id());

    case ExpressionProto::kAddNode: {
      const auto& add = proto.add_node();
      return *ExprFromProto(add.lhs()) + *ExprFromProto(add.rhs());
    }

    case ExpressionProto::kSubNode: {
      const auto& sub = proto.sub_node();
      return *ExprFromProto(sub.lhs()) - *ExprFromProto(sub.rhs());
    }

    case ExpressionProto::kMulNode: {
      const auto& mul = proto.mul_node();
      return *ExprFromProto(mul.lhs()) * *ExprFromProto(mul.rhs());
    }

    case ExpressionProto::kDivNode: {
      const auto& div = proto.div_node();
      return *ExprFromProto(div.lhs()) / *ExprFromProto(div.rhs());
    }

    case ExpressionProto::NODE_TYPE_NOT_SET:
    default:
      return nullptr;
  }
}

DynExpr* operator*(DynExpr& lhs, DynExpr& rhs) { return new Mul(&lhs, &rhs); }
DynExpr* operator*(int64_t k, DynExpr& rhs) {
  return new Mul(DynExpr::_(k), &rhs);
}
DynExpr* operator/(DynExpr& lhs, DynExpr& rhs) { return new Div(&lhs, &rhs); }
DynExpr* operator/(DynExpr& lhs, int64_t d) {
  return new Div(&lhs, DynExpr::_(d));
}
DynExpr* operator+(DynExpr& lhs, DynExpr& rhs) { return new Add(&lhs, &rhs); }
DynExpr* operator+(DynExpr& lhs, int64_t d) {
  return new Add(&lhs, DynExpr::_(d));
}
DynExpr* operator-(DynExpr& lhs, DynExpr& rhs) { return new Sub(&lhs, &rhs); }
DynExpr* operator-(DynExpr& lhs, int64_t d) {
  return new Sub(&lhs, DynExpr::_(d));
}
bool operator==(DynExpr& lhs, DynExpr& rhs) {
  return DynExpr::equal(&lhs, &rhs);
}
bool operator==(DynExpr& lhs, int64_t d) {
  return DynExpr::equal(&lhs, DynExpr::_(d));
}
bool operator<(DynExpr& lhs, int64_t d) {
  return lhs.is_constant() && lhs.get_val() < d;
}

bool DynExpr::equal(DynExpr* expr1, DynExpr* expr2) {
  auto e1 = expr1->s();
  auto e2 = expr2->s();
  if (e1 == nullptr || e2 == nullptr) return false;
  Constant* c1 = dynamic_cast<Constant*>(e1);
  Constant* c2 = dynamic_cast<Constant*>(e2);
  if (c1 && c2) return c1->get_val() == c2->get_val();
  // Var x = Var y <=> x = y
  if (Variable* varx = dynamic_cast<Variable*>(e1),
      *vary = dynamic_cast<Variable*>(e2);
      varx && vary) {
    return varx->get_id() == vary->get_id();
  }
  // a * b = c * d <=> (a = c /\ b = d) \/ (a = d /\ b = c)
  if (Mul* ab = dynamic_cast<Mul*>(e1), *cd = dynamic_cast<Mul*>(e2);
      ab && cd) {
    auto a = ab->get_lhs();
    auto b = ab->get_rhs();
    auto c = cd->get_lhs();
    auto d = cd->get_rhs();
    return (*a == *c && *b == *d) || (*a == *d && *b == *c);
  }
  // a / b = c / d <=> (a = c /\ b = d)
  if (Div* ab = dynamic_cast<Div*>(e1), *cd = dynamic_cast<Div*>(e2);
      ab && cd) {
    auto a = ab->get_lhs();
    auto b = ab->get_rhs();
    auto c = cd->get_lhs();
    auto d = cd->get_rhs();
    return *a == *c && *b == *d;
  }
  // a + b = c + d <=> (a = c /\ b = d) \/ (a = d /\ b = c)
  if (Add* ab = dynamic_cast<Add*>(e1), *cd = dynamic_cast<Add*>(e2);
      ab && cd) {
    auto a = ab->get_lhs();
    auto b = ab->get_rhs();
    auto c = cd->get_lhs();
    auto d = cd->get_rhs();
    return (*a == *c && *b == *d) || (*a == *d && *b == *c);
  }
  // a - b = c - d <=> (a = c /\ b = d)
  if (Sub* ab = dynamic_cast<Sub*>(e1), *cd = dynamic_cast<Sub*>(e2);
      ab && cd) {
    auto* a = ab->get_lhs();
    auto* b = ab->get_rhs();
    auto* c = cd->get_lhs();
    auto* d = cd->get_rhs();
    return *a == *c && *b == *d;
  }
  return false;
}

// Simplification methods
DynExpr* Constant::s() { return this; }

DynExpr* Variable::s() { return this; }

DynExpr* Mul::s() {
  DynExpr* s_lhs = get_lhs()->s();
  DynExpr* s_rhs = get_rhs()->s();
  Constant* l = dynamic_cast<Constant*>(s_lhs);
  Constant* r = dynamic_cast<Constant*>(s_rhs);
  // constant * constant
  if (l && r) return DynExpr::_(l->get_val() * r->get_val());
  // 0 * X = 0
  if (l && l->get_val() == 0) return DynExpr::zero;
  // 1 * X = X
  if (l && l->get_val() == 1) return s_rhs;
  // X * 1 = X
  if (r && r->get_val() == 1) return s_lhs;
  // X * constant = constant * X
  if (r && s_lhs->is_dynamic()) return (r->get_val() * *s_lhs)->s();
  // m * (nX) = (m*n) * X
  if (Mul* nX = dynamic_cast<Mul*>(s_rhs)) {
    DynExpr* X = nX->get_rhs();
    Constant* n = dynamic_cast<Constant*>(nX->get_lhs());
    if (l && n) {
      auto mn = l->get_val() * n->get_val();
      return (mn * *X)->s();
    }
  }
  return (*s_lhs) * (*s_rhs);
}

DynExpr* Add::s() {
  DynExpr* s_lhs = get_lhs()->s();
  DynExpr* s_rhs = get_rhs()->s();
  Constant* l = dynamic_cast<Constant*>(s_lhs);
  Constant* r = dynamic_cast<Constant*>(s_rhs);
  // constant + constant
  if (l && r) return DynExpr::_(l->get_val() + r->get_val());
  // 0 + X = X
  if (l && l->get_val() == 0) return s_rhs;
  // X + 0 = X
  if (r && r->get_val() == 0) return s_lhs;
  // m + X = X + m
  if (l && s_rhs->is_dynamic()) return (*s_rhs + l->get_val())->s();
  // X + X = 2 * X
  if (*s_lhs == *s_rhs) {
    return (2 * (*s_rhs))->s();
  }
  // nX + X = (n+1) * X
  if (Mul* nX = dynamic_cast<Mul*>(s_lhs)) {
    DynExpr* n = nX->get_lhs();
    DynExpr* X = nX->get_rhs();
    if (*X == *s_rhs) {
      return (*(*n + 1) * (*X))->s();
    }
  }
  // X + nX = (n+1) * X
  if (Mul* nX = dynamic_cast<Mul*>(s_rhs)) {
    DynExpr* n = nX->get_lhs();
    DynExpr* X = nX->get_rhs();
    if (*X == *s_lhs) {
      return (*(*n + 1) * (*X))->s();
    }
  }
  // mX + nX = (m+n) * X
  if (Mul* mX = dynamic_cast<Mul*>(s_lhs), *nY = dynamic_cast<Mul*>(s_rhs);
      mX && nY) {
    DynExpr* m = mX->get_lhs();
    DynExpr* X = mX->get_rhs();
    DynExpr* n = nY->get_lhs();
    DynExpr* Y = nY->get_rhs();
    if (*X == *Y) {
      return (*(*m + *n) * (*X))->s();
    }
  }
  // (X + Y) + Z = X + (Y + Z)
  if (Add* XY = dynamic_cast<Add*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*X + *(*Y + *s_rhs))->s();
  }
  // (X - Y) + Z = X - (Y - Z)
  if (Sub* XY = dynamic_cast<Sub*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*X - *(*Y - *s_rhs))->s();
  }
  return *s_lhs + *s_rhs;
}

DynExpr* Sub::s() {
  if (!get_lhs()){
    LOG(INFO) << "NO LEFT";
  }
  
  if (!get_rhs()){
    LOG(INFO) << "NO RIGHT";
  }
  DynExpr* s_lhs = get_lhs()->s();
  DynExpr* s_rhs = get_rhs()->s();
  Constant* l = dynamic_cast<Constant*>(s_lhs);
  Constant* r = dynamic_cast<Constant*>(s_rhs);
  // constant - constant
  if (l && r) return DynExpr::_(l->get_val() - r->get_val());
  // X - 0 = X
  if (r && r->get_val() == 0) return s_lhs;
  // X - X = 0
  if (*s_lhs == *s_rhs) {
    return DynExpr::zero;
  }
  // mX - nX = (m-n) * X
  if (Mul* mX = dynamic_cast<Mul*>(s_lhs), *nY = dynamic_cast<Mul*>(s_rhs);
      mX && nY) {
    DynExpr* m = mX->get_lhs();
    DynExpr* X = mX->get_rhs();
    DynExpr* n = nY->get_lhs();
    DynExpr* Y = nY->get_rhs();
    if (*X == *Y) {
      return (*(*m - *n) * (*X))->s();
    }
  }
  // (X + Y) - X = X + (Y - Z)
  if (Add* XY = dynamic_cast<Add*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*X + *(*Y - *s_rhs))->s();
  }
  // (X - Y) - Z = X - (Y + Z)
  if (Sub* XY = dynamic_cast<Sub*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*X - *(*Y + *s_rhs))->s();
  }
  return *s_lhs - *s_rhs;
}

DynExpr* Div::s() {
  DynExpr* s_lhs = get_lhs()->s();
  DynExpr* s_rhs = get_rhs()->s();
  Constant* l = dynamic_cast<Constant*>(s_lhs);
  Constant* r = dynamic_cast<Constant*>(s_rhs);
  // constant / constant
  if (l && r) return DynExpr::_(l->get_val() / r->get_val());
  // X / 1 = X
  if (r && r->get_val() == 1) return s_lhs;
  // (X + Y) / Z = (X/Z) + (Y/Z)
  if (Add* XY = dynamic_cast<Add*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*((*X) / (*s_rhs)) + *((*Y) / (*s_rhs)))->s();
  }
  // (X * Y) / Z = (X/Z) * Y
  if (Mul* XY = dynamic_cast<Mul*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*(*X / (*s_rhs)) * (*Y))->s();
  }
  // (X / Y) / Z = X / (Y*Z)
  if (Div* XY = dynamic_cast<Div*>(s_lhs)) {
    DynExpr* X = XY->get_lhs();
    DynExpr* Y = XY->get_rhs();
    return (*X / *(*Y * *s_rhs))->s();
  }
  return *s_lhs / *s_rhs;
}

std::ostream& operator<<(std::ostream& os, DynExpr* expr) {
  ExpressionProto proto;
  expr->to_proto(&proto);
  os << proto.ShortDebugString();
  return os;
}

DynExpr* DynExpr::zero = new Constant(0);
DynExpr* DynExpr::one = new Constant(1);

// Defined in .cc file to avoid inlining these large routines
Shape::Shape() = default;
Shape::~Shape() = default;
Shape::Shape(const Shape&) = default;
Shape::Shape(Shape&&) noexcept = default;
Shape& Shape::operator=(const Shape&) = default;
Shape& Shape::operator=(Shape&&) noexcept = default;

Shape::Shape(const PrimitiveType element_type) {
  CHECK(element_type == TOKEN || element_type == OPAQUE_TYPE ||
        element_type == BUFFER)
      << "Invalid element type for token or opaque shape: " << element_type_;
  set_element_type(element_type);
}

Shape::Shape(const PrimitiveType element_type,
             const absl::Span<const int64_t> dimensions,
             const absl::Span<const bool> dynamic_dimensions) {
  CHECK(primitive_util::IsArrayType(element_type))
      << "Invalid element type for array shape: " << element_type;
  if (!dynamic_dimensions.empty()) {
    CHECK_EQ(dimensions.size(), dynamic_dimensions.size())
        << "If dynamic_dimensions is provided, it must have the same size as "
           "dimensions.";
  }

  set_element_type(element_type);
  auto& state = array_state();
  state.dimensions = {dimensions.begin(), dimensions.end()};
  if (dynamic_dimensions.empty()) {
    // Assume all dimensions are static.
    state.dynamic_dimensions.resize(dimensions.size(), false);
  } else {
    state.dynamic_dimensions = absl::InlinedVector<bool, InlineRank()>(
        dynamic_dimensions.begin(), dynamic_dimensions.end());
  }
}

Shape::Shape(std::vector<Shape> tuple_shapes) {
  set_element_type(TUPLE);
  tuple_state().tuple_shapes = std::move(tuple_shapes);
}

/* static */ Shape Shape::MakeBufferShape(Shape element_shape) {
  CHECK(element_shape.IsArray())
      << "element_shape must be an array shape to create a buffer shape.";
  Shape shape(BUFFER);
  shape.buffer_state().buffer_shape = {std::move(element_shape)};
  return shape;
}

Shape::Shape(const ShapeProto& shape_proto) {
  *this = FromProto(shape_proto).value_or(Shape());
}

absl::StatusOr<Shape> Shape::FromProto(const ShapeProto& shape_proto) {

  // LOG(INFO) << "FROM PROTO:\n" << shape_proto.DebugString() << std::endl;

  Shape shape;
  shape.set_element_type(shape_proto.element_type());
  if (auto* const state = shape.if_array_state()) {
    const int num_dims = shape_proto.dimensions_size();
    const int num_is_dynamic_dims = shape_proto.is_dynamic_dimension_size();
    const int num_expressions = shape_proto.expressions_size();
    state->dimensions.reserve(num_dims);
    state->dynamic_dimensions.reserve(num_dims);
    state->expressions.reserve(num_dims);
    if (num_is_dynamic_dims != 0) {
      TF_RET_CHECK(num_dims == num_is_dynamic_dims)
          << "Malformed shape proto: number of is_dynamic_dimension "
             "fields ("
          << num_is_dynamic_dims << ") does not match number of dimension "
          << "fields (" << num_dims << ").";
    }
    if (num_expressions != 0) {
      TF_RET_CHECK(num_dims == num_expressions)
          << "Malformed shape proto: number of expressions "
             "fields ("
          << num_expressions << ") does not match number of dimension "
          << "fields (" << num_dims << ").";
    }
    for (int i = 0; i < num_dims; ++i) {
      const bool is_dynamic =
          (i < num_is_dynamic_dims) && shape_proto.is_dynamic_dimension(i);
      // We don't want to crash due to a malformed proto, so use
      // UnsafeAddDimension. We expect that the caller will eventually call a
      // validation routine that will detect the error in case the dimension
      // value is invalid.
      DynExpr* expression = (i < num_expressions)
                                ? ExprFromProto(shape_proto.expressions(i))
                                : DynExpr::_(-30);
      shape.UnsafeAddDimension(shape_proto.dimensions(i), is_dynamic,
                               expression);
    }
  } else if (auto* const state = shape.if_tuple_state()) {
    state->tuple_shapes.reserve(shape_proto.tuple_shapes_size());
    for (const ShapeProto& element_shape : shape_proto.tuple_shapes()) {
      TF_ASSIGN_OR_RETURN(Shape tuple_shape, Shape::FromProto(element_shape));
      state->tuple_shapes.emplace_back(std::move(tuple_shape));
    }
  } else if (auto* const state = shape.if_buffer_state()) {
    state->buffer_shape.emplace_back(shape_proto.tuple_shapes(0));
  }
  if (shape_proto.has_layout()) {
    TF_RET_CHECK(shape.IsArray()) << "Malformed shape proto: element_type "
                                  << PrimitiveType_Name(shape.element_type())
                                  << " should not have a layout.";
    TF_ASSIGN_OR_RETURN(*shape.mutable_layout(),
                        Layout::FromProto(shape_proto.layout()));
  }
  // LOG(INFO) << "FROM PROTO " << shape << "\n";
  return shape;
}

ShapeProto Shape::ToProto() const {
  ShapeProto proto;
  proto.set_element_type(element_type_);

  // LOG(INFO) << "TO PROTO " << ToString() << "\n";

  if (const auto* const state = if_array_state()) {
    proto.mutable_dimensions()->Reserve(state->dimensions.size());
    for (const int64_t dimension : state->dimensions) {
      proto.add_dimensions(dimension);
    }
    for (const bool dynamic : state->dynamic_dimensions) {
      proto.add_is_dynamic_dimension(dynamic);
    }
    for (const DynExpr* e : state->expressions) {
      ExpressionProto* eproto = proto.add_expressions();
      CHECK(e != nullptr) << "Missing expression in expression list.";
      e->to_proto(eproto);
    }
    if (state->layout.has_value()) {
      *proto.mutable_layout() = state->layout->ToProto();
    }
  } else if (const auto* const state = if_tuple_state()) {
    proto.mutable_tuple_shapes()->Reserve(state->tuple_shapes.size());
    for (const Shape& shape : state->tuple_shapes) {
      *proto.add_tuple_shapes() = shape.ToProto();
    }
  } else if (const auto* const state = if_buffer_state()) {
    proto.mutable_tuple_shapes()->Reserve(1);
    *proto.add_tuple_shapes() = state->buffer_shape[0].ToProto();
  }
  // LOG(INFO) << "DEBUG VIEW:\n" << proto.DebugString() << std::endl;
  return proto;
}

const Shape::ArrayState& Shape::array_state() const {
  const auto* const state = if_array_state();
  CHECK(state) << "Expected an array shape. Got " << ToString()
               << "\nThis is a programmer error. Please read "
                  "the Shape object's array properties (e.g. dimensions) "
                  "only when it's an array shape.";
  return *state;
}

Shape::ArrayState& Shape::array_state() {
  auto* const state = if_array_state();
  CHECK(state) << "Expected an array shape. Got " << ToString()
               << "\nThis is a programmer error. Please mutate "
                  "the Shape object's array properties (e.g. dimensions) "
                  "only when it's an array shape.";
  return *state;
}

const Shape::TupleState& Shape::tuple_state() const {
  const auto* const state = if_tuple_state();
  CHECK(state) << "Expected a tuple shape. Got " << ToString()
               << "\nThis is a programmer error. Please read "
                  "the Shape object's tuple properties (e.g. tuple_shapes) "
                  "only when it's a tuple shape.";
  return *state;
}

Shape::TupleState& Shape::tuple_state() {
  auto* const state = if_tuple_state();
  CHECK(state) << "Expected a tuple shape. Got " << ToString()
               << "\nThis is a programmer error. Please mutate "
                  "the Shape object's tuple properties (e.g. tuple_shapes) "
                  "only when it's a tuple shape.";
  return *state;
}

const Shape::BufferState& Shape::buffer_state() const {
  const auto* const state = if_buffer_state();
  CHECK(state) << "Expected a buffer shape. Got " << ToString()
               << "\nThis is a programmer error. Please read "
                  "the Shape object's buffer properties (e.g. buffer_shapes) "
                  "only when it's a buffer shape.";
  return *state;
}

Shape::BufferState& Shape::buffer_state() {
  auto* const state = if_buffer_state();
  CHECK(state) << "Expected a buffer shape. Got " << ToString()
               << "\nThis is a programmer error. Please mutate "
                  "the Shape object's buffer properties (e.g. buffer_shapes) "
                  "only when it's a buffer shape.";
  return *state;
}

void Shape::Print(Printer* printer, bool print_layout) const {
  if (print_layout) {
    ShapeUtil::PrintHumanStringWithLayout(printer, *this);
  } else {
    ShapeUtil::PrintHumanString(printer, *this);
  }
}

std::string Shape::ToString(bool print_layout) const {
  if (print_layout) {
    return ShapeUtil::HumanStringWithLayout(*this);
  } else {
    return ShapeUtil::HumanString(*this);
  }
}

bool Shape::AreAllLeavesIntegers() const {
  if (const auto* const state = if_tuple_state()) {
    return absl::c_all_of(state->tuple_shapes, [](const Shape& s) {
      return s.AreAllLeavesIntegers();
    });
  }
  return primitive_util::IsIntegralType(element_type());
}

void Shape::add_dimensions(int64_t value, bool is_dynamic, DynExpr* expr) {
  if (value < 0) {
    CHECK(is_dynamic) << "static dimension must have size >= 0 instead of "
                      << value << ".";
    CHECK_EQ(value, kUnboundedSize)
        << "dynamic dimension must have size == kUnboundedSize or >= 0.";
  }
  UnsafeAddDimension(value, is_dynamic, expr);
}

void Shape::set_dynamic_dimension(int dimension, bool is_dynamic) {
  auto& state = array_state();
  // Ensure that the dimension size is valid for the new dynamic-ness.
  CheckDimensionSize(dimension, state.dimensions[dimension], is_dynamic);
  state.dynamic_dimensions[dimension] = is_dynamic;
}

void Shape::set_expression(int dimension, DynExpr* e) {
  auto& state = array_state();
  state.expressions[dimension] = e;
}

void Shape::set_expressions(std::vector<DynExpr*> exps) {
  auto& state = array_state();
  state.expressions.clear();
  for (auto e : exps){
    state.expressions.push_back(e);
  }
}

void Shape::set_dimensions(int index, int64_t size,
                           std::optional<bool> is_dynamic) {
  auto& state = array_state();
  const bool dynamic =
      is_dynamic.has_value() ? *is_dynamic : state.dynamic_dimensions[index];
  CheckDimensionSize(index, size, dynamic);
  state.dimensions[index] = size;
  state.dynamic_dimensions[index] = dynamic;
  state.expressions[index] = DynExpr::_(size);
}

void Shape::set_dimensions_minor(int index, int64_t size,
                                 std::optional<bool> is_dynamic) {
  const int physical_index = layout().minor_to_major(index);
  set_dimensions(physical_index, size, is_dynamic);
}

void Shape::CheckDimensionSize(int dim_index, int64_t size, bool is_dynamic) {
  if (is_dynamic) {
    if (size < 0) {
      CHECK_EQ(size, kUnboundedSize) << "the " << dim_index
                                     << "-th dimension is dynamic and must "
                                        "have size == kUnboundedSize or >= 0.";
    }
  } else {
    CHECK_GE(size, 0) << "the " << dim_index
                      << "-th dimension is static and must have size >= 0.";
  }
}

void Shape::UnsafeAddDimension(int64_t value, bool is_dynamic, DynExpr* exp) {
  auto& state = array_state();
  CHECK_EQ(state.dimensions.size(), state.dynamic_dimensions.size())
      << "where the shape is " << ToString();
  CHECK_EQ(state.dimensions.size(), state.expressions.size())
      << "where the shape is " << ToString();
  state.dimensions.push_back(value);
  state.dynamic_dimensions.push_back(is_dynamic);
  state.expressions.push_back(exp);
}

bool Shape::is_static() const {
  if (const auto* const state = if_tuple_state()) {
    return absl::c_all_of(state->tuple_shapes,
                          [](const Shape& s) { return s.is_static(); });
  }
  if (const auto* const state = if_array_state()) {
    return !absl::c_any_of(state->dynamic_dimensions, [](bool b) { return b; });
  }
  return true;
}

bool Shape::is_unbounded_dynamic() const {
  if (const auto* const state = if_tuple_state()) {
    return absl::c_any_of(state->tuple_shapes, [](const Shape& subshape) {
      return subshape.is_unbounded_dynamic();
    });
  }
  if (const auto* const state = if_array_state()) {
    return absl::c_any_of(state->dimensions,
                          [](int64_t dim) { return dim == kUnboundedSize; });
  }
  return false;
}

bool Shape::is_bounded_dynamic() const {
  if (const auto* const state = if_tuple_state()) {
    return absl::c_any_of(state->tuple_shapes, [](const Shape& subshape) {
      return subshape.is_bounded_dynamic();
    });
  }
  if (const auto* const state = if_array_state()) {
    for (auto i = 0; i < state->dimensions.size(); ++i) {
      if (is_bounded_dynamic_dimension(i)) return true;
    }
    return false;
  }
  return false;
}

void Shape::DeleteDimension(int64_t dim_to_delete) {
  auto& state = array_state();
  CHECK_GE(dim_to_delete, 0);
  CHECK_LT(dim_to_delete, state.dimensions.size());
  state.dimensions.erase(state.dimensions.begin() + dim_to_delete);
  state.dynamic_dimensions.erase(state.dynamic_dimensions.begin() +
                                 dim_to_delete);
  state.expressions.erase(state.expressions.begin() +
                                 dim_to_delete);
  if (LayoutUtil::HasLayout(*this)) {
    state.layout->DeleteDimension(dim_to_delete);  // NOLINT: optional-access
  }
}

void Shape::DeleteDimensions(absl::Span<const int64_t> dims_to_delete) {
  auto& state = array_state();
  std::vector<int64_t> sorted_dims_to_delete(dims_to_delete.begin(),
                                             dims_to_delete.end());
  absl::c_sort(sorted_dims_to_delete);
  state.dimensions = RemoveElements(sorted_dims_to_delete, state.dimensions);
  state.dynamic_dimensions =
      RemoveElements(sorted_dims_to_delete, state.dynamic_dimensions);
  state.expressions =
      RemoveElements(sorted_dims_to_delete, state.expressions);
  if (LayoutUtil::HasLayout(*this)) {
    for (auto it = sorted_dims_to_delete.rbegin();
         it != sorted_dims_to_delete.rend(); ++it) {
      state.layout->DeleteDimension(*it);  // NOLINT: optional-access
    }
  }
}

void Shape::CheckStateIsEmpty() const {
  if (const auto* const state = if_array_state()) {
    CHECK(state->dimensions.empty()) << ToString();
    CHECK(state->dynamic_dimensions.empty()) << ToString();
    CHECK(state->expressions.empty()) << ToString();
    CHECK(!state->layout.has_value()) << ToString();
  } else if (const auto* const state = if_tuple_state()) {
    CHECK(state->tuple_shapes.empty()) << ToString();
  }
}

const std::vector<Shape>& Shape::tuple_shapes() const {
  return tuple_state().tuple_shapes;
}

const Shape& Shape::buffer_shape() const {
  return buffer_state().buffer_shape[0];
}

void Shape::Clear() {
  // Before setting the element type to invalid, we need to clear the state
  // because the state may be non-empty if the shape was previously valid.
  // Without this step, set_element_type() may CHECK-fail.
  if (auto* const state = if_array_state()) {
    *state = ArrayState();
  } else if (auto* const state = if_tuple_state()) {
    *state = TupleState();
  }
  set_element_type(PRIMITIVE_TYPE_INVALID);
}

void Shape::set_element_type(const PrimitiveType value) {
  element_type_ = value;

  // Make sure the variant state matches the element type.
  // If we have to change the case of the variant, and the current case is not
  // empty, it's likely a programmer error - we CHECK-fail to catch it.
  if (element_type_ == TOKEN) {
    if (!if_token_state()) {
      CheckStateIsEmpty();
      state_ = TokenState();
    }
    return;
  }
  if (element_type_ == OPAQUE_TYPE) {
    if (!if_opaque_state()) {
      CheckStateIsEmpty();
      state_ = OpaqueState();
    }
    return;
  }
  if (element_type_ == TUPLE) {
    if (!if_tuple_state()) {
      CheckStateIsEmpty();
      state_ = TupleState();
    }
    return;
  }
  if (element_type_ == BUFFER) {
    if (!if_buffer_state()) {
      CheckStateIsEmpty();
      state_ = BufferState();
    }
    return;
  }
  if (primitive_util::IsArrayType(element_type_)) {
    if (!if_array_state()) {
      CheckStateIsEmpty();
      state_ = ArrayState();
    }
    return;
  }
  // Treat all other types as invalid.
  if (element_type_ != PRIMITIVE_TYPE_INVALID) {
    LOG(ERROR) << "Unsupported element type: " << element_type_;
    element_type_ = PRIMITIVE_TYPE_INVALID;
  }
  if (!if_invalid_state()) {
    CheckStateIsEmpty();
    state_ = InvalidState();
  }
}

const Shape& Shape::tuple_shapes(int index) const {
  return tuple_state().tuple_shapes[index];
}

Shape* Shape::add_tuple_shapes() {
  auto& state = tuple_state();
  state.tuple_shapes.push_back(Shape());
  return &state.tuple_shapes.back();
}

bool Shape::Equal::operator()(const Shape& lhs, const Shape& rhs) {
  if (lhs.IsTuple()) {
    return rhs.IsTuple() &&
           absl::c_equal(
               lhs.tuple_shapes(), rhs.tuple_shapes(),
               [=](const Shape& l, const Shape& r) { return (*this)(l, r); });
  }
  if (lhs.IsBuffer() || rhs.IsBuffer()) {
    if (!ignore_buffer_) {
      return lhs.IsBuffer() && rhs.IsBuffer() &&
             lhs.buffer_shape() == rhs.buffer_shape();
    }
    auto underline_shape = [](const Shape& shape) {
      if (shape.IsBuffer()) {
        return shape.buffer_shape();
      }
      return shape;
    };
    return underline_shape(lhs) == underline_shape(rhs);
  }

  if (!lhs.IsArray()) {
    // Non-tuple, non-array tupes such as opaque and token types are trivially
    // the same.
    return lhs.element_type() == rhs.element_type();
  }

  if (!rhs.IsArray()) {
    return false;
  }

  if (!ignore_element_type_) {
    if ((ignore_fp_precision_ &&
         !ShapeUtil::SameElementTypeIgnoringFpPrecision(lhs, rhs)) ||
        (!ignore_fp_precision_ && !ShapeUtil::SameElementType(lhs, rhs))) {
      VLOG(3) << "CompareShapes: lhs element type != rhs element type";
      return false;
    }
  }

  if (!ignore_dimensions_) {
    if (!ShapeUtil::SameRank(lhs, rhs)) {
      VLOG(3) << "CompareShapes: lhs rank != rhs rank";
      return false;
    }
    for (int i = 0; i < lhs.dimensions().size(); ++i) {
      if (ignore_dynamic_dimension_ &&
          (lhs.is_unbounded_dynamic_dimension(i) ||
           rhs.is_unbounded_dynamic_dimension(i))) {
        continue;
      }
      if (i == 0 && ignore_batch_ &&
          (lhs.outer_multiplier() > 0 || rhs.outer_multiplier() > 0)) {
        VLOG(3) << "CompareShapes: batch dimension found. Forcely compatible";
        continue;
      }
      if (lhs.dimensions(i) != rhs.dimensions(i)) {
        VLOG(3) << "CompareShapes: lhs dimensions != rhs dimensions";
        return false;
      }
    }
  } else {
    if (!ShapeUtil::SameRank(lhs, rhs)) {
      VLOG(3) << "CompareShapes: lhs rank != rhs rank";
      return false;
    }
  }

  if (!ignore_layout_) {
    if (lhs.IsArray()) {
      Layout::Equal equal;
      if (lhs.has_layout() || rhs.has_layout()) {
        if (!lhs.has_layout() || !rhs.has_layout()) {
          VLOG(3) << "CompareShapes: both shapes do not have layouts";
          return false;
        }
        if (ignore_tiles_in_layout_) {
          equal.IgnoreTiles();
        }
        if (ignore_element_size_in_layout_) {
          equal.IgnoreElementSize();
        }
        if (ignore_memory_space_in_layout_) {
          equal.IgnoreMemorySpace();
        }
        if (ignore_tail_padding_alignment_in_elements_in_layout_) {
          equal.IgnoreTailPaddingAlignmentInElements();
        }
        if (ignore_split_config_in_layout_) {
          equal.IgnoreSplitConfigs();
        }
        if (!equal(lhs.layout(), rhs.layout())) {
          VLOG(3) << "CompareShapes: lhs layout != rhs layout";
          return false;
        }
      }
    }
  }

  if (!ignore_dynamic_dimension_) {
    for (int i = 0; i < lhs.dimensions().size(); ++i) {
      if (lhs.is_dynamic_dimension(i) != rhs.is_dynamic_dimension(i)) {
        VLOG(3) << "CompareShapes: lhs and rhs have different dynamic "
                   "dimensions.";
        return false;
      }
    }
  }
  return true;
}

std::ostream& operator<<(std::ostream& out, const Shape& shape) {
  out << shape.ToString(/*print_layout=*/true);
  return out;
}

ProgramShape::ProgramShape() = default;
ProgramShape::~ProgramShape() = default;
ProgramShape::ProgramShape(const ProgramShape&) = default;
ProgramShape::ProgramShape(ProgramShape&&) = default;
ProgramShape& ProgramShape::operator=(const ProgramShape&) = default;
ProgramShape& ProgramShape::operator=(ProgramShape&&) = default;

ProgramShape::ProgramShape(const ProgramShapeProto& program_shape_proto) {
  auto program_shape = FromProto(program_shape_proto);
  if (!program_shape.ok()) {
    LOG(ERROR) << "Failed to parse ProgramShapeProto: "
               << program_shape_proto.DebugString();
    return;
  }
  *this = std::move(*program_shape);
}

absl::StatusOr<ProgramShape> ProgramShape::FromProto(
    const ProgramShapeProto& program_shape_proto) {
  ProgramShape program_shape;
  const int num_params = program_shape_proto.parameters_size();
  const int num_param_names = program_shape_proto.parameter_names_size();
  TF_RET_CHECK(num_params == num_param_names)
      << "ProgramShapeProto has different numbers of parameters and "
         "parameter names: "
      << num_params << " vs " << num_param_names;
  program_shape.parameters_.reserve(num_params);
  program_shape.parameter_names_.reserve(num_params);
  for (int i = 0; i < num_params; ++i) {
    const std::string& name =
        i < num_param_names ? program_shape_proto.parameter_names(i) : "";
    TF_ASSIGN_OR_RETURN(Shape shape,
                        Shape::FromProto(program_shape_proto.parameters(i)));
    program_shape.AddParameter(shape, name);
  }
  TF_ASSIGN_OR_RETURN(*program_shape.mutable_result(),
                      Shape::FromProto(program_shape_proto.result()));
  return program_shape;
}

ProgramShapeProto ProgramShape::ToProto() const {
  ProgramShapeProto proto;
  for (const Shape& shape : parameters()) {
    *proto.add_parameters() = shape.ToProto();
  }
  *proto.mutable_result() = result().ToProto();
  for (const std::string& name : parameter_names()) {
    proto.add_parameter_names(name);
  }
  return proto;
}

void ProgramShape::Print(Printer* printer) const {
  ShapeUtil::PrintHumanString(printer, *this);
}

std::string ProgramShape::ToString() const {
  return ShapeUtil::HumanString(*this);
}

std::ostream& operator<<(std::ostream& out, const ProgramShape& program_shape) {
  out << program_shape.ToString() << "\n";
  return out;
}

}  // namespace xla
