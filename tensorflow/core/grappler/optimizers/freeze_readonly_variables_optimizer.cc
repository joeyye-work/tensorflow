#include "tensorflow/core/grappler/optimizers/freeze_readonly_variables_optimizer.h"

#include "absl/container/flat_hash_map.h"
#include "absl/strings/match.h"
#include "absl/strings/numbers.h"
#include "absl/strings/string_view.h"
#include "tensorflow/core/framework/attr_value.pb.h"
#include "tensorflow/core/framework/function.pb.h"
#include "tensorflow/core/framework/node_def.pb.h"
#include "tensorflow/core/framework/node_def_util.h"
#include "tensorflow/core/framework/op.h"
#include "tensorflow/core/framework/op_def.pb.h"
#include "tensorflow/core/framework/tensor.h"
#include "tensorflow/core/framework/tensor.pb.h"
#include "tensorflow/core/framework/tensor_shape.h"
#include "tensorflow/core/framework/types.h"
#include "tensorflow/core/graph/tensor_id.h"
#include "tensorflow/core/grappler/grappler_item.h"
#include "tensorflow/core/grappler/optimizers/custom_graph_optimizer_registry.h"
#include "tensorflow/core/grappler/utils.h"
#include "tensorflow/core/platform/env.h"
#include "tensorflow/core/platform/errors.h"
#include "tensorflow/core/platform/logging.h"
#include "tensorflow/core/platform/status.h"
#include "tensorflow/core/platform/strcat.h"
#include "tensorflow/core/platform/types.h"
#include "tensorflow/core/util/tensor_bundle/tensor_bundle.h"

namespace tensorflow {
namespace grappler {
namespace {

constexpr char kOptimizerCheckpointEnvVar[] =
  "TF_XLA_FREEZE_READONLY_VARIABLES_OPTIMIZER_CHECKPOINT";
constexpr char kOptimizerMaxTensorBytesEnvVar[] =
  "TF_XLA_FREEZE_READONLY_VARIABLES_OPTIMIZER_MAX_BYTES";
constexpr int64_t kDefaultMaxTensorBytes = 1LL * 1024 * 1024; // Set default to 1 MiB to avoid OOM when accidentally freezing large variables.

struct FrozenVariable {
  DataType dtype = DT_INVALID;
  TensorProto value;
};

int64_t MaxTensorBytes() {
  const char* value = std::getenv(kOptimizerMaxTensorBytesEnvVar);
  if (value == nullptr || value[0] == '\0') return kDefaultMaxTensorBytes;

  int64_t parsed = 0;
  if (!absl::SimpleAtoi(value, &parsed) || parsed < 0) {
    LOG(WARNING) << "Ignoring invalid " << kOptimizerMaxTensorBytesEnvVar
                 << "=" << value << "; using " << kDefaultMaxTensorBytes;
    return kDefaultMaxTensorBytes;
  }
  return parsed;
}

bool EstimateTensorBytes(DataType dtype, const TensorShape& shape,
                         int64_t& estimated_bytes) {
  const int64_t elements = shape.num_elements();
  const int dtype_size = DataTypeSize(dtype);
  if (elements < 0 || dtype_size <= 0) return false;
  if (elements > std::numeric_limits<int64_t>::max() / dtype_size) {
    estimated_bytes = std::numeric_limits<int64_t>::max();
    return true;
  }
  estimated_bytes = elements * dtype_size;
  return true;
}

bool IsVariableNode(const NodeDef* node) {
  return node->op() == "VarHandleOp" || node->op() == "VariableV2";
}

bool IsMutatingVariableOp(absl::string_view op) {
  return op == "Assign" || op == "AssignAdd" || op == "AssignSub" ||
         op == "AssignVariableOp" || op == "AssignAddVariableOp" ||
         op == "AssignSubVariableOp" || op == "DestroyResourceOp" ||
         absl::StartsWith(op, "ResourceApply") ||
         absl::StartsWith(op, "ResourceScatter") ||
         absl::StartsWith(op, "Scatter");
}

std::vector<std::string> ControlInputs(const NodeDef* node) {
  std::vector<std::string> inputs;
  for (const std::string& input : node->input()) {
    if (IsControlInput(input)) inputs.push_back(input);
  }
  return inputs;
}

bool FindDataInput(const NodeDef* node, int dst_input, std::string& input) {
  int data_input = 0;
  for (const std::string& candidate : node->input()) {
    if (IsControlInput(candidate)) continue;
    if (data_input == dst_input) {
      input = candidate;
      return true;
    }
    ++data_input;
  }
  return false;
}

void SetInputs(const std::vector<std::string>& inputs, NodeDef* node) {
  node->clear_input();
  for (const std::string& input : inputs) node->add_input(input);
}

std::string TensorName(absl::string_view node_name, int output_index) {
  if (output_index == 0) return std::string(node_name);
  return strings::StrCat(node_name, ":", output_index);
}

bool SetDataInput(NodeDef* node, int dst_input, absl::string_view new_input) {
  int data_input = 0;
  for (std::string& input : *node->mutable_input()) {
    if (IsControlInput(input)) continue;
    if (data_input == dst_input) {
      input = std::string(new_input);
      return true;
    }
    ++data_input;
  }
  return false;
}

void CopyInternalAttrs(const NodeDef* from, NodeDef* to) {
  for (const auto& attr : from->attr()) {
    if (!attr.first.empty() && attr.first[0] == '_') {
      (*to->mutable_attr())[attr.first] = attr.second;
    }
  }
}

NodeDef BaseReplacementDef(const NodeDef* old_node, absl::string_view op) {
  NodeDef node_def;
  node_def.set_name(old_node->name());
  node_def.set_op(std::string(op));
  node_def.set_device(old_node->device());
  CopyInternalAttrs(old_node, &node_def);
  return node_def;
}

void AddUniqueKey(absl::string_view key, std::vector<std::string>& keys) {
  if (key.empty()) return;
  for (const std::string& existing : keys) {
    if (absl::string_view(existing) == key) return;
  }
  keys.push_back(std::string(key));
}

void AddCheckpointKey(absl::string_view key, std::vector<std::string>& keys) {
  AddUniqueKey(key, keys);
  AddUniqueKey(strings::StrCat(key, "/.ATTRIBUTES/VARIABLE_VALUE"), keys);
}

bool HasPartSuffix(absl::string_view value, size_t part_pos) {
  const size_t part_index_pos = part_pos + strlen("/part_");
  if (part_index_pos >= value.size()) return false;
  for (size_t i = part_index_pos; i < value.size(); ++i) {
    if (value[i] < '0' || value[i] > '9') return false;
  }
  return true;
}

void AddCandidateCheckpointKeyVariants(absl::string_view key,
                                       std::vector<std::string>& keys) {
  if (key.empty()) return;

  std::vector<std::string> bases;
  bases.push_back(std::string(key));
  if (absl::StartsWith(key, "varhandle/")) {
    bases.push_back(std::string(key.substr(strlen("varhandle/"))));
  }

  for (const std::string& base : bases) {
    AddCheckpointKey(base, keys);

    const size_t part_pos = base.rfind("/part_");
    if (part_pos != std::string::npos && HasPartSuffix(base, part_pos)) {
      AddCheckpointKey(base.substr(0, part_pos), keys);
    }
  }
}

std::vector<std::string> CandidateCheckpointKeys(const NodeDef* node) {
  std::vector<std::string> keys;
  std::string shared_name;
  if (!GetNodeAttr(*node, "shared_name", &shared_name).ok()) {
    shared_name.clear();
  }
  if (!shared_name.empty()) {
    AddCandidateCheckpointKeyVariants(shared_name, keys);
  }
  AddCandidateCheckpointKeyVariants(node->name(), keys);
  return keys;
}

class CheckpointTensorReader {
 public:
  explicit CheckpointTensorReader(absl::string_view checkpoint_prefix)
      : reader_(Env::Default(), checkpoint_prefix),
        max_tensor_bytes_(MaxTensorBytes()) {}

  absl::Status status() const { return reader_.status(); }

  absl::Status Lookup(const std::vector<std::string>& keys,
                      FrozenVariable& frozen) {
    for (const std::string& key : keys) {
      if (!reader_.Contains(key)) continue;

      std::vector<TensorSlice> slices;
      absl::Status status = reader_.LookupTensorSlices(key, &slices);
      if (!status.ok()) return status;
      if (!slices.empty()) {
        return errors::FailedPrecondition(
            "checkpoint tensor is partitioned; slice-aware freeze is "
            "required: ",
            key, " slices=", slices.size());
      }

      DataType dtype = DT_INVALID;
      TensorShape shape;
      status = reader_.LookupDtypeAndShape(key, &dtype, &shape);
      if (!status.ok()) return status;

      int64_t estimated_bytes = -1;
        if (EstimateTensorBytes(dtype, shape, estimated_bytes) &&
          estimated_bytes > max_tensor_bytes_) {
        return errors::ResourceExhausted(
            "checkpoint tensor exceeds freeze byte limit: key=", key,
            " dtype=", DataTypeString(dtype), " shape=", shape.DebugString(),
            " estimated_bytes=", estimated_bytes,
            " max_bytes=", max_tensor_bytes_);
      }

      Tensor tensor(dtype, shape);
      status = reader_.Lookup(key, &tensor);
      if (!status.ok()) return status;

      frozen.dtype = dtype;
      tensor.AsProtoTensorContent(&frozen.value);
      return absl::OkStatus();
    }
    return errors::NotFound("no checkpoint tensor for variable");
  }

 private:
  BundleReader reader_;
  const int64_t max_tensor_bytes_;
};

bool AttrTypeEquals(const NodeDef* node, absl::string_view attr_name,
                    DataType expected) {
  DataType actual = DT_INVALID;
  return GetNodeAttr(*node, attr_name, &actual).ok() && actual == expected;
}

bool IsFrozenValueCompatibleWithNode(const NodeDef* node,
                                     const FrozenVariable& frozen) {
  DataType node_dtype = DT_INVALID;
  if (GetNodeAttr(*node, "dtype", &node_dtype).ok() &&
      node_dtype != frozen.dtype) {
    return false;
  }

  PartialTensorShape node_shape;
  if (!GetNodeAttr(*node, "shape", &node_shape).ok()) {
    return true;
  }

  PartialTensorShape frozen_shape;
  if (!PartialTensorShape::BuildPartialTensorShape(frozen.value.tensor_shape(),
                                                   &frozen_shape)
           .ok()) {
    return false;
  }

  return node_shape.IsCompatibleWith(frozen_shape);
}

bool IsSafeResourceConsumer(const NodeDef* consumer,
                            const FrozenVariable& frozen) {
  if (consumer->op() == "ReadVariableOp") {
    return AttrTypeEquals(consumer, "dtype", frozen.dtype);
  }
  return false;
}

bool ResolveInputType(const NodeDef* node, int input_index,
                      DataType& input_type) {
  const OpDef* op_def = nullptr;
  return OpRegistry::Global()->LookUpOpDef(node->op(), &op_def).ok() &&
         InputTypeForNode(*node, *op_def, input_index, &input_type).ok();
}

using Fanouts = absl::flat_hash_map<std::string, std::vector<std::string>>;

Fanouts BuildDataFanouts(const GraphDef* graph) {
  Fanouts fanouts;
  for (const NodeDef& node : graph->node()) {
    for (const std::string& input : node.input()) {
      if (IsControlInput(input)) continue;
      fanouts[NodeName(input)].push_back(node.name());
    }
  }
  return fanouts;
}

const NodeDef* FindNode(const GraphDef* graph, absl::string_view name) {
  for (const NodeDef& node : graph->node()) {
    if (node.name() == name) return &node;
  }
  return nullptr;
}

NodeDef* FindMutableNode(GraphDef* graph, absl::string_view name) {
  for (NodeDef& node : *graph->mutable_node()) {
    if (node.name() == name) return &node;
  }
  return nullptr;
}

bool ForEachDataInputFrom(const NodeDef* consumer, absl::string_view producer,
                          const std::function<bool(int)>& visit) {
  int data_input = 0;
  for (const std::string& input : consumer->input()) {
    if (IsControlInput(input)) continue;
    if (NodeName(input) == producer && !visit(data_input)) return false;
    ++data_input;
  }
  return true;
}

bool IsSafeToFreeze(const GraphDef* graph, const Fanouts& fanouts,
                    const NodeDef* node, const FrozenVariable& frozen) {
  if (!IsFrozenValueCompatibleWithNode(node, frozen)) {
    return false;
  }

  const auto fanout_it = fanouts.find(node->name());
  if (fanout_it == fanouts.end()) return true;

  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer == nullptr) return false;
    if (IsMutatingVariableOp(consumer->op())) return false;

    if (node->op() == "VarHandleOp") {
      if (!IsSafeResourceConsumer(consumer, frozen)) return false;
      bool ok = true;
      ForEachDataInputFrom(consumer, node->name(), [&](int dst_input) {
        if (dst_input != 0) ok = false;
        return ok;
      });
      if (!ok) return false;
    } else if (node->op() == "VariableV2") {
      bool ok = true;
      ForEachDataInputFrom(consumer, node->name(), [&](int dst_input) {
        DataType input_type = DT_INVALID;
        if (!ResolveInputType(consumer, dst_input, input_type) ||
            IsRefType(input_type)) {
          ok = false;
        }
        return ok;
      });
      if (!ok) return false;
    }
  }
  return true;
}

struct ReadPathAnalysis {
  int compute_read_paths = 0;
};

struct ReadPathRewriteCandidate {
  std::string node_name;
  FrozenVariable frozen;
};

bool IsNodeInStack(const std::vector<std::string>& stack,
                   absl::string_view node_name) {
  for (const std::string& existing : stack) {
    if (absl::string_view(existing) == node_name) return true;
  }
  return false;
}

bool ForEachDataEdgeFrom(const NodeDef* consumer, absl::string_view producer,
                         const std::function<bool(int, int)>& visit) {
  int data_input = 0;
  for (const std::string& input : consumer->input()) {
    if (IsControlInput(input)) continue;
    const TensorId tensor_id = ParseTensorName(input);
    if (tensor_id.node() == producer && !visit(data_input, tensor_id.index())) {
      return false;
    }
    ++data_input;
  }
  return true;
}

bool AnalyzeResourceSwitch(const GraphDef* graph, const Fanouts& fanouts,
                           const NodeDef* switch_node,
                           const FrozenVariable& frozen,
                           std::vector<std::string>& stack,
                           ReadPathAnalysis& analysis) {
  if (switch_node->op() != "Switch" ||
      !AttrTypeEquals(switch_node, "T", DT_RESOURCE)) {
    return false;
  }
  if (IsNodeInStack(stack, switch_node->name())) {
    return false;
  }

  stack.push_back(switch_node->name());
  const auto fanout_it = fanouts.find(switch_node->name());
  if (fanout_it == fanouts.end()) {
    stack.pop_back();
    return true;
  }

  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer == nullptr) {
      stack.pop_back();
      return false;
    }

    bool ok = true;
    ForEachDataEdgeFrom(
        consumer, switch_node->name(), [&](int dst_input, int src_output) {
          if (src_output != 0 && src_output != 1) {
            ok = false;
            return false;
          }

          if (consumer->op() == "Switch" && dst_input == 0) {
            if (!AnalyzeResourceSwitch(graph, fanouts, consumer, frozen,
                                       stack, analysis)) {
              ok = false;
              return false;
            }
            return true;
          }

          if (dst_input == 0 && IsSafeResourceConsumer(consumer, frozen)) {
            ++analysis.compute_read_paths;
            return true;
          }

          ok = false;
          return false;
        });
    if (!ok) {
      stack.pop_back();
      return false;
    }
  }
  stack.pop_back();
  return true;
}

bool AnalyzeVarHandleReadPaths(const GraphDef* graph, const Fanouts& fanouts,
                               const NodeDef* node,
                               const FrozenVariable& frozen,
                               ReadPathAnalysis& analysis) {
  const auto fanout_it = fanouts.find(node->name());
  if (fanout_it == fanouts.end()) return true;

  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer == nullptr) return false;

    bool ok = true;
    ForEachDataEdgeFrom(
        consumer, node->name(), [&](int dst_input, int src_output) {
          if (src_output != 0) {
            ok = false;
            return false;
          }
          if (consumer->op() == "VarIsInitializedOp" && dst_input == 0) {
            return true;
          }
          if (consumer->op() == "AssignVariableOp" && dst_input == 0) {
            return true;
          }
          if (dst_input == 0 && IsSafeResourceConsumer(consumer, frozen)) {
            ++analysis.compute_read_paths;
            return true;
          }
          if (consumer->op() == "Switch" && dst_input == 0) {
            std::vector<std::string> stack;
            if (!AnalyzeResourceSwitch(graph, fanouts, consumer, frozen,
                                       stack, analysis)) {
              ok = false;
              return false;
            }
            return true;
          }

          ok = false;
          return false;
        });
    if (!ok) return false;
  }
  return true;
}

bool IsPreservedVariableV2Consumer(const NodeDef* consumer, int dst_input) {
  return (consumer->op() == "Assign" && dst_input == 0) ||
         consumer->op() == "Save" || consumer->op() == "SaveV2";
}

bool HasSaveOutputConsumer(const GraphDef* graph, const Fanouts& fanouts,
                           const NodeDef* node) {
  const auto fanout_it = fanouts.find(node->name());
  if (fanout_it == fanouts.end()) return false;
  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer != nullptr &&
        (consumer->op() == "Save" || consumer->op() == "SaveV2")) {
      return true;
    }
  }
  return false;
}

bool HasSupportedValueOutputConsumers(const GraphDef* graph,
                                      const Fanouts& fanouts,
                                      const NodeDef* node,
                                      const FrozenVariable& frozen,
                                      ReadPathAnalysis& analysis) {
  const auto fanout_it = fanouts.find(node->name());
  if (fanout_it == fanouts.end()) {
    return false;
  }

  bool has_output = false;
  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer == nullptr) {
      return false;
    }

    bool ok = true;
    ForEachDataEdgeFrom(
        consumer, node->name(), [&](int dst_input, int src_output) {
          has_output = true;
          if (src_output != 0) {
            ok = false;
            return false;
          }

          if (consumer->op() == "Save" || consumer->op() == "SaveV2") {
            ok = false;
            return false;
          }
          if (IsMutatingVariableOp(consumer->op())) {
            ok = false;
            return false;
          }

          DataType input_type = DT_INVALID;
          if (!ResolveInputType(consumer, dst_input, input_type)) {
            ok = false;
            return false;
          }
          if (IsRefType(input_type) || BaseType(input_type) != frozen.dtype) {
            ok = false;
            return false;
          }
          return true;
        });
    if (!ok) return false;
  }

  if (!has_output) {
    return false;
  }
  return true;
}

bool IsSupportedVariableV2ComputeConsumer(
    const GraphDef* graph, const Fanouts& fanouts, const NodeDef* consumer,
    int dst_input, const FrozenVariable& frozen, ReadPathAnalysis& analysis) {
  if (consumer->op() == "Identity" && dst_input == 0 &&
      AttrTypeEquals(consumer, "T", frozen.dtype)) {
    if (!HasSupportedValueOutputConsumers(graph, fanouts, consumer, frozen,
                                          analysis)) {
      return false;
    }
    ++analysis.compute_read_paths;
    return true;
  }

  if (HasSaveOutputConsumer(graph, fanouts, consumer)) {
    return false;
  }

  DataType input_type = DT_INVALID;
  if (!ResolveInputType(consumer, dst_input, input_type)) {
    return false;
  }

  if (IsRefType(input_type) || BaseType(input_type) != frozen.dtype) {
    return false;
  }

  ++analysis.compute_read_paths;
  return true;
}

bool AnalyzeVariableV2ReadPaths(const GraphDef* graph,
                                const Fanouts& fanouts,
                                const NodeDef* node,
                                const FrozenVariable& frozen,
                                ReadPathAnalysis& analysis) {
  const auto fanout_it = fanouts.find(node->name());
  if (fanout_it == fanouts.end()) return true;

  for (const std::string& consumer_name : fanout_it->second) {
    const NodeDef* consumer = FindNode(graph, consumer_name);
    if (consumer == nullptr) return false;

    bool ok = true;
    ForEachDataEdgeFrom(
        consumer, node->name(), [&](int dst_input, int src_output) {
          if (src_output != 0) {
            ok = false;
            return false;
          }
          if (IsPreservedVariableV2Consumer(consumer, dst_input)) {
            return true;
          }
          if (IsMutatingVariableOp(consumer->op())) {
            ok = false;
            return false;
          }
          if (!IsSupportedVariableV2ComputeConsumer(
                  graph, fanouts, consumer, dst_input, frozen, analysis)) {
            ok = false;
            return false;
          }
          return true;
        });
    if (!ok) return false;
  }
  return true;
}

bool IsSafeToReadPathFreeze(const GraphDef* graph, const Fanouts& fanouts,
                            const NodeDef* node, const FrozenVariable& frozen,
                            ReadPathAnalysis& analysis) {
  if (!IsFrozenValueCompatibleWithNode(node, frozen)) {
    return false;
  }

  bool safe = false;
  if (node->op() == "VarHandleOp") {
    safe = AnalyzeVarHandleReadPaths(graph, fanouts, node, frozen, analysis);
  } else if (node->op() == "VariableV2") {
    safe = AnalyzeVariableV2ReadPaths(graph, fanouts, node, frozen, analysis);
  } else {
    return false;
  }

  if (!safe) return false;
  if (analysis.compute_read_paths == 0) return false;
  return true;
}

std::string NewNodeName(const GraphDef* graph, std::string base) {
  if (FindNode(graph, base) == nullptr) return base;
  for (int i = 1;; ++i) {
    std::string candidate = base + "_" + std::to_string(i);
    if (FindNode(graph, candidate) == nullptr) 
      return candidate;
  }
}

NodeDef MakeConstNodeDef(absl::string_view name, const NodeDef* node,
                         const FrozenVariable& frozen) {
  NodeDef node_def = BaseReplacementDef(node, "Const");
  node_def.set_name(std::string(name));
  AddNodeAttr("dtype", frozen.dtype, &node_def);
  AddNodeAttr("value", frozen.value, &node_def);
  const std::vector<std::string> control_inputs = ControlInputs(node);
  SetInputs(control_inputs, &node_def);
  return node_def;
}

std::string GetOrCreateFrozenConst(
    GraphDef* graph, const NodeDef* variable, const FrozenVariable& frozen,
    absl::flat_hash_map<std::string, std::string>& frozen_const_by_node_name) {
  auto it = frozen_const_by_node_name.find(variable->name());
  if (it != frozen_const_by_node_name.end()) return it->second;

  const NodeDef variable_copy = *variable;
  const std::string frozen_const_name =
      NewNodeName(graph, variable_copy.name() + "/frozen_const");
  NodeDef node_def = MakeConstNodeDef(frozen_const_name, &variable_copy, frozen);
  NodeDef* frozen_const = graph->add_node();
  *frozen_const = std::move(node_def);
  frozen_const_by_node_name[variable_copy.name()] = frozen_const->name();
  return frozen_const->name();
}

void RewriteReadVariableFromSource(NodeDef* node,
                                   absl::string_view value_input,
                                   const FrozenVariable& frozen) {
  std::vector<std::string> inputs;
  inputs.push_back(std::string(value_input));
  for (const std::string& input : ControlInputs(node)) inputs.push_back(input);

  NodeDef node_def = BaseReplacementDef(node, "Identity");
  SetInputs(inputs, &node_def);
  AddNodeAttr("T", frozen.dtype, &node_def);
  *node = std::move(node_def);
}

std::string GetOrCreateMirrorSwitch(
    GraphDef* graph, const NodeDef* resource_switch,
    absl::string_view data_input, const FrozenVariable& frozen,
    absl::flat_hash_map<std::string, std::string>& mirror_switches) {
  const NodeDef switch_copy = *resource_switch;
  auto it = mirror_switches.find(switch_copy.name());
  if (it != mirror_switches.end()) return it->second;

  std::string pred_input;
  if (!FindDataInput(&switch_copy, 1, pred_input)) return "";

  NodeDef* mirror = graph->add_node();
    mirror->set_name(
      NewNodeName(graph, switch_copy.name() + "/frozen_switch"));
  mirror->set_op("Switch");
  mirror->set_device(switch_copy.device());
  CopyInternalAttrs(&switch_copy, mirror);
  std::vector<std::string> inputs;
  inputs.push_back(std::string(data_input));
  inputs.push_back(pred_input);
  for (const std::string& input : ControlInputs(&switch_copy)) {
    inputs.push_back(input);
  }
  SetInputs(inputs, mirror);
  AddNodeAttr("T", frozen.dtype, mirror);

  mirror_switches[switch_copy.name()] = mirror->name();
  return mirror->name();
}

absl::Status RewriteResourceSwitch(
    GraphDef* graph, const Fanouts& fanouts, const NodeDef* resource_switch,
    absl::string_view data_input, const FrozenVariable& frozen,
    absl::flat_hash_map<std::string, std::string>& mirror_switches,
    int& rewritten_paths) {
  const NodeDef switch_copy = *resource_switch;
  const std::string mirror_switch = GetOrCreateMirrorSwitch(
      graph, &switch_copy, data_input, frozen, mirror_switches);
  if (mirror_switch.empty()) {
    return errors::InvalidArgument("Switch missing pred input: ",
                                   switch_copy.name());
  }

  const auto fanout_it = fanouts.find(switch_copy.name());
  if (fanout_it == fanouts.end()) return absl::OkStatus();

  for (const std::string& consumer_name : fanout_it->second) {
    NodeDef* consumer = FindMutableNode(graph, consumer_name);
    if (consumer == nullptr) continue;
    const NodeDef consumer_before = *consumer;

    bool ok = true;
    ForEachDataEdgeFrom(
        &consumer_before, switch_copy.name(),
        [&](int dst_input, int src_output) {
          const std::string mirror_output =
              TensorName(mirror_switch, src_output);
          if (consumer_before.op() == "Switch" && dst_input == 0) {
            if (!RewriteResourceSwitch(graph, fanouts, &consumer_before,
                                       mirror_output, frozen, mirror_switches,
                                       rewritten_paths)
                     .ok()) {
              ok = false;
              return false;
            }
            return true;
          }

          if (consumer_before.op() == "ReadVariableOp" && dst_input == 0) {
            RewriteReadVariableFromSource(consumer, mirror_output, frozen);
            ++rewritten_paths;
            return true;
          }
          return true;
        });
    if (!ok) return errors::Internal("failed to rewrite resource switch chain");
  }
  return absl::OkStatus();
}

absl::Status RewriteVarHandleReadPaths(
    GraphDef* graph, const Fanouts& fanouts, const NodeDef* variable,
    absl::string_view frozen_const, const FrozenVariable& frozen,
    absl::flat_hash_map<std::string, std::string>& mirror_switches,
    int& rewritten_paths) {
  const auto fanout_it = fanouts.find(variable->name());
  if (fanout_it == fanouts.end()) return absl::OkStatus();

  for (const std::string& consumer_name : fanout_it->second) {
    NodeDef* consumer = FindMutableNode(graph, consumer_name);
    if (consumer == nullptr) continue;
    const NodeDef consumer_before = *consumer;

    bool ok = true;
    ForEachDataEdgeFrom(
        &consumer_before, variable->name(), [&](int dst_input, int src_output) {
          if (src_output != 0) return true;
          if (consumer_before.op() == "ReadVariableOp" && dst_input == 0) {
            RewriteReadVariableFromSource(consumer, frozen_const, frozen);
            ++rewritten_paths;
            return true;
          }
          if (consumer_before.op() == "Switch" && dst_input == 0) {
            if (!RewriteResourceSwitch(graph, fanouts, &consumer_before,
                                       frozen_const, frozen, mirror_switches,
                                       rewritten_paths)
                     .ok()) {
              ok = false;
              return false;
            }
            return true;
          }
          return true;
        });
    if (!ok) return errors::Internal("failed to rewrite VarHandle read path");
  }
  return absl::OkStatus();
}

absl::Status RewriteVariableV2ReadPaths(GraphDef* graph,
                                        const Fanouts& fanouts,
                                        const NodeDef* variable,
                                        absl::string_view frozen_const,
                                        const FrozenVariable& frozen,
                                        int& rewritten_paths) {
  const auto fanout_it = fanouts.find(variable->name());
  if (fanout_it == fanouts.end()) return absl::OkStatus();

  for (const std::string& consumer_name : fanout_it->second) {
    NodeDef* consumer = FindMutableNode(graph, consumer_name);
    if (consumer == nullptr) continue;
    const NodeDef consumer_before = *consumer;

    bool ok = true;
    ForEachDataEdgeFrom(
        &consumer_before, variable->name(), [&](int dst_input, int src_output) {
          if (src_output != 0) return true;
          if (IsPreservedVariableV2Consumer(&consumer_before, dst_input) ||
              IsMutatingVariableOp(consumer_before.op())) {
            return true;
          }

          if (consumer_before.op() == "Identity" && dst_input == 0) {
            RewriteReadVariableFromSource(consumer, frozen_const, frozen);
            ++rewritten_paths;
            return true;
          }

          if (!SetDataInput(consumer, dst_input, frozen_const)) {
            ok = false;
            return false;
          }
          ++rewritten_paths;
          return true;
        });
    if (!ok) return errors::Internal("failed to rewrite VariableV2 read path");
  }
  return absl::OkStatus();
}

absl::Status RewriteReadPaths(
    GraphDef* graph, const Fanouts& fanouts, const NodeDef* variable,
    const FrozenVariable& frozen,
    absl::flat_hash_map<std::string, std::string>& frozen_const_by_node_name,
    int& rewritten_paths) {
  const std::string frozen_const = GetOrCreateFrozenConst(
      graph, variable, frozen, frozen_const_by_node_name);

  if (variable->op() == "VarHandleOp") {
    absl::flat_hash_map<std::string, std::string> mirror_switches;
    return RewriteVarHandleReadPaths(graph, fanouts, variable, frozen_const,
                                     frozen, mirror_switches,
                                     rewritten_paths);
  }
  if (variable->op() == "VariableV2") {
    return RewriteVariableV2ReadPaths(graph, fanouts, variable, frozen_const,
                                      frozen, rewritten_paths);
  }
  return absl::OkStatus();
}

bool OptimizerCheckpointEnvEnabled() {
  const char* checkpoint_prefix = std::getenv(kOptimizerCheckpointEnvVar);
  return checkpoint_prefix != nullptr && checkpoint_prefix[0] != '\0';
}

}  // namespace

const char* FreezeReadonlyVariablesOptimizerName() {
  return "freeze_readonly_variables_optimizer";
}

bool IsFreezeReadonlyVariablesOptimizerEnabled() {
  return OptimizerCheckpointEnvEnabled();
}

std::unique_ptr<CustomGraphOptimizer>
CreateFreezeReadonlyVariablesOptimizer() {
  return std::make_unique<FreezeReadonlyVariablesOptimizer>();
}

string FreezeReadonlyVariablesOptimizer::name() const {
  return FreezeReadonlyVariablesOptimizerName();
}

absl::Status FreezeReadonlyVariablesOptimizer::Init(
    const RewriterConfig_CustomGraphOptimizer* config) {
  const char* checkpoint_prefix = std::getenv(kOptimizerCheckpointEnvVar);
  checkpoint_prefix_ = checkpoint_prefix == nullptr ? "" : checkpoint_prefix;
  if (checkpoint_prefix_.empty()) {
    VLOG(1) << "FreezeReadonlyVariablesOptimizer disabled; set "
            << kOptimizerCheckpointEnvVar << " to a checkpoint prefix";
  }
  return absl::OkStatus();
}

absl::Status FreezeReadonlyVariablesOptimizer::Optimize(
    Cluster* cluster, const GrapplerItem& item, GraphDef* optimized_graph) {
  *optimized_graph = item.graph;
  if (checkpoint_prefix_.empty()) return absl::OkStatus();

  CheckpointTensorReader tensor_reader(checkpoint_prefix_);
  if (!tensor_reader.status().ok()) {
    LOG(WARNING)
        << "FreezeReadonlyVariablesOptimizer skipped: cannot open checkpoint "
        << checkpoint_prefix_ << ": " << tensor_reader.status();
    return absl::OkStatus();
  }

  int candidates = 0;
  int frozen_variables = 0;
  Fanouts fanouts = BuildDataFanouts(optimized_graph);
  absl::flat_hash_map<std::string, FrozenVariable> frozen_by_node_name;
  std::vector<std::pair<std::string, FrozenVariable>> variables_to_replace;
  std::vector<ReadPathRewriteCandidate> variables_to_rewrite_read_paths;

  for (const NodeDef& node : optimized_graph->node()) {
    if (!IsVariableNode(&node)) continue;
    ++candidates;

    FrozenVariable frozen;
    absl::Status lookup_status =
        tensor_reader.Lookup(CandidateCheckpointKeys(&node), frozen);
    if (!lookup_status.ok()) continue;

    const bool safe_to_replace =
        IsSafeToFreeze(optimized_graph, fanouts, &node, frozen);
    ReadPathAnalysis read_path_analysis;
    const bool safe_to_rewrite_read_path =
        !safe_to_replace &&
        IsSafeToReadPathFreeze(optimized_graph, fanouts, &node, frozen,
                               read_path_analysis);

    if (!safe_to_replace && !safe_to_rewrite_read_path) {
      continue;
    }

    if (safe_to_replace) {
      frozen_by_node_name[node.name()] = frozen;
      variables_to_replace.push_back({node.name(), frozen});
    } else {
      variables_to_rewrite_read_paths.push_back({node.name(), frozen});
    }
  }

  for (const auto& entry : variables_to_replace) {
    NodeDef* node = FindMutableNode(optimized_graph, entry.first);
    if (node == nullptr) continue;
    const FrozenVariable& frozen = entry.second;
    *node = MakeConstNodeDef(node->name(), node, frozen);
    ++frozen_variables;
  }

  for (NodeDef& node : *optimized_graph->mutable_node()) {
    if (node.op() != "ReadVariableOp") {
      continue;
    }

    std::string variable_input;
    if (!FindDataInput(&node, 0, variable_input)) continue;
    auto frozen_it = frozen_by_node_name.find(NodeName(variable_input));
    if (frozen_it == frozen_by_node_name.end()) continue;

    RewriteReadVariableFromSource(&node, variable_input, frozen_it->second);
  }

  absl::flat_hash_map<std::string, std::string> frozen_const_by_node_name;
  for (const ReadPathRewriteCandidate& candidate :
       variables_to_rewrite_read_paths) {
    NodeDef* node = FindMutableNode(optimized_graph, candidate.node_name);
    if (node == nullptr) continue;
    const NodeDef variable = *node;
    int rewritten_paths = 0;
    TF_RETURN_IF_ERROR(
        RewriteReadPaths(optimized_graph, fanouts, &variable, candidate.frozen,
                         frozen_const_by_node_name, rewritten_paths));
    if (rewritten_paths > 0) ++frozen_variables;
  }

  LOG(INFO) << "FreezeReadonlyVariablesOptimizer candidates=" << candidates
            << " frozen_variables=" << frozen_variables;
  return absl::OkStatus();
}

REGISTER_GRAPH_OPTIMIZER_AS(FreezeReadonlyVariablesOptimizer,
                            "freeze_readonly_variables_optimizer");

}  // namespace grappler
}  // namespace tensorflow