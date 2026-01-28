/* Copyright 2025 Huawei. All Rights Reserved.

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

#include "kernel_selector_ops_rewriter.h"

#include <cctype>
#include <fstream>
#include <regex>
#include <sstream>

#include "xla/hlo/ir/dfs_hlo_visitor_with_default.h"
#include "xla/hlo/ir/hlo_casting_utils.h"
#include "xla/literal_util.h"
#include "xla/service/cpu/cpu_runtime.h"

namespace xla {
namespace cpu {

// Uncomment to get printed information about the sizes and the call selected.
#define PRINT_DEBUG

#ifdef PRINT_DEBUG
#include <iostream>
#define DEBUG(x) std::cerr << x << "\n";
#else
#define DEBUG(x) \
  do {           \
  } while (0);
#endif

enum Operation { NONE, GEMV, GEMM, BATCH_MATMUL_3D, BATCH_MATMUL_4D };
enum KernelType { kGEMV, kGEMM, kBATCH3D, kBATCH4D, kARGMAX };

using Range = std::pair<int, int>;
using RangeSet = std::vector<Range>;

Range maxRange = {0, INT_MAX};

class IntervalMap {
  using TypedRange = std::pair<KernelType, RangeSet>;
  std::map<TypedRange, std::string> m_map;

 public:
  void insert(KernelType kTy, RangeSet& ranges, std::string& value) {
    m_map[{kTy, ranges}] = value;
  }

  bool lookup(KernelType kTy, std::vector<int>& keys, std::string& outValue,
              bool& fallback) const {
    fallback = false;
    for (const auto& entry : m_map) {
      TypedRange typedRange = entry.first;
      std::string value = entry.second;
      if (typedRange.first != kTy) continue;

      const RangeSet& ranges = typedRange.second;
      if (ranges.size() != keys.size()) continue;

      bool match = true;
      for (size_t i = 0; i < ranges.size(); ++i) {
        if (keys[i] < ranges[i].first || keys[i] > ranges[i].second) {
          match = false;
          break;
        }
        if (ranges[i] == maxRange) {
          fallback = true;
        }
      }

      if (match) {
        outValue = value;
        return true;
      }
    }
    return false;
  }

  void print() const {
    for (const auto& entry : m_map) {
      TypedRange typedRange = entry.first;
      std::string value = entry.second;
      int kTy = typedRange.first;
      const RangeSet& ranges = typedRange.second;

      DEBUG("[" << kTy << "](");
      for (const auto& range : ranges) {
        DEBUG("[" << range.first << ":" << range.second << "] ");
      }
      DEBUG(") -> " << value << "\n");
    }
  }

  void clear() { m_map.clear(); }
};

struct ParsedData {
  std::string kernelName;
  RangeSet sizes;
  std::string functionName;
  bool isValid;
};

std::map<std::string, KernelType> kernelStringToType = {{"gemv", kGEMV},
                                                        {"gemm", kGEMM},
                                                        {"batch3d", kBATCH3D},
                                                        {"batch4d", kBATCH4D},
                                                        {"argmax", kARGMAX}};
std::map<KernelType, std::string> kernelTypeToString;  // filled automatically.

std::map<KernelType, int> kernelTypeToSizeRank = {
    {kGEMV, 2}, {kGEMM, 3}, {kARGMAX, 3}, {kBATCH3D, 4}, {kBATCH4D, 5}};

int parseInt(const std::string& str) {
  if (str == "*") return maxRange.second;

  int size = std::stoi(str);
  if (size < 0) {
    LOG(ERROR) << "Found invalid size: " << size;
    return -1;
  }

  return size;
}

Range parseRange(const std::string& str) {
  size_t colonPos = str.find(':');

  if (str == "*") {
    return maxRange;
  }

  // For non-range strings like "1" we create a range {1,1}
  if (colonPos == std::string::npos) {
    int value = parseInt(str);
    return {value, value};
  }

  auto left = str.substr(0, colonPos);
  auto right = str.substr(colonPos + 1);

  int start = parseInt(left);
  int end = parseInt(right);

  assert(start <= end);

  return {start, end};
}

// Parses line from the mapping file which look like [kernel](size1,size2,...)
// -> symbol
ParsedData parseLine(std::string& line) {
  // Remove all whitespace from the line first.
  line.erase(std::remove_if(line.begin(), line.end(), ::isspace), line.end());
  // A range looks like 23:29 or 12:*
  std::string range = R"(\d+:(?:\d+|\*))";
  // An element is either a number, a *, or a range
  std::string element = R"((?:\d+|\*|)" + range + R"())";
  // Sizes is a list of elements in parentheses
  std::string sizes = R"(\(((?:)" + element + R"(,)*)" + element + R"()\))";
  std::regex pattern(R"(^\[(.+)\])" + sizes + R"(->(.+))");

  std::smatch matches;

  ParsedData data;
  data.isValid = false;

  if (std::regex_match(line, matches, pattern)) {
    data.kernelName = matches[1];
    std::stringstream ss(matches[2]);
    std::string token;

    while (std::getline(ss, token, ',')) {
      auto range = parseRange(token);
      if (range.first == -1 || range.second == -1) return data;
      data.sizes.push_back(range);
    }
    data.functionName = matches[3];
    data.isValid = true;
  } else {
    XLA_VLOG_LINES(3, "KernelSelectorOpsRewriter::parseLine() : No match.\n");
  }

  return data;
}

IntervalMap sizesToSymbol;

const char* kernel_map_file = std::getenv("KERNEL_MAP_FILE");

void fill_map_from_file(const char* map_file, IntervalMap& map) {
  if (!map_file) {
    XLA_VLOG_LINES(3, "NO MAP FILE\n");
    return;
  }

  std::ifstream file(map_file);
  if (!file.is_open()) {
    std::string file_name(map_file);
    XLA_VLOG_LINES(3,
                   "KernelSelectorOpsRewriter::fill_map_from_file() : Cannot "
                   "open file. \n");
    return;
  }

  // Clear the map to prevent conflicts and unexpected
  // behaviour due to default pre-filled values.
  map.clear();

  std::string line;
  int lineno = 1;
  while (std::getline(file, line)) {
    // If the file we are reading has Windows line endings, make sure
    // we remove the `\r` before processing the regex, otherwise it will
    // not match.
    if (!line.empty() && line.back() == '\r') {
      line.pop_back();
    }

    ParsedData data = parseLine(line);
    if (!data.isValid) {
      LOG(ERROR) << "Regex did not match on line " << lineno;
    } else {
      if (kernelStringToType.find(data.kernelName) ==
          kernelStringToType.end()) {
        LOG(ERROR) << data.kernelName << " is not a valid kernel type";
        return;
      }

      KernelType kTy = kernelStringToType[data.kernelName];
      int expectedRank = kernelTypeToSizeRank[kTy];

      // Fallback case (i.e. lines like [gemm](*) -> symbol): store in the map
      // the correct amount of "infinite" ranges:
      if (data.sizes.size() == 1 && data.sizes[0] == maxRange) {
        data.sizes.assign(expectedRank, maxRange);
      }

      if (data.sizes.size() != expectedRank) {
        LOG(ERROR) << data.kernelName
                   << " expected to have an input size of rank " << expectedRank
                   << ", but got " << data.sizes.size() << "(line " << lineno
                   << ")";
      } else {
        map.insert(kTy, data.sizes, data.functionName);
      }
    }
    lineno++;
  }

  return;
}

class KernelSelectorOpsRewriterVisitor : public DfsHloRewriteVisitor {
 private:
  void printDebugMessage(KernelType kTy, std::vector<int> sizes) {
    std::string debug_msg = "{";
    for (size_t i = 0; i < sizes.size(); ++i) {
      debug_msg += std::to_string(sizes[i]);
      if (i != sizes.size() - 1) {
        debug_msg += ", ";
      }
    }
    debug_msg +=
        "} -> Is not on the map and a fallback was not specified. The " +
        kernelTypeToString[kTy] + " will not be replaced.";

    DEBUG(debug_msg);
  }

  std::string GetKernelSelectorFunction(KernelType kTy, std::vector<int> sizes,
                                        bool& fallback) {
    std::string fun_name;
    bool found = sizesToSymbol.lookup(kTy, sizes, fun_name, fallback);
    fallback = false;

    if (!found) {
#ifdef PRINT_DEBUG
      printDebugMessage(kTy, sizes);
#endif
    }
    return fun_name;
  }

  Operation getOperation(HloInstruction* instr) {
    if (auto* dot = DynCast<HloDotInstruction>(instr)) {
      auto batch_dims = dot->dot_dimension_numbers().lhs_batch_dimensions();
      auto dims = dot->shape().dimensions();
      if (batch_dims.size() == 1) {
        return Operation::BATCH_MATMUL_3D;
      }
      if (batch_dims.size() == 2) {
        return Operation::BATCH_MATMUL_4D;
      }
      if (dims.size() == 1) {
        return Operation::GEMV;
      }
      if (batch_dims.empty()) {
        return Operation::GEMM;
      }
    }
    return Operation::NONE;
  }

  template <typename T>
  HloInstruction* makeConstant(HloInstruction* op, T value) {
    auto litteral = LiteralUtil::CreateR0<T>(value);
    return op->AddInstruction(
        HloInstruction::CreateConstant(std::move(litteral)));
  }

#ifdef PRINT_DEBUG
  std::map<std::vector<int>, std::string> AllocatedGemmSizes;
  std::map<std::vector<int>, std::string> AllocatedGemvSizes;
  std::map<std::vector<int>, std::string> AllocatedBatchMatmul3DSizes;
  std::map<std::vector<int>, std::string> AllocatedBatchMatmul4DSizes;
  std::map<std::vector<int>, std::string> AllocatedArgMax3DSizes;
#endif

 public:
  absl::Status HandleDot(HloInstruction* dot) override {
    Operation operation = getOperation(dot);
    if (operation == Operation::NONE) {
      return absl::OkStatus();
    }
    bool fallbackSelected;

    // Collect all the operands for the CustomCall
    switch (operation) {
      case GEMM: {
        KernelType kTy = kGEMM;
        auto dnums = dot->dot_dimension_numbers();
        auto lhs_contracting_dims = dnums.lhs_contracting_dimensions();
        auto rhs_contracting_dims = dnums.rhs_contracting_dimensions();

        assert(lhs_contracting_dims.size() == 1);
        assert(rhs_contracting_dims.size() == 1);

        HloInstruction* trA = makeConstant(dot, lhs_contracting_dims[0] == 0);
        HloInstruction* trB = makeConstant(dot, rhs_contracting_dims[0] == 1);

        HloInstruction* alpha = makeConstant(dot, (float)1.0);
        HloInstruction* beta = makeConstant(dot, (float)0.0);

        HloInstruction* A = dot->operands()[0];
        HloInstruction* B = dot->operands()[1];

        int m = dot->shape().dimensions(0);
        HloInstruction* M = makeConstant(dot, m);

        int n = dot->shape().dimensions(1);
        HloInstruction* N = makeConstant(dot, n);

        int k = A->shape().dimensions(lhs_contracting_dims[0]);
        HloInstruction* K = makeConstant(dot, k);

        std::string fun_name =
            GetKernelSelectorFunction(kTy, {m, n, k}, fallbackSelected);
        if (fun_name.empty()) return absl::OkStatus();

#ifdef PRINT_DEBUG
        if (AllocatedGemmSizes.find({m, n, k}) == AllocatedGemmSizes.end()) {
          AllocatedGemmSizes[{m, n, k}] = fun_name;
          DEBUG("{m: " << m << ", n: " << n << ", k: " << k << "} -> "
                       << fun_name << (fallbackSelected ? " (fallback)" : ""));
        }
#endif

        std::vector<HloInstruction*> operands = {trA, trB, A,     B,   M,
                                                 N,   K,   alpha, beta};

        HloInstruction* kernel_selector_call =
            dot->AddInstruction(HloInstruction::CreateCustomCall(
                dot->shape(), operands, runtime::kCustomCallKernelSelector));

        // Add metadata
        OpMetadata metadata = dot->metadata();
        metadata.set_op_name(fun_name);
        metadata.set_op_type(runtime::kKernelSelectorOperationGEMM);
        kernel_selector_call->set_metadata(metadata);
        TF_RETURN_IF_ERROR(ReplaceInstruction(dot, kernel_selector_call));

        break;
      }
      case GEMV: {
        KernelType kTy = kGEMV;
        auto dnums = dot->dot_dimension_numbers();
        auto lhs_contracting_dims = dnums.lhs_contracting_dimensions();

        assert(lhs_contracting_dims.size() == 1);

        bool is_trA = lhs_contracting_dims[0] == 0;
        HloInstruction* trA = makeConstant(dot, is_trA);

        HloInstruction* alpha = makeConstant(dot, (float)1.0);
        HloInstruction* beta = makeConstant(dot, (float)0.0);

        HloInstruction* A = dot->operands()[0];
        HloInstruction* X = dot->operands()[1];

        int m = A->shape().dimensions(is_trA ? 1 : 0);
        HloInstruction* M = makeConstant(dot, m);

        int n = A->shape().dimensions(is_trA ? 0 : 1);
        HloInstruction* N = makeConstant(dot, n);

        std::string fun_name =
            GetKernelSelectorFunction(kTy, {m, n}, fallbackSelected);
        if (fun_name.empty()) return absl::OkStatus();

#ifdef PRINT_DEBUG
        if (AllocatedGemvSizes.find({m, n}) == AllocatedGemvSizes.end()) {
          AllocatedGemvSizes[{m, n}] = fun_name;
          DEBUG("{m: " << m << ", n: " << n << "} -> " << fun_name
                       << (fallbackSelected ? " (fallback)" : ""));
        }
#endif

        std::vector<HloInstruction*> operands = {trA, A, X, M, N, alpha, beta};

        HloInstruction* kernel_selector_call =
            dot->AddInstruction(HloInstruction::CreateCustomCall(
                dot->shape(), operands, runtime::kCustomCallKernelSelector));

        // Add metadata
        OpMetadata metadata = dot->metadata();
        metadata.set_op_name(fun_name);
        metadata.set_op_type(runtime::kKernelSelectorOperationGEMV);
        kernel_selector_call->set_metadata(metadata);
        TF_RETURN_IF_ERROR(ReplaceInstruction(dot, kernel_selector_call));

        break;
      }
      case BATCH_MATMUL_3D: {
        KernelType kTy = kBATCH3D;
        auto dnums = dot->dot_dimension_numbers();
        auto lhs_contracting_dims = dnums.lhs_contracting_dimensions();
        auto rhs_contracting_dims = dnums.rhs_contracting_dimensions();

        assert(lhs_contracting_dims.size() == 1);
        assert(rhs_contracting_dims.size() == 1);

        HloInstruction* trA = makeConstant(dot, lhs_contracting_dims[0] == 1);
        HloInstruction* trB = makeConstant(dot, rhs_contracting_dims[0] == 2);

        HloInstruction* A = dot->operands()[0];
        HloInstruction* B = dot->operands()[1];

        int p = dot->shape().dimensions(0);
        HloInstruction* P = makeConstant(dot, p);

        int num_batch_dims = dnums.lhs_batch_dimensions_size();

        int m = dot->shape().dimensions(num_batch_dims);
        HloInstruction* M = makeConstant(dot, m);

        int n = dot->shape().dimensions(num_batch_dims + 1);
        HloInstruction* N = makeConstant(dot, n);

        int k = A->shape().dimensions(lhs_contracting_dims[0]);
        HloInstruction* K = makeConstant(dot, k);

        std::string fun_name =
            GetKernelSelectorFunction(kTy, {p, m, n, k}, fallbackSelected);
        if (fun_name.empty()) return absl::OkStatus();

#ifdef PRINT_DEBUG
        if (AllocatedBatchMatmul3DSizes.find({p, m, n, k}) ==
            AllocatedBatchMatmul3DSizes.end()) {
          AllocatedBatchMatmul3DSizes[{p, m, n, k}] = fun_name;
          DEBUG("{p: " << p << ", m: " << m << ", n: " << n << ", k: " << k
                       << "} -> " << fun_name
                       << (fallbackSelected ? " (fallback)" : ""));
        }
#endif

        std::vector<HloInstruction*> operands = {trA, trB, A, B, P, M, N, K};

        HloInstruction* kernel_selector_call =
            dot->AddInstruction(HloInstruction::CreateCustomCall(
                dot->shape(), operands, runtime::kCustomCallKernelSelector));

        // Add metadata
        OpMetadata metadata = dot->metadata();
        metadata.set_op_name(fun_name);
        metadata.set_op_type(runtime::kKernelSelectorOperationBATCH3D);
        kernel_selector_call->set_metadata(metadata);
        TF_RETURN_IF_ERROR(ReplaceInstruction(dot, kernel_selector_call));

        break;
      }
      case BATCH_MATMUL_4D: {
        KernelType kTy = kBATCH4D;
        auto dnums = dot->dot_dimension_numbers();
        auto lhs_contracting_dims = dnums.lhs_contracting_dimensions();
        auto rhs_contracting_dims = dnums.rhs_contracting_dimensions();

        assert(lhs_contracting_dims.size() == 1);
        assert(rhs_contracting_dims.size() == 1);

        HloInstruction* trA = makeConstant(dot, lhs_contracting_dims[0] == 2);
        HloInstruction* trB = makeConstant(dot, rhs_contracting_dims[0] == 3);

        HloInstruction* A = dot->operands()[0];
        HloInstruction* B = dot->operands()[1];

        int q = dot->shape().dimensions(0);
        HloInstruction* Q = makeConstant(dot, q);

        int p = dot->shape().dimensions(1);
        HloInstruction* P = makeConstant(dot, p);

        int num_batch_dims = dnums.lhs_batch_dimensions_size();

        int m = dot->shape().dimensions(num_batch_dims);
        HloInstruction* M = makeConstant(dot, m);

        int n = dot->shape().dimensions(num_batch_dims + 1);
        HloInstruction* N = makeConstant(dot, n);

        int k = A->shape().dimensions(lhs_contracting_dims[0]);
        HloInstruction* K = makeConstant(dot, k);

        std::string fun_name = GetKernelSelectorFunction(kTy, {q, p, m, n, k}, fallbackSelected);

        if (fun_name.empty()) return absl::OkStatus();

#ifdef PRINT_DEBUG
        if (AllocatedBatchMatmul4DSizes.find({q, p, m, n, k}) ==
            AllocatedBatchMatmul4DSizes.end()) {
          AllocatedBatchMatmul4DSizes[{q, p, m, n, k}] = fun_name;
          DEBUG("{q: " << q << ", p: " << p << ", m: " << m << ", n: " << n
                       << ", k: " << k << "} -> " << fun_name
                       << (fallbackSelected ? " (fallback)" : ""));
        }
#endif

        std::vector<HloInstruction*> operands = {trA, trB, A, B, Q, P, M, N, K};

        HloInstruction* kernel_selector_call =
            dot->AddInstruction(HloInstruction::CreateCustomCall(
                dot->shape(), operands, runtime::kCustomCallKernelSelector));

        // Add metadata
        OpMetadata metadata = dot->metadata();
        metadata.set_op_name(fun_name);
        metadata.set_op_type(runtime::kKernelSelectorOperationBATCH4D);
        kernel_selector_call->set_metadata(metadata);
        TF_RETURN_IF_ERROR(ReplaceInstruction(dot, kernel_selector_call));

        break;
      }
      default:
        DEBUG("No library funcion was selected.");
        return absl::OkStatus();
    }

    return absl::OkStatus();
  }

  absl::Status HandleReduce(HloInstruction* reduce) override {
    bool fallbackSelected;
    std::string op_type = reduce->metadata().op_type();
    // TODO: Is this reliable way to check for ArgMax?
    // Works for BERT but its unclear if this is the proper way.
    if (op_type != "ArgMax") {
      return absl::OkStatus();
    }

    auto reduceOpr = reduce->operands();
    // The ArgMax pattern we support has exactly 4 operands.
    if (reduceOpr.size() != 4) {
      return absl::OkStatus();
    }

    // We currently only support 3D ArgMax.
    auto dims = reduceOpr[0]->shape().dimensions();
    if (dims.size() != 3) {
      return absl::OkStatus();
    }

    KernelType kTy = kARGMAX;
    int b = dims[0];
    int m = dims[1];
    int n = dims[2];

    std::string fun_name = GetKernelSelectorFunction(kTy, {b, m, n}, fallbackSelected);

    if (fun_name.empty()) return absl::OkStatus();

#ifdef PRINT_DEBUG
    if (AllocatedArgMax3DSizes.find({b, m, n}) ==
        AllocatedArgMax3DSizes.end()) {
      AllocatedArgMax3DSizes[{b, m, n}] = fun_name;
      DEBUG("{b: " << b << ", m: " << m << ", n: " << n << "} -> " << fun_name
                   << (fallbackSelected ? " (fallback)" : ""));
    }
#endif

    std::vector<HloInstruction*> operands;
    for (int i = 0; i < 4; i++) operands.push_back(reduceOpr[i]);

    HloInstruction* kernel_selector_call =
        reduce->AddInstruction(HloInstruction::CreateCustomCall(
            reduce->shape(), operands, runtime::kCustomCallKernelSelector));

    // Add metadata
    OpMetadata metadata = reduce->metadata();
    metadata.set_op_name(fun_name);
    metadata.set_op_type(runtime::kKernelSelectorOperationARGMAX);
    kernel_selector_call->set_metadata(metadata);
    TF_RETURN_IF_ERROR(ReplaceInstruction(reduce, kernel_selector_call));

    return absl::OkStatus();
  }
};  // namespace cpu

absl::StatusOr<bool> KernelSelectorOpsRewriter::Run(
    HloModule* module,
    const absl::flat_hash_set<absl::string_view>& execution_threads) {
  XLA_VLOG_LINES(
      3, "KernelSelectorOpsRewriter::Run(), before:\n" + module->ToString());

  if (!kernel_map_file) {
    LOG(INFO) << "KERNEL_MAP_FILE is not set. The kernel selector will not "
                 "run.\n Check xla/service/cpu/example_kernel_map.txt for an "
                 "example of kernel map file";
    return absl::OkStatus();
  }

  // Build the reverse map.
  for (const auto& pair : kernelStringToType) {
    kernelTypeToString[pair.second] = pair.first;
  }

  fill_map_from_file(kernel_map_file, sizesToSymbol);

  KernelSelectorOpsRewriterVisitor visitor;
  TF_ASSIGN_OR_RETURN(auto result,
                      visitor.RunOnModule(module, execution_threads));
  XLA_VLOG_LINES(
      3, "KernelSelectorOpsRewriter::Run(), after:\n" + module->ToString());
  return result;
}

}  // namespace cpu
}  // namespace xla
