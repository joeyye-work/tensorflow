#include "tensorflow/core/framework/resource_mgr.h"

namespace tensorflow {
const string BatchSizeResourceName = "BatchSizeResource_";
class BatchSizeResource : public ResourceBase {
  public:
    ~BatchSizeResource() override {
      VLOG(1) << "BatchSizeResource destroyed with batch size: " << batch_size_;
    }
    string DebugString() const override { return BatchSizeResourceName; }
    void SetBatchSize(size_t s) { batch_size_ = s; }
    size_t GetBatchSize() { return batch_size_; }
  private:
    size_t batch_size_ = 0;
};
}
