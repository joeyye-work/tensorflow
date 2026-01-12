#include <cassert>
#include <stdint.h>

#include <MemrefHelpers.h>
#include <cblas.h>
#include <string.h>

extern "C" void sbatch_matmul_4d_nn_mlir(
    /* A */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t, int64_t,
    /* B */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t, int64_t,
    /* C */ float *, float *, int64_t, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t);

extern "C" void sbatch_matmul_4d_nt_mlir(
    /* A */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t, int64_t,
    /* B */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t, int64_t,
    /* C */ float *, float *, int64_t, int64_t, int64_t, int64_t, int64_t,
    int64_t, int64_t, int64_t, int64_t);

// C interface
extern "C" void cblas_sbatch_matmul_4d_mlir(
    const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
    const enum CBLAS_TRANSPOSE TransB, const BLASINT BATCH1,
    const BLASINT BATCH2, const BLASINT M, const BLASINT N, const BLASINT K,
    const float *A, const BLASINT LDA, const float *B, const BLASINT LDB,
    float *C, const BLASINT LDC) {

  // For the mini lib we only have nn,nt
  assert(Order == CblasRowMajor);
  assert(TransA == CblasNoTrans);

  memset(C, 0, BATCH1 * BATCH2 * M * N * sizeof(float));

  if (TransB == CblasTrans) {
    sbatch_matmul_4d_nt_mlir(
        /* A */ Memref_4D_Args(A, BATCH1, BATCH2, M, K, LDA),
        /* B */ Memref_4D_Args(B, BATCH1, BATCH2, N, K, LDB),
        /* C */ Memref_4D_Args(C, BATCH1, BATCH2, M, N, LDC));
  } else {
    sbatch_matmul_4d_nn_mlir(
        /* A */ Memref_4D_Args(A, BATCH1, BATCH2, M, K, LDA),
        /* B */ Memref_4D_Args(B, BATCH1, BATCH2, K, N, LDB),
        /* C */ Memref_4D_Args(C, BATCH1, BATCH2, M, N, LDC));
  }
}
