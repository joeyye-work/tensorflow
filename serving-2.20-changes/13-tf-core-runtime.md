# Commit 13: Update TF core runtime for dynamic batch support

Miscellaneous TF core updates to integrate dynamic batch-size handling
throughout the runtime execution path.

## Files changed

- `tensorflow/core/common_runtime/constant_folding.cc`:
  skip constant-folding for nodes annotated with xla_compile_batch_sizes
- `tensorflow/core/grappler/optimizers/remapper.cc`:
  preserve xla_compile_batch_sizes attribute through fusions
- `tensorflow/core/kernels/function_ops.cc` / `.h`:
  PartitionedCallOp and FunctionOp forward BatchSizeResource from
  step-container into called functions
- `tensorflow/core/kernels/padding_fifo_queue.cc`:
  avoid assertion failures for dynamic-batch queues
- `tensorflow/core/kernels/strided_slice_op.cc`:
  expression-aware strided slice kernel
- `tensorflow/core/util/strided_slice_op.cc` / `.h`:
  propagate expressions through StridedSliceShapeSpec; update SliceHelper
- `tensorflow/core/graph/subgraph.cc`:
  mark feed/fetch nodes with _is_batch attr so the JIT identifies which
  argument carries the dynamic batch dimension
