# Commit 3: Propagate DynExpr through shape inference

Updates TF and XLA shape inference to carry symbolic dimension expressions
alongside concrete shapes, allowing the batch dimension to flow through ops.

## Files changed

- `tensorflow/core/framework/shape_inference.cc` / `.h`: expression-aware
  InferenceContext; MakeDimWithExpr / GetDimExpr helpers
- `tensorflow/core/framework/common_shape_fns.cc`: expression propagation for
  standard TF shape functions
- `third_party/xla/xla/service/shape_inference.cc` / `.h`: DynExpr propagation
  through XLA ops (broadcast, reduce, slice, reshape, concat, dot, etc.)
- `tensorflow/core/grappler/costs/graph_properties.cc`: record inferred
  per-output TensorShapeExpressions in _xla_inferred_output_tensor_shapes
  node attributes for the encapsulation pass
