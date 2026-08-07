#ifndef TENSORFLOW_CORE_GRAPPLER_OPTIMIZERS_FREEZE_READONLY_VARIABLES_OPTIMIZER_H_
#define TENSORFLOW_CORE_GRAPPLER_OPTIMIZERS_FREEZE_READONLY_VARIABLES_OPTIMIZER_H_

#include <memory>
#include <string>

#include "tensorflow/core/grappler/optimizers/custom_graph_optimizer.h"
#include "tensorflow/core/platform/types.h"

namespace tensorflow {
namespace grappler {

const char* FreezeReadonlyVariablesOptimizerName();
bool IsFreezeReadonlyVariablesOptimizerEnabled();
std::unique_ptr<CustomGraphOptimizer>
CreateFreezeReadonlyVariablesOptimizer();

class FreezeReadonlyVariablesOptimizer : public CustomGraphOptimizer {
 public:
  string name() const override;
  bool UsesFunctionLibrary() const override { return false; }
  absl::Status Init(
      const RewriterConfig_CustomGraphOptimizer* config = nullptr) override;
  absl::Status Optimize(Cluster* cluster, const GrapplerItem& item,
                        GraphDef* optimized_graph) override;

 private:
  std::string checkpoint_prefix_;
};

}  // namespace grappler
}  // namespace tensorflow

#endif  // TENSORFLOW_CORE_GRAPPLER_OPTIMIZERS_FREEZE_READONLY_VARIABLES_OPTIMIZER_H_