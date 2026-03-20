#ifndef TENSORFLOW_CORE_FRAMEWORK_TENSOR_SHAPE_EXPR_H_
#define TENSORFLOW_CORE_FRAMEWORK_TENSOR_SHAPE_EXPR_H_

#include <cstdint>
#include <memory>
#include <string>
#include <utility>

#include "tensorflow/core/framework/tensor_shape.pb.h"

namespace tensorflow {

// Forward declarations
class Constant;
class Variable;
class ExprAdd;
class ExprSub;
class ExprMul;
class ExprDiv;

// DimExpr: Base class for symbolic expressions representing dynamic dimension
// sizes. These expressions form a DAG that tracks how unknown dimensions relate
// to each other through arithmetic operations.
//
// The expression language:
//   - Var(sym_id): A symbolic variable representing an unknown dimension
//   - Const(k): A known constant value
//   - Add/Sub/Mul/Div(lhs, rhs): Binary arithmetic operations
//
// INVARIANT: An unknown dimension is not just -1, it is -1 + Var(sym).
class DimExpr {
 public:
  enum class Kind : uint8_t {
    kConstant,
    kVariable,
    kAdd,
    kSub,
    kMul,
    kDiv,
  };

  virtual ~DimExpr() = default;

  virtual Kind kind() const = 0;
  virtual void ToProto(ExpressionProto* proto) const = 0;

  virtual bool IsConstant() const { return false; }
  virtual int64_t ConstantValue() const { return 0; }

  // Factory methods - return owning pointers
  static std::unique_ptr<DimExpr> Cons(int64_t val);
  static std::unique_ptr<DimExpr> Var(int32_t var_id);

  // Structural equality check
  static bool Equals(const DimExpr* a, const DimExpr* b);

  // Build from proto (owns all returned nodes)
  static std::unique_ptr<DimExpr> FromProto(const ExpressionProto& proto);

  // Debug representation
  std::string DebugString() const;

 protected:
  DimExpr() = default;
};

// Constant expression node: represents a known integer value
class Constant final : public DimExpr {
 public:
  explicit Constant(int64_t value) : value_(value) {}

  Kind kind() const override { return Kind::kConstant; }
  void ToProto(ExpressionProto* proto) const override {
    proto->set_constant_value(value_);
  }

  bool IsConstant() const override { return true; }
  int64_t ConstantValue() const override { return value_; }

  int64_t value() const { return value_; }

 private:
  int64_t value_;
};

// Variable expression node: represents a symbolic unknown dimension
class Variable final : public DimExpr {
 public:
  explicit Variable(int32_t id) : id_(id) {}

  Kind kind() const override { return Kind::kVariable; }
  void ToProto(ExpressionProto* proto) const override {
    proto->set_variable_id(id_);
  }

  int32_t id() const { return id_; }

 private:
  int32_t id_;
};

// Addition expression node
class ExprAdd final : public DimExpr {
 public:
  ExprAdd(DimExpr* lhs, DimExpr* rhs) : lhs_(lhs), rhs_(rhs) {}

  Kind kind() const override { return Kind::kAdd; }
  void ToProto(ExpressionProto* proto) const override {
    auto* add_msg = proto->mutable_add_node();
    lhs_->ToProto(add_msg->mutable_lhs());
    rhs_->ToProto(add_msg->mutable_rhs());
  }

  bool IsConstant() const override {
    return lhs_->IsConstant() && rhs_->IsConstant();
  }
  int64_t ConstantValue() const override {
    return lhs_->ConstantValue() + rhs_->ConstantValue();
  }

  DimExpr* lhs() const { return lhs_; }
  DimExpr* rhs() const { return rhs_; }

 private:
  DimExpr* lhs_;
  DimExpr* rhs_;
};

// Subtraction expression node
class ExprSub final : public DimExpr {
 public:
  ExprSub(DimExpr* lhs, DimExpr* rhs) : lhs_(lhs), rhs_(rhs) {}

  Kind kind() const override { return Kind::kSub; }
  void ToProto(ExpressionProto* proto) const override {
    auto* sub_msg = proto->mutable_sub_node();
    lhs_->ToProto(sub_msg->mutable_lhs());
    rhs_->ToProto(sub_msg->mutable_rhs());
  }

  bool IsConstant() const override {
    return lhs_->IsConstant() && rhs_->IsConstant();
  }
  int64_t ConstantValue() const override {
    return lhs_->ConstantValue() - rhs_->ConstantValue();
  }

  DimExpr* lhs() const { return lhs_; }
  DimExpr* rhs() const { return rhs_; }

 private:
  DimExpr* lhs_;
  DimExpr* rhs_;
};

// Multiplication expression node
class ExprMul final : public DimExpr {
 public:
  ExprMul(DimExpr* lhs, DimExpr* rhs) : lhs_(lhs), rhs_(rhs) {}

  Kind kind() const override { return Kind::kMul; }
  void ToProto(ExpressionProto* proto) const override {
    auto* mul_msg = proto->mutable_mul_node();
    lhs_->ToProto(mul_msg->mutable_lhs());
    rhs_->ToProto(mul_msg->mutable_rhs());
  }

  bool IsConstant() const override {
    return lhs_->IsConstant() && rhs_->IsConstant();
  }
  int64_t ConstantValue() const override {
    return lhs_->ConstantValue() * rhs_->ConstantValue();
  }

  DimExpr* lhs() const { return lhs_; }
  DimExpr* rhs() const { return rhs_; }

 private:
  DimExpr* lhs_;
  DimExpr* rhs_;
};

// Division expression node
class ExprDiv final : public DimExpr {
 public:
  ExprDiv(DimExpr* lhs, DimExpr* rhs) : lhs_(lhs), rhs_(rhs) {}

  Kind kind() const override { return Kind::kDiv; }
  void ToProto(ExpressionProto* proto) const override {
    auto* div_msg = proto->mutable_div_node();
    lhs_->ToProto(div_msg->mutable_lhs());
    rhs_->ToProto(div_msg->mutable_rhs());
  }

  bool IsConstant() const override {
    return lhs_->IsConstant() && rhs_->IsConstant();
  }
  int64_t ConstantValue() const override {
    int64_t r = rhs_->ConstantValue();
    return (r == 0) ? 0 : lhs_->ConstantValue() / r;
  }

  DimExpr* lhs() const { return lhs_; }
  DimExpr* rhs() const { return rhs_; }

 private:
  DimExpr* lhs_;
  DimExpr* rhs_;
};

// Simplify an expression tree: constant folding and algebraic identities.
// Returns a NEW expression (does not mutate input).
// The arena parameter is used to allocate nodes that will be owned externally.
DimExpr* SimplifyExpr(DimExpr* expr,
                      std::vector<std::unique_ptr<DimExpr>>* arena);

}  // namespace tensorflow

#endif  // TENSORFLOW_CORE_FRAMEWORK_TENSOR_SHAPE_EXPR_H_
