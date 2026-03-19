#include "tensorflow/core/framework/tensor_shape_expr.h"

namespace tensorflow {

std::unique_ptr<DimExpr> DimExpr::Cons(int64_t val) {
  return std::make_unique<Constant>(val);
}

std::unique_ptr<DimExpr> DimExpr::Var(int32_t id) {
  return std::make_unique<Variable>(id);
}

std::string DimExpr::DebugString() const {
  ExpressionProto proto;
  ToProto(&proto);
  return proto.DebugString();
}

static bool EqualsImpl(const DimExpr* a, const DimExpr* b) {
  if (a == b) return true;
  if (a == nullptr || b == nullptr) return false;
  if (a->kind() != b->kind()) return false;

  switch (a->kind()) {
    case DimExpr::Kind::kConstant: {
      auto* ac = static_cast<const Constant*>(a);
      auto* bc = static_cast<const Constant*>(b);
      return ac->value() == bc->value();
    }
    case DimExpr::Kind::kVariable: {
      auto* av = static_cast<const Variable*>(a);
      auto* bv = static_cast<const Variable*>(b);
      return av->id() == bv->id();
    }
    case DimExpr::Kind::kAdd: {
      auto* aa = static_cast<const ExprAdd*>(a);
      auto* ba = static_cast<const ExprAdd*>(b);
      return EqualsImpl(aa->lhs(), ba->lhs()) &&
             EqualsImpl(aa->rhs(), ba->rhs());
    }
    case DimExpr::Kind::kSub: {
      auto* as = static_cast<const ExprSub*>(a);
      auto* bs = static_cast<const ExprSub*>(b);
      return EqualsImpl(as->lhs(), bs->lhs()) &&
             EqualsImpl(as->rhs(), bs->rhs());
    }
    case DimExpr::Kind::kMul: {
      auto* am = static_cast<const ExprMul*>(a);
      auto* bm = static_cast<const ExprMul*>(b);
      return EqualsImpl(am->lhs(), bm->lhs()) &&
             EqualsImpl(am->rhs(), bm->rhs());
    }
    case DimExpr::Kind::kDiv: {
      auto* ad = static_cast<const ExprDiv*>(a);
      auto* bd = static_cast<const ExprDiv*>(b);
      return EqualsImpl(ad->lhs(), bd->lhs()) &&
             EqualsImpl(ad->rhs(), bd->rhs());
    }
  }

  return false;
}

bool DimExpr::Equals(const DimExpr* a, const DimExpr* b) {
  return EqualsImpl(a, b);
}

std::unique_ptr<DimExpr> DimExpr::FromProto(const ExpressionProto& proto) {
  switch (proto.node_type_case()) {
    case ExpressionProto::kConstantValue:
      return DimExpr::Cons(proto.constant_value());
    case ExpressionProto::kVariableId:
      return DimExpr::Var(proto.variable_id());
    case ExpressionProto::kAddNode: {
      auto lhs = FromProto(proto.add_node().lhs());
      auto rhs = FromProto(proto.add_node().rhs());
      // Note: These are owning pointers, but ExprAdd takes raw pointers.
      // The caller must manage lifetime appropriately.
      return std::make_unique<ExprAdd>(lhs.release(), rhs.release());
    }
    case ExpressionProto::kSubNode: {
      auto lhs = FromProto(proto.sub_node().lhs());
      auto rhs = FromProto(proto.sub_node().rhs());
      return std::make_unique<ExprSub>(lhs.release(), rhs.release());
    }
    case ExpressionProto::kMulNode: {
      auto lhs = FromProto(proto.mul_node().lhs());
      auto rhs = FromProto(proto.mul_node().rhs());
      return std::make_unique<ExprMul>(lhs.release(), rhs.release());
    }
    case ExpressionProto::kDivNode: {
      auto lhs = FromProto(proto.div_node().lhs());
      auto rhs = FromProto(proto.div_node().rhs());
      return std::make_unique<ExprDiv>(lhs.release(), rhs.release());
    }
    case ExpressionProto::NODE_TYPE_NOT_SET:
    default:
      return nullptr;
  }
}

DimExpr* SimplifyExpr(DimExpr* expr,
                      std::vector<std::unique_ptr<DimExpr>>* arena) {
  if (!expr) return nullptr;

  auto own = [arena](std::unique_ptr<DimExpr> e) -> DimExpr* {
    DimExpr* ptr = e.get();
    arena->push_back(std::move(e));
    return ptr;
  };

  switch (expr->kind()) {
    case DimExpr::Kind::kConstant:
    case DimExpr::Kind::kVariable:
      return expr;

    case DimExpr::Kind::kAdd: {
      auto* add = static_cast<ExprAdd*>(expr);
      DimExpr* lhs = SimplifyExpr(add->lhs(), arena);
      DimExpr* rhs = SimplifyExpr(add->rhs(), arena);

      // Constant folding
      if (lhs->IsConstant() && rhs->IsConstant()) {
        return own(DimExpr::Cons(lhs->ConstantValue() + rhs->ConstantValue()));
      }

      // x + 0 → x
      if (rhs->IsConstant() && rhs->ConstantValue() == 0) return lhs;
      if (lhs->IsConstant() && lhs->ConstantValue() == 0) return rhs;

      return own(std::make_unique<ExprAdd>(lhs, rhs));
    }

    case DimExpr::Kind::kSub: {
      auto* sub = static_cast<ExprSub*>(expr);
      DimExpr* lhs = SimplifyExpr(sub->lhs(), arena);
      DimExpr* rhs = SimplifyExpr(sub->rhs(), arena);

      // Constant folding
      if (lhs->IsConstant() && rhs->IsConstant()) {
        return own(DimExpr::Cons(lhs->ConstantValue() - rhs->ConstantValue()));
      }

      // x - 0 → x
      if (rhs->IsConstant() && rhs->ConstantValue() == 0) return lhs;

      return own(std::make_unique<ExprSub>(lhs, rhs));
    }

    case DimExpr::Kind::kMul: {
      auto* mul = static_cast<ExprMul*>(expr);
      DimExpr* lhs = SimplifyExpr(mul->lhs(), arena);
      DimExpr* rhs = SimplifyExpr(mul->rhs(), arena);

      // Constant folding
      if (lhs->IsConstant() && rhs->IsConstant()) {
        return own(DimExpr::Cons(lhs->ConstantValue() * rhs->ConstantValue()));
      }

      // x * 1 → x
      if (rhs->IsConstant() && rhs->ConstantValue() == 1) return lhs;
      if (lhs->IsConstant() && lhs->ConstantValue() == 1) return rhs;

      // x * 0 → 0
      if (rhs->IsConstant() && rhs->ConstantValue() == 0)
        return own(DimExpr::Cons(0));
      if (lhs->IsConstant() && lhs->ConstantValue() == 0)
        return own(DimExpr::Cons(0));

      return own(std::make_unique<ExprMul>(lhs, rhs));
    }

    case DimExpr::Kind::kDiv: {
      auto* div = static_cast<ExprDiv*>(expr);
      DimExpr* lhs = SimplifyExpr(div->lhs(), arena);
      DimExpr* rhs = SimplifyExpr(div->rhs(), arena);

      // Constant folding (avoid div by zero)
      if (lhs->IsConstant() && rhs->IsConstant()) {
        int64_t r = rhs->ConstantValue();
        if (r != 0) {
          return own(DimExpr::Cons(lhs->ConstantValue() / r));
        }
      }

      // x / 1 → x
      if (rhs->IsConstant() && rhs->ConstantValue() == 1) return lhs;

      return own(std::make_unique<ExprDiv>(lhs, rhs));
    }
  }

  return expr;
}

}  // namespace tensorflow
