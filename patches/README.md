# Serving-2.20 Patches

This directory contains consolidated patches representing all changes made to
the `for-serving-2.20` branch after commit
`72fbba3d20f4616d7312b5e2b7f79daf6e82f2fa` (TF 2.20.0 release).

The 76 original commits have been grouped into 6 logical patches. One subsequent
commit (`c630d2841d1d0446a15dec4a809c91a04fa2b071`) pushed after the initial PR
is captured as a standalone seventh patch.
Each patch is a squashed unified diff covering a focused area of functionality.

## Branch base

The `for-serving-2.20` branch diverged from the TF upstream at commit
`5fb3b1fefda9320202da184752a3366fbeddfeac`. All patches below are expressed
as diffs between consecutive milestones on the branch so that each patch
applies cleanly on top of the previous one.

---

## Patch 1 — Initial serving setup and debug options

**File:** `0001-initial-serving-setup.patch`  
**Range:** `5fb3b1fefda..66aca809f27`  
**Files changed:** 4 | **Insertions:** 73

### Commits covered

| Hash | Message |
|------|---------|
| `92148e0b108` | Enable serving build |
| `66aca809f27` | `[Huawei]` Add debug option `tf_xla_annotate_cluster_id` |

### Summary

- Enables the serving build by updating `python_repo.bzl`.
- Adds a new JIT flag `--tf_xla_annotate_cluster_id` that allows operators
  whose names start with `.cluster.<id>` to influence clustering decisions,
  making it easier to debug XLA cluster assignments during serving.

---

## Patch 2 — Dynamic batch size support in XLA kernels

**File:** `0002-dynamic-batch-size-xla-kernels.patch`  
**Range:** `66aca809f27..044df01287e`  
**Files changed:** 50 | **Insertions:** 2,234 | **Deletions:** 96

### Commits covered

| Hash | Message |
|------|---------|
| `5a4234fb3d6` | `[Huawei]` Retrieve batch size and pass to runoptions |
| `bf0e7dbb4d5` | `[Huawei]` Support magic number in IR Emitter |
| `a7902189489` | `[Huawei]` Find dynamic dimensions, override them and add a new attribute |
| `f2d6e96fca3` | `[Huawei]` Simplify the acquisition of the dynamic batch in LLVM IR loop emitter |
| `204a64427dd` | `[Huawei]` Solution of issues related to manual padding |
| `4ab00b8170f` | `[Huawei]` Propagation of dynamic dimension multiplier |
| `69e6c1837f5` | `[Huawei]` Remove consumer analysis logic, retrieve batch size and pass to runoptions |
| `f1e7b2c8b33` | `[Huawei]` Add switch to enable dynamic sizes |
| `8ba71b03c3f` | `[Huawei]` Disable reduce-window in the dynamic case |
| `893c47be716` | `[Huawei]` Look for batch dim by name |
| `f0235e6cefd` | `[Huawei]` Look for multiplier when deciding to emit reduce-window |
| `de2b88a8e83` | `[Huawei]` Error propagation |
| `eca0ef81595` | Fix reduce mean op |
| `d4abbfb6598` | Add batch size to all the kernels |
| `439a1b3eb6a` | Reduce printing by default |
| `ccdb4a002b9` | Add `GetOuterBatchValueSimplifier` pass |
| `cd1b1c66a58` | Correct AddLoop logic |
| `ad3218b8d0e` | Fixup batch multiplier value for reduce op |
| `3bb90e5834d` | Remove magic number for batch dim |
| `20855566c91` | Merge correctness fix from fenxcc |
| `039b2534a8c` | Remove repetitive code block |
| `12630f7e64f` | Split parallel compute subgraph info into different clusters |
| `33a78c2f178` | Support passing batch size to non-thunk version and add custom handler for ir_emitter |
| `4ef54350ce6` | Support dynamic dimension in dot product |
| `a768cfeaf4c` | Merge PR #8 (`non_thunk_bs`) |
| `044df01287e` | Merge PR #7 (`steven.dynamic_dot`) |

### Summary

Core implementation of dynamic batch size support in the XLA compilation and
execution stack:

- Introduces a mechanism to locate the dynamic (batch) dimension in HLO
  computations and propagate a runtime *batch multiplier* through the XLA
  IR (loop emitter, reduce-window, dot product, etc.).
- Extends the LLVM IR loop emitter to use a "magic number" to identify the
  outer batch loop at run time.
- Adds the `GetOuterBatchValueSimplifier` XLA pass.
- Threads the batch size through XLA run-options so that CPU/GPU kernels can
  use the actual runtime value.
- Adds support for dynamic dimension in dot products and for the non-thunk
  execution path.

Key files: `third_party/xla/xla/backends/cpu/…`, `third_party/xla/xla/service/…`,
`tensorflow/compiler/jit/kernels/xla_ops.cc`,
`tensorflow/compiler/tf2xla/xla_compiler.cc`.

---

## Patch 3 — Step container and batch size resource in the TF framework

**File:** `0003-step-container-batch-size-resource.patch`  
**Range:** `044df01287e..87404644cd7`  
**Files changed:** 17 | **Insertions:** 165 | **Deletions:** 54

### Commits covered

| Hash | Message |
|------|---------|
| `4444d2fef50` | `[Huawei]` Added step container, removed batch size from session and op_kernel |
| `3fbd89ab87a` | `[Huawei]` Add `tf_xla_threshold_for_megamorphic` flag |
| `13723b59ff2` | Merge PR #10 (`tf_xla_threshold_for_megamorphic`) |
| `2c6a66f6820` | `[Huawei]` Print batch multiplier in shape |
| `028bf1d178a` | `[Huawei]` Move `batch_size_resource.h` to framework dir |
| `822ce4e10f1` | `[Huawei]` Set output shape according to batch size |
| `b8e80bdfb77` | Merge PR #11 (`joey.batch_output_size2`) |
| `b2e6e545b7e` | `[Huawei]` Set `is_batch_` by using attr `_is_batch` |
| `85b0b1db073` | `[Huawei]` Added case for not-found resource in container |
| `1a2edeeae47` | Merge PR #13 (`utku.set_is_batch_`) |
| `87404644cd7` | Merge PR #14 (`utku.missing_resource_in_container`) |

### Summary

Refactors batch size management out of the Session and OpKernel layers and
into a dedicated step-scoped resource container:

- Introduces `BatchSizeResource` in `tensorflow/core/framework/` and moves
  it to the framework directory for broader visibility.
- Replaces the old per-session/per-op-kernel batch size storage with a step
  container keyed resource so that batch size is propagated through nested
  function calls cleanly.
- Adds `--tf_xla_threshold_for_megamorphic` flag to control when XLA
  specialisation is considered megamorphic (too many shapes).
- Fixes output shape inference to incorporate the batch size multiplier.
- Adds robustness when the step container resource is not yet present.

Key files: `tensorflow/core/framework/batch_size_resource.h`,
`tensorflow/compiler/jit/kernels/xla_ops.cc`,
`tensorflow/compiler/jit/xla_launch_util.cc`.

---

## Patch 4 — XLA batch matcher

**File:** `0004-xla-batch-matcher.patch`  
**Range:** `87404644cd7..4fbccfcfe44`  
**Files changed:** 125 | **Insertions:** 4,020 | **Deletions:** 678

### Commits covered

| Hash | Message |
|------|---------|
| `38fec133bff` | Add XLA batch matcher |
| `e812b157a74` | Merge PR #3 (`wendi98/serving-2.20`) |
| `351efcb44c3` | `[Huawei]` Fix batch matcher to always return next power of 2 |
| `bd9d8dc4f04` | `[Huawei]` Support for expressions in XLA shapes |
| `25c5828471b` | `[Huawei]` Support for expressions in TensorShape |
| `e73a80c0659` | `[Huawei]` Undo padding after possible compilation |
| `494c0047117` | Merge PR #17 (`joey.fix_batch_matcher`) |
| `75dce3937f2` | `[Huawei]` Fix proto for `xla_compile_batch_sizes` |
| `a66865e24e1` | Merge branch `for-serving-2.20` into `support_dyn_expr` |
| `c37efedd4f1` | Merge PR #16 (`utku-work/support_dyn_expr`) |
| `4fbccfcfe44` | Merge PR #18 (`utku-work/fix_proto`) |

### Summary

Introduces the *XLA batch matcher* — a mechanism to pre-compile a model for a
set of supported batch sizes and then select the best compiled variant at
serving time:

- New files: `tensorflow/compiler/jit/xla_batch_matcher.cc` and `.h`.
- The matcher maintains a sorted list of candidate batch sizes and, given an
  observed batch size, returns the smallest candidate that is ≥ the observed
  size (always a power of 2 after the fix).
- Padding/unpadding logic added to `xla_ops.cc`: inputs are padded to the
  next supported batch size before compilation and unpadded after.
- Expression support added to both `TensorShape` and XLA `Shape` to carry
  symbolic batch-size expressions through compilation.
- Proto update: `xla_compile_batch_sizes` field added to the XLA compile
  options proto.

Key files: `tensorflow/compiler/jit/xla_batch_matcher.{cc,h}`,
`tensorflow/compiler/jit/kernels/xla_ops.cc`,
`tensorflow/compiler/tf2xla/kernels/` (many ops updated to propagate
batch-size padding).

---

## Patch 5 — Dynamic expression (DynExpr) support

**File:** `0005-dynamic-expressions-dynexpr.patch`  
**Range:** `4fbccfcfe44..4266eeebbb4`  
**Files changed:** 12 | **Insertions:** 439 | **Deletions:** 169

### Commits covered

| Hash | Message |
|------|---------|
| `a3cc7d84296` | Pass TF expressions to XLA args |
| `080c6eb99ae` | Merge PR #19 (`stevenvar/steven.pass_tf_exps_to_xla`) |
| `7604f259eb4` | Resolve the issue for the XLA batch matcher flag being set but invalid |
| `11176f3d310` | Add method to retrieve the set of variable IDs in an expression |
| `ffac3f2eef1` | Add `solve` method to find the value of a variable in an expression |
| `5ef4c638cf9` | Merge PR #23 (`stevenvar/steven.extend_dynexpr`) |
| `d4da79fbc61` | Merge PR #22 (`wendi98/serving-2.20`) |
| `d260d6171b5` | Fix logic in `DynExpr::solve()` |
| `4266eeebbb4` | Merge PR #24 (`stevenvar/steven.extend_dynexpr`) |

### Summary

Extends the `DynExpr` (dynamic expression) infrastructure to allow symbolic
batch-size expressions to flow from the TF graph into XLA:

- TF `_Arg` nodes can now carry a `DynExpr` expression that describes how
  the argument's batch dimension relates to a symbolic variable.
- The `DynExpr` class gains two new methods: `get_all_ids()` to enumerate
  the symbolic variable IDs referenced by an expression, and `solve()` to
  find the concrete value of a variable given a known expression value.
- Bug fix in `DynExpr::solve()` for the general linear case.
- Fixes the batch matcher flag validation path (flag set but invalid value).

Key files: `tensorflow/core/framework/tensor_shape_expr.{cc,h}`,
`tensorflow/compiler/jit/encapsulate_subgraphs_pass.cc`,
`tensorflow/compiler/jit/kernels/xla_ops.cc`.

---

## Patch 6 — Unknown rank handling and stability fixes

**File:** `0006-unknown-rank-handling-fixes.patch`  
**Range:** `4266eeebbb4..1d7181b67fb` (branch tip)  
**Files changed:** 31 | **Insertions:** 961 | **Deletions:** 521

### Commits covered

| Hash | Message |
|------|---------|
| `42c36557db0` | Support capturing dynamic values |
| `fe50cc06f0e` | `[Huawei]` Less default verbose in `xla_batch_matcher` |
| `2fd758c4fb3` | `[Huawei]` Clustering to have no more than one dynamic var |
| `35bbb8f58f7` | Changes related to unknown rank |
| `e25a1b162c9` | `[Huawei]` Fix build conflict in integration |
| `69b765211e5` | Keep `output_shapes` in `_Arg` nodes |
| `171ca25f440` | Exclude nodes whose input is unranked from cluster |
| `1650151f665` | Fix propagation issue for unknown rank |
| `87ae225e0c1` | Fix potential index mismatch in `XlaRunOp::Compute` |
| `247d84a4ffa` | Not unknown rank if expression exists |
| `cec62664953` | Invert reshape expression propagation |
| `86a10549a21` | Guard DynExpr shape expression lookups |
| `814a59776eb` | Add explicit tf2xla expressions next to `AddDim` |
| `5a263f85d37` | `cluster_single_dynamic_dim` default to false and log properly |
| `893b9eb8d8b` | Retrieve the shape info from output shape if dimension not yet materialized |
| `29f95de058e` | Potential fix for pull request finding |
| `1d7181b67fb` | Only pad const arg if its value is batch_size |

### Summary

Stability and correctness fixes for unknown-rank tensors and the clustering
pipeline:

- Nodes with unranked input tensors are now excluded from dynamic-batch
  clusters to avoid invalid XLA shapes.
- `_Arg` nodes now preserve `output_shapes` so that shape information is
  available throughout the XLA compilation pipeline.
- Clustering is restricted to have at most one dynamic (batch) variable per
  cluster (`--cluster_single_dynamic_dim` flag, defaults to false).
- `DynExpr` lookups are now guarded against missing/invalid entries.
- Reshape expression propagation is corrected (inverted direction).
- `XlaRunOp::Compute` index mismatch bug fixed.
- Unknown-rank handling tightened: a tensor is no longer considered
  unknown-rank if it already has a `DynExpr` expression.
- Batch size padding now correctly skips constant arguments that do not
  represent a batch size.
- Build conflict fixes (macro redefinition in `shape.h`, missing
  `get_all_ids()` for `Div`).

Key files: `tensorflow/compiler/jit/encapsulate_subgraphs_pass.cc`,
`tensorflow/compiler/jit/mark_for_compilation_pass.cc`,
`tensorflow/compiler/jit/kernels/xla_ops.cc`,
`tensorflow/compiler/jit/xla_batch_matcher.cc`,
`tensorflow/core/framework/tensor_shape.{cc,h}`,
`third_party/xla/xla/shape_dynexpr.h`.

---

## Patch 7 — True scalar batch-size constant patching

**File:** `0007-true-scalar-batch-size-constants.patch`  
**Range:** `1d7181b67fb..c630d2841d1` (single commit)  
**Files changed:** 1 | **Insertions:** 69 | **Deletions:** 55

### Commits covered

| Hash | Message |
|------|---------|
| `c630d2841d1` | Patch true scalar batch-size constants |

### Summary

Refines the scalar constant batch-size rewriting logic in
`CompileToLocalExecutable` (`xla_ops.cc`):

- Replaces the ad-hoc `old_batch` variable with a cleaner
  `record_dynamic_dim_value` lambda that tracks the unique runtime dynamic
  dimension value across all arguments. A `has_multiple_dynamic_dim_values`
  flag guards against the ambiguous case where different arguments have
  different dynamic sizes.
- Introduces a `maybe_rewrite_scalar_constant` lambda that encapsulates the
  heuristic for rewriting scalar integer constants:
  - Only true scalars (`NumElements() == 1`) are candidates.
  - Only constants whose runtime value matches the detected dynamic batch size
    are rewritten.
  - The rewrite operates on a deep-copied `Tensor` so the original caller-
    visible buffer is never mutated; consequently, no restoration via
    `old_vars` is needed for constants.
- Simplifies the post-compilation restore loop: since scalar constants are now
  patched via deep copy, only dynamic dimension entries in `old_vars` (shape
  dims) need to be restored.
- Removes a stale trailing comment (`// Use 1 all the time for now`) in
  `DimExprToDynExpr`.
- Fixes `get_xla_compile_batch` calls to use `shp.dim_size(idx)` (the actual
  dynamic index) instead of always using index 0.

Key files: `tensorflow/compiler/jit/kernels/xla_ops.cc`.

---

## How to apply patches

Each patch is a standard unified diff. To apply them in order:

```bash
git apply patches/0001-initial-serving-setup.patch
git apply patches/0002-dynamic-batch-size-xla-kernels.patch
git apply patches/0003-step-container-batch-size-resource.patch
git apply patches/0004-xla-batch-matcher.patch
git apply patches/0005-dynamic-expressions-dynexpr.patch
git apply patches/0006-unknown-rank-handling-fixes.patch
git apply patches/0007-true-scalar-batch-size-constants.patch
```

All patches apply relative to the branch divergence point
(`5fb3b1fefda9320202da184752a3366fbeddfeac`).
