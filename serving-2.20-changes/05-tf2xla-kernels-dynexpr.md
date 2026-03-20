# Commit 5: Propagate DynExpr through tf2xla op kernels

Updates all 43 tf2xla kernel implementations to thread per-dimension symbolic
expressions through their output shapes so the dynamic batch dimension is
visible in XLA's compiled shapes.

## Affected ops

- **Elementwise / unary**: relu, clip_by_value, select, where
- **Reduction**: reduction_ops, reduction_ops_common, softmax
- **Reshape / slice**: reshape_op, slice_op, split_op, strided_slice_op
- **Gather / scatter**: gather_op, scatter_nd_op
- **Matrix ops**: matrix_diag_ops, matrix_triangular_solve_op
- **Convolution**: conv_ops, conv_op_helpers
- **Pooling**: pooling_ops
- **Random**: stateless_random_ops, fake_quantize_ops
- **Misc**: unique_op, tile_ops, pack_op, unpack_op, shape_op, const_op,
  diag_op, bincount_op, beta_op, in_topk_op, lower_upper_bound_ops, image_ops,
  dynamic_partition_op, dynamic_stitch_op, sparse_to_dense_op,
  segment_reduction_ops, quantize_and_dequantize_op, reverse_sequence_op,
  stack_ops, tensor_array_ops, tensor_list_ops, tensor_list_utils,
  broadcast_to_op
