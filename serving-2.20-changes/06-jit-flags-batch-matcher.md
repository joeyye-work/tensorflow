# Commit 6: Add JIT compilation flags and XlaBatchMatcher for dynamic batch

Adds four new mark-for-compilation flags and a batch-size matching utility
that allow the XLA JIT to compile for a discrete set of batch sizes and round
real requests up to the nearest compiled bucket.

## Files changed

- `tensorflow/compiler/jit/flags.cc` / `.h`:
  - `tf_xla_annotate_cluster_id`: cluster ops by name prefix `.cluster.{id}`
  - `tf_xla_cluster_parallel`: split parallel subgraphs into separate clusters
  - `tf_xla_enable_dynamic_sizes`: master switch for DynExpr batch support
  - `tf_xla_threshold_for_megamorphic`: tune megamorphic-cluster threshold
- `tensorflow/compiler/jit/xla_batch_matcher.cc` / `.h` *(new)*:
  XlaBatchMatcher reads `TF_XLA_COMPILE_BATCH_SIZES` env var (e.g. `1,2,4-16`)
  and rounds real batch sizes up to the next compile-time bucket
