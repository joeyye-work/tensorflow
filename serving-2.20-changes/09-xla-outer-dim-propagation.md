# Commit 9: Add XLA outer-dimension propagation and batch-value simplifier

Two new XLA HLO optimization passes that enable downstream code to know which
HLO dimensions carry the outer (batch) multiplier.

## Files changed

- `third_party/xla/xla/service/outer_dimension_propagation.cc` / `.h` *(new)*:
  OuterDimensionPropagationPass reads `tf_outer_marker` metadata on HLO
  parameters and propagates outer-dimension multiplier relationships through
  the HLO graph via instruction metadata
- `third_party/xla/xla/service/get_outer_batch_value_simplifier.cc` / `.h`
  *(new)*: GetOuterBatchValueSimplifier pass replaces
  `GetTupleElement(outer_batch_size_tuple, 0)` patterns with a direct constant
  matching the outer batch multiplier
- `third_party/xla/xla/service/BUILD`: register both passes
