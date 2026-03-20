#ifndef TENSORFLOW_COMPILER_JIT_KERNELS_XLA_BATCH_MATCHER_H_
#define TENSORFLOW_COMPILER_JIT_KERNELS_XLA_BATCH_MATCHER_H_

#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>
#include <sstream>
#include <algorithm>
#include <stdexcept>
#include <cctype>
#include <cstdint>

namespace tensorflow {

// Define the maximum allowed batch size: 2147483648 >> 1 = 1073741824
// Exceeding this value will make the next power of two exceed the safe range
constexpr int kMaxBatch = 2147483648ULL >> 1;

class XlaBatchMatcher {
  public:
    XlaBatchMatcher();
    virtual ~XlaBatchMatcher() = default;
    int64_t get_xla_compile_batch(int64_t real_batch);
    std::vector<int64_t> get_all_batches() { return all_batches_; }

  private:
    void parse_env_config();
    void print_all_batches();
    std::vector<int64_t> parse_single_item(const std::string& item);
    int64_t find_min_larger_batch(int64_t real_batch);

    std::vector<int64_t> all_batches_;
    const char* env_str_;
    int64_t last_batch_ = -1;
};

}  // namespace tensorflow

#endif  // TENSORFLOW_COMPILER_JIT_KERNELS_XLA_BATCH_MATCHER_H_