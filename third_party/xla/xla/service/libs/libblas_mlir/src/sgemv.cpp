#include <cassert>
#include <stdint.h>
#include <string.h>

#include <MemrefHelpers.h>
#include <cblas.h>

extern "C" void sgemv_n_alpha1_beta1_mlir(/* alpha */ float,
                                          /* beta */ float,
                                          /* A */ const float *, const float *,
                                          int64_t, int64_t, int64_t, int64_t,
                                          int64_t,
                                          /* X */ const float *, const float *,
                                          int64_t, int64_t, int64_t,
                                          /* Y */ float *, float *, int64_t,
                                          int64_t, int64_t);

// C interface
extern "C" void cblas_sgemv_mlir(const enum CBLAS_ORDER Order,
                                 const enum CBLAS_TRANSPOSE TransA,
                                 const BLASINT M, const BLASINT N,
                                 const float alpha, const float *A,
                                 const BLASINT LDA, const float *X,
                                 const BLASINT INCX, const float beta, float *Y,
                                 const BLASINT INCY) {
  // For the mini lib we only have nn, alpha=1, beta=0 or beta=1.
  assert(TransA == CblasNoTrans);
  assert(Order == CblasRowMajor);
  assert(alpha == 1.0);
  assert(beta == 1.0 || beta == 0.0);

  // This is faster
  if (beta == 0.0) {
    memset(Y, 0, M * sizeof(float));
  }

  // Call MLIR kernel
  sgemv_n_alpha1_beta1_mlir(/* alpha */ 1.0,
                            /* beta */ 1.0,
                            /* A */ Memref_2D_Args(A, M, N, LDA),
                            /* X */ Memref_1D_Args(X, N, INCX),
                            /* Y */ Memref_1D_Args(Y, M, INCY));
}
