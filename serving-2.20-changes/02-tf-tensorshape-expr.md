# Commit 2: Add DynExpr support in TF framework TensorShape

Extends TF's TensorShape/TensorShapeProto with per-dimension expressions so
that the symbolic batch dimension can be carried alongside concrete sizes.

## Files changed

- `tensorflow/core/framework/tensor_shape_expr.cc` / `.h` *(new)*:
  TensorShapeExpr wrapper around DynExpr for TF-level shape propagation
- `tensorflow/core/framework/tensor_shape.proto`: repeated `expressions` field
  in TensorShapeProto
- `tensorflow/core/framework/tensor_shape.cc` / `.h`: GetExpression /
  SetExpression / expressions accessors
- `tensorflow/core/framework/batch_size_resource.h` *(new)*:
  BatchSizeResource for step-container storage of the runtime batch size
- `tensorflow/core/framework/BUILD`: new targets for tensor_shape_expr and
  batch_size_resource
- `tensorflow/core/BUILD`: batch_size_resource dependency
- `tensorflow/tools/toolchains/python/python_repo.bzl`: pin Python toolchain
