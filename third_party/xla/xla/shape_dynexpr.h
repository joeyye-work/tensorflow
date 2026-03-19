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

#include <set>
#include <cstdint>
#include <ostream>

#include "xla/printer.h"
#include "xla/xla_data.pb.h"

namespace xla {

class DynExpr {
 public:
  virtual ~DynExpr() = default;
  virtual void print(xla::Printer* printer) const = 0;
  virtual void to_proto(xla::ExpressionProto* proto) const = 0;
  virtual bool is_constant() const = 0;
  virtual int64_t get_val() const { return -1; }
  virtual DynExpr* s() = 0; // simplify
  virtual DynExpr* substitute(int id, DynExpr* v) = 0;
  virtual std::set<int> get_all_ids() = 0;
  virtual int64_t solve(int64_t x) = 0;

  bool is_dynamic() { return !is_constant(); }

  static DynExpr* zero;
  static DynExpr* one;
  static DynExpr* _(int64_t val);
  static DynExpr* V(int var_id);
  static DynExpr* _s(DynExpr* expr);
  static bool equal(DynExpr* expr1, DynExpr* expr2);

  friend std::ostream& operator<<(std::ostream& os, DynExpr* expr);
};

// constant i
class Constant : public DynExpr {
  int64_t value;

 public:
  explicit Constant(int64_t v) : value(v) {}
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
  DynExpr* substitute(int id, DynExpr* v) { return this; }
  std::set<int> get_all_ids() { return {}; }
  int64_t solve(int64_t x) { return -1; }
  DynExpr* s() override;
};

// var id (int)
class Variable : public DynExpr {
  int id;

 public:
  explicit Variable(int identifier) : id(identifier) {}
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
  DynExpr* substitute(int id, DynExpr* v) { return get_id() == id ? v : this;}
  std::set<int> get_all_ids() { return {get_id()}; }
  int64_t solve(int64_t x) { return x; }
  DynExpr* s() override;
};

// exp = exp + exp
class Add : public DynExpr {
  DynExpr* lhs;
  DynExpr* rhs;

 public:
  Add(DynExpr* l, DynExpr* r) : lhs(std::move(l)), rhs(std::move(r)) {}
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" + ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs; }
  DynExpr* get_rhs() const { return rhs; }

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

  int64_t solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return -1;
    if (lhs->get_all_ids().size() == 1) {
      // (A + c) = x <=> A = x - c => solve A = y with y = x - c
      return lhs->solve(x - rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c + A) = x <=> A = x - c => solve A = y with y = x - c
      return rhs->solve(x - lhs->get_val());
    }
    // No solution
    return -1;
  }

  DynExpr* s() override;

  ~Add() {
    delete lhs;
    delete rhs;
  }
};

// exp = exp - exp
class Sub : public DynExpr {
  DynExpr* lhs;
  DynExpr* rhs;

 public:
  Sub(DynExpr* l, DynExpr* r) : lhs(std::move(l)), rhs(std::move(r)) {}
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" - ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs; }
  DynExpr* get_rhs() const { return rhs; }

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

  int64_t solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return -1;
    if (lhs->get_all_ids().size() == 1) {
      // (A - c) = x <=> A = x + c => solve A = y with y = x + c
      return lhs->solve(x + rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c + A) = x <=> A = x - c => solve A = y with y = x + c
      return rhs->solve(x + lhs->get_val());
    }
    // No solution
    return -1;
  }

  DynExpr* s() override;

  ~Sub() {
    delete lhs;
    delete rhs;
  }
};

// exp = exp * exp
class Mul : public DynExpr {
  DynExpr* lhs;
  DynExpr* rhs;

 public:
  Mul(DynExpr* l, DynExpr* r) : lhs(std::move(l)), rhs(std::move(r)) {}
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" * ");
    rhs->print(printer);
    printer->Append(")");
  }

  DynExpr* get_lhs() const { return lhs; }
  DynExpr* get_rhs() const { return rhs; }

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

  int64_t solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return -1;
    if (lhs->get_all_ids().size() == 1) {
      // (A * c) = x <=> A = x / c => solve A = y with y = x / c
      int64_t c = rhs->get_val();
      if (x % c != 0) return -1;
      return lhs->solve(x / c);
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c * A) = x <=> A = x / c => solve A = y with y = x / c
      int64_t c = lhs->get_val();
      if (x % c != 0) return -1;
      return rhs->solve(x / c);
    }
    // No solution
    return -1;
  }

  DynExpr* s() override;

  ~Mul() {
    delete lhs;
    delete rhs;
  }
};

// expr / expr
class Div : public DynExpr {
  DynExpr* lhs;
  DynExpr* rhs;

 public:
  Div(DynExpr* l, DynExpr* r) : lhs(std::move(l)), rhs(std::move(r)) {}
  void print(xla::Printer* printer) const override {
    printer->Append("(");
    lhs->print(printer);
    printer->Append(" / ( ");
    rhs->print(printer);
    printer->Append(") )");
  }

  DynExpr* get_lhs() const { return lhs; }
  DynExpr* get_rhs() const { return rhs; }

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

  int64_t solve(int64_t x) {
    // Cannot solve if both lhs and rhs are dynamic...
    if (lhs->is_dynamic() && rhs->is_dynamic()) return -1;
    if (lhs->get_all_ids().size() == 1) {
      // (A / c) = x <=> A = x * c => solve A = y with y = x * c
      return lhs->solve(x * rhs->get_val());
    }
    if (rhs->get_all_ids().size() == 1) {
      // (c / A) = x <=> A = c / x => solve A = y with y = c / x
      int64_t c = lhs->get_val();
      if (c % x != 0) return -1;
      return rhs->solve(c / x);
    }
    // No solution
    return -1;
  }

  ~Div() {
    delete lhs;
    delete rhs;
  }
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

inline DynExpr* DynExpr::_(int64_t val) {
  if (val == 0) return DynExpr::zero;
  if (val == 1) return DynExpr::one;
  return new Constant(val);
}
inline DynExpr* DynExpr::V(int var_id) { return new Variable(var_id); }

}  // namespace xla

#endif  // XLA_SHAPE_DYNEXPR_H_
