#include <cassert>
#include <stdint.h>

#include <MemrefHelpers.h>
#include <cblas.h>
#include <string.h>

extern "C" void sbatch_matmul_3d_nn_mlir(
    /* A */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t,
    /* B */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t,
    /* C */ float *, float *, int64_t, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t);

extern "C" void sbatch_matmul_3d_nt_mlir(
    /* A */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t,
    /* B */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t,
    /* C */ float *, float *, int64_t, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t);

// C interface
extern "C" void cblas_sbatch_matmul_mlir(
    const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
    const enum CBLAS_TRANSPOSE TransB, const BLASINT BATCH, const BLASINT M,
    const BLASINT N, const BLASINT K, const float *A, const BLASINT LDA,
    const float *B, const BLASINT LDB, float *C, const BLASINT LDC) {

  // For the mini lib we only have nn,nt
  assert(Order == CblasRowMajor);
  assert(TransA == CblasNoTrans);

  memset(C, 0, BATCH * M * N * sizeof(float));

  if (TransB == CblasTrans) {
    sbatch_matmul_3d_nt_mlir(/* A */ Memref_3D_Args(A, BATCH, M, K, LDA),
                             /* B */ Memref_3D_Args(B, BATCH, N, K, LDB),
                             /* C */ Memref_3D_Args(C, BATCH, M, N, LDC));
  } else {
    sbatch_matmul_3d_nn_mlir(/* A */ Memref_3D_Args(A, BATCH, M, K, LDA),
                             /* B */ Memref_3D_Args(B, BATCH, K, N, LDB),
                             /* C */ Memref_3D_Args(C, BATCH, M, N, LDC));
  }
}
