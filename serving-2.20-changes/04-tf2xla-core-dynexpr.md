# Commit 4: Update tf2xla core utilities for DynExpr support

Updates the tf2xla compilation infrastructure so that TF-level DynExpr
expressions cross the TF→XLA lowering boundary and appear on XLA shapes.

## Files changed

- `tensorflow/compiler/tf2xla/shape_util.cc`: TensorShapeToXlaShape converts
  TF per-dim expressions to XLA DynExpr
- `tensorflow/compiler/tf2xla/xla_argument.h`: XlaArgument carries expressions
- `tensorflow/compiler/tf2xla/xla_op_kernel.cc`: XlaOpKernelContext reads
  and forwards expressions
- `tensorflow/compiler/tf2xla/xla_compiler.cc`: pass TF expressions into
  XLA argument shapes
- `tensorflow/compiler/tf2xla/layout_util.cc`: expression-aware layout
- `tensorflow/compiler/tf2xla/lib/broadcast.cc` / `.h`: expression-propagating
  broadcast helpers
- `tensorflow/compiler/tf2xla/lib/data_format.cc`: data-format transform
  preserves expressions
- `tensorflow/compiler/tf2xla/ops/xla_ops.cc`: register xla_compile_batch_sizes
  op attribute
