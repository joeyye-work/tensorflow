/* Copyright 2025 Huawei. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/
#ifndef XLA_SERVICE_CPU_KERNEL_SELECTOR_H_
#define XLA_SERVICE_CPU_KERNEL_SELECTOR_H_
#include <cstdint>

namespace xla {
namespace cpu {

#ifndef OPENBLAS_CONST
#define OPENBLAS_CONST const
#endif

typedef enum CBLAS_ORDER {
  CblasRowMajor = 101,
  CblasColMajor = 102
} CBLAS_ORDER;

typedef enum CBLAS_TRANSPOSE {
  CblasNoTrans = 111,
  CblasTrans = 112,
  CblasConjTrans = 113,
  CblasConjNoTrans = 114
} CBLAS_TRANSPOSE;

typedef int blasint;
typedef CBLAS_ORDER CBLAS_LAYOUT;

extern "C" {

// BLAS interface
extern void cblas_sgemm(OPENBLAS_CONST enum CBLAS_ORDER Order,
                        OPENBLAS_CONST enum CBLAS_TRANSPOSE TransA,
                        OPENBLAS_CONST enum CBLAS_TRANSPOSE TransB,
                        OPENBLAS_CONST blasint M, OPENBLAS_CONST blasint N,
                        OPENBLAS_CONST blasint K, OPENBLAS_CONST float alpha,
                        OPENBLAS_CONST float* A, OPENBLAS_CONST blasint lda,
                        OPENBLAS_CONST float* B, OPENBLAS_CONST blasint ldb,
                        OPENBLAS_CONST float beta, float* C,
                        OPENBLAS_CONST blasint ldc);

extern void cblas_sgemv(OPENBLAS_CONST enum CBLAS_ORDER order,
                        OPENBLAS_CONST enum CBLAS_TRANSPOSE trans,
                        OPENBLAS_CONST blasint m, OPENBLAS_CONST blasint n,
                        OPENBLAS_CONST float alpha, OPENBLAS_CONST float* a,
                        OPENBLAS_CONST blasint lda, OPENBLAS_CONST float* x,
                        OPENBLAS_CONST blasint incx, OPENBLAS_CONST float beta,
                        float* y, OPENBLAS_CONST blasint incy);

#ifdef ENABLE_BLAS_MLIR
// MLIR LIB
extern void cblas_sbatch_matmul_mlir(
    const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
    const enum CBLAS_TRANSPOSE TransB, const blasint P, const blasint M,
    const blasint N, const blasint K, const float* A, const blasint lda,
    const float* B, const blasint ldb, float* C, const blasint ldc);

extern void cblas_sbatch_matmul_4d_mlir(
    const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
    const enum CBLAS_TRANSPOSE TransB, const blasint Q, const blasint P,
    const blasint M, const blasint N, const blasint K, const float* A,
    const blasint lda, const float* B, const blasint ldb, float* C,
    const blasint ldc);

extern void cblas_sgemm_mlir(const enum CBLAS_ORDER Order,
                             const enum CBLAS_TRANSPOSE TransA,
                             const enum CBLAS_TRANSPOSE TransB, const blasint M,
                             const blasint N, const blasint K,
                             const float alpha, const float* A,
                             const blasint lda, const float* B,
                             const blasint ldb, const float beta, float* C,
                             const blasint ldc);

extern void cblas_sgemv_mlir(const enum CBLAS_ORDER Order,
                             const enum CBLAS_TRANSPOSE TransA, const blasint M,
                             const blasint N, const float alpha, const float* A,
                             const blasint lda, const float* X,
                             const blasint incX, const float beta, float* Y,
                             const blasint incY);
#endif  // ENABLE_BLAS_MLIR
}  // extern "C"

void __xla_cpu_runtime_KernelSelectorGEMMSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int M, int N, int K, float alpha, float beta, float* C);

void __xla_cpu_runtime_KernelSelectorGEMMParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int m, int n, int k, float alpha, float beta, float* C);

void __xla_cpu_runtime_KernelSelectorBatch3DSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int P, int M, int N, int K, float* C);

void __xla_cpu_runtime_KernelSelectorBatch3DParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int P, int M, int N, int K, float* C);

void __xla_cpu_runtime_KernelSelectorBatch4DSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C);

void __xla_cpu_runtime_KernelSelectorBatch4DParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C);

void __xla_cpu_runtime_KernelSelectorGEMV(const void* run_options_ptr, bool trA,
                                          const float* A, const float* X, int M,
                                          int N, float alpha, float beta,
                                          float* Y);

#ifdef ENABLE_BLAS_MLIR
void __xla_cpu_runtime_KernelSelectorGEMMMLIR(const void* run_options_ptr,
                                              bool trA, bool trB,
                                              const float* A, const float* B,
                                              int m, int n, int k, float alpha,
                                              float beta, float* C);

void __xla_cpu_runtime_KernelSelectorBatch3DMLIR(const void* run_options_ptr,
                                                 bool trA, bool trB,
                                                 const float* A, const float* B,
                                                 int P, int M, int N, int K,
                                                 float* C);

void __xla_cpu_runtime_KernelSelectorBatch4DMLIR(const void* run_options_ptr,
                                                 bool trA, bool trB,
                                                 const float* A, const float* B,
                                                 int Q, int P, int M, int N,
                                                 int K, float* C);

void __xla_cpu_runtime_KernelSelectorGEMVMLIR(const void* run_options_ptr,
                                              bool trA, const float* A,
                                              const float* X, int M, int N,
                                              float alpha, float beta,
                                              float* Y);
#endif  // ENABLE_BLAS_MLIR

void __xla_cpu_runtime_ArgMax3DParallel(const void* run_options_ptr, int B,
                                        int M, int N, float* invals,
                                        int32_t* inidxs, float init_value,
                                        int32_t init_idx, float* outvals,
                                        int32_t* outidxs);
void __xla_cpu_runtime_ArgMax3DSequential(const void* run_options_ptr, int B,
                                          int M, int N, float* invals,
                                          int32_t* inidxs, float init_value,
                                          int32_t init_idx, float* outvals,
                                          int32_t* outidxs);

void __xla_cpu_runtime_ArgMax3DEmpty(const void* run_options_ptr, int B, int M,
                                     int N, float* invals, int32_t* inidxs,
                                     float init_value, int32_t init_idx,
                                     float* outvals, int32_t* outidxs);

void __xla_cpu_runtime_KernelSelectorGEMVEmpty(const void* run_options_ptr,
                                               bool trA, const float* A,
                                               const float* X, int M, int N,
                                               float alpha, float beta,
                                               float* Y);

void __xla_cpu_runtime_KernelSelectorGEMMEmpty(const void* run_options_ptr,
                                               bool trA, bool trB,
                                               const float* A, const float* B,
                                               int m, int n, int k, float alpha,
                                               float beta, float* C);

void __xla_cpu_runtime_KernelSelectorBatch3DEmpty(const void* run_options_ptr,
                                                  bool trA, bool trB,
                                                  const float* A,
                                                  const float* B, int P, int M,
                                                  int N, int K, float* C);

void __xla_cpu_runtime_KernelSelectorBatch4DEmpty(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C);

}  // namespace cpu
}  // namespace xla

#endif  // XLA_SERVICE_CPU_KERNEL_SELECTOR_H_
