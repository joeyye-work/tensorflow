/* Referenced & Modified External Open Source Code:
Source URL: https://github.com/openxla/xla/pull/7540/files
Original Copyright: 2023 The TensorFlow Authors.

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

#ifndef XLA_SERVICE_CPU_XNNPACK_OPS_H_
#define XLA_SERVICE_CPU_XNNPACK_OPS_H_

namespace xla {
namespace cpu {

extern "C" {

extern void __xla_cpu_runtime_XnnPackSoftMaxND(const void* run_options_ptr,
                                               void* in, void* out,
                                               int64_t batch_size,
                                               int64_t channels);

}  // extern "C"

}  // namespace cpu
}  // namespace xla

#endif  // XLA_SERVICE_CPU_XNNPACK_OPS_H_
