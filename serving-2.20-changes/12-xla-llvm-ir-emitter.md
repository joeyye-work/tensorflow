# Commit 12: Update XLA LLVM IR emitter for dynamic batch loop bounds

Extends the LLVM IR code generation layer to thread the runtime batch
multiplier through every emitted loop so the batch dimension is scaled at
run time without recompilation.

## Files changed

- `third_party/xla/xla/service/llvm_ir/llvm_util.cc` / `.h`:
  `EmitBatchMultiplier` loads batch_size_multiplier via GEP from RunOptions;
  `EmitBatchDimWithMultiplier` computes batch_dim × multiplier for loop bounds
- `third_party/xla/xla/service/llvm_ir/llvm_loop.cc` / `.h`:
  ForLoop / ParallelLoopEmitter accept optional batch_multiplier Value* and
  scale the batch dimension bound
- `third_party/xla/xla/service/llvm_ir/loop_emitter.cc`:
  LoopEmitter passes batch_multiplier through to inner loops
- `third_party/xla/xla/service/llvm_ir/ir_array.cc`:
  index linearisation honours scaled batch dimension
- `third_party/xla/xla/service/elemental_ir_emitter.cc`:
  all per-element emitters (reduce-window, select, scatter, sort, fft, etc.)
  propagate batch_multiplier into nested loops
- `third_party/xla/xla/service/llvm_ir/tuple_ops.cc`:
  tuple element loads respect scaled batch dimension
- `third_party/xla/xla/service/llvm_ir/BUILD`:
  add executable_run_options_offset dependency
