# Commit 1: Add XLA dynamic expression (DynExpr) support in XLA shapes

This commit introduces the foundational `DynExpr` symbolic expression system
that underpins dynamic-batch support across TF serving 2.20.

## Files changed

- `third_party/xla/xla/shape_dynexpr.h` *(new)*: DynExpr class hierarchy
  (Const, Var, Add, Sub, Mul, Div) with print/proto/solve/substitute
- `third_party/xla/xla/xla_data.proto`: ExpressionProto + per-dim expressions
  field in ShapeProto
- `third_party/xla/xla/shape.cc` / `.h`: `expressions()` accessor,
  `set_expressions()`, `Shape::expressions(int dim)` helper
- `third_party/xla/xla/shape_util.cc` / `.h`: utilities for propagating DynExpr
- `third_party/xla/xla/executable_run_options.h`: `batch_multiplier` field
- `third_party/xla/xla/stream_executor/tpu/c_api_decl.h`: batch_multiplier in
  SE_ExecutableRunOptions
- `third_party/xla/xla/xla.proto` / `BUILD`: flag registration
