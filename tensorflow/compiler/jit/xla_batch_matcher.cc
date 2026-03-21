#include "tensorflow/compiler/jit/xla_batch_matcher.h"
#include "xla/debug_options_flags.h"
#include "tensorflow/core/platform/logging.h"

namespace tensorflow {

XlaBatchMatcher::XlaBatchMatcher() {
  const std::string xla_compile_batch_sizes =
      xla::GetDebugOptionsFromFlags().xla_compile_batch_sizes();
  env_str_ = xla_compile_batch_sizes.c_str();
  parse_env_config();
}

// Trim whitespace (spaces/tabs) from both ends of a string
std::string trim(const std::string& s) {
  size_t start = s.find_first_not_of(" \t");
  size_t end = s.find_last_not_of(" \t");
  return (start == std::string::npos) ? "" : s.substr(start, end - start + 1);
}

std::vector<int64_t> XlaBatchMatcher::parse_single_item(const std::string& item) {
  std::vector<int64_t> batch_list;
  if (item.empty()) return batch_list;

  // 1. Parse single value (no colon separator)
  if (item.find(':') == std::string::npos) {
    // Validate all characters are digits (reject non-numeric chars)
    for (char c : item) {
      if (!isdigit(c)) {
        throw std::invalid_argument("Non-numeric characters: " + item);
      }
    }
    auto val = static_cast<int64_t>(std::stoll(item));
    if (val <= 0 || val > kMaxBatch) {
      throw std::invalid_argument("Out of valid range (1-" + std::to_string(kMaxBatch) + "): " + item);
    }
    batch_list.push_back(val);
    return batch_list;
  }

  // 2. Parse range format (start:end:step)
  std::stringstream ss(item);
  std::string part;
  std::vector<std::string> parts;
  while (std::getline(ss, part, ':')) {
    parts.push_back(trim(part));
  }
  if (parts.size() > 3) {
    throw std::invalid_argument("Invalid range format (requires start:end:step): " + item);
  }

  // Convert and validate range parameters
  int64_t start, end, step;
  try {
    start = std::stoi(parts[0]);
    end = std::stoi(parts[1]);
    step = parts.size() == 2 ? 1 : std::stoi(parts[2]);
  } catch (...) {
    throw std::invalid_argument("Invalid numeric values in range: " + item);
  }
  if (start <= 0 || end <= 0 || step <= 0) {
    throw std::invalid_argument("Range parameters must be positive integers: " + item);
  }
  if (start > end) {
    throw std::invalid_argument("Start value > end value in range: " + item);
  }
  if (end > kMaxBatch) {
    throw std::invalid_argument("Range exceeds max limit (" + std::to_string(kMaxBatch) + "): " + item);
  }

  // Generate batch list from range
  for (int64_t i = start; i <= end; i += step) {
    batch_list.push_back(i);
  }
  return batch_list;
}

void XlaBatchMatcher::print_all_batches() {
  std::ostringstream oss;
  oss << "[XLA_BATCH_INFO] Valid batch list update: ";
  for (size_t i = 0; i < all_batches_.size(); ++i) {
    if (i > 0) oss << ", ";
    oss << all_batches_[i];
  }
  LOG(INFO) << oss.str();
}

// Parse environment variable config into deduplicated, sorted batch list
// For example, export XLA_COMPILE_BATCH_SIZES="10:100:10, 977"
void XlaBatchMatcher::parse_env_config() {
  // If the env var not set or is empty, filled with the nearest power of two by default
  if (!env_str_) {
    VLOG(2) << "[XLA_BATCH_WARN] Env var " << "--tf_xla_compile_batch_sizes" <<
      " not set, filled with the nearest power of two by default";
    return;
  }

  if (std::string(env_str_).empty()) {
    VLOG(2) << "[XLA_BATCH_WARN] Env var " << "--tf_xla_compile_batch_sizes" <<
        "is empty, filled with the nearest power of two by default";
    return;
  }

  // Split config by commas
  std::stringstream ss(env_str_);
  std::string item;
  while (std::getline(ss, item, ',')) {
    std::string trimmed_item = trim(item);
    if (trimmed_item.empty()) continue;

    // Parse single item (skip on failure to avoid breaking other items)
    try {
      std::vector<int64_t> item_batches = parse_single_item(trimmed_item);
      all_batches_.insert(all_batches_.end(), item_batches.begin(), item_batches.end());
    } catch (const std::exception& e) {
      LOG(INFO) << "[XLA_BATCH_WARN] Failed to parse config item, skipping: " <<
        trimmed_item << " (" << e.what() << ")";
    }
  }

  if (!all_batches_.empty()) {
    std::sort(all_batches_.begin(), all_batches_.end());
    auto last = std::unique(all_batches_.begin(), all_batches_.end());
    all_batches_.erase(last, all_batches_.end());
  }

  // Print parsed result
  if (!all_batches_.empty()) print_all_batches();
  return;
}

// Calculate the smallest power of two greater than the real batch
static int64_t GetNextPowerOfTwo(int64_t real_batch) {
  // If real_batch is already a power of two, return real_batch directly
  if ((real_batch & (real_batch - 1)) == 0) {
    return real_batch;
  }

  int64_t power = 1;
  while (power < real_batch) {
    power <<= 1;
  }
  return power;
}

int64_t XlaBatchMatcher::find_min_larger_batch(int64_t real_batch) {
  if (real_batch <= 0 || real_batch > kMaxBatch) {
    LOG(INFO) << "[XLA_BATCH_WARN] Out of valid range: " << real_batch;
    return real_batch;
  }

  if (all_batches_.empty()) {
    // Return the next power of two directly without modifying all_batches_
    return GetNextPowerOfTwo(real_batch);
  }

  // Edge case 1: Real value < the smallest batch, use smallest
  if (real_batch < all_batches_.front()) {
    return all_batches_.front();
  }
  // Edge case 2: Real value ≥ the largest batch, use the nearest power of two
  if (real_batch > all_batches_.back()) {
    int64_t val = GetNextPowerOfTwo(real_batch);
    all_batches_.emplace_back(val);
    print_all_batches();
    return val;
  }

  // Find first batch larger than real value (binary search via lower_bound)
  auto it = std::lower_bound(all_batches_.begin(), all_batches_.end(), real_batch);
  return (it != all_batches_.end()) ? *it : all_batches_.back();
}

int64_t XlaBatchMatcher::get_xla_compile_batch(int64_t real_batch) {
  // Match target batch size
  int64_t selected = find_min_larger_batch(real_batch);
  if (real_batch != last_batch_ || all_batches_.empty()) {
    last_batch_ = real_batch;
    VLOG(2) << "[XLA_BATCH_INFO] Real batch: " << real_batch
      << " -> Selected compile batch: " << selected;
  }
  return selected;
}

}  // namespace tensorflow
