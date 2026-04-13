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

#ifndef XLA_SHAPE_DYNEXPR_H_
#define XLA_SHAPE_DYNEXPR_H_

#include <cstdint>
#include <memory>
#include <optional>
#include <ostream>
#include <set>
#include <vector>

#include "absl/hash/hash.h"
#include "absl/log/check.h"
#include "absl/types/span.h"
#include "xla/printer.h"
#include "xla/xla_data.pb.h"

namespace xla {

// Reserved sentinel for "missing expression". Keep this outside the normal
// expression id space so it cannot be confused with a real UnknownExpr id.
inline constexpr int kMissingExpressionSentinel = -1000001;

enum class DExprKind {
  kUnknown,
  kConstant,
  kVariable,
  kAdd,
  kSub,
  kMul,
  kDiv,
};

class DynExpr {
 public:
  virtual ~DynExpr() = default;
  virtual std::unique_ptr<DynExpr> clone() const = 0;
  virtual DExprKind kind() const = 0;
  virtual void print(xla::Printer* printer) const = 0;
  virtual void to_proto(xla::ExpressionProto* proto) const = 0;
  virtual bool is_constant() const = 0;
  virtual int64_t get_val() const { return -1; }
  virtual DynExpr* s() = 0; // simplify
  virtual DynExpr* substitute(int id, DynExpr* v) = 0;
  virtual std::set<int> get_all_ids() = 0;
  virtual std::optional<int64_t> solve(int64_t x) = 0;

  bool is_dynamic() { return !is_constant(); }

  static DynExpr* zero;
  static DynExpr* one;
  static DynExpr* _(int64_t val);
  static DynExpr* V(int var_id);
  static DynExpr* _s(DynExpr* expr);
  static bool equal(DynExpr* expr1, DynExpr* expr2);

  friend std::ostream& operator<<(std::ostream& os, DynExpr* expr);
};

class DExpr {
 public:
  using Kind = DExprKind;

  DExpr() = default;
  explicit DExpr(std::unique_ptr<DynExpr> expr) : expr_(std::move(expr)) {}

  DExpr(const DExpr& other) {
    if (other.expr_ != nullptr) {
      expr_ = other.expr_->clone();
    }
  }
  DExpr& operator=(const DExpr& other) {
    if (this == &other) return *this;
    expr_.reset();
    if (other.expr_ != nullptr) {
      expr_ = other.expr_->clone();
    }
    return *this;
  }

  DExpr(DExpr&&) noexcept = default;
  DExpr& operator=(DExpr&&) noexcept = default;

  static DExpr Unknown(int id = 0);
  static DExpr Adopt(DynExpr* expr) { return DExpr(std::unique_ptr<DynExpr>(expr)); }
  static DExpr Const(int64_t value) { return Adopt(DynExpr::_(value)); }
  static DExpr Var(int var_id) { return Adopt(DynExpr::V(var_id)); }
  bool is_unknown() const {
    return expr_ != nullptr && expr_->kind() == DExprKind::kUnknown;
  }
  Kind kind() const {
    CHECK(expr_ != nullptr) << "Attempted to access empty DExpr";
    return expr_->kind();
  }

  DynExpr* get() const {
    CHECK(expr_ != nullptr) << "Attempted to access empty DExpr";
    return expr_.get();
  }
  DynExpr& operator*() const {
    CHECK(expr_ != nullptr) << "Attempted to dereference empty DExpr";
    return *expr_;
  }
  DynExpr* operator->() const {
    CHECK(expr_ != nullptr) << "Attempted to access empty DExpr";
    return expr_.get();
  }
  operator DynExpr*() const { return get(); }
  explicit operator bool() const { return expr_ != nullptr && !is_unknown(); }

  std::unique_ptr<DynExpr> clone() const {
    if (expr_ == nullptr) {
      return nullptr;
    }
    return expr_->clone();
  }
  DynExpr* release() { return expr_.release(); }

  DExpr simplify() const {
    return expr_ == nullptr ? DExpr() : Adopt(expr_->s());
  }
  void to_proto(xla::ExpressionProto* proto) const {
    CHECK(expr_ != nullptr) << "Attempted to serialize empty DExpr";
    expr_->to_proto(proto);
  }
  DExpr substitute(int id, const DExpr& value) const {
    return expr_ == nullptr ? DExpr() : Adopt(expr_->substitute(id, value.get()));
  }

  template <typename H>
  friend H AbslHashValue(H h, const DExpr& expr) {
    xla::ExpressionProto proto;
    if (expr.expr_ != nullptr) {
      expr.expr_->to_proto(&proto);
    }
    return H::combine(std::move(h), proto.SerializeAsString());
  }

 private:
  std::unique_ptr<DynExpr> expr_;
};

class UnknownExpr : public DynExpr {
  int id_;

 public:
  explicit UnknownExpr(int id = 0) : id_(id) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<UnknownExpr>(id_);
  }
  DExprKind kind() const override { return DExprKind::kUnknown; }
  void print(xla::Printer* printer) const override {
    if (id_ == kMissingExpressionSentinel) {
      printer->Append("_");
      return;
    }
    printer->Append("?");
    if (id_ != 0) {
      printer->Append(id_);
    }
  }
  void to_proto(xla::ExpressionProto* proto) const override {
    (void)proto;
  }
  bool is_constant() const override { return true; }
  int get_id() const { return id_; }
  DynExpr* substitute(int id, DynExpr* v) override {
    (void)id;
    (void)v;
    return clone().release();
  }
  std::set<int> get_all_ids() override { return {}; }
  std::optional<int64_t> solve(int64_t x) override {
    (void)x;
    return std::nullopt;
  }
  DynExpr* s() override { return clone().release(); }
};

inline DExpr DExpr::Unknown(int id) {
  return DExpr(std::unique_ptr<DynExpr>(new xla::UnknownExpr(id)));
}

// constant i
class Constant : public DynExpr {
  int64_t value;

 public:
  explicit Constant(int64_t v) : value(v) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Constant>(value);
  }
  DExprKind kind() const override { return DExprKind::kConstant; }
  void print(xla::Printer* printer) const override {
    if (value < 0) {
      printer->Append("(");
    }
    printer->Append(value);
    if (value < 0) {
      printer->Append(")");
    }
  }
  void to_proto(xla::ExpressionProto* proto) const override {
    proto->set_constant_value(value);
  }
  bool is_constant() const override { return true; }
  int64_t get_val() const override { return value; }
  DynExpr* substitute(int id, DynExpr* v) { return clone().release(); }
  std::set<int> get_all_ids() { return {}; }
  std::optional<int64_t> solve(int64_t x) { return std::nullopt; }
  DynExpr* s() override;
};

// var id (int)
class Variable : public DynExpr {
  int id;

 public:
  explicit Variable(int identifier) : id(identifier) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Variable>(id);
  }
  DExprKind kind() const override { return DExprKind::kVariable; }
  void print(xla::Printer* printer) const override {
    // printer->Append("(Var ");
    char letter = 'A' + (id - 1);
    printer->Append(std::string(1, letter));
    // printer->Append(")");
  }
  void to_proto(xla::ExpressionProto* proto) const override {
    proto->set_variable_id(id);
  }
  bool is_constant() const override { return false; }
  int get_id() const { return id; }
  DynExpr* substitute(int id, DynExpr* v) {
    return get_id() == id ? v->clone().release() : clone().release();
  }
  std::set<int> get_all_ids() { return {get_id()}; }
  std::optional<int64_t> solve(int64_t x) { return x; }
  DynExpr* s() override;
};

// exp = exp + exp
class Add : public DynExpr {
  std::unique_ptr<DynExpr> lhs;
  std::unique_ptr<DynExpr> rhs;

 public:
  Add(DynExpr* l, DynExpr* r) : lhs(l), rhs(r) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Add>(lhs->clone().release(), rhs->clone().release());
  }
  DExprKind kind() const override { return DExprKind::kAdd; }
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" + ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs.get(); }
  DynExpr* get_rhs() const { return rhs.get(); }

  void to_proto(xla::ExpressionProto* proto) const override {
    auto* add_msg = proto->mutable_add_node();
    lhs->to_proto(add_msg->mutable_lhs());
    rhs->to_proto(add_msg->mutable_rhs());
  }

  bool is_constant() const override {
    return lhs->is_constant() && rhs->is_constant();
  }

  int64_t get_val() const override { return lhs->get_val() + rhs->get_val(); }

  DynExpr* substitute(int id, DynExpr* v) {
    return new Add(lhs->substitute(id, v), rhs->substitute(id, v));
  }

  std::set<int> get_all_ids() {
    auto s = lhs->get_all_ids();
    s.merge(rhs->get_all_ids());
    return s;
  }

  std::optional<int64_t> solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return std::nullopt;
    if (lhs->get_all_ids().size() == 1) {
      // (A + c) = x <=> A = x - c => solve A = y with y = x - c
      return lhs->solve(x - rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c + A) = x <=> A = x - c => solve A = y with y = x - c
      return rhs->solve(x - lhs->get_val());
    }
    // No solution
    return std::nullopt;
  }

  DynExpr* s() override;

  ~Add() override = default;
};

// exp = exp - exp
class Sub : public DynExpr {
  std::unique_ptr<DynExpr> lhs;
  std::unique_ptr<DynExpr> rhs;

 public:
  Sub(DynExpr* l, DynExpr* r) : lhs(l), rhs(r) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Sub>(lhs->clone().release(), rhs->clone().release());
  }
  DExprKind kind() const override { return DExprKind::kSub; }
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" - ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs.get(); }
  DynExpr* get_rhs() const { return rhs.get(); }

  void to_proto(xla::ExpressionProto* proto) const override {
    auto* sub_msg = proto->mutable_sub_node();
    lhs->to_proto(sub_msg->mutable_lhs());
    rhs->to_proto(sub_msg->mutable_rhs());
  }

  bool is_constant() const override {
    return lhs->is_constant() && rhs->is_constant();
  }

  int64_t get_val() const override { return lhs->get_val() - rhs->get_val(); }

  DynExpr* substitute(int id, DynExpr* v) {
    return new Sub(lhs->substitute(id, v), rhs->substitute(id, v));
  }

  std::set<int> get_all_ids() {
    auto s = lhs->get_all_ids();
    s.merge(rhs->get_all_ids());
    return s;
  }

  std::optional<int64_t> solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return std::nullopt;
    if (lhs->get_all_ids().size() == 1) {
      // (A - c) = x <=> A = x + c => solve A = y with y = x + c
      return lhs->solve(x + rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c - A) = x <=> A = c - x => solve A = y with y = c - x
      return rhs->solve(lhs->get_val() - x);
    }
    // No solution
    return std::nullopt;
  }

  DynExpr* s() override;

  ~Sub() override = default;
};

// exp = exp * exp
class Mul : public DynExpr {
  std::unique_ptr<DynExpr> lhs;
  std::unique_ptr<DynExpr> rhs;

 public:
  Mul(DynExpr* l, DynExpr* r) : lhs(l), rhs(r) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Mul>(lhs->clone().release(), rhs->clone().release());
  }
  DExprKind kind() const override { return DExprKind::kMul; }
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" * ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs.get(); }
  DynExpr* get_rhs() const { return rhs.get(); }

  void to_proto(xla::ExpressionProto* proto) const override {
    auto* mul_msg = proto->mutable_mul_node();
    lhs->to_proto(mul_msg->mutable_lhs());
    rhs->to_proto(mul_msg->mutable_rhs());
  }

  bool is_constant() const override {
    return lhs->is_constant() && rhs->is_constant();
  }

  int64_t get_val() const override { return lhs->get_val() * rhs->get_val(); }

  DynExpr* substitute(int id, DynExpr* v) {
    return new Mul(lhs->substitute(id, v), rhs->substitute(id, v));
  }

  std::set<int> get_all_ids() {
    auto s = lhs->get_all_ids();
    s.merge(rhs->get_all_ids());
    return s;
  }

  std::optional<int64_t> solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return std::nullopt;
    if (lhs->get_all_ids().size() == 1) {
      // (A * c) = x <=> A = x / c => solve A = y with y = x / c
      int64_t c = rhs->get_val();
      if (c == 0) return x == 0 ? lhs->solve(0) : std::nullopt;
      if (x % c != 0) return std::nullopt;
      return lhs->solve(x / c);
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c * A) = x <=> A = x / c => solve A = y with y = x / c
      int64_t c = lhs->get_val();
      if (c == 0) return x == 0 ? rhs->solve(0) : std::nullopt;
      if (x % c != 0) return std::nullopt;
      return rhs->solve(x / c);
    }
    // No solution
    return std::nullopt;
  }

  DynExpr* s() override;

  ~Mul() override = default;
};

// expr / expr
class Div : public DynExpr {
  std::unique_ptr<DynExpr> lhs;
  std::unique_ptr<DynExpr> rhs;

 public:
  Div(DynExpr* l, DynExpr* r) : lhs(l), rhs(r) {}
  std::unique_ptr<DynExpr> clone() const override {
    return std::make_unique<Div>(lhs->clone().release(), rhs->clone().release());
  }
  DExprKind kind() const override { return DExprKind::kDiv; }
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" / ( ");
    rhs->print(printer);
    printer->Append(") )");
  }

  DynExpr* get_lhs() const { return lhs.get(); }
  DynExpr* get_rhs() const { return rhs.get(); }

  void to_proto(xla::ExpressionProto* proto) const override {
    auto* div_msg = proto->mutable_div_node();
    lhs->to_proto(div_msg->mutable_lhs());
    rhs->to_proto(div_msg->mutable_rhs());
  }

  bool is_constant() const override {
    return lhs->is_constant() && rhs->is_constant();
  }

  int64_t get_val() const override { return lhs->get_val() / rhs->get_val(); }

  DynExpr* substitute(int id, DynExpr* v) {
    return new Div(lhs->substitute(id, v), rhs->substitute(id, v));
  }

  DynExpr* s() override;

  std::set<int> get_all_ids() {
    auto s = lhs->get_all_ids();
    s.merge(rhs->get_all_ids());
    return s;
  }

  std::optional<int64_t> solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return std::nullopt;
    if (lhs->get_all_ids().size() == 1) {
      // (A / c) = x <=> A = x * c => solve A = y with y = x * c
      return lhs->solve(x * rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c / A) = x <=> A = c / x => solve A = y with y = c / x
      int64_t c = lhs->get_val();
      if (x == 0) return std::nullopt;
      if (c % x != 0) return std::nullopt;
      return rhs->solve(c / x);
    }
    // No solution
    return std::nullopt;
  }

  ~Div() override = default;
};

DynExpr* operator*(DynExpr& lhs, DynExpr& rhs);
DynExpr* operator*(int64_t k, DynExpr& rhs);
DynExpr* operator/(DynExpr& lhs, DynExpr& rhs);
DynExpr* operator/(DynExpr& lhs, int64_t d);
DynExpr* operator+(DynExpr& lhs, DynExpr& rhs);
DynExpr* operator+(DynExpr& lhs, int64_t d);
DynExpr* operator-(DynExpr& lhs, DynExpr& rhs);
DynExpr* operator-(DynExpr& lhs, int64_t d);
bool operator==(DynExpr& lhs, DynExpr& rhs);
bool operator==(DynExpr& lhs, int64_t d);

inline DExpr operator*(const DExpr& lhs, const DExpr& rhs) {
  return DExpr::Adopt(*lhs.get() * *rhs.get());
}
inline DExpr operator*(int64_t lhs, const DExpr& rhs) {
  return DExpr::Adopt(lhs * *rhs.get());
}
inline DExpr operator/(const DExpr& lhs, const DExpr& rhs) {
  return DExpr::Adopt(*lhs.get() / *rhs.get());
}
inline DExpr operator/(const DExpr& lhs, int64_t rhs) {
  return DExpr::Adopt(*lhs.get() / rhs);
}
inline DExpr operator+(const DExpr& lhs, const DExpr& rhs) {
  return DExpr::Adopt(*lhs.get() + *rhs.get());
}
inline DExpr operator+(const DExpr& lhs, int64_t rhs) {
  return DExpr::Adopt(*lhs.get() + rhs);
}
inline DExpr operator-(const DExpr& lhs, const DExpr& rhs) {
  return DExpr::Adopt(*lhs.get() - *rhs.get());
}
inline DExpr operator-(const DExpr& lhs, int64_t rhs) {
  return DExpr::Adopt(*lhs.get() - rhs);
}
inline bool operator==(const DExpr& lhs, const DExpr& rhs) {
  return *lhs.get() == *rhs.get();
}
inline bool operator==(const DExpr& lhs, int64_t rhs) {
  return *lhs.get() == rhs;
}

inline DExpr DExprFromProto(const xla::ExpressionProto& proto) {
  switch (proto.node_type_case()) {
    case ExpressionProto::kConstantValue:
      return DExpr::Const(proto.constant_value());
    case ExpressionProto::kVariableId:
      return DExpr::Var(proto.variable_id());
    case ExpressionProto::kAddNode: {
      const auto& add = proto.add_node();
      return DExprFromProto(add.lhs()) + DExprFromProto(add.rhs());
    }
    case ExpressionProto::kSubNode: {
      const auto& sub = proto.sub_node();
      return DExprFromProto(sub.lhs()) - DExprFromProto(sub.rhs());
    }
    case ExpressionProto::kMulNode: {
      const auto& mul = proto.mul_node();
      return DExprFromProto(mul.lhs()) * DExprFromProto(mul.rhs());
    }
    case ExpressionProto::kDivNode: {
      const auto& div = proto.div_node();
      return DExprFromProto(div.lhs()) / DExprFromProto(div.rhs());
    }
    case ExpressionProto::NODE_TYPE_NOT_SET:
    default:
      return DExpr::Unknown(kMissingExpressionSentinel);
  }
}

inline DynExpr* DynExpr::_(int64_t val) {
  return new Constant(val);
}
inline DynExpr* DynExpr::V(int var_id) { return new Variable(var_id); }

}  // namespace xla

#endif  // XLA_SHAPE_DYNEXPR_H_
