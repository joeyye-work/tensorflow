# Commit 8: Update JIT XlaRunOp and launch utilities for dynamic batch

Updates the XLA JIT runtime path so it extracts the batch-size multiplier
from compiled shapes, pads inputs, executes, then un-pads outputs.

## Files changed

- `tensorflow/compiler/jit/kernels/xla_ops.cc`:
  - XlaRunOp reads batch_multiplier from output shapes
  - Pads input tensors to the compile-time batch size
  - Runs the compiled executable
  - Un-pads output tensors back to the real batch size
  - Reads expressions from _Arg shape annotations; DimExprToDynExpr conversion
- `tensorflow/compiler/jit/xla_launch_util.cc` / `.h`:
  - Pass batch_multiplier into RunOptions
  - RunXlaComputation accepts and forwards batch_size_multiplier
- `tensorflow/compiler/jit/kernels/BUILD`:
  - Add xla_batch_matcher dependency
