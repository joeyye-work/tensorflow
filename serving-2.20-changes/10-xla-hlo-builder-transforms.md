# Commit 10: Update XLA HLO builder and transforms for DynExpr shapes

Threads DynExpr through XLA's HLO construction and optimization passes so
that dynamic-batch information survives optimization and lowering.

## Files changed

- `third_party/xla/xla/hlo/builder/xla_builder.cc` / `.h`:
  BuildXlaOp / GetShape carry expressions; helpers propagate expressions for
  Add, Broadcast, Reshape, Reduce, Slice, etc.
- `third_party/xla/xla/hlo/builder/lib/`: arithmetic, broadcast, slicing,
  matrix, PRNG, approx_topk, SVD updated to forward expression metadata
- `third_party/xla/xla/hlo/pass/hlo_pass_pipeline.cc`:
  schedule OuterDimensionPropagationPass when tf_xla_enable_dynamic_sizes
- `third_party/xla/xla/hlo/transforms/`: dot_decomposer, cholesky, eigh, qr,
  rng_bit_generator, bitcast_dtypes, all_gather_combiner updated to preserve
  expression metadata through transformations
- `third_party/xla/xla/hlo/translate/mhlo_to_hlo/`: mlir_hlo_to_hlo.cc and
  type_to_shape.cc carry expressions across the MLIR→HLO boundary
- `third_party/xla/xla/service/`: hlo_creation_utils, layout_assignment,
  reduce_scatter_combiner, triangular_solve_expander updated
