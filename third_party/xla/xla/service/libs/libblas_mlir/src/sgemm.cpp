#include <cassert>
#include <stdint.h>

#include <MemrefHelpers.h>
#include <cblas.h>

#include <string.h>

extern "C" void sgemm_nn_alpha1_beta1_mlir(
    /* alpha */ float,
    /* beta */ float,
    /* A */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t,
    /* B */ const float *, const float *, int64_t, int64_t, int64_t, int64_t,
    int64_t,
    /* C */ float *, float *, int64_t, int64_t, int64_t, int64_t, int64_t);

// C interface
extern "C" void cblas_sgemm_mlir(
    const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
    const enum CBLAS_TRANSPOSE TransB, const BLASINT M, const BLASINT N,
    const BLASINT K, const float alpha, const float *A, const BLASINT LDA,
    const float *B, const BLASINT LDB, const float beta, float *C,
    const BLASINT LDC) {
  // For the mini lib we only have nn, alpha=1, beta=1 or beta=0.
  assert(Order == CblasRowMajor);
  assert(TransA == CblasNoTrans);
  assert(TransB == CblasNoTrans);
  assert(alpha == 1.0);
  assert(beta == 1.0 || beta == 0.0);

  // This is faster
  if (beta == 0.0) {
    memset(C, 0, M * N * sizeof(float));
  }

  // Call MLIR kernel
  sgemm_nn_alpha1_beta1_mlir(/* alpha */ 1.0,
                             /* beta */ 1.0,
                             /* A */ Memref_2D_Args(A, M, K, LDA),
                             /* B */ Memref_2D_Args(B, K, N, LDB),
                             /* C */ Memref_2D_Args(C, M, N, LDC));
}
