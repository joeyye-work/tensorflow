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

#include "kernel_selector.h"

#define EIGEN_USE_THREADS

#include <string.h>

#include "tsl/platform/blocking_counter.h"
#include "unsupported/Eigen/CXX11/Tensor"
#include "xla/executable_run_options.h"
#include "xla/service/cpu/runtime_lightweight_check.h"

namespace xla {
namespace cpu {

// TODO: Need to test handling trA, trB
void __xla_cpu_runtime_KernelSelectorGEMMSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int M, int N, int K, float alpha, float beta, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb, beta, C,
              ldc);
}

// TODO: Need to test handling trA, trB
void __xla_cpu_runtime_KernelSelectorGEMMParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int M, int N, int K, float alpha, float beta, float* C) {
  const xla::ExecutableRunOptions* run_options =
      static_cast<const xla::ExecutableRunOptions*>(run_options_ptr);
  XLA_LIGHTWEIGHT_CHECK(run_options->intra_op_thread_pool() != nullptr);
  const Eigen::ThreadPoolDevice* thread_pool =
      (Eigen::ThreadPoolDevice*)(run_options->intra_op_thread_pool());
  Eigen::ThreadPoolInterface* eigen_interface_ = thread_pool->getPool();

  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float beta_v = beta;
  if (beta == 0.0) {
    beta_v = 1.0;
    memset(C, 0.0, M * N * sizeof(float));
  }

  int njobs = eigen_interface_->NumThreads();

  int sqrt_jobs = (int)sqrt(njobs);

  tsl::BlockingCounter bc(njobs);

  // TODO: Look at a more flexible way to distribute computation amongst
  // threads.
  for (int i = 0; i < sqrt_jobs; i++) {
    for (int j = 0; j < sqrt_jobs; j++) {
      int M_tile = M / sqrt_jobs;
      int N_tile = N / sqrt_jobs;

      int M_start = i * M_tile;
      int N_start = j * N_tile;

      int M_len = (i == sqrt_jobs - 1) ? (M - M_start) : M_tile;
      int N_len = (j == sqrt_jobs - 1) ? (N - N_start) : N_tile;

      eigen_interface_->Schedule([=, &bc]() {
        cblas_sgemm(Order, TransA, TransB, M_len, N_len, K, alpha,
                    &A[M_start * lda], lda, &B[N_start], ldb, beta_v,
                    &C[M_start * ldc + N_start], ldc);
        bc.DecrementCount();
      });
    }
  }
  bc.Wait();
}

void __xla_cpu_runtime_KernelSelectorBatch3DSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int P, int M, int N, int K, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float alpha = 1.0;
  float beta = 0.0;

  for (int i = 0; i < P; ++i) {
    cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, &A[i * M * K], lda,
                &B[i * K * N], ldb, beta, &C[i * M * N], ldc);
  }
}

void __xla_cpu_runtime_KernelSelectorBatch3DParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int P, int M, int N, int K, float* C) {
  const xla::ExecutableRunOptions* run_options =
      static_cast<const xla::ExecutableRunOptions*>(run_options_ptr);
  XLA_LIGHTWEIGHT_CHECK(run_options->intra_op_thread_pool() != nullptr);
  const Eigen::ThreadPoolDevice* thread_pool =
      (Eigen::ThreadPoolDevice*)(run_options->intra_op_thread_pool());
  Eigen::ThreadPoolInterface* eigen_interface_ = thread_pool->getPool();

  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float alpha = 1.0;
  float beta = 0.0;

  int njobs = eigen_interface_->NumThreads();

  int num_batches = P;

  tsl::BlockingCounter bc(num_batches < njobs ? num_batches : njobs);

  // parallelize batches
  int PB = (num_batches) / njobs;
  int rem = (num_batches) % njobs;

  // TODO: Need to test handling trA
  for (int batchIdx = 0, threadIdx = 0; batchIdx < num_batches; threadIdx++) {
    int adjPB = PB + (threadIdx < rem ? 1 : 0);

    eigen_interface_->Schedule([=, &bc]() {
      for (int i = 0; i < adjPB; i++) {
        const float* AA = &A[(batchIdx + i) * M * K];
        const float* BB = &B[(batchIdx + i) * K * N];
        float* CC = &C[(batchIdx + i) * M * N];
        cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, AA, lda, BB, ldb,
                    beta, CC, ldc);
      }
      bc.DecrementCount();
    });

    batchIdx += adjPB;
  }
  bc.Wait();
}

void __xla_cpu_runtime_KernelSelectorGEMV(const void* run_options_ptr, bool trA,
                                          const float* A, const float* X, int M,
                                          int N, float alpha, float beta,
                                          float* Y) {
  int lda = trA ? M : N;
  int incX = 1;
  int incY = 1;
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  cblas_sgemv(Order, TransA, M, N, alpha, A, lda, X, incX, beta, Y, incY);
}

#ifdef ENABLE_BLAS_MLIR
void __xla_cpu_runtime_KernelSelectorGEMMMLIR(const void* run_options_ptr,
                                              bool trA, bool trB,
                                              const float* A, const float* B,
                                              int M, int N, int K, float alpha,
                                              float beta, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float beta_v = beta;
  if (beta == 0.0) {
    beta_v = 1.0;
    memset(C, 0.0, M * N * sizeof(float));
  }

  cblas_sgemm_mlir(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb,
                   beta_v, C, ldc);
}

void __xla_cpu_runtime_KernelSelectorBatch3DMLIR(const void* run_options_ptr,
                                                 bool trA, bool trB,
                                                 const float* A, const float* B,
                                                 int P, int M, int N, int K,
                                                 float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  cblas_sbatch_matmul_mlir(Order, TransA, TransB, P, M, N, K, A, lda, B, ldb, C,
                           ldc);
}

void __xla_cpu_runtime_KernelSelectorBatch4DMLIR(const void* run_options_ptr,
                                                 bool trA, bool trB,
                                                 const float* A, const float* B,
                                                 int Q, int P, int M, int N,
                                                 int K, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  cblas_sbatch_matmul_4d_mlir(Order, TransA, TransB, Q, P, M, N, K, A, lda, B,
                              ldb, C, ldc);
}
#endif  // ENABLE_BLAS_MLIR

void __xla_cpu_runtime_KernelSelectorBatch4DSequential(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float alpha = 1.0;
  float beta = 0.0;

  for (int i = 0; i < Q * P; ++i) {
    cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, &A[i * M * K], lda,
                &B[i * K * N], ldb, beta, &C[i * M * N], ldc);
  }
}

void __xla_cpu_runtime_KernelSelectorBatch4DParallel(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C) {
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;
  CBLAS_TRANSPOSE TransB = (trB) ? CblasTrans : CblasNoTrans;
  int lda = trA ? M : K;
  int ldb = trB ? K : N;
  int ldc = N;

  float alpha = 1.0;
  float beta = 0.0;

  const xla::ExecutableRunOptions* run_options =
      static_cast<const xla::ExecutableRunOptions*>(run_options_ptr);
  XLA_LIGHTWEIGHT_CHECK(run_options->intra_op_thread_pool() != nullptr);
  const Eigen::ThreadPoolDevice* thread_pool =
      (Eigen::ThreadPoolDevice*)(run_options->intra_op_thread_pool());
  Eigen::ThreadPoolInterface* eigen_interface_ = thread_pool->getPool();

  int njobs = eigen_interface_->NumThreads();

  int num_batches = P * Q;

  tsl::BlockingCounter bc(num_batches < njobs ? num_batches : njobs);

  // parallelize batches
  int PB = (num_batches) / njobs;
  int rem = (num_batches) % njobs;

  // TODO: Need to test handling trA
  for (int batchIdx = 0, threadIdx = 0; batchIdx < num_batches; threadIdx++) {
    int adjPB = PB + (threadIdx < rem ? 1 : 0);

    eigen_interface_->Schedule([=, &bc]() {
      for (int i = 0; i < adjPB; i++) {
        const float* AA = &A[(batchIdx + i) * M * K];
        const float* BB = &B[(batchIdx + i) * K * N];
        float* CC = &C[(batchIdx + i) * M * N];
        cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, AA, lda, BB, ldb,
                    beta, CC, ldc);
      }
      bc.DecrementCount();
    });

    batchIdx += adjPB;
  }
  bc.Wait();
}

#ifdef ENABLE_BLAS_MLIR
void __xla_cpu_runtime_KernelSelectorGEMVMLIR(const void* run_options_ptr,
                                              bool trA, const float* A,
                                              const float* X, int M, int N,
                                              float alpha, float beta,
                                              float* Y) {
  int lda = trA ? M : N;
  int incX = 1;
  int incY = 1;
  CBLAS_LAYOUT Order = CblasRowMajor;
  CBLAS_TRANSPOSE TransA = (trA) ? CblasTrans : CblasNoTrans;

  cblas_sgemv_mlir(Order, TransA, M, N, alpha, A, lda, X, incX, beta, Y, incY);
}
#endif  // ENABLE_BLAS_MLIR

void __xla_cpu_runtime_ArgMaxTask(size_t out_idx, int N, float* invals,
                                  int32_t* inidxs, float init_value,
                                  int32_t init_idx, float* outvals,
                                  int32_t* outidxs) {
  float maxval = init_value;
  int32_t maxidx = init_idx;
  size_t idx = (out_idx)*N;

  for (int i = 0; i < N; i++) {
    float val = invals[idx];
    int32_t idx_val = inidxs[idx];

    if (val >= maxval) {
      maxval = val;
      maxidx = idx_val;
    }

    idx++;
  }

  outvals[out_idx] = maxval;
  outidxs[out_idx] = maxidx;
}

void __xla_cpu_runtime_ArgMax3DParallel(const void* run_options_ptr, int B,
                                        int M, int N, float* invals,
                                        int32_t* inidxs, float init_value,
                                        int32_t init_idx, float* outvals,
                                        int32_t* outidxs) {
  const xla::ExecutableRunOptions* run_options =
      static_cast<const xla::ExecutableRunOptions*>(run_options_ptr);
  XLA_LIGHTWEIGHT_CHECK(run_options->intra_op_thread_pool() != nullptr);
  const Eigen::ThreadPoolDevice* thread_pool =
      (Eigen::ThreadPoolDevice*)(run_options->intra_op_thread_pool());
  Eigen::ThreadPoolInterface* eigen_interface_ = thread_pool->getPool();

  int BM = B * M;
  int num_threads = eigen_interface_->NumThreads();
  const int block_size = (BM + num_threads - 1) / num_threads;
  tsl::BlockingCounter bc(num_threads);

  for (size_t t = 0; t < num_threads; t++) {
    size_t start = t * block_size;
    size_t end = std::min<size_t>((t + 1) * block_size, BM);

    eigen_interface_->ScheduleWithHint(
        [=, &bc]() {
          for (size_t bm = start; bm < end; bm++) {
            __xla_cpu_runtime_ArgMaxTask(bm, N, invals, inidxs, init_value,
                                         init_idx, outvals, outidxs);
          }
          bc.DecrementCount();
        },
        t, t + 1);
  }

  bc.Wait();
}

void __xla_cpu_runtime_ArgMax3DSequential(const void* run_options_ptr, int B,
                                          int M, int N, float* invals,
                                          int32_t* inidxs, float init_value,
                                          int32_t init_idx, float* outvals,
                                          int32_t* outidxs) {
  // NB: run_options_ptr is ignored in the sequential version.
  for (int b = 0; b < B; b++) {
    for (int m = 0; m < M; m++) {
      size_t out_idx = b * M + m;
      __xla_cpu_runtime_ArgMaxTask(out_idx, N, invals, inidxs, init_value,
                                   init_idx, outvals, outidxs);
    }
  }
}

void __xla_cpu_runtime_ArgMax3DEmpty(const void* run_options_ptr, int B, int M,
                                     int N, float* invals, int32_t* inidxs,
                                     float init_value, int32_t init_idx,
                                     float* outvals, int32_t* outidxs) {}

void __xla_cpu_runtime_KernelSelectorGEMVEmpty(const void* run_options_ptr,
                                               bool trA, const float* A,
                                               const float* X, int M, int N,
                                               float alpha, float beta,
                                               float* Y) {}

void __xla_cpu_runtime_KernelSelectorGEMMEmpty(const void* run_options_ptr,
                                               bool trA, bool trB,
                                               const float* A, const float* B,
                                               int m, int n, int k, float alpha,
                                               float beta, float* C) {}

void __xla_cpu_runtime_KernelSelectorBatch3DEmpty(const void* run_options_ptr,
                                                  bool trA, bool trB,
                                                  const float* A,
                                                  const float* B, int P, int M,
                                                  int N, int K, float* C) {}

void __xla_cpu_runtime_KernelSelectorBatch4DEmpty(
    const void* run_options_ptr, bool trA, bool trB, const float* A,
    const float* B, int Q, int P, int M, int N, int K, float* C) {}

}  // namespace cpu
}  // namespace xla
