#ifndef MEMREF_HELPERS_H_
#define MEMREF_HELPERS_H_

#define Memref_1D_Args(NAME, M, S) NAME, NAME, 0, M, S
#define Memref_2D_Args(NAME, M, N, LD) NAME, NAME, 0, M, N, LD, 1
#define Memref_3D_Args(NAME, B, M, N, LD) NAME, NAME, 0, B, M, N, M *LD, LD, 1
#define Memref_4D_Args(NAME, B1, B2, M, N, LD)                                 \
  NAME, NAME, 0, B1, B2, M, N, B2 *M *LD, M *LD, LD, 1

#endif