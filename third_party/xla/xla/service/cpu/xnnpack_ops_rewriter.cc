/*
Referenced & Modified External Open Source Code:
Original Copyright: 2023 The OpenXLA Authors.

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

#include "xnnpack_ops_rewriter.h"

#include "xla/hlo/ir/dfs_hlo_visitor_with_default.h"
#include "xla/literal_comparison.h"
#include "xla/literal_util.h"
#include "xnnpack_pattern_utils.h"
#include "xla/status_macros.h"

namespace xla {
namespace cpu {

extern const char* const kCustomCallXnnPackSoftMax = "__xnnpack$softmax";

namespace {
namespace m = match;
namespace pu = ::xla::cpu::xnnpack_pattern_utils_internal;

bool IsNegInfConstScalar(const HloInstruction* const_instr) {
  if (const_instr->opcode() != HloOpcode::kConstant) {
    return false;
  }
  if (!ShapeUtil::IsEffectiveScalar(const_instr->shape())) {
    return false;
  }
  auto value = LiteralUtil::GetFirstScalarLiteral(const_instr->literal());
  return literal_comparison::Equal(
             value, LiteralUtil::MinValue(const_instr->shape().element_type()))
      .ok();
}

bool IsMaxReducerComputation(const HloComputation* comp) {
  if (comp->root_instruction()->opcode() != HloOpcode::kMaximum) {
    return false;
  }
  auto max_instr = comp->root_instruction();
  const HloInstruction* p0 = comp->parameter_instruction(0);
  const HloInstruction* p1 = comp->parameter_instruction(1);
  const HloInstruction* max_p0 = max_instr->operand(0);
  const HloInstruction* max_p1 = max_instr->operand(1);
  return (max_p0 == p0 && max_p1 == p1) || (max_p1 == p0 && max_p0 == p1);
}

// Pattern to match any of Maximum(Reduce_max(...), -inf) or Reduce_max(...).
auto MaxReduce(HloInstruction** instr) {
  auto is_valid_reduce_max = [](const HloInstruction* reduce) {
    HloComputation* reducer = reduce->to_apply();
    return IsMaxReducerComputation(reducer) &&
           (reduce->dimensions().size() == 1) &&
           (reduce->operand(1)->opcode() == HloOpcode::kConstant) &&
           IsNegInfConstScalar(reduce->operand(1));
  };

  return m::AnyOf<HloInstruction>(
      m::Maximum().WithBinaryOperandsAnyOrder(
          m::Reduce(instr).WithPredicate(is_valid_reduce_max).WithOneUse(),
          pu::OptionalBroadcast(
              m::Constant().WithPredicate(IsNegInfConstScalar))),
      m::Reduce(instr).WithPredicate(is_valid_reduce_max).WithOneUse());
}

// Matches the softmax pattern with divide instruction as root node.
// Here we pass 'instr' as root node and return the producer HloInstruction.
// Tha axis on which softmax is applied is stored in 'axis'.
std::optional<HloInstruction*> MatchSoftmax(HloInstruction* instr, int* axis) {
  //
  // producer
  // |   \
  // |  reduce_max or max(reduce_max)
  // |     |
  // |  reshape
  // |     |
  // |  broadcast
  // |     |
  // |  reshape
  // |     |
  // |  broadcast
  // |   /
  // subtract
  // |
  // exponential
  // |   \
  // |   Convert(optional)
  // |     |
  // |  reduce_sum
  // |     |
  // |   Convert(optional)
  // |     |
  // |  reshape
  // |     |
  // |   Convert(optional)
  // |     |
  // |  broadcast
  // |     |
  // |  reshape
  // |     |
  // |  broadcast
  // |   /
  // divide  // (instr parameter)
  //

  // This matcher covers the most common SoftMax patterns we have encountered
  // in real-life models.
  HloInstruction* left_exponential;
  HloInstruction* right_exponential;
  HloInstruction* left_producer;
  HloInstruction* reduce_sum;
  HloInstruction* reduce_max;
  HloInstruction* reduce_instr;

  // Lower diamond
  if (!Match(instr,
             m::Divide(
                 m::Exp(&left_exponential, m::Op()),
                 m::Broadcast(m::Reshape(m::Broadcast(
                     pu::OptionalConvert(m::Reshape(pu::OptionalConvert(
                         m::Reduce(&reduce_sum,
                                   pu::OptionalConvert(
                                       m::Exp(&right_exponential, m::Op())),
                                   m::ConstantScalar(0))
                             .WithPredicate([](const HloInstruction* reduce) {
                               HloComputation* reducer = reduce->to_apply();
                               return (reducer->root_instruction()->opcode() ==
                                           HloOpcode::kAdd &&
                                       reduce->dimensions().size() == 1);
                             })
                             .WithOneUse()))))))))) {
    return std::nullopt;
  }

  if (left_exponential != right_exponential ||
      left_exponential->user_count() != 2) {
    return std::nullopt;
  }

  // Upper diamond
  if (!Match(left_exponential->mutable_operand(0),
             m::Subtract(m::Op(&left_producer),
                         m::Broadcast(m::Reshape(m::Broadcast(
                                          m::Reshape(m::Op(&reduce_instr)))))
                             .WithOneUse())
                 .WithOneUse())) {
    return std::nullopt;
  }

  // Match the reduce max.
  if (!Match(reduce_instr, MaxReduce(&reduce_max))) {
    return std::nullopt;
  }

  if (left_producer != reduce_max->operand(0) ||
      left_producer->user_count() != 2) {
    return std::nullopt;
  }

  if (reduce_sum->dimensions()[0] != reduce_max->dimensions()[0]) {
    return std::nullopt;
  }

  *axis = reduce_sum->dimensions()[0];

  return left_producer;
}

}  // namespace

class XnnPackOpsRewriterVisitor : public DfsHloRewriteVisitor {
 public:
  absl::Status HandleDivide(HloInstruction* divide_instr) override {
    if (divide_instr->HasControlDependencies()) {
      return absl::OkStatus();
    }
    if (!pu::IsSupportedType(divide_instr->shape().element_type())) {
      return absl::OkStatus();
    }
    int axis = -1;
    std::optional<HloInstruction*> producer = MatchSoftmax(divide_instr, &axis);
    if (producer == std::nullopt) {
      return absl::OkStatus();
    }

    const Shape& output_shape = divide_instr->shape();
    int softmax_dims = output_shape.dimensions().size();
    if (softmax_dims < 2) {
      XLA_VLOG_LINES(3, "Found SoftMax with " + std::to_string(softmax_dims) +
                            " dims, which is not supported\n");
      return absl::OkStatus();
    }

    HloInstruction* softmax_call =
        divide_instr->AddInstruction(HloInstruction::CreateCustomCall(
            output_shape, {producer.value()}, kCustomCallXnnPackSoftMax));
    TF_RETURN_IF_ERROR(ReplaceInstruction(divide_instr, softmax_call));

    return absl::OkStatus();
  }
};

absl::StatusOr<bool> XnnPackOpsRewriter::Run(
    HloModule* module,
    const absl::flat_hash_set<absl::string_view>& execution_threads) {
  XLA_VLOG_LINES(3,
                 "XnnPackOpsRewriter::Run(), before:\n" + module->ToString());
  XnnPackOpsRewriterVisitor visitor;
  TF_ASSIGN_OR_RETURN(auto result,
                      visitor.RunOnModule(module, execution_threads));
  XLA_VLOG_LINES(3, "XnnPackOpsRewriter::Run(), after:\n" + module->ToString());
  return result;
}

}  // namespace cpu
}  // namespace xla
