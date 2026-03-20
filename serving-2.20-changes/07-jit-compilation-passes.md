# Commit 7: Update JIT mark-for-compilation and encapsulation for dynamic batch

Extends the TF JIT compilation passes to correctly handle dynamic batch sizes
during graph partitioning, encapsulation, and shape-annotation propagation.

## Files changed

- `tensorflow/compiler/jit/mark_for_compilation_pass.cc`: enforce at most one
  dynamic variable per cluster; support tf_xla_annotate_cluster_id and
  tf_xla_cluster_parallel; exclude unranked nodes; use
  tf_xla_threshold_for_megamorphic for megamorphic eviction
- `tensorflow/compiler/jit/device_compilation_profiler.cc`:
  carry batch-size padding/unpadding across compilations
- `tensorflow/compiler/jit/device_compiler.h`:
  carry xla_compile_batch_sizes attr across compilations
- `tensorflow/compiler/jit/encapsulate_subgraphs_pass.cc`:
  propagate _xla_inferred_output_tensor_shapes and output shape expressions
  from graph_properties into _Arg node attributes
- `tensorflow/compiler/jit/encapsulate_util.cc` / `.h`:
  helper to read inferred-shape annotations
- `tensorflow/compiler/jit/shape_inference.cc`:
  expression-aware JIT shape inference
- `tensorflow/compiler/jit/BUILD`:
  add xla_batch_matcher and batch_size_resource deps
