/* Original Copyright: Copyright (c) Facebook, Inc. and its affiliates.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.

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

#define XNN_LOG_LEVEL 4
#include <iostream>
#include "xnnpack.h"
#include "absl/base/attributes.h"

namespace xla {
namespace cpu {

extern "C" {
ABSL_ATTRIBUTE_NO_SANITIZE_MEMORY void __xla_cpu_runtime_XnnPackSoftMaxND(
    const void* run_options_ptr, void* in, void* out, int64_t batch_size,
    int64_t channels) {
  // NB: run_options_ptr is ignored.
  float* input = (float*)in;
  float* output = (float*)out;

  xnn_status status = xnn_initialize(nullptr /* allocator */);
  if (status != xnn_status_success) {
    std::cout << "failed to initialize XNNPACK";
    return;
  }

  xnn_operator_t softmax_op = nullptr;
  status = xnn_create_softmax_nc_f32(0 /* flags */, &softmax_op);
  if (status != xnn_status_success || softmax_op == nullptr) {
    std::cout << "failed to create SoftMax operator\n";
    return;
  }

  status = xnn_reshape_softmax_nc_f32(softmax_op, channels, /* channels */
                                      channels /* input stride */,
                                      channels /* output stride */, batch_size,
                                      /*threadpool=*/nullptr);
  if (status != xnn_status_success) {
    std::cout << "failed to reshape SoftMax operator";
    return;
  }

  status = xnn_setup_softmax_nc_f32(softmax_op, input, output);
  if (status != xnn_status_success) {
    std::cout << "failed to setup SoftMax operator";
    return;
  }

  status = xnn_run_operator(softmax_op, /*threadpool=*/nullptr);
  if (status != xnn_status_success) {
    std::cout << "failed to run SoftMax operator";
    return;
  }

  xnn_delete_operator(softmax_op);

  xnn_deinitialize();
}

}  // extern "C"

}  // namespace cpu
}  // namespace xla
