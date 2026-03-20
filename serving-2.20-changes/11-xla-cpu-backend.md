# Commit 11: Update XLA CPU backend to support dynamic batch execution

Extends the XLA CPU backend (both thunk and non-thunk paths) to read and
apply the runtime batch-size multiplier provided by XlaRunOp.

## Files changed

- `third_party/xla/xla/service/cpu/executable_run_options_offset.cc` / `.h`
  *(new)*: byte offsets into ExecutableRunOptions struct for IR-level GEP access
- `third_party/xla/xla/service/cpu/cpu_executable.cc`:
  retrieve batch_multiplier and forward to kernels
- `third_party/xla/xla/service/cpu/cpu_compiler.cc`:
  schedule OuterDimensionPropagationPass in CPU pipeline
- `third_party/xla/xla/service/cpu/ir_emitter.cc` / `.h`:
  non-thunk emitter loads and passes batch_multiplier to every kernel call
- `third_party/xla/xla/service/cpu/ir_emitter2.cc` / `.h`:
  thunk emitter counterpart
- `third_party/xla/xla/service/cpu/thunk_emitter.cc` / `.h`:
  emit KernelThunk with batch_multiplier operand
- `third_party/xla/xla/backends/cpu/runtime/kernel.cc` / `.h` / `kernel_c_api.h`:
  KernelCallFrame / SE_KernelCallFrame carry batch_multiplier
- `third_party/xla/xla/backends/cpu/codegen/kernel_api_ir_builder.cc` / `.h`:
  generate LLVM IR load of batch_multiplier
- `third_party/xla/xla/service/cpu/dot_op_emitter.cc`:
  emit dynamic dot product using batch_multiplier
- `third_party/xla/xla/service/cpu/parallel_loop_emitter.cc`:
  emit batch-multiplier loop bound
- `third_party/xla/xla/debug_options_flags.cc`:
  register tf_xla_enable_dynamic_sizes debug flag
