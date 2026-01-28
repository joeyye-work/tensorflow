	.text
	.file	"LLVMDialectModule"
	.globl	sbatch_matmul_3d_nn_mlir                    // -- Begin function sbatch_matmul_3d_nn_mlir
	.p2align	4
	.type	sbatch_matmul_3d_nn_mlir,@function
sbatch_matmul_3d_nn_mlir:                           // @sbatch_matmul_3d_nn_mlir
	.cfi_startproc
// %bb.0:
	stp	d15, d14, [sp, #-160]!          // 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	sub	sp, sp, #1040
	.cfi_def_cfa_offset 1200
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset w30, -88
	.cfi_offset w29, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	cmp	x4, #0
	ldr	x13, [sp, #1248]
	ldr	x29, [sp, #1336]
	lsl	x23, x5, #6
	cinv	x8, x4, lt
	ldr	x20, [sp, #1264]
	ldr	x26, [sp, #1216]
	add	x0, x23, #64
	add	x9, x8, x8, lsr #63
	add	x10, x8, #3
	mov	x19, x7
	str	x6, [sp, #760]                  // 8-byte Folded Spill
	mov	x21, x5
	stp	x13, x3, [sp, #144]             // 16-byte Folded Spill
	mov	x27, x2
	str	x1, [sp, #720]                  // 8-byte Folded Spill
	asr	x9, x9, #1
	str	x4, [sp, #744]                  // 8-byte Folded Spill
	cinv	x28, x9, lt
	cmp	x8, #0
	ldr	x9, [sp, #1256]
	csel	x8, x10, x8, lt
	cmp	x4, #0
	ldr	x10, [sp, #1328]
	asr	x8, x8, #2
	cinv	x24, x8, lt
	cmp	x13, #0
	cinv	x8, x13, lt
	str	x9, [sp, #752]                  // 8-byte Folded Spill
	add	x9, x8, x8, lsr #63
	str	x10, [sp, #736]                 // 8-byte Folded Spill
	add	x10, x8, #15
	add	x11, x8, #7
	add	x12, x8, #3
	asr	x9, x9, #1
	cinv	x14, x9, lt
	ldr	x9, [sp, #1296]
	cmp	x8, #0
	str	x14, [sp, #1000]                // 8-byte Folded Spill
	str	x9, [sp, #696]                  // 8-byte Folded Spill
	ldr	x9, [sp, #1288]
	str	x9, [sp, #688]                  // 8-byte Folded Spill
	csel	x9, x10, x8, lt
	csel	x10, x11, x8, lt
	csel	x8, x12, x8, lt
	cmp	x13, #0
	asr	x9, x9, #4
	asr	x8, x8, #2
	asr	x10, x10, #3
	cinv	x11, x9, lt
	ldr	x9, [sp, #1224]
	cinv	x25, x8, lt
	cinv	x10, x10, lt
	lsl	x8, x25, #2
	str	x11, [sp, #1016]                // 8-byte Folded Spill
	str	x10, [sp, #1008]                // 8-byte Folded Spill
	str	x8, [sp, #600]                  // 8-byte Folded Spill
	lsl	x8, x14, #1
	str	x8, [sp, #648]                  // 8-byte Folded Spill
	str	x9, [sp, #712]                  // 8-byte Folded Spill
	lsl	x9, x11, #4
	str	x9, [sp, #832]                  // 8-byte Folded Spill
	lsl	x9, x10, #3
	str	x9, [sp, #768]                  // 8-byte Folded Spill
	bl	malloc
	lsl	x8, x24, #2
	negs	x9, x21
	add	x10, x19, x19, lsl #1
	mov	w12, #1                         // =0x1
	str	x8, [sp, #1024]                 // 8-byte Folded Spill
	lsl	x8, x28, #1
	and	x9, x9, #0x3
	str	x27, [sp, #704]                 // 8-byte Folded Spill
	str	x8, [sp, #920]                  // 8-byte Folded Spill
	add	x8, x0, #63
	lsl	x27, x27, #2
	lsl	x5, x21, #2
	and	x22, x8, #0xffffffffffffffc0
	and	x8, x21, #0x3
	bfi	x12, x24, #2, #62
	mul	x17, x19, x12
	csneg	x6, x8, x9, mi
	lsl	x8, x10, #2
	mul	x18, x28, x19
	add	x12, x5, x27
	lsl	x15, x6, #2
	str	x8, [sp, #1032]                 // 8-byte Folded Spill
	mul	x16, x24, x19
	lsl	x2, x16, #4
	sub	x8, x5, x15
	lsl	x3, x17, #2
	stp	x5, x8, [sp, #96]               // 16-byte Folded Spill
	lsl	x4, x20, #2
	sub	x8, x12, x15
	sub	x12, x22, x6, lsl #6
	mov	x13, x20
	str	x8, [sp, #904]                  // 8-byte Folded Spill
	add	x10, x4, x20
	lsl	x11, x20, #5
	lsl	x20, x19, #2
	add	x8, x12, x23
	lsl	x9, x13, #4
	sub	x28, x11, x4
	str	x0, [sp, #16]                   // 8-byte Folded Spill
	str	x8, [sp, #552]                  // 8-byte Folded Spill
	add	x8, x27, x18, lsl #3
	lsl	x10, x10, #2
	str	x13, [sp, #728]                 // 8-byte Folded Spill
	str	xzr, [sp, #184]                 // 8-byte Folded Spill
	str	xzr, [sp, #776]                 // 8-byte Folded Spill
	add	x12, x8, x5
	str	x8, [sp, #888]                  // 8-byte Folded Spill
	sub	x8, x12, x15
	ldr	x12, [sp, #104]                 // 8-byte Folded Reload
	str	x26, [sp, #680]                 // 8-byte Folded Spill
	str	x4, [sp, #824]                  // 8-byte Folded Spill
	str	x8, [sp, #896]                  // 8-byte Folded Spill
	add	x8, x3, x27
	add	x14, x8, x5
	str	x8, [sp, #992]                  // 8-byte Folded Spill
	sub	x8, x14, x15
	sub	x14, x21, x6
	str	x8, [sp, #880]                  // 8-byte Folded Spill
	add	x8, x2, x27
	add	x5, x8, x5
	str	x8, [sp, #912]                  // 8-byte Folded Spill
	sub	x8, x5, x15
	add	x15, x21, x20
	ldr	x5, [sp, #720]                  // 8-byte Folded Reload
	str	x8, [sp, #872]                  // 8-byte Folded Spill
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	sub	x1, x15, x6
	add	x15, x21, x16, lsl #2
	lsl	x16, x25, #4
	str	x9, [sp, #1016]                 // 8-byte Folded Spill
	sub	x15, x15, x6
	lsl	x15, x15, #2
	lsl	x7, x8, #6
	ldr	x8, [sp, #1008]                 // 8-byte Folded Reload
	str	x15, [sp, #576]                 // 8-byte Folded Spill
	add	x15, x21, x17
	sub	x15, x15, x6
	lsl	x15, x15, #2
	str	x15, [sp, #568]                 // 8-byte Folded Spill
	add	x15, x21, x18, lsl #1
	lsl	x17, x8, #5
	ldr	x8, [sp, #1000]                 // 8-byte Folded Reload
	sub	x15, x15, x6
	lsl	x18, x15, #2
	lsl	x15, x8, #3
	ldr	x8, [sp, #712]                  // 8-byte Folded Reload
	lsl	x8, x8, #2
	add	x23, x11, x8
	str	x8, [sp, #864]                  // 8-byte Folded Spill
	add	x23, x26, x23
	str	x23, [sp, #984]                 // 8-byte Folded Spill
	add	x23, x9, x8
	add	x23, x26, x23
	str	x23, [sp, #976]                 // 8-byte Folded Spill
	add	x23, x4, x8
	add	x23, x26, x23
	str	x23, [sp, #968]                 // 8-byte Folded Spill
	lsl	x23, x13, #3
	add	x24, x23, x8
	add	x24, x26, x24
	str	x24, [sp, #960]                 // 8-byte Folded Spill
	add	x24, x13, x13, lsl #1
	lsl	x25, x24, #3
	lsl	x30, x24, #2
	add	x24, x26, x8
	add	x0, x24, x28
	str	x0, [sp, #952]                  // 8-byte Folded Spill
	add	x0, x24, x25
	str	x0, [sp, #944]                  // 8-byte Folded Spill
	add	x0, x24, x10
	str	x0, [sp, #936]                  // 8-byte Folded Spill
	add	x0, x24, x30
	str	x0, [sp, #928]                  // 8-byte Folded Spill
	add	x0, x12, #4
	ldr	x12, [sp, #904]                 // 8-byte Folded Reload
	str	x0, [sp, #512]                  // 8-byte Folded Spill
	madd	x24, x13, x0, x8
	add	x0, x12, #4
	str	x0, [sp, #672]                  // 8-byte Folded Spill
	mul	x0, x13, x14
	add	x24, x26, x24
	add	x0, x8, x0, lsl #2
	lsl	x8, x19, #4
	str	x8, [sp, #1008]                 // 8-byte Folded Spill
	add	x12, x26, x0
	add	x0, x8, x27
	add	x0, x0, x5
	add	x8, x0, #32
	add	x0, x27, x1, lsl #2
	add	x1, x26, x4
	str	x8, [sp, #816]                  // 8-byte Folded Spill
	add	x0, x0, x5
	add	x8, x0, #4
	str	x8, [sp, #808]                  // 8-byte Folded Spill
	add	x8, x5, x3
	add	x3, x26, x11
	add	x11, x26, x23
	add	x23, x24, x7
	str	x8, [sp, #624]                  // 8-byte Folded Spill
	add	x8, x5, x2
	add	x2, x26, x28
	add	x0, x3, x7
	str	x8, [sp, #616]                  // 8-byte Folded Spill
	ldr	x8, [sp, #888]                  // 8-byte Folded Reload
	str	x0, [sp, #504]                  // 8-byte Folded Spill
	add	x0, x2, x7
	str	x0, [sp, #496]                  // 8-byte Folded Spill
	add	x13, x8, x5
	add	x8, x13, #32
	add	x13, x26, x10
	str	x8, [sp, #640]                  // 8-byte Folded Spill
	add	x8, x18, #4
	add	x18, x26, x25
	str	x8, [sp, #560]                  // 8-byte Folded Spill
	ldr	x8, [sp, #896]                  // 8-byte Folded Reload
	add	x0, x18, x7
	str	x0, [sp, #488]                  // 8-byte Folded Spill
	add	x0, x13, x7
	str	x0, [sp, #480]                  // 8-byte Folded Spill
	add	x0, x26, x9
	add	x9, x0, x7
	add	x8, x5, x8
	str	x9, [sp, #472]                  // 8-byte Folded Spill
	add	x9, x1, x7
	str	x8, [sp, #632]                  // 8-byte Folded Spill
	add	x8, x26, x30
	str	x9, [sp, #464]                  // 8-byte Folded Spill
	add	x9, x11, x7
	str	x9, [sp, #456]                  // 8-byte Folded Spill
	add	x9, x8, x7
	str	x9, [sp, #448]                  // 8-byte Folded Spill
	add	x9, x12, x7
	str	x9, [sp, #440]                  // 8-byte Folded Spill
	ldr	x9, [sp, #880]                  // 8-byte Folded Reload
	add	x9, x5, x9
	str	x9, [sp, #544]                  // 8-byte Folded Spill
	ldr	x9, [sp, #872]                  // 8-byte Folded Reload
	add	x9, x5, x9
	str	x9, [sp, #656]                  // 8-byte Folded Spill
	add	x9, x3, x17
	str	x9, [sp, #432]                  // 8-byte Folded Spill
	add	x9, x2, x17
	str	x9, [sp, #424]                  // 8-byte Folded Spill
	add	x9, x18, x17
	str	x9, [sp, #416]                  // 8-byte Folded Spill
	add	x9, x13, x17
	str	x9, [sp, #408]                  // 8-byte Folded Spill
	add	x9, x0, x17
	str	x9, [sp, #400]                  // 8-byte Folded Spill
	add	x9, x1, x17
	str	x9, [sp, #392]                  // 8-byte Folded Spill
	add	x9, x11, x17
	str	x9, [sp, #384]                  // 8-byte Folded Spill
	add	x9, x8, x17
	str	x9, [sp, #376]                  // 8-byte Folded Spill
	add	x9, x24, x17
	str	x9, [sp, #368]                  // 8-byte Folded Spill
	add	x9, x12, x17
	lsl	x17, x21, #3
	str	x9, [sp, #360]                  // 8-byte Folded Spill
	add	x9, x3, x16
	str	x17, [sp, #72]                  // 8-byte Folded Spill
	str	x9, [sp, #352]                  // 8-byte Folded Spill
	add	x9, x2, x16
	str	x9, [sp, #344]                  // 8-byte Folded Spill
	add	x9, x18, x16
	str	x9, [sp, #336]                  // 8-byte Folded Spill
	add	x9, x13, x16
	str	x9, [sp, #328]                  // 8-byte Folded Spill
	add	x9, x0, x16
	str	x9, [sp, #320]                  // 8-byte Folded Spill
	add	x9, x1, x16
	str	x9, [sp, #312]                  // 8-byte Folded Spill
	add	x9, x11, x16
	add	x11, x11, x15
	str	x9, [sp, #304]                  // 8-byte Folded Spill
	add	x9, x8, x16
	add	x8, x8, x15
	str	x9, [sp, #296]                  // 8-byte Folded Spill
	add	x9, x24, x16
	str	x8, [sp, #216]                  // 8-byte Folded Spill
	add	x8, x24, x15
	str	x9, [sp, #288]                  // 8-byte Folded Spill
	add	x9, x12, x16
	lsl	x16, x21, #4
	str	x8, [sp, #208]                  // 8-byte Folded Spill
	str	x9, [sp, #280]                  // 8-byte Folded Spill
	lsl	x9, x21, #5
	sub	x7, x16, x6, lsl #4
	sub	x10, x9, x6, lsl #5
	sub	x6, x17, x6, lsl #3
	mov	x17, x12
	add	x12, x18, x15
	stp	x16, x9, [sp, #80]              // 16-byte Folded Spill
	lsl	x9, x19, #3
	add	x8, x17, x15
	str	x12, [sp, #256]                 // 8-byte Folded Spill
	add	x12, x13, x15
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	add	x16, x5, x9
	add	x9, x9, x27
	str	x14, [sp, #1032]                // 8-byte Folded Spill
	str	x8, [sp, #200]                  // 8-byte Folded Spill
	ldr	x8, [sp, #992]                  // 8-byte Folded Reload
	str	x12, [sp, #248]                 // 8-byte Folded Spill
	str	x16, [sp, #800]                 // 8-byte Folded Spill
	add	x16, x3, x15
	add	x9, x5, x9
	ldr	x3, [sp, #776]                  // 8-byte Folded Reload
	stp	x6, x10, [sp, #56]              // 16-byte Folded Spill
	str	x16, [sp, #272]                 // 8-byte Folded Spill
	add	x16, x2, x15
	str	x9, [sp, #592]                  // 8-byte Folded Spill
	add	x9, x20, x27
	mov	x2, x23
	sub	x23, x14, #4
	str	x16, [sp, #264]                 // 8-byte Folded Spill
	ldr	x16, [sp, #184]                 // 8-byte Folded Reload
	add	x9, x5, x9
	add	x12, x5, x13
	str	x9, [sp, #584]                  // 8-byte Folded Spill
	mov	x9, x24
	add	x8, x5, x8
	str	x12, [sp, #792]                 // 8-byte Folded Spill
	add	x12, x5, x27
	str	x8, [sp, #536]                  // 8-byte Folded Spill
	ldr	x8, [sp, #912]                  // 8-byte Folded Reload
	add	x13, x12, x13
	str	x13, [sp, #608]                 // 8-byte Folded Spill
	add	x13, x0, x15
	str	x13, [sp, #240]                 // 8-byte Folded Spill
	add	x13, x1, x15
	stp	x11, x13, [sp, #224]            // 16-byte Folded Spill
	add	x8, x5, x8
	str	x8, [sp, #528]                  // 8-byte Folded Spill
	sub	x8, x14, #3
	str	x8, [sp, #912]                  // 8-byte Folded Spill
	sub	x8, x14, #2
	str	x8, [sp, #904]                  // 8-byte Folded Spill
	sub	x8, x14, #1
	str	x8, [sp, #896]                  // 8-byte Folded Spill
	ldr	x8, [sp, #752]                  // 8-byte Folded Reload
	lsl	x11, x8, #2
	ldr	x8, [sp, #760]                  // 8-byte Folded Reload
	lsl	x8, x8, #2
	stp	x8, x11, [sp, #128]             // 16-byte Folded Spill
	add	x8, x5, x20
	add	x11, x10, #32
	str	x8, [sp, #784]                  // 8-byte Folded Spill
	add	x8, x22, #128
	str	x8, [sp, #664]                  // 8-byte Folded Spill
	add	x8, x22, #256
	str	x8, [sp, #1000]                 // 8-byte Folded Spill
	ldr	x8, [sp, #552]                  // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #992]                  // 8-byte Folded Spill
	add	x8, x7, #16
	stp	x8, x11, [sp, #40]              // 16-byte Folded Spill
	add	x8, x6, #8
	stp	x7, x8, [sp, #24]               // 16-byte Folded Spill
	b	.LBB0_4
	.p2align	2
.LBB0_1:                                //   in Loop: Header=BB0_4 Depth=1
	str	s0, [x24, x9, lsl #2]
.LBB0_2:                                //   in Loop: Header=BB0_4 Depth=1
	ldr	x0, [sp, #120]                  // 8-byte Folded Reload
	bl	free
.LBB0_3:                                // %.backedge53
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #800]                  // 8-byte Folded Reload
	ldp	x11, x10, [sp, #128]            // 16-byte Folded Reload
	add	x8, x8, x11
	ldr	x5, [sp, #872]                  // 8-byte Folded Reload
	ldp	x9, x16, [sp, #176]             // 16-byte Folded Reload
	ldp	x3, x17, [sp, #160]             // 16-byte Folded Reload
	ldr	x12, [sp, #880]                 // 8-byte Folded Reload
	ldr	x2, [sp, #192]                  // 8-byte Folded Reload
	add	x5, x5, x11
	add	x16, x16, x10
	add	x9, x9, x10
	add	x17, x17, x10
	add	x12, x12, x11
	add	x2, x2, x10
	str	x8, [sp, #800]                  // 8-byte Folded Spill
	ldr	x8, [sp, #784]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #784]                  // 8-byte Folded Spill
	ldr	x8, [sp, #792]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #792]                  // 8-byte Folded Spill
	ldr	x8, [sp, #816]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #816]                  // 8-byte Folded Spill
	ldr	x8, [sp, #808]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #808]                  // 8-byte Folded Spill
	ldr	x8, [sp, #624]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #624]                  // 8-byte Folded Spill
	ldr	x8, [sp, #616]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #616]                  // 8-byte Folded Spill
	ldr	x8, [sp, #640]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #640]                  // 8-byte Folded Spill
	ldr	x8, [sp, #632]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #632]                  // 8-byte Folded Spill
	ldr	x8, [sp, #504]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #504]                  // 8-byte Folded Spill
	ldr	x8, [sp, #496]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #496]                  // 8-byte Folded Spill
	ldr	x8, [sp, #488]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #488]                  // 8-byte Folded Spill
	ldr	x8, [sp, #480]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #480]                  // 8-byte Folded Spill
	ldr	x8, [sp, #472]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #472]                  // 8-byte Folded Spill
	ldr	x8, [sp, #464]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #464]                  // 8-byte Folded Spill
	ldr	x8, [sp, #456]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #456]                  // 8-byte Folded Spill
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #448]                  // 8-byte Folded Spill
	ldr	x8, [sp, #440]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #440]                  // 8-byte Folded Spill
	ldr	x8, [sp, #544]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #544]                  // 8-byte Folded Spill
	ldr	x8, [sp, #656]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #656]                  // 8-byte Folded Spill
	ldr	x8, [sp, #432]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #432]                  // 8-byte Folded Spill
	ldr	x8, [sp, #424]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #424]                  // 8-byte Folded Spill
	ldr	x8, [sp, #416]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #416]                  // 8-byte Folded Spill
	ldr	x8, [sp, #408]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #408]                  // 8-byte Folded Spill
	ldr	x8, [sp, #400]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #400]                  // 8-byte Folded Spill
	ldr	x8, [sp, #392]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #392]                  // 8-byte Folded Spill
	ldr	x8, [sp, #384]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #384]                  // 8-byte Folded Spill
	ldr	x8, [sp, #376]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #376]                  // 8-byte Folded Spill
	ldr	x8, [sp, #368]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #368]                  // 8-byte Folded Spill
	ldr	x8, [sp, #360]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #360]                  // 8-byte Folded Spill
	ldr	x8, [sp, #352]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #352]                  // 8-byte Folded Spill
	ldr	x8, [sp, #344]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #344]                  // 8-byte Folded Spill
	ldr	x8, [sp, #336]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #336]                  // 8-byte Folded Spill
	ldr	x8, [sp, #328]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #328]                  // 8-byte Folded Spill
	ldr	x8, [sp, #320]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #320]                  // 8-byte Folded Spill
	ldr	x8, [sp, #312]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #312]                  // 8-byte Folded Spill
	ldr	x8, [sp, #304]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #304]                  // 8-byte Folded Spill
	ldr	x8, [sp, #296]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #296]                  // 8-byte Folded Spill
	ldr	x8, [sp, #288]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #288]                  // 8-byte Folded Spill
	ldr	x8, [sp, #280]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #280]                  // 8-byte Folded Spill
	ldr	x8, [sp, #592]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #592]                  // 8-byte Folded Spill
	ldr	x8, [sp, #584]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #584]                  // 8-byte Folded Spill
	ldr	x8, [sp, #272]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #272]                  // 8-byte Folded Spill
	ldr	x8, [sp, #264]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #264]                  // 8-byte Folded Spill
	ldr	x8, [sp, #256]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #256]                  // 8-byte Folded Spill
	ldr	x8, [sp, #248]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #248]                  // 8-byte Folded Spill
	ldr	x8, [sp, #608]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #608]                  // 8-byte Folded Spill
	ldr	x8, [sp, #240]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #240]                  // 8-byte Folded Spill
	ldr	x8, [sp, #232]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #232]                  // 8-byte Folded Spill
	ldr	x8, [sp, #224]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #224]                  // 8-byte Folded Spill
	ldr	x8, [sp, #216]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #216]                  // 8-byte Folded Spill
	ldr	x8, [sp, #208]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #208]                  // 8-byte Folded Spill
	ldr	x8, [sp, #200]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #200]                  // 8-byte Folded Spill
	ldr	x8, [sp, #536]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #536]                  // 8-byte Folded Spill
	ldr	x8, [sp, #528]                  // 8-byte Folded Reload
	add	x8, x8, x11
	str	x8, [sp, #528]                  // 8-byte Folded Spill
.LBB0_4:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_8 Depth 2
                                        //       Child Loop BB0_10 Depth 3
                                        //       Child Loop BB0_12 Depth 3
                                        //       Child Loop BB0_15 Depth 3
                                        //         Child Loop BB0_17 Depth 4
                                        //         Child Loop BB0_19 Depth 4
                                        //       Child Loop BB0_22 Depth 3
                                        //       Child Loop BB0_24 Depth 3
                                        //       Child Loop BB0_28 Depth 3
                                        //       Child Loop BB0_30 Depth 3
                                        //     Child Loop BB0_36 Depth 2
                                        //     Child Loop BB0_39 Depth 2
                                        //     Child Loop BB0_42 Depth 2
                                        //       Child Loop BB0_44 Depth 3
                                        //       Child Loop BB0_46 Depth 3
                                        //     Child Loop BB0_49 Depth 2
                                        //     Child Loop BB0_51 Depth 2
                                        //     Child Loop BB0_55 Depth 2
                                        //     Child Loop BB0_57 Depth 2
                                        //     Child Loop BB0_61 Depth 2
                                        //     Child Loop BB0_64 Depth 2
                                        //     Child Loop BB0_67 Depth 2
                                        //       Child Loop BB0_69 Depth 3
                                        //       Child Loop BB0_71 Depth 3
                                        //     Child Loop BB0_74 Depth 2
                                        //     Child Loop BB0_76 Depth 2
                                        //     Child Loop BB0_80 Depth 2
                                        //     Child Loop BB0_82 Depth 2
                                        //     Child Loop BB0_86 Depth 2
                                        //     Child Loop BB0_89 Depth 2
                                        //     Child Loop BB0_92 Depth 2
                                        //       Child Loop BB0_94 Depth 3
                                        //       Child Loop BB0_96 Depth 3
                                        //     Child Loop BB0_99 Depth 2
                                        //     Child Loop BB0_101 Depth 2
                                        //     Child Loop BB0_105 Depth 2
                                        //     Child Loop BB0_107 Depth 2
                                        //     Child Loop BB0_111 Depth 2
                                        //     Child Loop BB0_114 Depth 2
                                        //     Child Loop BB0_117 Depth 2
                                        //       Child Loop BB0_119 Depth 3
                                        //       Child Loop BB0_121 Depth 3
                                        //     Child Loop BB0_124 Depth 2
                                        //     Child Loop BB0_126 Depth 2
                                        //     Child Loop BB0_130 Depth 2
                                        //     Child Loop BB0_132 Depth 2
	ldr	x8, [sp, #152]                  // 8-byte Folded Reload
	cmp	x3, x8
	b.ge	.LBB0_133
// %bb.5:                               //   in Loop: Header=BB0_4 Depth=1
	stp	x16, x2, [sp, #184]             // 16-byte Folded Spill
	add	x8, x3, #1
	ldr	x2, [sp, #832]                  // 8-byte Folded Reload
	mov	x4, x16
	str	x3, [sp, #776]                  // 8-byte Folded Spill
	ldr	x3, [sp, #768]                  // 8-byte Folded Reload
	str	x12, [sp, #880]                 // 8-byte Folded Spill
	mov	x12, xzr
	stp	x8, x17, [sp, #160]             // 16-byte Folded Spill
	mov	x8, x17
	str	x9, [sp, #176]                  // 8-byte Folded Spill
	str	x5, [sp, #872]                  // 8-byte Folded Spill
	b	.LBB0_8
	.p2align	2
.LBB0_6:                                //   in Loop: Header=BB0_8 Depth=2
	stp	q3, q2, [x11]
	stp	q1, q0, [x11, #32]
.LBB0_7:                                // %.backedge
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x12, [sp, #856]                 // 8-byte Folded Reload
	add	x4, x4, #64
	add	x9, x9, #64
	add	x8, x8, #64
.LBB0_8:                                //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_10 Depth 3
                                        //       Child Loop BB0_12 Depth 3
                                        //       Child Loop BB0_15 Depth 3
                                        //         Child Loop BB0_17 Depth 4
                                        //         Child Loop BB0_19 Depth 4
                                        //       Child Loop BB0_22 Depth 3
                                        //       Child Loop BB0_24 Depth 3
                                        //       Child Loop BB0_28 Depth 3
                                        //       Child Loop BB0_30 Depth 3
	cmp	x12, x2
	b.ge	.LBB0_31
// %bb.9:                               //   in Loop: Header=BB0_8 Depth=2
	add	x10, x12, #16
	ldr	x11, [sp, #688]                 // 8-byte Folded Reload
	ldr	x2, [sp, #776]                  // 8-byte Folded Reload
	mov	x3, x4
	str	x10, [sp, #856]                 // 8-byte Folded Spill
	ldr	x10, [sp, #696]                 // 8-byte Folded Reload
	mov	x17, xzr
	add	x13, x11, x10, lsl #2
	ldr	x10, [sp, #736]                 // 8-byte Folded Reload
	ldr	x11, [sp, #752]                 // 8-byte Folded Reload
	ldr	x1, [sp, #680]                  // 8-byte Folded Reload
	str	x4, [sp, #888]                  // 8-byte Folded Spill
	mov	x4, x5
	ldr	x5, [sp, #784]                  // 8-byte Folded Reload
	ldr	x6, [sp, #800]                  // 8-byte Folded Reload
	mul	x14, x2, x10
	lsl	x10, x29, #1
	mul	x16, x2, x11
	add	x11, x10, x29
	add	x15, x14, x12
	str	x16, [sp, #848]                 // 8-byte Folded Spill
	add	x16, x16, x12
	add	x0, x15, x29
	add	x10, x15, x10
	add	x18, x13, x15, lsl #2
	add	x11, x15, x11
	add	x15, x13, x0, lsl #2
	add	x10, x13, x10, lsl #2
	ldr	x0, [sp, #712]                  // 8-byte Folded Reload
	add	x11, x13, x11, lsl #2
	ldp	q6, q4, [x18, #32]
	ldp	q1, q0, [x18]
	ldr	x18, [sp, #664]                 // 8-byte Folded Reload
	add	x0, x1, x0, lsl #2
	ldp	q19, q17, [x10, #32]
	ldp	q22, q20, [x10]
	ldr	x10, [sp, #760]                 // 8-byte Folded Reload
	ldp	q3, q2, [x15, #32]
	str	x0, [sp, #840]                  // 8-byte Folded Spill
	ldp	q7, q5, [x15]
	ldp	q18, q16, [x11, #32]
	ldp	q23, q21, [x11]
	ldr	x11, [sp, #704]                 // 8-byte Folded Reload
	ldr	x15, [sp, #720]                 // 8-byte Folded Reload
	add	x0, x0, x16, lsl #2
	mul	x16, x2, x10
	add	x15, x15, x11, lsl #2
	ldr	x2, [sp, #792]                  // 8-byte Folded Reload
	ldp	q29, q28, [x0, #32]
	ldp	q30, q31, [x0]
	lsl	x10, x16, #2
	ldr	q26, [x15, x10]
	add	x10, x16, x19
	lsl	x10, x10, #2
	ldr	q25, [x15, x10]
	add	x10, x16, x19, lsl #1
	lsl	x10, x10, #2
	ldr	q24, [x15, x10]
	add	x10, x2, x27
	cmp	xzr, x23
	prfm	pldl1keep, [x10, #16]
	ldr	q27, [x10]
	b.ge	.LBB0_11
	.p2align	2
.LBB0_10:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x1, [sp, #936]                  // 8-byte Folded Reload
	ldr	x24, [sp, #968]                 // 8-byte Folded Reload
	fmla	v1.4s, v30.4s, v26.s[0]
	fmla	v0.4s, v31.4s, v26.s[0]
	ldr	x0, [sp, #984]                  // 8-byte Folded Reload
	fmla	v6.4s, v29.4s, v26.s[0]
	fmla	v4.4s, v28.4s, v26.s[0]
	add	x11, x6, x27
	fmla	v7.4s, v30.4s, v25.s[0]
	fmla	v5.4s, v31.4s, v25.s[0]
	stp	q30, q31, [x18, #-128]
	fmla	v3.4s, v29.4s, v25.s[0]
	fmla	v2.4s, v28.4s, v25.s[0]
	stp	q29, q28, [x18, #-96]
	add	x1, x1, x3
	add	x24, x24, x3
	add	x26, x0, x3
	ldr	x0, [sp, #952]                  // 8-byte Folded Reload
	fmla	v17.4s, v28.4s, v24.s[0]
	fmla	v19.4s, v29.4s, v24.s[0]
	fmla	v22.4s, v30.4s, v24.s[0]
	fmla	v20.4s, v31.4s, v24.s[0]
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v18.4s, v29.4s, v27.s[0]
	prfm	pldl1keep, [x1]
	ldr	x1, [sp, #944]                  // 8-byte Folded Reload
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	ldp	q28, q29, [x24, #32]
	ldp	q30, q31, [x24]
	ldr	x24, [sp, #960]                 // 8-byte Folded Reload
	add	x0, x0, x3
	add	x1, x1, x3
	add	x24, x24, x3
	fmla	v4.4s, v29.4s, v26.s[1]
	fmla	v0.4s, v31.4s, v26.s[1]
	fmla	v6.4s, v28.4s, v26.s[1]
	fmla	v1.4s, v30.4s, v26.s[1]
	fmla	v2.4s, v29.4s, v25.s[1]
	fmla	v3.4s, v28.4s, v25.s[1]
	fmla	v5.4s, v31.4s, v25.s[1]
	stp	q30, q31, [x18, #-64]
	fmla	v7.4s, v30.4s, v25.s[1]
	stp	q28, q29, [x18, #-32]
	fmla	v20.4s, v31.4s, v24.s[1]
	fmla	v22.4s, v30.4s, v24.s[1]
	fmla	v19.4s, v28.4s, v24.s[1]
	fmla	v23.4s, v30.4s, v27.s[1]
	prfm	pldl1keep, [x1]
	ldr	x1, [sp, #928]                  // 8-byte Folded Reload
	fmla	v21.4s, v31.4s, v27.s[1]
	ldp	q31, q30, [x24, #32]
	fmla	v17.4s, v29.4s, v24.s[1]
	fmla	v18.4s, v28.4s, v27.s[1]
	fmla	v16.4s, v29.4s, v27.s[1]
	ldp	q29, q28, [x24]
	add	x1, x1, x3
	fmla	v4.4s, v30.4s, v26.s[2]
	fmla	v2.4s, v30.4s, v25.s[2]
	add	x10, x5, x27
	fmla	v17.4s, v30.4s, v24.s[2]
	stp	q29, q28, [x18]
	fmla	v16.4s, v30.4s, v27.s[2]
	stp	q31, q30, [x18, #32]
	prfm	pldl1keep, [x0]
	ldr	x0, [sp, #976]                  // 8-byte Folded Reload
	ldp	q30, q9, [x1]
	ldp	q10, q8, [x1, #32]
	fmla	v6.4s, v31.4s, v26.s[2]
	fmla	v3.4s, v31.4s, v25.s[2]
	fmla	v19.4s, v31.4s, v24.s[2]
	fmla	v1.4s, v29.4s, v26.s[2]
	fmla	v0.4s, v28.4s, v26.s[2]
	fmla	v7.4s, v29.4s, v25.s[2]
	fmla	v5.4s, v28.4s, v25.s[2]
	fmla	v22.4s, v29.4s, v24.s[2]
	fmla	v20.4s, v28.4s, v24.s[2]
	fmla	v23.4s, v29.4s, v27.s[2]
	add	x28, x4, x27
	add	x7, x11, #32
	add	x30, x10, #32
	add	x25, x28, #32
	add	x0, x0, x3
	fmla	v18.4s, v31.4s, v27.s[2]
	fmla	v21.4s, v28.4s, v27.s[2]
	stp	q30, q9, [x18, #64]
	fmla	v4.4s, v8.4s, v26.s[3]
	stp	q10, q8, [x18, #96]
	prfm	pldl1keep, [x26]
	fmla	v6.4s, v10.4s, v26.s[3]
	fmla	v0.4s, v9.4s, v26.s[3]
	fmla	v1.4s, v30.4s, v26.s[3]
	fmla	v2.4s, v8.4s, v25.s[3]
	fmla	v3.4s, v10.4s, v25.s[3]
	fmla	v5.4s, v9.4s, v25.s[3]
	fmla	v7.4s, v30.4s, v25.s[3]
	ldp	q29, q28, [x0, #32]
	fmla	v20.4s, v9.4s, v24.s[3]
	fmla	v22.4s, v30.4s, v24.s[3]
	add	x17, x17, #4
	add	x6, x6, #16
	fmla	v19.4s, v10.4s, v24.s[3]
	fmla	v17.4s, v8.4s, v24.s[3]
	add	x5, x5, #16
	add	x4, x4, #16
	fmla	v23.4s, v30.4s, v27.s[3]
	ldp	q30, q31, [x0]
	prfm	pldl1keep, [x25]
	ldr	q26, [x28, #16]
	prfm	pldl1keep, [x30]
	ldr	q25, [x10, #16]
	prfm	pldl1keep, [x7]
	ldr	q24, [x11, #16]
	ldr	x10, [sp, #1016]                // 8-byte Folded Reload
	fmla	v21.4s, v9.4s, v27.s[3]
	fmla	v18.4s, v10.4s, v27.s[3]
	fmla	v16.4s, v8.4s, v27.s[3]
	add	x3, x3, x10
	add	x2, x2, #16
	add	x18, x18, #256
	add	x10, x2, x27
	cmp	x17, x23
	prfm	pldl1keep, [x10, #16]
	ldr	q27, [x10]
	b.lt	.LBB0_10
.LBB0_11:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x0, [sp, #728]                  // 8-byte Folded Reload
	ldr	x17, [sp, #912]                 // 8-byte Folded Reload
	add	x11, x22, x23, lsl #6
	fmla	v1.4s, v30.4s, v26.s[0]
	ldr	x3, [sp, #848]                  // 8-byte Folded Reload
	ldr	x4, [sp, #840]                  // 8-byte Folded Reload
	fmla	v0.4s, v31.4s, v26.s[0]
	fmla	v6.4s, v29.4s, v26.s[0]
	ldr	x1, [sp, #904]                  // 8-byte Folded Reload
	stp	q30, q31, [x11]
	fmla	v4.4s, v28.4s, v26.s[0]
	stp	q29, q28, [x11, #32]
	fmla	v2.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v30.4s, v25.s[0]
	madd	x10, x17, x0, x3
	madd	x18, x1, x0, x3
	fmla	v5.4s, v31.4s, v25.s[0]
	fmla	v3.4s, v29.4s, v25.s[0]
	fmla	v17.4s, v28.4s, v24.s[0]
	fmla	v19.4s, v29.4s, v24.s[0]
	fmla	v20.4s, v31.4s, v24.s[0]
	fmla	v22.4s, v30.4s, v24.s[0]
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v18.4s, v29.4s, v27.s[0]
	ldr	x11, [sp, #896]                 // 8-byte Folded Reload
	add	x17, x22, x17, lsl #6
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	ldr	x5, [sp, #824]                  // 8-byte Folded Reload
	ldr	x6, [sp, #872]                  // 8-byte Folded Reload
	add	x10, x10, x12
	mov	x2, xzr
	add	x10, x4, x10, lsl #2
	ldp	q28, q29, [x10]
	ldp	q30, q31, [x10, #32]
	add	x10, x18, x12
	add	x18, x22, x1, lsl #6
	add	x10, x4, x10, lsl #2
	fmla	v4.4s, v31.4s, v26.s[1]
	fmla	v0.4s, v29.4s, v26.s[1]
	fmla	v5.4s, v29.4s, v25.s[1]
	fmla	v2.4s, v31.4s, v25.s[1]
	fmla	v20.4s, v29.4s, v24.s[1]
	fmla	v17.4s, v31.4s, v24.s[1]
	fmla	v21.4s, v29.4s, v27.s[1]
	fmla	v16.4s, v31.4s, v27.s[1]
	fmla	v6.4s, v30.4s, v26.s[1]
	stp	q28, q29, [x17]
	stp	q30, q31, [x17, #32]
	fmla	v1.4s, v28.4s, v26.s[1]
	fmla	v3.4s, v30.4s, v25.s[1]
	fmla	v7.4s, v28.4s, v25.s[1]
	fmla	v22.4s, v28.4s, v24.s[1]
	fmla	v19.4s, v30.4s, v24.s[1]
	fmla	v23.4s, v28.4s, v27.s[1]
	fmla	v18.4s, v30.4s, v27.s[1]
	ldp	q29, q28, [x10, #32]
	ldp	q31, q30, [x10]
	madd	x10, x11, x0, x3
	add	x0, x22, x11, lsl #6
	ldr	x11, [sp, #1032]                // 8-byte Folded Reload
	add	x10, x10, x12
	fmla	v0.4s, v30.4s, v26.s[2]
	fmla	v4.4s, v28.4s, v26.s[2]
	fmla	v2.4s, v28.4s, v25.s[2]
	fmla	v5.4s, v30.4s, v25.s[2]
	fmla	v17.4s, v28.4s, v24.s[2]
	fmla	v20.4s, v30.4s, v24.s[2]
	fmla	v16.4s, v28.4s, v27.s[2]
	fmla	v21.4s, v30.4s, v27.s[2]
	add	x10, x4, x10, lsl #2
	stp	q31, q30, [x18]
	fmla	v1.4s, v31.4s, v26.s[2]
	stp	q29, q28, [x18, #32]
	fmla	v6.4s, v29.4s, v26.s[2]
	fmla	v7.4s, v31.4s, v25.s[2]
	fmla	v3.4s, v29.4s, v25.s[2]
	fmla	v19.4s, v29.4s, v24.s[2]
	fmla	v22.4s, v31.4s, v24.s[2]
	fmla	v18.4s, v29.4s, v27.s[2]
	fmla	v23.4s, v31.4s, v27.s[2]
	ldp	q28, q29, [x10]
	fmla	v0.4s, v29.4s, v26.s[3]
	ldp	q30, q31, [x10, #32]
	fmla	v4.4s, v31.4s, v26.s[3]
	fmla	v5.4s, v29.4s, v25.s[3]
	fmla	v2.4s, v31.4s, v25.s[3]
	fmla	v20.4s, v29.4s, v24.s[3]
	fmla	v17.4s, v31.4s, v24.s[3]
	fmla	v21.4s, v29.4s, v27.s[3]
	ldr	x10, [sp, #672]                 // 8-byte Folded Reload
	fmla	v16.4s, v31.4s, v27.s[3]
	fmla	v6.4s, v30.4s, v26.s[3]
	fmla	v1.4s, v28.4s, v26.s[3]
	fmla	v3.4s, v30.4s, v25.s[3]
	fmla	v7.4s, v28.4s, v25.s[3]
	stp	q28, q29, [x0]
	stp	q30, q31, [x0, #32]
	fmla	v22.4s, v28.4s, v24.s[3]
	fmla	v19.4s, v30.4s, v24.s[3]
	fmla	v23.4s, v28.4s, v27.s[3]
	fmla	v18.4s, v30.4s, v27.s[3]
	cmp	x11, x21
	b.ge	.LBB0_13
	.p2align	2
.LBB0_12:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x1, x6, x10
	add	x10, x10, #4
	add	x3, x1, x20
	prfm	pldl1keep, [x1]
	ldur	s24, [x1, #-4]
	add	x1, x9, x2
	add	x4, x3, x20
	prfm	pldl1keep, [x3]
	ldur	s25, [x3, #-4]
	add	x3, x8, x2
	add	x2, x2, x5
	prfm	pldl1keep, [x4]
	ldur	s26, [x4, #-4]
	add	x4, x4, x20
	prfm	pldl1keep, [x4]
	ldur	s27, [x4, #-4]
	prfm	pldl1keep, [x1]
	ldp	q28, q29, [x3, #32]
	add	x1, x22, x11, lsl #6
	ldp	q30, q31, [x3]
	add	x11, x11, #1
	fmla	v4.4s, v29.4s, v24.s[0]
	fmla	v0.4s, v31.4s, v24.s[0]
	fmla	v5.4s, v31.4s, v25.s[0]
	fmla	v2.4s, v29.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v26.s[0]
	fmla	v6.4s, v28.4s, v24.s[0]
	fmla	v1.4s, v30.4s, v24.s[0]
	fmla	v3.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v30.4s, v25.s[0]
	fmla	v22.4s, v30.4s, v26.s[0]
	fmla	v19.4s, v28.4s, v26.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v18.4s, v28.4s, v27.s[0]
	stp	q30, q31, [x1]
	stp	q28, q29, [x1, #32]
	fmla	v16.4s, v29.4s, v27.s[0]
	cmp	x11, x21
	b.lt	.LBB0_12
.LBB0_13:                               // %.preheader
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x1, [sp, #808]                  // 8-byte Folded Reload
	ldr	x11, [sp, #816]                 // 8-byte Folded Reload
	mov	x10, xzr
	mov	w5, #1                          // =0x1
	mov	w6, #2                          // =0x2
	mov	w4, #3                          // =0x3
	mov	w3, #4                          // =0x4
	b	.LBB0_15
	.p2align	2
.LBB0_14:                               // %.loopexit
                                        //   in Loop: Header=BB0_15 Depth=3
	ldr	x10, [sp, #1008]                // 8-byte Folded Reload
	add	x11, x11, x10
	add	x1, x1, x10
	mov	x10, x3
	mov	x3, x7
.LBB0_15:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_17 Depth 4
                                        //         Child Loop BB0_19 Depth 4
	madd	x10, x10, x29, x14
	add	x10, x10, x12
	madd	x2, x5, x29, x14
	madd	x5, x6, x29, x14
	add	x2, x2, x12
	add	x5, x5, x12
	add	x10, x13, x10, lsl #2
	stp	q1, q0, [x10]
	stp	q6, q4, [x10, #32]
	add	x10, x13, x2, lsl #2
	add	x2, x13, x5, lsl #2
	stp	q7, q5, [x10]
	stp	q3, q2, [x10, #32]
	madd	x10, x4, x29, x14
	add	x10, x10, x12
	stp	q22, q20, [x2]
	stp	q19, q17, [x2, #32]
	ldr	x2, [sp, #1024]                 // 8-byte Folded Reload
	cmp	x3, x2
	add	x10, x13, x10, lsl #2
	stp	q23, q21, [x10]
	stp	q18, q16, [x10, #32]
	b.ge	.LBB0_20
// %bb.16:                              //   in Loop: Header=BB0_15 Depth=3
	madd	x10, x3, x29, x14
	add	x4, x3, #3
	add	x5, x3, #1
	add	x6, x3, #2
	madd	x2, x5, x29, x14
	ldp	q28, q29, [x22, #32]
	mov	x30, xzr
	madd	x24, x6, x29, x14
	ldp	q30, q31, [x22]
	add	x7, x3, #4
	add	x10, x10, x12
	add	x10, x13, x10, lsl #2
	add	x2, x2, x12
	add	x2, x13, x2, lsl #2
	ldp	q6, q4, [x10, #32]
	ldp	q1, q0, [x10]
	madd	x10, x4, x29, x14
	ldp	q3, q2, [x2, #32]
	add	x10, x10, x12
	ldp	q7, q5, [x2]
	add	x2, x24, x12
	add	x2, x13, x2, lsl #2
	ldp	q19, q17, [x2, #32]
	ldp	q22, q20, [x2]
	mov	x2, x11
	add	x10, x13, x10, lsl #2
	ldp	q18, q16, [x10, #32]
	ldp	q23, q21, [x10]
	madd	x10, x3, x19, x16
	lsl	x10, x10, #2
	ldr	q27, [x15, x10]
	madd	x10, x5, x19, x16
	lsl	x10, x10, #2
	ldr	q26, [x15, x10]
	madd	x10, x6, x19, x16
	lsl	x10, x10, #2
	ldr	q25, [x15, x10]
	madd	x10, x4, x19, x16
	lsl	x10, x10, #2
	ldr	q24, [x15, x10]
	ldr	x10, [sp, #1000]                // 8-byte Folded Reload
	fmla	v4.4s, v29.4s, v27.s[0]
	cmp	xzr, x23
	b.ge	.LBB0_18
	.p2align	2
.LBB0_17:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        //       Parent Loop BB0_15 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x28, x10, #64
	fmla	v6.4s, v28.4s, v27.s[0]
	fmla	v1.4s, v30.4s, v27.s[0]
	add	x24, x10, #128
	prfm	pldl1keep, [x28]
	ldp	q9, q8, [x10, #-160]
	fmla	v0.4s, v31.4s, v27.s[0]
	ldp	q12, q15, [x10, #-192]
	fmla	v2.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v5.4s, v31.4s, v26.s[0]
	fmla	v7.4s, v30.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x24]
	fmla	v19.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	ldp	q11, q10, [x10, #-128]
	fmla	v22.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	ldp	q13, q14, [x10, #-96]
	fmla	v18.4s, v28.4s, v24.s[0]
	fmla	v21.4s, v31.4s, v24.s[0]
	add	x26, x10, #192
	prfm	pldl1keep, [x26]
	fmla	v23.4s, v30.4s, v24.s[0]
	fmla	v0.4s, v15.4s, v27.s[1]
	add	x25, x10, #256
	add	x30, x30, #4
	fmla	v1.4s, v12.4s, v27.s[1]
	fmla	v6.4s, v9.4s, v27.s[1]
	fmla	v4.4s, v8.4s, v27.s[1]
	fmla	v7.4s, v12.4s, v26.s[1]
	fmla	v5.4s, v15.4s, v26.s[1]
	fmla	v3.4s, v9.4s, v26.s[1]
	fmla	v2.4s, v8.4s, v26.s[1]
	fmla	v22.4s, v12.4s, v25.s[1]
	fmla	v20.4s, v15.4s, v25.s[1]
	fmla	v19.4s, v9.4s, v25.s[1]
	fmla	v17.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v12.4s, v24.s[1]
	fmla	v21.4s, v15.4s, v24.s[1]
	ldp	q15, q12, [x10, #-64]
	fmla	v18.4s, v9.4s, v24.s[1]
	fmla	v16.4s, v8.4s, v24.s[1]
	ldp	q9, q8, [x10, #-32]
	prfm	pldl1keep, [x25]
	ldp	q28, q29, [x10, #32]
	ldp	q30, q31, [x10]
	add	x10, x2, x20
	prfm	pldl1keep, [x2]
	fmla	v4.4s, v14.4s, v27.s[2]
	fmla	v6.4s, v13.4s, v27.s[2]
	fmla	v1.4s, v11.4s, v27.s[2]
	fmla	v0.4s, v10.4s, v27.s[2]
	fmla	v2.4s, v14.4s, v26.s[2]
	fmla	v3.4s, v13.4s, v26.s[2]
	fmla	v5.4s, v10.4s, v26.s[2]
	fmla	v7.4s, v11.4s, v26.s[2]
	fmla	v17.4s, v14.4s, v25.s[2]
	fmla	v19.4s, v13.4s, v25.s[2]
	fmla	v20.4s, v10.4s, v25.s[2]
	fmla	v22.4s, v11.4s, v25.s[2]
	fmla	v16.4s, v14.4s, v24.s[2]
	fmla	v18.4s, v13.4s, v24.s[2]
	fmla	v21.4s, v10.4s, v24.s[2]
	fmla	v23.4s, v11.4s, v24.s[2]
	fmla	v0.4s, v12.4s, v27.s[3]
	fmla	v1.4s, v15.4s, v27.s[3]
	fmla	v6.4s, v9.4s, v27.s[3]
	fmla	v4.4s, v8.4s, v27.s[3]
	ldur	q27, [x2, #-16]
	prfm	pldl1keep, [x10]
	add	x2, x2, #16
	fmla	v7.4s, v15.4s, v26.s[3]
	fmla	v5.4s, v12.4s, v26.s[3]
	fmla	v3.4s, v9.4s, v26.s[3]
	fmla	v2.4s, v8.4s, v26.s[3]
	ldur	q26, [x10, #-16]
	add	x10, x10, x20
	add	x24, x10, x20
	prfm	pldl1keep, [x10]
	fmla	v22.4s, v15.4s, v25.s[3]
	fmla	v20.4s, v12.4s, v25.s[3]
	fmla	v19.4s, v9.4s, v25.s[3]
	fmla	v17.4s, v8.4s, v25.s[3]
	ldur	q25, [x10, #-16]
	prfm	pldl1keep, [x24]
	mov	x10, x25
	fmla	v23.4s, v15.4s, v24.s[3]
	fmla	v21.4s, v12.4s, v24.s[3]
	fmla	v18.4s, v9.4s, v24.s[3]
	fmla	v16.4s, v8.4s, v24.s[3]
	ldur	q24, [x24, #-16]
	fmla	v4.4s, v29.4s, v27.s[0]
	cmp	x30, x23
	b.lt	.LBB0_17
.LBB0_18:                               //   in Loop: Header=BB0_15 Depth=3
	ldp	q10, q8, [x17, #32]
	ldp	q12, q11, [x17]
	fmla	v6.4s, v28.4s, v27.s[0]
	fmla	v0.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v30.4s, v27.s[0]
	fmla	v2.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v5.4s, v31.4s, v26.s[0]
	ldp	q9, q13, [x18, #32]
	fmla	v7.4s, v30.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v25.s[0]
	ldr	x2, [sp, #992]                  // 8-byte Folded Reload
	ldr	x25, [sp, #1032]                // 8-byte Folded Reload
	fmla	v19.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	mov	x10, x1
	fmla	v22.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	fmla	v18.4s, v28.4s, v24.s[0]
	fmla	v21.4s, v31.4s, v24.s[0]
	fmla	v23.4s, v30.4s, v24.s[0]
	ldp	q29, q30, [x18]
	ldp	q31, q28, [x0, #32]
	fmla	v1.4s, v12.4s, v27.s[1]
	fmla	v0.4s, v11.4s, v27.s[1]
	fmla	v6.4s, v10.4s, v27.s[1]
	fmla	v4.4s, v8.4s, v27.s[1]
	fmla	v7.4s, v12.4s, v26.s[1]
	fmla	v5.4s, v11.4s, v26.s[1]
	fmla	v3.4s, v10.4s, v26.s[1]
	fmla	v2.4s, v8.4s, v26.s[1]
	fmla	v22.4s, v12.4s, v25.s[1]
	fmla	v20.4s, v11.4s, v25.s[1]
	fmla	v19.4s, v10.4s, v25.s[1]
	fmla	v17.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v12.4s, v24.s[1]
	fmla	v21.4s, v11.4s, v24.s[1]
	fmla	v18.4s, v10.4s, v24.s[1]
	fmla	v16.4s, v8.4s, v24.s[1]
	ldp	q10, q8, [x0]
	fmla	v4.4s, v13.4s, v27.s[2]
	fmla	v6.4s, v9.4s, v27.s[2]
	fmla	v0.4s, v30.4s, v27.s[2]
	fmla	v1.4s, v29.4s, v27.s[2]
	fmla	v2.4s, v13.4s, v26.s[2]
	fmla	v3.4s, v9.4s, v26.s[2]
	fmla	v5.4s, v30.4s, v26.s[2]
	fmla	v7.4s, v29.4s, v26.s[2]
	fmla	v17.4s, v13.4s, v25.s[2]
	fmla	v19.4s, v9.4s, v25.s[2]
	fmla	v20.4s, v30.4s, v25.s[2]
	fmla	v22.4s, v29.4s, v25.s[2]
	fmla	v16.4s, v13.4s, v24.s[2]
	fmla	v18.4s, v9.4s, v24.s[2]
	fmla	v21.4s, v30.4s, v24.s[2]
	fmla	v23.4s, v29.4s, v24.s[2]
	fmla	v1.4s, v10.4s, v27.s[3]
	fmla	v0.4s, v8.4s, v27.s[3]
	fmla	v6.4s, v31.4s, v27.s[3]
	fmla	v4.4s, v28.4s, v27.s[3]
	fmla	v7.4s, v10.4s, v26.s[3]
	fmla	v5.4s, v8.4s, v26.s[3]
	fmla	v3.4s, v31.4s, v26.s[3]
	fmla	v2.4s, v28.4s, v26.s[3]
	fmla	v22.4s, v10.4s, v25.s[3]
	fmla	v20.4s, v8.4s, v25.s[3]
	fmla	v19.4s, v31.4s, v25.s[3]
	fmla	v17.4s, v28.4s, v25.s[3]
	fmla	v23.4s, v10.4s, v24.s[3]
	fmla	v21.4s, v8.4s, v24.s[3]
	fmla	v18.4s, v31.4s, v24.s[3]
	fmla	v16.4s, v28.4s, v24.s[3]
	cmp	x25, x21
	b.ge	.LBB0_14
	.p2align	2
.LBB0_19:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        //       Parent Loop BB0_15 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x24, x10, x20
	prfm	pldl1keep, [x10]
	ldur	s24, [x10, #-4]
	add	x25, x25, #1
	prfm	pldl1keep, [x24]
	ldur	s25, [x24, #-4]
	add	x24, x24, x20
	add	x10, x10, #4
	prfm	pldl1keep, [x24]
	ldur	s26, [x24, #-4]
	add	x24, x24, x20
	prfm	pldl1keep, [x24]
	ldur	s27, [x24, #-4]
	prfm	pldl1keep, [x2]
	ldp	q28, q29, [x2, #-32]
	fmla	v4.4s, v29.4s, v24.s[0]
	ldp	q30, q31, [x2, #-64]
	fmla	v0.4s, v31.4s, v24.s[0]
	fmla	v5.4s, v31.4s, v25.s[0]
	fmla	v2.4s, v29.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v26.s[0]
	add	x2, x2, #64
	fmla	v6.4s, v28.4s, v24.s[0]
	fmla	v1.4s, v30.4s, v24.s[0]
	fmla	v3.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v30.4s, v25.s[0]
	fmla	v22.4s, v30.4s, v26.s[0]
	fmla	v19.4s, v28.4s, v26.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v18.4s, v28.4s, v27.s[0]
	fmla	v16.4s, v29.4s, v27.s[0]
	cmp	x25, x21
	b.lt	.LBB0_19
	b	.LBB0_14
	.p2align	2
.LBB0_20:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x10, [sp, #1024]                // 8-byte Folded Reload
	ldr	x11, [sp, #920]                 // 8-byte Folded Reload
	cmp	x10, x11
	b.ge	.LBB0_26
// %bb.21:                              //   in Loop: Header=BB0_8 Depth=2
	ldr	x3, [sp, #1024]                 // 8-byte Folded Reload
	ldp	q18, q19, [x22, #32]
	mov	x10, xzr
	ldp	q20, q21, [x22]
	ldr	x4, [sp, #1000]                 // 8-byte Folded Reload
	madd	x11, x3, x29, x14
	add	x11, x11, x12
	add	x1, x13, x11, lsl #2
	add	x11, x3, #1
	madd	x3, x3, x19, x16
	madd	x2, x11, x29, x14
	madd	x11, x11, x19, x16
	ldp	q1, q0, [x1, #32]
	ldp	q4, q2, [x1]
	lsl	x3, x3, #2
	add	x2, x2, x12
	lsl	x11, x11, #2
	ldr	q17, [x15, x3]
	ldr	x3, [sp, #624]                  // 8-byte Folded Reload
	add	x2, x13, x2, lsl #2
	ldr	q16, [x15, x11]
	ldr	x11, [sp, #616]                 // 8-byte Folded Reload
	ldp	q5, q3, [x2, #32]
	ldp	q7, q6, [x2]
	cmp	xzr, x23
	b.ge	.LBB0_23
	.p2align	2
.LBB0_22:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x30, x4, #64
	fmla	v0.4s, v19.4s, v17.s[0]
	fmla	v1.4s, v18.4s, v17.s[0]
	add	x28, x4, #128
	prfm	pldl1keep, [x30]
	ldp	q23, q22, [x4, #-160]
	fmla	v4.4s, v20.4s, v17.s[0]
	ldp	q24, q25, [x4, #-192]
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v3.4s, v19.4s, v16.s[0]
	fmla	v5.4s, v18.4s, v16.s[0]
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	prfm	pldl1keep, [x28]
	ldp	q19, q18, [x4, #-128]
	ldp	q20, q21, [x4, #-96]
	fmla	v2.4s, v25.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	fmla	v6.4s, v25.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v16.s[1]
	fmla	v4.4s, v24.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	add	x24, x4, #192
	prfm	pldl1keep, [x24]
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v5.4s, v23.4s, v16.s[1]
	ldp	q23, q22, [x4, #-32]
	ldp	q24, q25, [x4, #-64]
	add	x6, x3, x27
	add	x25, x11, x27
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v18.4s, v17.s[2]
	fmla	v3.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v18.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v4.4s, v19.4s, v17.s[2]
	add	x5, x4, #256
	add	x7, x6, #32
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	add	x26, x25, #32
	prfm	pldl1keep, [x26]
	add	x10, x10, #4
	add	x3, x3, #16
	add	x11, x11, #16
	fmla	v2.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v25.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v16.s[3]
	fmla	v4.4s, v24.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	ldr	q17, [x25, #16]
	prfm	pldl1keep, [x7]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	ldr	q16, [x6, #16]
	prfm	pldl1keep, [x5]
	ldp	q18, q19, [x4, #32]
	ldp	q20, q21, [x4]
	mov	x4, x5
	cmp	x10, x23
	b.lt	.LBB0_22
.LBB0_23:                               //   in Loop: Header=BB0_8 Depth=2
	ldp	q23, q22, [x17, #32]
	ldp	q25, q24, [x17]
	fmla	v0.4s, v19.4s, v17.s[0]
	fmla	v1.4s, v18.4s, v17.s[0]
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v17.s[0]
	fmla	v3.4s, v19.4s, v16.s[0]
	fmla	v5.4s, v18.4s, v16.s[0]
	ldp	q18, q19, [x18]
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x18, #32]
	fmla	v2.4s, v24.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	ldr	x10, [sp, #880]                 // 8-byte Folded Reload
	ldr	x11, [sp, #992]                 // 8-byte Folded Reload
	fmla	v4.4s, v25.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	ldr	x3, [sp, #1032]                 // 8-byte Folded Reload
	ldr	x6, [sp, #576]                  // 8-byte Folded Reload
	fmla	v7.4s, v25.4s, v16.s[1]
	fmla	v6.4s, v24.4s, v16.s[1]
	ldp	q25, q24, [x0]
	fmla	v5.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v16.s[1]
	ldp	q23, q22, [x0, #32]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v19.4s, v17.s[2]
	ldr	x7, [sp, #568]                  // 8-byte Folded Reload
	fmla	v3.4s, v21.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v4.4s, v18.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v6.4s, v19.4s, v16.s[2]
	fmla	v7.4s, v18.4s, v16.s[2]
	fmla	v2.4s, v24.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v24.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v16.s[3]
	fmla	v4.4s, v25.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v25.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	cmp	x3, x21
	b.ge	.LBB0_25
	.p2align	2
.LBB0_24:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x10, x7
	add	x5, x10, x6
	add	x3, x3, #1
	add	x5, x5, #4
	add	x4, x4, #4
	prfm	pldl1keep, [x5]
	ldr	s16, [x10, x6]
	prfm	pldl1keep, [x4]
	ldr	s17, [x10, x7]
	prfm	pldl1keep, [x11]
	ldp	q18, q19, [x11, #-64]
	ldp	q20, q21, [x11, #-32]
	add	x11, x11, #64
	add	x10, x10, #4
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v1.4s, v20.4s, v16.s[0]
	fmla	v2.4s, v19.4s, v16.s[0]
	fmla	v4.4s, v18.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v17.s[0]
	fmla	v6.4s, v19.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	fmla	v3.4s, v21.4s, v17.s[0]
	cmp	x3, x21
	b.lt	.LBB0_24
.LBB0_25:                               //   in Loop: Header=BB0_8 Depth=2
	stp	q4, q2, [x1]
	stp	q1, q0, [x1, #32]
	stp	q7, q6, [x2]
	stp	q5, q3, [x2, #32]
.LBB0_26:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x10, [sp, #744]                 // 8-byte Folded Reload
	ldr	x11, [sp, #920]                 // 8-byte Folded Reload
	cmp	x11, x10
	ldr	x2, [sp, #832]                  // 8-byte Folded Reload
	ldr	x3, [sp, #768]                  // 8-byte Folded Reload
	ldr	x5, [sp, #872]                  // 8-byte Folded Reload
	ldr	x4, [sp, #888]                  // 8-byte Folded Reload
	b.ge	.LBB0_7
// %bb.27:                              //   in Loop: Header=BB0_8 Depth=2
	ldr	x1, [sp, #920]                  // 8-byte Folded Reload
	ldp	q7, q16, [x22, #32]
	mov	x10, xzr
	ldp	q6, q5, [x22]
	madd	x11, x1, x29, x14
	add	x11, x11, x12
	madd	x12, x1, x19, x16
	add	x11, x13, x11, lsl #2
	ldr	x13, [sp, #1000]                // 8-byte Folded Reload
	lsl	x12, x12, #2
	ldp	q1, q0, [x11, #32]
	ldp	q3, q2, [x11]
	ldr	q4, [x15, x12]
	ldr	x12, [sp, #640]                 // 8-byte Folded Reload
	cmp	xzr, x23
	b.ge	.LBB0_29
	.p2align	2
.LBB0_28:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x1, x13, #64
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	add	x16, x13, #128
	prfm	pldl1keep, [x1]
	ldp	q18, q17, [x13, #-160]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q19, q20, [x13, #-192]
	fmla	v2.4s, v5.4s, v4.s[0]
	prfm	pldl1keep, [x16]
	ldp	q6, q5, [x13, #-128]
	ldp	q7, q16, [x13, #-96]
	add	x15, x13, #192
	prfm	pldl1keep, [x15]
	add	x14, x13, #256
	add	x10, x10, #4
	fmla	v2.4s, v20.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v3.4s, v19.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	ldp	q18, q17, [x13, #-32]
	ldp	q19, q20, [x13, #-64]
	prfm	pldl1keep, [x12]
	fmla	v0.4s, v16.4s, v4.s[2]
	fmla	v2.4s, v5.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v20.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v19.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	ldur	q4, [x12, #-16]
	prfm	pldl1keep, [x14]
	add	x12, x12, #16
	ldp	q7, q16, [x13, #32]
	ldp	q6, q5, [x13]
	mov	x13, x14
	cmp	x10, x23
	b.lt	.LBB0_28
.LBB0_29:                               //   in Loop: Header=BB0_8 Depth=2
	ldp	q18, q17, [x17, #32]
	ldp	q20, q19, [x17]
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v5.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q5, q6, [x18]
	ldp	q7, q16, [x18, #32]
	ldr	x12, [sp, #560]                 // 8-byte Folded Reload
	ldr	x16, [sp, #552]                 // 8-byte Folded Reload
	ldr	x17, [sp, #632]                 // 8-byte Folded Reload
	ldr	x18, [sp, #880]                 // 8-byte Folded Reload
	fmla	v2.4s, v19.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	mov	x10, xzr
	mov	w13, #64                        // =0x40
	fmla	v3.4s, v20.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	ldp	q18, q17, [x0, #32]
	ldp	q20, q19, [x0]
	fmla	v0.4s, v16.4s, v4.s[2]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v5.4s, v4.s[2]
	fmla	v2.4s, v19.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v20.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	ldr	x14, [sp, #1032]                // 8-byte Folded Reload
	add	x14, x14, xzr
	cmp	x14, x21
	b.ge	.LBB0_6
	.p2align	2
.LBB0_30:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x15, x18, x12
	add	x14, x16, x13
	add	x13, x13, #64
	prfm	pldl1keep, [x15]
	add	x15, x16, x10, lsl #6
	ldr	s4, [x17, x10, lsl #2]
	prfm	pldl1keep, [x14]
	add	x10, x10, #1
	add	x12, x12, #4
	ldp	q5, q6, [x15]
	ldp	q7, q16, [x15, #32]
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v2.4s, v6.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v5.4s, v4.s[0]
	ldr	x14, [sp, #1032]                // 8-byte Folded Reload
	add	x14, x14, x10
	cmp	x14, x21
	b.lt	.LBB0_30
	b	.LBB0_6
	.p2align	2
.LBB0_31:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #696]                  // 8-byte Folded Reload
	ldr	x9, [sp, #688]                  // 8-byte Folded Reload
	cmp	x2, x3
	add	x24, x9, x8, lsl #2
	lsl	x8, x29, #1
	ldr	x9, [sp, #680]                  // 8-byte Folded Reload
	str	x8, [sp, #520]                  // 8-byte Folded Spill
	ldr	x8, [sp, #712]                  // 8-byte Folded Reload
	str	x24, [sp, #856]                 // 8-byte Folded Spill
	add	x8, x9, x8, lsl #2
	ldr	x9, [sp, #720]                  // 8-byte Folded Reload
	str	x8, [sp, #840]                  // 8-byte Folded Spill
	ldr	x8, [sp, #704]                  // 8-byte Folded Reload
	add	x8, x9, x8, lsl #2
	str	x8, [sp, #888]                  // 8-byte Folded Spill
	b.lt	.LBB0_35
// %bb.32:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x4, [sp, #600]                  // 8-byte Folded Reload
	cmp	x3, x4
	b.lt	.LBB0_60
.LBB0_33:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #648]                  // 8-byte Folded Reload
	cmp	x4, x8
	b.lt	.LBB0_85
.LBB0_34:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #144]                  // 8-byte Folded Reload
	ldr	x9, [sp, #648]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_3
	b	.LBB0_110
	.p2align	2
.LBB0_35:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #88]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #736]                  // 8-byte Folded Reload
	ldr	x13, [sp, #776]                 // 8-byte Folded Reload
	mov	x11, xzr
	mul	x9, x13, x8
	ldr	x8, [sp, #760]                  // 8-byte Folded Reload
	ldr	x2, [sp, #520]                  // 8-byte Folded Reload
	add	x12, x2, x29
	ldr	x6, [sp, #784]                  // 8-byte Folded Reload
	ldp	x3, x4, [sp, #496]              // 16-byte Folded Reload
	ldr	x7, [sp, #800]                  // 8-byte Folded Reload
	mul	x10, x13, x8
	ldr	x8, [sp, #752]                  // 8-byte Folded Reload
	mul	x13, x13, x8
	add	x8, x0, #63
	add	x17, x10, x19
	lsl	x16, x10, #2
	str	x10, [sp, #848]                 // 8-byte Folded Spill
	and	x25, x8, #0xffffffffffffffc0
	ldr	x8, [sp, #832]                  // 8-byte Folded Reload
	stp	x13, x0, [sp, #112]             // 16-byte Folded Spill
	add	x14, x9, x8
	add	x15, x13, x8
	ldr	x8, [sp, #888]                  // 8-byte Folded Reload
	add	x12, x14, x12
	add	x18, x24, x14, lsl #2
	add	x1, x14, x29
	add	x2, x14, x2
	lsl	x14, x17, #2
	add	x12, x24, x12, lsl #2
	add	x17, x24, x2, lsl #2
	ldp	q1, q0, [x18]
	ldr	x18, [sp, #792]                 // 8-byte Folded Reload
	ldp	q7, q5, [x12]
	add	x12, x10, x19, lsl #1
	lsl	x12, x12, #2
	ldr	q16, [x8, x16]
	ldr	q17, [x8, x14]
	add	x16, x24, x1, lsl #2
	ldp	q6, q3, [x16]
	ldp	q4, q2, [x17]
	ldp	x16, x17, [sp, #464]            // 16-byte Folded Reload
	ldp	x1, x2, [sp, #480]              // 16-byte Folded Reload
	ldr	q18, [x8, x12]
	ldr	x8, [sp, #840]                  // 8-byte Folded Reload
	add	x12, x25, #64
	add	x5, x8, x15, lsl #2
	ldp	x14, x15, [sp, #448]            // 16-byte Folded Reload
	ldp	q21, q20, [x5]
	ldr	x5, [sp, #872]                  // 8-byte Folded Reload
	.p2align	2
.LBB0_36:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x24, x18, x27
	fmla	v1.4s, v21.4s, v16.s[0]
	fmla	v0.4s, v20.4s, v16.s[0]
	cmp	x11, x23
	prfm	pldl1keep, [x24, #16]
	ldr	q19, [x24]
	b.ge	.LBB0_38
// %bb.37:                              //   in Loop: Header=BB0_36 Depth=2
	ldr	x8, [sp, #864]                  // 8-byte Folded Reload
	mov	x10, x25
	fmla	v6.4s, v21.4s, v17.s[0]
	fmla	v3.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v18.s[0]
	fmla	v2.4s, v20.4s, v18.s[0]
	stp	q21, q20, [x12, #-64]
	fmla	v7.4s, v21.4s, v19.s[0]
	fmla	v5.4s, v20.4s, v19.s[0]
	add	x26, x6, x27
	add	x28, x5, x27
	add	x0, x26, #32
	add	x11, x11, #4
	add	x6, x6, #16
	add	x5, x5, #16
	add	x24, x1, x8
	add	x25, x16, x8
	add	x13, x14, x8
	add	x30, x4, x8
	prfm	pldl1keep, [x24]
	ldp	q20, q21, [x25]
	add	x24, x2, x8
	add	x25, x15, x8
	add	x18, x18, #16
	fmla	v0.4s, v21.4s, v16.s[1]
	fmla	v3.4s, v21.4s, v17.s[1]
	fmla	v2.4s, v21.4s, v18.s[1]
	fmla	v5.4s, v21.4s, v19.s[1]
	fmla	v1.4s, v20.4s, v16.s[1]
	fmla	v6.4s, v20.4s, v17.s[1]
	fmla	v4.4s, v20.4s, v18.s[1]
	fmla	v7.4s, v20.4s, v19.s[1]
	stp	q20, q21, [x12, #-32]
	prfm	pldl1keep, [x24]
	ldp	q21, q20, [x25]
	add	x24, x3, x8
	add	x25, x7, x27
	add	x7, x7, #16
	fmla	v0.4s, v20.4s, v16.s[2]
	fmla	v3.4s, v20.4s, v17.s[2]
	fmla	v2.4s, v20.4s, v18.s[2]
	fmla	v5.4s, v20.4s, v19.s[2]
	fmla	v1.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v21.4s, v17.s[2]
	fmla	v4.4s, v21.4s, v18.s[2]
	fmla	v7.4s, v21.4s, v19.s[2]
	stp	q21, q20, [x12]
	prfm	pldl1keep, [x24]
	ldp	q20, q21, [x13]
	add	x13, x17, x8
	add	x24, x25, #32
	add	x8, x28, #32
	fmla	v0.4s, v21.4s, v16.s[3]
	fmla	v3.4s, v21.4s, v17.s[3]
	fmla	v2.4s, v21.4s, v18.s[3]
	fmla	v5.4s, v21.4s, v19.s[3]
	fmla	v1.4s, v20.4s, v16.s[3]
	fmla	v6.4s, v20.4s, v17.s[3]
	fmla	v4.4s, v20.4s, v18.s[3]
	fmla	v7.4s, v20.4s, v19.s[3]
	stp	q20, q21, [x12, #32]
	prfm	pldl1keep, [x30]
	ldp	q21, q20, [x13]
	prfm	pldl1keep, [x8]
	ldr	q16, [x28, #16]
	prfm	pldl1keep, [x0]
	ldr	q17, [x26, #16]
	prfm	pldl1keep, [x24]
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	ldr	q18, [x25, #16]
	mov	x25, x10
	add	x12, x12, #128
	add	x4, x4, x8
	add	x3, x3, x8
	add	x2, x2, x8
	add	x1, x1, x8
	add	x17, x17, x8
	add	x16, x16, x8
	add	x15, x15, x8
	add	x14, x14, x8
	b	.LBB0_36
	.p2align	2
.LBB0_38:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #728]                 // 8-byte Folded Reload
	ldr	x11, [sp, #912]                 // 8-byte Folded Reload
	add	x8, x25, x23, lsl #5
	fmla	v6.4s, v21.4s, v17.s[0]
	ldr	x10, [sp, #112]                 // 8-byte Folded Reload
	ldr	x4, [sp, #832]                  // 8-byte Folded Reload
	fmla	v3.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v18.s[0]
	stp	q21, q20, [x8]
	fmla	v2.4s, v20.4s, v18.s[0]
	fmla	v5.4s, v20.4s, v19.s[0]
	ldr	x16, [sp, #840]                 // 8-byte Folded Reload
	ldr	x12, [sp, #904]                 // 8-byte Folded Reload
	fmla	v7.4s, v21.4s, v19.s[0]
	mov	x14, xzr
	madd	x8, x11, x13, x10
	ldr	x15, [sp, #896]                 // 8-byte Folded Reload
	add	x11, x25, x11, lsl #5
	ldr	x0, [sp, #824]                  // 8-byte Folded Reload
	ldr	x1, [sp, #192]                  // 8-byte Folded Reload
	ldr	x2, [sp, #440]                  // 8-byte Folded Reload
	add	x8, x8, x4
	ldr	x24, [sp, #856]                 // 8-byte Folded Reload
	add	x8, x16, x8, lsl #2
	ldp	q20, q21, [x8]
	madd	x8, x12, x13, x10
	add	x12, x25, x12, lsl #5
	add	x8, x8, x4
	fmla	v0.4s, v21.4s, v16.s[1]
	fmla	v3.4s, v21.4s, v17.s[1]
	fmla	v2.4s, v21.4s, v18.s[1]
	fmla	v5.4s, v21.4s, v19.s[1]
	add	x8, x16, x8, lsl #2
	fmla	v1.4s, v20.4s, v16.s[1]
	stp	q20, q21, [x11]
	fmla	v6.4s, v20.4s, v17.s[1]
	fmla	v4.4s, v20.4s, v18.s[1]
	fmla	v7.4s, v20.4s, v19.s[1]
	ldp	q21, q20, [x8]
	madd	x8, x15, x13, x10
	add	x13, x25, x15, lsl #5
	ldr	x15, [sp, #512]                 // 8-byte Folded Reload
	add	x8, x8, x4
	fmla	v0.4s, v20.4s, v16.s[2]
	fmla	v3.4s, v20.4s, v17.s[2]
	fmla	v2.4s, v20.4s, v18.s[2]
	fmla	v5.4s, v20.4s, v19.s[2]
	add	x8, x16, x8, lsl #2
	stp	q21, q20, [x12]
	fmla	v1.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v21.4s, v17.s[2]
	fmla	v4.4s, v21.4s, v18.s[2]
	fmla	v7.4s, v21.4s, v19.s[2]
	ldr	x16, [sp, #1032]                // 8-byte Folded Reload
	ldp	q20, q21, [x8]
	fmla	v0.4s, v21.4s, v16.s[3]
	fmla	v3.4s, v21.4s, v17.s[3]
	fmla	v2.4s, v21.4s, v18.s[3]
	fmla	v5.4s, v21.4s, v19.s[3]
	fmla	v1.4s, v20.4s, v16.s[3]
	fmla	v6.4s, v20.4s, v17.s[3]
	fmla	v4.4s, v20.4s, v18.s[3]
	fmla	v7.4s, v20.4s, v19.s[3]
	stp	q20, q21, [x13]
	ldr	x17, [sp, #880]                 // 8-byte Folded Reload
	cmp	x16, x21
	b.ge	.LBB0_40
	.p2align	2
.LBB0_39:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x17, x17, x15
	add	x8, x1, x14
	add	x18, x25, x16, lsl #5
	add	x16, x16, #1
	prfm	pldl1keep, [x17]
	ldur	s16, [x17, #-4]
	add	x17, x17, x20
	add	x15, x15, #4
	prfm	pldl1keep, [x17]
	ldur	s17, [x17, #-4]
	add	x17, x17, x20
	prfm	pldl1keep, [x17]
	ldur	s18, [x17, #-4]
	add	x17, x17, x20
	prfm	pldl1keep, [x17]
	ldur	s19, [x17, #-4]
	add	x17, x2, x14
	prfm	pldl1keep, [x8]
	add	x14, x14, x0
	ldp	q20, q21, [x17]
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v3.4s, v21.4s, v17.s[0]
	fmla	v2.4s, v21.4s, v18.s[0]
	fmla	v5.4s, v21.4s, v19.s[0]
	fmla	v1.4s, v20.4s, v16.s[0]
	fmla	v6.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v18.s[0]
	fmla	v7.4s, v20.4s, v19.s[0]
	stp	q20, q21, [x18]
	ldr	x17, [sp, #880]                 // 8-byte Folded Reload
	cmp	x16, x21
	b.lt	.LBB0_39
.LBB0_40:                               // %.preheader52
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #48]                   // 8-byte Folded Reload
	ldr	x16, [sp, #808]                 // 8-byte Folded Reload
	mov	x5, xzr
	add	x14, x25, #128
	ldr	x17, [sp, #816]                 // 8-byte Folded Reload
	mov	w2, #1                          // =0x1
	mov	w3, #2                          // =0x2
	mov	w1, #3                          // =0x3
	mov	w18, #4                         // =0x4
	add	x15, x25, x8
	b	.LBB0_42
	.p2align	2
.LBB0_41:                               // %.loopexit48
                                        //   in Loop: Header=BB0_42 Depth=2
	ldr	x8, [sp, #1008]                 // 8-byte Folded Reload
	mov	x5, x18
	mov	x18, x4
	ldr	x4, [sp, #832]                  // 8-byte Folded Reload
	add	x17, x17, x8
	add	x16, x16, x8
.LBB0_42:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_44 Depth 3
                                        //       Child Loop BB0_46 Depth 3
	madd	x8, x5, x29, x9
	add	x8, x8, x4
	madd	x0, x2, x29, x9
	madd	x2, x3, x29, x9
	add	x0, x0, x4
	add	x8, x24, x8, lsl #2
	add	x0, x24, x0, lsl #2
	stp	q1, q0, [x8]
	madd	x8, x1, x29, x9
	add	x8, x8, x4
	stp	q6, q3, [x0]
	add	x0, x2, x4
	add	x0, x24, x0, lsl #2
	stp	q4, q2, [x0]
	add	x8, x24, x8, lsl #2
	stp	q7, q5, [x8]
	ldr	x8, [sp, #1024]                 // 8-byte Folded Reload
	cmp	x18, x8
	b.ge	.LBB0_47
// %bb.43:                              //   in Loop: Header=BB0_42 Depth=2
	madd	x8, x18, x29, x9
	add	x2, x18, #1
	add	x1, x18, #3
	add	x3, x18, #2
	madd	x0, x2, x29, x9
	mov	x7, x4
	ldr	x10, [sp, #848]                 // 8-byte Folded Reload
	mov	x5, xzr
	madd	x6, x3, x29, x9
	ldp	q20, q21, [x25]
	add	x8, x8, x4
	add	x8, x24, x8, lsl #2
	add	x0, x0, x4
	add	x4, x18, #4
	add	x0, x24, x0, lsl #2
	ldp	q1, q0, [x8]
	madd	x8, x1, x29, x9
	add	x8, x8, x7
	ldp	q6, q3, [x0]
	add	x0, x6, x7
	add	x0, x24, x0, lsl #2
	ldp	q4, q2, [x0]
	ldr	x0, [sp, #888]                  // 8-byte Folded Reload
	mov	x6, x14
	mov	x7, x17
	add	x8, x24, x8, lsl #2
	ldp	q7, q5, [x8]
	madd	x8, x18, x19, x10
	lsl	x8, x8, #2
	ldr	q19, [x0, x8]
	madd	x8, x2, x19, x10
	lsl	x8, x8, #2
	ldr	q18, [x0, x8]
	madd	x8, x3, x19, x10
	lsl	x8, x8, #2
	ldr	q17, [x0, x8]
	madd	x8, x1, x19, x10
	lsl	x8, x8, #2
	ldr	q16, [x0, x8]
	cmp	xzr, x23
	b.ge	.LBB0_45
	.p2align	2
.LBB0_44:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_42 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x8, x6, #32
	fmla	v1.4s, v20.4s, v19.s[0]
	fmla	v0.4s, v21.4s, v19.s[0]
	add	x5, x5, #4
	prfm	pldl1keep, [x8]
	ldp	q22, q23, [x6, #-96]
	fmla	v3.4s, v21.4s, v18.s[0]
	fmla	v6.4s, v20.4s, v18.s[0]
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v17.s[0]
	add	x8, x6, #96
	fmla	v5.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q21, q20, [x6, #-64]
	prfm	pldl1keep, [x8]
	add	x8, x7, x20
	add	x0, x8, x20
	fmla	v0.4s, v23.4s, v19.s[1]
	fmla	v3.4s, v23.4s, v18.s[1]
	fmla	v2.4s, v23.4s, v17.s[1]
	fmla	v5.4s, v23.4s, v16.s[1]
	fmla	v1.4s, v22.4s, v19.s[1]
	fmla	v6.4s, v22.4s, v18.s[1]
	fmla	v4.4s, v22.4s, v17.s[1]
	fmla	v7.4s, v22.4s, v16.s[1]
	fmla	v0.4s, v20.4s, v19.s[2]
	ldp	q22, q23, [x6, #-32]
	fmla	v3.4s, v20.4s, v18.s[2]
	fmla	v2.4s, v20.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v1.4s, v21.4s, v19.s[2]
	fmla	v6.4s, v21.4s, v18.s[2]
	fmla	v4.4s, v21.4s, v17.s[2]
	fmla	v7.4s, v21.4s, v16.s[2]
	ldp	q20, q21, [x6], #128
	prfm	pldl1keep, [x7]
	fmla	v0.4s, v23.4s, v19.s[3]
	fmla	v3.4s, v23.4s, v18.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	fmla	v1.4s, v22.4s, v19.s[3]
	ldur	q19, [x7, #-16]
	prfm	pldl1keep, [x8]
	fmla	v6.4s, v22.4s, v18.s[3]
	ldur	q18, [x8, #-16]
	add	x8, x0, x20
	prfm	pldl1keep, [x0]
	add	x7, x7, #16
	fmla	v4.4s, v22.4s, v17.s[3]
	ldur	q17, [x0, #-16]
	prfm	pldl1keep, [x8]
	fmla	v7.4s, v22.4s, v16.s[3]
	ldur	q16, [x8, #-16]
	cmp	x5, x23
	b.lt	.LBB0_44
.LBB0_45:                               //   in Loop: Header=BB0_42 Depth=2
	ldp	q23, q22, [x11]
	fmla	v0.4s, v21.4s, v19.s[0]
	fmla	v1.4s, v20.4s, v19.s[0]
	fmla	v3.4s, v21.4s, v18.s[0]
	fmla	v6.4s, v20.4s, v18.s[0]
	ldr	x7, [sp, #1032]                 // 8-byte Folded Reload
	mov	x5, x16
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v17.s[0]
	mov	x6, x15
	fmla	v5.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x12]
	fmla	v0.4s, v22.4s, v19.s[1]
	fmla	v3.4s, v22.4s, v18.s[1]
	fmla	v2.4s, v22.4s, v17.s[1]
	fmla	v5.4s, v22.4s, v16.s[1]
	fmla	v1.4s, v23.4s, v19.s[1]
	fmla	v6.4s, v23.4s, v18.s[1]
	fmla	v4.4s, v23.4s, v17.s[1]
	fmla	v7.4s, v23.4s, v16.s[1]
	fmla	v0.4s, v21.4s, v19.s[2]
	ldp	q23, q22, [x13]
	fmla	v3.4s, v21.4s, v18.s[2]
	fmla	v2.4s, v21.4s, v17.s[2]
	fmla	v5.4s, v21.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v19.s[2]
	fmla	v6.4s, v20.4s, v18.s[2]
	fmla	v4.4s, v20.4s, v17.s[2]
	fmla	v7.4s, v20.4s, v16.s[2]
	fmla	v0.4s, v22.4s, v19.s[3]
	fmla	v3.4s, v22.4s, v18.s[3]
	fmla	v2.4s, v22.4s, v17.s[3]
	fmla	v5.4s, v22.4s, v16.s[3]
	fmla	v1.4s, v23.4s, v19.s[3]
	fmla	v6.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v23.4s, v16.s[3]
	cmp	x7, x21
	b.ge	.LBB0_41
	.p2align	2
.LBB0_46:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_42 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x8, x5, x20
	prfm	pldl1keep, [x5]
	ldur	s16, [x5, #-4]
	add	x7, x7, #1
	prfm	pldl1keep, [x8]
	ldur	s17, [x8, #-4]
	add	x8, x8, x20
	add	x5, x5, #4
	prfm	pldl1keep, [x8]
	ldur	s18, [x8, #-4]
	add	x8, x8, x20
	prfm	pldl1keep, [x8]
	ldur	s19, [x8, #-4]
	prfm	pldl1keep, [x6]
	ldp	q20, q21, [x6, #-32]
	add	x6, x6, #32
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v3.4s, v21.4s, v17.s[0]
	fmla	v2.4s, v21.4s, v18.s[0]
	fmla	v1.4s, v20.4s, v16.s[0]
	fmla	v6.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v18.s[0]
	fmla	v7.4s, v20.4s, v19.s[0]
	fmla	v5.4s, v21.4s, v19.s[0]
	cmp	x7, x21
	b.lt	.LBB0_46
	b	.LBB0_41
	.p2align	2
.LBB0_47:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #1024]                 // 8-byte Folded Reload
	ldr	x15, [sp, #920]                 // 8-byte Folded Reload
	cmp	x8, x15
	b.ge	.LBB0_53
// %bb.48:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x18, [sp, #1024]                // 8-byte Folded Reload
	ldr	x10, [sp, #848]                 // 8-byte Folded Reload
	mov	x17, xzr
	madd	x8, x18, x29, x9
	ldr	x0, [sp, #888]                  // 8-byte Folded Reload
	ldp	q6, q7, [x25]
	ldr	x1, [sp, #616]                  // 8-byte Folded Reload
	ldr	x2, [sp, #624]                  // 8-byte Folded Reload
	add	x8, x8, x4
	add	x15, x24, x8, lsl #2
	add	x8, x18, #1
	madd	x18, x18, x19, x10
	madd	x16, x8, x29, x9
	madd	x8, x8, x19, x10
	lsl	x18, x18, #2
	ldp	q1, q0, [x15]
	add	x16, x16, x4
	lsl	x8, x8, #2
	ldr	q5, [x0, x18]
	mov	x18, x14
	add	x16, x24, x16, lsl #2
	ldr	q4, [x0, x8]
	ldp	q3, q2, [x16]
	cmp	xzr, x23
	b.ge	.LBB0_50
	.p2align	2
.LBB0_49:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x6, x18, #32
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v0.4s, v7.4s, v5.s[0]
	add	x5, x18, #96
	prfm	pldl1keep, [x6]
	ldp	q16, q17, [x18, #-96]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q7, q6, [x18, #-64]
	prfm	pldl1keep, [x5]
	add	x8, x2, x27
	add	x3, x1, x27
	add	x0, x8, #32
	add	x4, x3, #32
	add	x17, x17, #4
	add	x2, x2, #16
	add	x1, x1, #16
	fmla	v0.4s, v17.4s, v5.s[1]
	fmla	v2.4s, v17.4s, v4.s[1]
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	fmla	v0.4s, v6.4s, v5.s[2]
	ldp	q16, q17, [x18, #-32]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v5.s[2]
	fmla	v3.4s, v7.4s, v4.s[2]
	ldp	q6, q7, [x18], #128
	prfm	pldl1keep, [x4]
	ldr	x4, [sp, #832]                  // 8-byte Folded Reload
	fmla	v0.4s, v17.4s, v5.s[3]
	fmla	v2.4s, v17.4s, v4.s[3]
	fmla	v1.4s, v16.4s, v5.s[3]
	ldr	q5, [x3, #16]
	prfm	pldl1keep, [x0]
	fmla	v3.4s, v16.4s, v4.s[3]
	ldr	q4, [x8, #16]
	cmp	x17, x23
	b.lt	.LBB0_49
.LBB0_50:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	q17, q16, [x11]
	fmla	v0.4s, v7.4s, v5.s[0]
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q6, q7, [x12]
	ldr	x8, [sp, #64]                   // 8-byte Folded Reload
	ldr	x2, [sp, #1032]                 // 8-byte Folded Reload
	mov	x17, xzr
	mov	x18, xzr
	fmla	v0.4s, v16.4s, v5.s[1]
	fmla	v2.4s, v16.4s, v4.s[1]
	add	x1, x25, x8
	fmla	v1.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	ldp	q17, q16, [x13]
	fmla	v0.4s, v7.4s, v5.s[2]
	fmla	v2.4s, v7.4s, v4.s[2]
	fmla	v1.4s, v6.4s, v5.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v0.4s, v16.4s, v5.s[3]
	fmla	v2.4s, v16.4s, v4.s[3]
	fmla	v1.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	cmp	x2, x21
	b.ge	.LBB0_52
	.p2align	2
.LBB0_51:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x5, [sp, #544]                  // 8-byte Folded Reload
	ldr	x6, [sp, #656]                  // 8-byte Folded Reload
	add	x8, x1, x18, lsl #3
	add	x2, x2, #1
	add	x8, x8, #32
	add	x0, x5, x18
	add	x3, x6, x18
	add	x0, x0, #4
	add	x3, x3, #4
	prfm	pldl1keep, [x3]
	ldr	s4, [x6, x18]
	prfm	pldl1keep, [x0]
	ldr	s5, [x5, x18]
	add	x0, x1, x17
	prfm	pldl1keep, [x8]
	add	x18, x18, #4
	add	x17, x17, #32
	ldp	q6, q7, [x0]
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v1.4s, v6.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	fmla	v3.4s, v6.4s, v5.s[0]
	cmp	x2, x21
	b.lt	.LBB0_51
.LBB0_52:                               //   in Loop: Header=BB0_4 Depth=1
	stp	q1, q0, [x15]
	stp	q3, q2, [x16]
.LBB0_53:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #744]                  // 8-byte Folded Reload
	ldr	x15, [sp, #920]                 // 8-byte Folded Reload
	cmp	x15, x8
	b.ge	.LBB0_59
// %bb.54:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x16, [sp, #920]                 // 8-byte Folded Reload
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	mov	x15, xzr
	madd	x8, x16, x29, x9
	ldp	q4, q3, [x25]
	ldr	x17, [sp, #632]                 // 8-byte Folded Reload
	add	x8, x8, x4
	add	x9, x24, x8, lsl #2
	ldr	x8, [sp, #848]                  // 8-byte Folded Reload
	ldp	q1, q0, [x9]
	madd	x8, x16, x19, x8
	lsl	x8, x8, #2
	ldr	q2, [x10, x8]
	ldr	x10, [sp, #640]                 // 8-byte Folded Reload
	cmp	xzr, x23
	b.ge	.LBB0_56
	.p2align	2
.LBB0_55:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x16, x14, #32
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	add	x8, x14, #96
	prfm	pldl1keep, [x16]
	ldp	q5, q6, [x14, #-96]
	add	x15, x15, #4
	ldp	q4, q3, [x14, #-64]
	prfm	pldl1keep, [x8]
	fmla	v0.4s, v6.4s, v2.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldp	q5, q6, [x14, #-32]
	prfm	pldl1keep, [x10]
	fmla	v0.4s, v3.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v6.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldur	q2, [x10, #-16]
	ldp	q4, q3, [x14], #128
	add	x10, x10, #16
	cmp	x15, x23
	b.lt	.LBB0_55
.LBB0_56:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	q6, q5, [x11]
	fmla	v0.4s, v3.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldp	q3, q4, [x12]
	ldr	x8, [sp, #64]                   // 8-byte Folded Reload
	ldr	x11, [sp, #1032]                // 8-byte Folded Reload
	mov	x10, xzr
	mov	x14, xzr
	fmla	v0.4s, v5.4s, v2.s[1]
	add	x8, x25, x8
	fmla	v1.4s, v6.4s, v2.s[1]
	ldp	q6, q5, [x13]
	fmla	v0.4s, v4.4s, v2.s[2]
	fmla	v1.4s, v3.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v2.s[3]
	fmla	v1.4s, v6.4s, v2.s[3]
	cmp	x11, x21
	b.ge	.LBB0_58
	.p2align	2
.LBB0_57:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x8, x14, lsl #3
	add	x13, x17, x14
	add	x11, x11, #1
	add	x13, x13, #4
	add	x12, x12, #32
	prfm	pldl1keep, [x13]
	ldr	s2, [x17, x14]
	add	x13, x8, x10
	add	x14, x14, #4
	add	x10, x10, #32
	prfm	pldl1keep, [x12]
	ldp	q3, q4, [x13]
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v3.4s, v2.s[0]
	cmp	x11, x21
	b.lt	.LBB0_57
.LBB0_58:                               //   in Loop: Header=BB0_4 Depth=1
	stp	q1, q0, [x9]
.LBB0_59:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x0, [sp, #120]                  // 8-byte Folded Reload
	bl	free
	ldr	x3, [sp, #768]                  // 8-byte Folded Reload
	ldr	x4, [sp, #600]                  // 8-byte Folded Reload
	cmp	x3, x4
	b.ge	.LBB0_33
.LBB0_60:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #736]                  // 8-byte Folded Reload
	ldr	x11, [sp, #776]                 // 8-byte Folded Reload
	mov	x12, xzr
	mul	x9, x11, x8
	ldr	x8, [sp, #752]                  // 8-byte Folded Reload
	ldr	x10, [sp, #768]                 // 8-byte Folded Reload
	ldr	x18, [sp, #520]                 // 8-byte Folded Reload
	add	x13, x18, x29
	ldp	x1, x2, [sp, #408]              // 16-byte Folded Reload
	ldp	x3, x4, [sp, #424]              // 16-byte Folded Reload
	ldr	x5, [sp, #872]                  // 8-byte Folded Reload
	ldr	x6, [sp, #784]                  // 8-byte Folded Reload
	ldr	x7, [sp, #800]                  // 8-byte Folded Reload
	mul	x15, x11, x8
	add	x14, x9, x10
	add	x8, x0, #63
	lsl	x16, x14, #2
	add	x17, x14, x29
	add	x18, x14, x18
	add	x13, x14, x13
	and	x8, x8, #0xffffffffffffffc0
	lsl	x13, x13, #2
	ldr	q0, [x24, x16]
	lsl	x16, x18, #2
	ldr	x18, [sp, #792]                 // 8-byte Folded Reload
	ldr	q3, [x24, x13]
	ldr	q1, [x24, x16]
	stp	x15, x0, [sp, #112]             // 16-byte Folded Spill
	add	x15, x15, x10
	ldr	x10, [sp, #760]                 // 8-byte Folded Reload
	lsl	x14, x15, #2
	lsl	x15, x17, #2
	ldp	x16, x17, [sp, #392]            // 16-byte Folded Reload
	mul	x11, x11, x10
	ldr	x10, [sp, #840]                 // 8-byte Folded Reload
	ldr	q2, [x24, x15]
	lsl	x13, x11, #2
	ldr	q7, [x10, x14]
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	str	x11, [sp, #848]                 // 8-byte Folded Spill
	ldp	x14, x15, [sp, #376]            // 16-byte Folded Reload
	ldr	q4, [x10, x13]
	add	x13, x11, x19
	lsl	x13, x13, #2
	ldr	q5, [x10, x13]
	add	x13, x11, x19, lsl #1
	lsl	x13, x13, #2
	ldr	q6, [x10, x13]
	orr	x13, x8, #0x20
	.p2align	2
.LBB0_61:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x24, x18, x27
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	cmp	x12, x23
	prfm	pldl1keep, [x24, #16]
	ldr	q16, [x24]
	b.ge	.LBB0_63
// %bb.62:                              //   in Loop: Header=BB0_61 Depth=2
	ldr	x10, [sp, #864]                 // 8-byte Folded Reload
	stur	q7, [x13, #-32]
	fmla	v1.4s, v7.4s, v6.s[0]
	fmla	v3.4s, v7.4s, v16.s[0]
	add	x25, x6, x27
	add	x26, x5, x27
	add	x11, x25, #32
	add	x0, x26, #32
	add	x12, x12, #4
	add	x6, x6, #16
	add	x5, x5, #16
	add	x18, x18, #16
	add	x24, x1, x10
	add	x28, x4, x10
	prfm	pldl1keep, [x24]
	add	x24, x2, x10
	ldr	q17, [x16, x10]
	stur	q17, [x13, #-16]
	prfm	pldl1keep, [x24]
	ldr	q18, [x15, x10]
	add	x24, x3, x10
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	fmla	v1.4s, v17.4s, v6.s[1]
	fmla	v3.4s, v17.4s, v16.s[1]
	str	q18, [x13]
	prfm	pldl1keep, [x24]
	ldr	q19, [x14, x10]
	fmla	v0.4s, v18.4s, v4.s[2]
	fmla	v2.4s, v18.4s, v5.s[2]
	fmla	v1.4s, v18.4s, v6.s[2]
	add	x24, x7, x27
	fmla	v3.4s, v18.4s, v16.s[2]
	add	x7, x7, #16
	add	x30, x24, #32
	str	q19, [x13, #16]
	prfm	pldl1keep, [x28]
	ldr	q7, [x17, x10]
	fmla	v0.4s, v19.4s, v4.s[3]
	fmla	v2.4s, v19.4s, v5.s[3]
	fmla	v1.4s, v19.4s, v6.s[3]
	prfm	pldl1keep, [x0]
	ldr	q4, [x26, #16]
	prfm	pldl1keep, [x11]
	ldr	q5, [x25, #16]
	prfm	pldl1keep, [x30]
	ldr	x10, [sp, #1016]                // 8-byte Folded Reload
	ldr	q6, [x24, #16]
	fmla	v3.4s, v19.4s, v16.s[3]
	add	x13, x13, #64
	add	x4, x4, x10
	add	x3, x3, x10
	add	x2, x2, x10
	add	x1, x1, x10
	add	x17, x17, x10
	add	x16, x16, x10
	add	x15, x15, x10
	add	x14, x14, x10
	b	.LBB0_61
	.p2align	2
.LBB0_63:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #728]                 // 8-byte Folded Reload
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v1.4s, v7.4s, v6.s[0]
	fmla	v3.4s, v7.4s, v16.s[0]
	ldr	x15, [sp, #112]                 // 8-byte Folded Reload
	ldr	x5, [sp, #768]                  // 8-byte Folded Reload
	mov	x12, xzr
	madd	x11, x10, x13, x15
	ldr	x14, [sp, #840]                 // 8-byte Folded Reload
	str	q7, [x8, x23, lsl #4]
	ldr	x6, [sp, #576]                  // 8-byte Folded Reload
	ldr	x7, [sp, #568]                  // 8-byte Folded Reload
	ldr	x17, [sp, #880]                 // 8-byte Folded Reload
	ldr	x24, [sp, #856]                 // 8-byte Folded Reload
	add	x11, x11, x5
	lsl	x11, x11, #2
	ldr	q7, [x14, x11]
	fmla	v0.4s, v7.4s, v4.s[1]
	str	q7, [x8, x10, lsl #4]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	fmla	v2.4s, v7.4s, v5.s[1]
	fmla	v1.4s, v7.4s, v6.s[1]
	fmla	v3.4s, v7.4s, v16.s[1]
	madd	x11, x10, x13, x15
	add	x11, x11, x5
	lsl	x11, x11, #2
	ldr	q17, [x14, x11]
	fmla	v0.4s, v17.4s, v4.s[2]
	str	q17, [x8, x10, lsl #4]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v2.4s, v17.4s, v5.s[2]
	fmla	v1.4s, v17.4s, v6.s[2]
	fmla	v3.4s, v17.4s, v16.s[2]
	madd	x11, x10, x13, x15
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	add	x11, x11, x5
	lsl	x11, x11, #2
	ldr	q7, [x14, x11]
	ldr	x11, [sp, #512]                 // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[3]
	fmla	v2.4s, v7.4s, v5.s[3]
	fmla	v1.4s, v7.4s, v6.s[3]
	fmla	v3.4s, v7.4s, v16.s[3]
	str	q7, [x8, x10, lsl #4]
	ldp	x16, x10, [sp, #360]            // 16-byte Folded Reload
	cmp	x13, x21
	b.ge	.LBB0_65
	.p2align	2
.LBB0_64:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x15, x17, x11
	add	x14, x10, x12
	add	x11, x11, #4
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s5, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s6, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s7, [x15, #-4]
	prfm	pldl1keep, [x14]
	ldr	x14, [sp, #824]                 // 8-byte Folded Reload
	ldr	q16, [x16, x12]
	add	x12, x12, x14
	fmla	v0.4s, v16.4s, v4.s[0]
	str	q16, [x8, x13, lsl #4]
	add	x13, x13, #1
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x13, x21
	b.lt	.LBB0_64
.LBB0_65:                               // %.preheader51
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #40]                  // 8-byte Folded Reload
	ldr	x13, [sp, #808]                 // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #48
	ldr	x14, [sp, #816]                 // 8-byte Folded Reload
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w18, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x10
	b	.LBB0_67
	.p2align	2
.LBB0_66:                               // %.loopexit47
                                        //   in Loop: Header=BB0_67 Depth=2
	ldr	x10, [sp, #1008]                // 8-byte Folded Reload
	mov	x2, x15
	mov	x15, x1
	add	x14, x14, x10
	add	x13, x13, x10
.LBB0_67:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_69 Depth 3
                                        //       Child Loop BB0_71 Depth 3
	madd	x0, x2, x29, x9
	add	x0, x0, x5
	madd	x16, x16, x29, x9
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	add	x16, x16, x5
	add	x17, x17, x5
	lsl	x0, x0, #2
	lsl	x16, x16, #2
	lsl	x17, x17, #2
	str	q0, [x24, x0]
	str	q2, [x24, x16]
	add	x16, x18, x5
	lsl	x16, x16, #2
	str	q1, [x24, x17]
	str	q3, [x24, x16]
	ldr	x16, [sp, #1024]                // 8-byte Folded Reload
	cmp	x15, x16
	b.ge	.LBB0_72
// %bb.68:                              //   in Loop: Header=BB0_67 Depth=2
	madd	x0, x15, x29, x9
	add	x17, x15, #2
	add	x18, x15, #3
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	madd	x3, x17, x29, x9
	add	x16, x15, #1
	ldr	q16, [x8]
	mov	x2, xzr
	madd	x1, x16, x29, x9
	mov	x4, x14
	add	x0, x0, x5
	lsl	x0, x0, #2
	add	x3, x3, x5
	add	x1, x1, x5
	ldr	q0, [x24, x0]
	madd	x0, x18, x29, x9
	lsl	x3, x3, #2
	lsl	x1, x1, #2
	add	x0, x0, x5
	ldr	q1, [x24, x3]
	ldr	x3, [sp, #848]                  // 8-byte Folded Reload
	lsl	x0, x0, #2
	ldr	q2, [x24, x1]
	add	x1, x15, #4
	ldr	q3, [x24, x0]
	madd	x0, x15, x19, x3
	lsl	x0, x0, #2
	ldr	q7, [x10, x0]
	madd	x0, x16, x19, x3
	lsl	x0, x0, #2
	ldr	q6, [x10, x0]
	madd	x0, x17, x19, x3
	lsl	x0, x0, #2
	ldr	q5, [x10, x0]
	madd	x0, x18, x19, x3
	mov	x3, x11
	lsl	x0, x0, #2
	ldr	q4, [x10, x0]
	cmp	xzr, x23
	b.ge	.LBB0_70
	.p2align	2
.LBB0_69:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_67 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x0, x3, #32
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	add	x2, x2, #4
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	prfm	pldl1keep, [x0]
	add	x0, x4, x20
	ldp	q16, q17, [x3, #-32]
	fmla	v0.4s, v16.4s, v7.s[1]
	fmla	v2.4s, v16.4s, v6.s[1]
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v7.s[2]
	fmla	v2.4s, v17.4s, v6.s[2]
	fmla	v1.4s, v17.4s, v5.s[2]
	fmla	v3.4s, v17.4s, v4.s[2]
	ldp	q17, q16, [x3], #64
	prfm	pldl1keep, [x4]
	fmla	v0.4s, v17.4s, v7.s[3]
	ldur	q7, [x4, #-16]
	prfm	pldl1keep, [x0]
	fmla	v2.4s, v17.4s, v6.s[3]
	ldur	q6, [x0, #-16]
	add	x0, x0, x20
	fmla	v1.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x0]
	ldur	q5, [x0, #-16]
	add	x0, x0, x20
	prfm	pldl1keep, [x0]
	ldur	q4, [x0, #-16]
	cmp	x2, x23
	b.lt	.LBB0_69
.LBB0_70:                               //   in Loop: Header=BB0_67 Depth=2
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	ldr	x4, [sp, #1032]                 // 8-byte Folded Reload
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	mov	x2, x13
	mov	x3, x12
	ldr	q17, [x8, x10, lsl #4]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	fmla	v0.4s, v17.4s, v7.s[1]
	ldr	q16, [x8, x10, lsl #4]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v2.4s, v17.4s, v6.s[1]
	fmla	v1.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	ldr	q18, [x8, x10, lsl #4]
	fmla	v0.4s, v16.4s, v7.s[2]
	fmla	v2.4s, v16.4s, v6.s[2]
	fmla	v1.4s, v16.4s, v5.s[2]
	fmla	v3.4s, v16.4s, v4.s[2]
	fmla	v0.4s, v18.4s, v7.s[3]
	fmla	v2.4s, v18.4s, v6.s[3]
	fmla	v1.4s, v18.4s, v5.s[3]
	fmla	v3.4s, v18.4s, v4.s[3]
	cmp	x4, x21
	b.ge	.LBB0_66
	.p2align	2
.LBB0_71:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_67 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x0, x2, x20
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x0]
	ldur	s5, [x0, #-4]
	add	x0, x0, x20
	add	x2, x2, #4
	prfm	pldl1keep, [x0]
	ldur	s6, [x0, #-4]
	add	x0, x0, x20
	prfm	pldl1keep, [x0]
	ldur	s7, [x0, #-4]
	prfm	pldl1keep, [x3]
	ldur	q16, [x3, #-16]
	add	x3, x3, #16
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x4, x21
	b.lt	.LBB0_71
	b	.LBB0_66
	.p2align	2
.LBB0_72:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #1024]                // 8-byte Folded Reload
	ldr	x14, [sp, #920]                 // 8-byte Folded Reload
	cmp	x13, x14
	b.ge	.LBB0_78
// %bb.73:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x17, [sp, #1024]                // 8-byte Folded Reload
	ldr	x18, [sp, #848]                 // 8-byte Folded Reload
	mov	x15, xzr
	add	x16, x17, #1
	madd	x13, x17, x29, x9
	madd	x17, x17, x19, x18
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	ldr	q4, [x8]
	madd	x14, x16, x29, x9
	madd	x16, x16, x19, x18
	ldr	x18, [sp, #624]                 // 8-byte Folded Reload
	add	x13, x13, x5
	lsl	x17, x17, #2
	add	x14, x14, x5
	add	x13, x24, x13, lsl #2
	lsl	x16, x16, #2
	ldr	q3, [x10, x17]
	ldr	x17, [sp, #616]                 // 8-byte Folded Reload
	add	x14, x24, x14, lsl #2
	ldr	q2, [x10, x16]
	mov	x16, x11
	ldr	q0, [x13]
	ldr	q1, [x14]
	cmp	xzr, x23
	b.ge	.LBB0_75
	.p2align	2
.LBB0_74:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x4, x16, #32
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	add	x0, x18, x27
	prfm	pldl1keep, [x4]
	ldp	q4, q5, [x16, #-32]
	add	x2, x17, x27
	add	x1, x0, #32
	add	x3, x2, #32
	add	x15, x15, #4
	add	x18, x18, #16
	add	x17, x17, #16
	fmla	v0.4s, v4.4s, v3.s[1]
	fmla	v1.4s, v4.4s, v2.s[1]
	fmla	v0.4s, v5.4s, v3.s[2]
	fmla	v1.4s, v5.4s, v2.s[2]
	ldp	q5, q4, [x16], #64
	prfm	pldl1keep, [x3]
	fmla	v0.4s, v5.4s, v3.s[3]
	ldr	q3, [x2, #16]
	prfm	pldl1keep, [x1]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldr	q2, [x0, #16]
	cmp	x15, x23
	b.lt	.LBB0_74
.LBB0_75:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldr	x15, [sp, #880]                 // 8-byte Folded Reload
	ldr	x16, [sp, #1032]                // 8-byte Folded Reload
	ldr	q5, [x8, x10, lsl #4]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	q4, [x8, x10, lsl #4]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v0.4s, v5.4s, v3.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldr	q5, [x8, x10, lsl #4]
	fmla	v0.4s, v4.4s, v3.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v3.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	cmp	x16, x21
	b.ge	.LBB0_77
	.p2align	2
.LBB0_76:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x17, x15, x7
	add	x18, x15, x6
	add	x16, x16, #1
	add	x17, x17, #4
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	ldr	s2, [x15, x6]
	prfm	pldl1keep, [x17]
	ldr	s3, [x15, x7]
	prfm	pldl1keep, [x12]
	ldur	q4, [x12, #-16]
	add	x12, x12, #16
	add	x15, x15, #4
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v3.s[0]
	cmp	x16, x21
	b.lt	.LBB0_76
.LBB0_77:                               //   in Loop: Header=BB0_4 Depth=1
	str	q0, [x13]
	str	q1, [x14]
.LBB0_78:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x12, [sp, #744]                 // 8-byte Folded Reload
	ldr	x13, [sp, #920]                 // 8-byte Folded Reload
	cmp	x13, x12
	b.ge	.LBB0_84
// %bb.79:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #920]                 // 8-byte Folded Reload
	ldr	x10, [sp, #848]                 // 8-byte Folded Reload
	mov	x12, xzr
	madd	x9, x13, x29, x9
	madd	x10, x13, x19, x10
	ldr	x13, [sp, #888]                 // 8-byte Folded Reload
	ldr	q2, [x8]
	ldr	x14, [sp, #632]                 // 8-byte Folded Reload
	ldr	x15, [sp, #880]                 // 8-byte Folded Reload
	add	x9, x9, x5
	lsl	x10, x10, #2
	add	x9, x24, x9, lsl #2
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #640]                 // 8-byte Folded Reload
	ldr	q0, [x9]
	cmp	xzr, x23
	b.ge	.LBB0_81
	.p2align	2
.LBB0_80:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x11, #32
	fmla	v0.4s, v2.4s, v1.s[0]
	add	x12, x12, #4
	prfm	pldl1keep, [x13]
	ldp	q2, q3, [x11, #-32]
	fmla	v0.4s, v2.4s, v1.s[1]
	fmla	v0.4s, v3.4s, v1.s[2]
	ldp	q3, q2, [x11], #64
	prfm	pldl1keep, [x10]
	fmla	v0.4s, v3.4s, v1.s[3]
	ldur	q1, [x10, #-16]
	add	x10, x10, #16
	cmp	x12, x23
	b.lt	.LBB0_80
.LBB0_81:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[0]
	mov	x10, xzr
	mov	w12, #16                        // =0x10
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #904]                 // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v1.s[1]
	ldr	q2, [x8, x11, lsl #4]
	ldr	x11, [sp, #896]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[2]
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #24]                  // 8-byte Folded Reload
	add	x8, x8, x11
	ldr	x11, [sp, #560]                 // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v1.s[3]
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	add	x13, x13, xzr
	cmp	x13, x21
	b.ge	.LBB0_83
	.p2align	2
.LBB0_82:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x15, x11
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	add	x13, x8, x12
	ldr	s1, [x14, x10, lsl #2]
	add	x12, x12, #16
	prfm	pldl1keep, [x13]
	ldr	q2, [x8, x10, lsl #4]
	add	x10, x10, #1
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	add	x13, x13, x10
	cmp	x13, x21
	b.lt	.LBB0_82
.LBB0_83:                               //   in Loop: Header=BB0_4 Depth=1
	str	q0, [x9]
.LBB0_84:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x0, [sp, #120]                  // 8-byte Folded Reload
	bl	free
	ldr	x4, [sp, #600]                  // 8-byte Folded Reload
	ldr	x8, [sp, #648]                  // 8-byte Folded Reload
	cmp	x4, x8
	b.ge	.LBB0_34
.LBB0_85:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #72]                   // 8-byte Folded Reload
	mov	x24, x4
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #736]                  // 8-byte Folded Reload
	ldr	x11, [sp, #776]                 // 8-byte Folded Reload
	mov	x12, xzr
	mul	x9, x11, x8
	ldr	x8, [sp, #752]                  // 8-byte Folded Reload
	ldr	x18, [sp, #520]                 // 8-byte Folded Reload
	str	x0, [sp, #848]                  // 8-byte Folded Spill
	add	x13, x18, x29
	ldp	x1, x2, [sp, #328]              // 16-byte Folded Reload
	ldp	x3, x4, [sp, #344]              // 16-byte Folded Reload
	ldr	x5, [sp, #872]                  // 8-byte Folded Reload
	ldr	x6, [sp, #784]                  // 8-byte Folded Reload
	ldr	x7, [sp, #800]                  // 8-byte Folded Reload
	mul	x10, x11, x8
	add	x8, x0, #63
	add	x14, x9, x24
	lsl	x16, x14, #2
	add	x17, x14, x29
	add	x18, x14, x18
	add	x13, x14, x13
	and	x8, x8, #0xffffffffffffffc0
	lsl	x13, x13, #2
	str	x10, [sp, #112]                 // 8-byte Folded Spill
	add	x15, x10, x24
	ldr	x10, [sp, #760]                 // 8-byte Folded Reload
	lsl	x14, x15, #2
	lsl	x15, x17, #2
	mul	x0, x11, x10
	ldr	x10, [sp, #856]                 // 8-byte Folded Reload
	ldr	x11, [sp, #840]                 // 8-byte Folded Reload
	ldr	d0, [x10, x16]
	lsl	x16, x18, #2
	ldr	x18, [sp, #792]                 // 8-byte Folded Reload
	ldr	d2, [x10, x15]
	ldr	d3, [x10, x13]
	lsl	x13, x0, #2
	ldr	d7, [x11, x14]
	str	x0, [sp, #120]                  // 8-byte Folded Spill
	ldp	x14, x15, [sp, #296]            // 16-byte Folded Reload
	ldr	d1, [x10, x16]
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	ldp	x16, x17, [sp, #312]            // 16-byte Folded Reload
	ldr	q4, [x10, x13]
	add	x13, x0, x19
	lsl	x13, x13, #2
	ldr	q5, [x10, x13]
	add	x13, x0, x19, lsl #1
	lsl	x13, x13, #2
	ldr	q6, [x10, x13]
	orr	x13, x8, #0x10
	.p2align	2
.LBB0_86:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x24, x18, x27
	fmla	v0.2s, v7.2s, v4.s[0]
	fmla	v2.2s, v7.2s, v5.s[0]
	cmp	x12, x23
	prfm	pldl1keep, [x24, #16]
	ldr	q16, [x24]
	b.ge	.LBB0_88
// %bb.87:                              //   in Loop: Header=BB0_86 Depth=2
	ldr	x10, [sp, #864]                 // 8-byte Folded Reload
	stur	d7, [x13, #-16]
	fmla	v1.2s, v7.2s, v6.s[0]
	fmla	v3.2s, v7.2s, v16.s[0]
	add	x25, x6, x27
	add	x26, x5, x27
	add	x11, x25, #32
	add	x0, x26, #32
	add	x12, x12, #4
	add	x6, x6, #16
	add	x5, x5, #16
	add	x18, x18, #16
	add	x24, x1, x10
	add	x28, x4, x10
	prfm	pldl1keep, [x24]
	add	x24, x2, x10
	ldr	d17, [x16, x10]
	stur	d17, [x13, #-8]
	prfm	pldl1keep, [x24]
	ldr	d18, [x15, x10]
	add	x24, x3, x10
	fmla	v0.2s, v17.2s, v4.s[1]
	fmla	v2.2s, v17.2s, v5.s[1]
	fmla	v1.2s, v17.2s, v6.s[1]
	fmla	v3.2s, v17.2s, v16.s[1]
	str	d18, [x13]
	prfm	pldl1keep, [x24]
	ldr	d19, [x14, x10]
	fmla	v0.2s, v18.2s, v4.s[2]
	fmla	v2.2s, v18.2s, v5.s[2]
	fmla	v1.2s, v18.2s, v6.s[2]
	add	x24, x7, x27
	fmla	v3.2s, v18.2s, v16.s[2]
	add	x7, x7, #16
	add	x30, x24, #32
	str	d19, [x13, #8]
	prfm	pldl1keep, [x28]
	ldr	d7, [x17, x10]
	fmla	v0.2s, v19.2s, v4.s[3]
	fmla	v2.2s, v19.2s, v5.s[3]
	fmla	v1.2s, v19.2s, v6.s[3]
	prfm	pldl1keep, [x0]
	ldr	q4, [x26, #16]
	prfm	pldl1keep, [x11]
	ldr	q5, [x25, #16]
	prfm	pldl1keep, [x30]
	ldr	x10, [sp, #1016]                // 8-byte Folded Reload
	ldr	q6, [x24, #16]
	fmla	v3.2s, v19.2s, v16.s[3]
	add	x13, x13, #32
	add	x4, x4, x10
	add	x3, x3, x10
	add	x2, x2, x10
	add	x1, x1, x10
	add	x17, x17, x10
	add	x16, x16, x10
	add	x15, x15, x10
	add	x14, x14, x10
	b	.LBB0_86
	.p2align	2
.LBB0_88:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #728]                 // 8-byte Folded Reload
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v6.s[0]
	fmla	v3.2s, v7.2s, v16.s[0]
	ldp	x15, x6, [sp, #112]             // 16-byte Folded Reload
	ldr	x4, [sp, #600]                  // 8-byte Folded Reload
	mov	x12, xzr
	madd	x11, x10, x13, x15
	ldr	x14, [sp, #840]                 // 8-byte Folded Reload
	str	d7, [x8, x23, lsl #3]
	ldr	x16, [sp, #824]                 // 8-byte Folded Reload
	ldr	x18, [sp, #880]                 // 8-byte Folded Reload
	ldr	x5, [sp, #856]                  // 8-byte Folded Reload
	add	x11, x11, x4
	lsl	x11, x11, #2
	ldr	d7, [x14, x11]
	fmla	v0.2s, v7.2s, v4.s[1]
	str	d7, [x8, x10, lsl #3]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	fmla	v2.2s, v7.2s, v5.s[1]
	fmla	v1.2s, v7.2s, v6.s[1]
	fmla	v3.2s, v7.2s, v16.s[1]
	madd	x11, x10, x13, x15
	add	x11, x11, x4
	lsl	x11, x11, #2
	ldr	d17, [x14, x11]
	fmla	v0.2s, v17.2s, v4.s[2]
	str	d17, [x8, x10, lsl #3]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v2.2s, v17.2s, v5.s[2]
	fmla	v1.2s, v17.2s, v6.s[2]
	fmla	v3.2s, v17.2s, v16.s[2]
	madd	x11, x10, x13, x15
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	add	x11, x11, x4
	lsl	x11, x11, #2
	ldr	d7, [x14, x11]
	ldr	x11, [sp, #512]                 // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[3]
	fmla	v2.2s, v7.2s, v5.s[3]
	fmla	v1.2s, v7.2s, v6.s[3]
	fmla	v3.2s, v7.2s, v16.s[3]
	str	d7, [x8, x10, lsl #3]
	ldp	x17, x10, [sp, #280]            // 16-byte Folded Reload
	cmp	x13, x21
	b.ge	.LBB0_90
	.p2align	2
.LBB0_89:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x15, x18, x11
	add	x14, x10, x12
	add	x11, x11, #4
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s5, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s6, [x15, #-4]
	add	x15, x15, x20
	prfm	pldl1keep, [x15]
	ldur	s7, [x15, #-4]
	prfm	pldl1keep, [x14]
	ldr	d16, [x17, x12]
	add	x12, x12, x16
	fmla	v0.2s, v16.2s, v4.s[0]
	str	d16, [x8, x13, lsl #3]
	add	x13, x13, #1
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x13, x21
	b.lt	.LBB0_89
.LBB0_90:                               // %.preheader50
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #32]                  // 8-byte Folded Reload
	ldr	x13, [sp, #808]                 // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #24
	ldr	x14, [sp, #816]                 // 8-byte Folded Reload
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w18, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x10
	b	.LBB0_92
	.p2align	2
.LBB0_91:                               // %.loopexit46
                                        //   in Loop: Header=BB0_92 Depth=2
	ldr	x10, [sp, #1008]                // 8-byte Folded Reload
	ldr	x4, [sp, #600]                  // 8-byte Folded Reload
	mov	x2, x15
	mov	x15, x1
	add	x14, x14, x10
	add	x13, x13, x10
.LBB0_92:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_94 Depth 3
                                        //       Child Loop BB0_96 Depth 3
	madd	x0, x2, x29, x9
	add	x0, x0, x4
	madd	x16, x16, x29, x9
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	add	x16, x16, x4
	add	x17, x17, x4
	lsl	x0, x0, #2
	lsl	x16, x16, #2
	lsl	x17, x17, #2
	str	d0, [x5, x0]
	str	d2, [x5, x16]
	add	x16, x18, x4
	lsl	x16, x16, #2
	str	d1, [x5, x17]
	str	d3, [x5, x16]
	ldr	x16, [sp, #1024]                // 8-byte Folded Reload
	cmp	x15, x16
	b.ge	.LBB0_97
// %bb.93:                              //   in Loop: Header=BB0_92 Depth=2
	madd	x0, x15, x29, x9
	add	x18, x15, #3
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	add	x16, x15, #1
	add	x17, x15, #2
	madd	x1, x16, x29, x9
	ldr	d16, [x8]
	mov	x2, xzr
	madd	x3, x17, x29, x9
	add	x0, x0, x4
	lsl	x0, x0, #2
	add	x1, x1, x4
	add	x3, x3, x4
	ldr	d0, [x5, x0]
	madd	x0, x18, x29, x9
	lsl	x1, x1, #2
	lsl	x3, x3, #2
	ldr	d2, [x5, x1]
	ldr	d1, [x5, x3]
	add	x1, x15, #4
	mov	x3, x11
	add	x0, x0, x4
	mov	x4, x14
	lsl	x0, x0, #2
	ldr	d3, [x5, x0]
	madd	x0, x15, x19, x6
	lsl	x0, x0, #2
	ldr	q7, [x10, x0]
	madd	x0, x16, x19, x6
	lsl	x0, x0, #2
	ldr	q6, [x10, x0]
	madd	x0, x17, x19, x6
	lsl	x0, x0, #2
	ldr	q5, [x10, x0]
	madd	x0, x18, x19, x6
	lsl	x0, x0, #2
	ldr	q4, [x10, x0]
	cmp	xzr, x23
	b.ge	.LBB0_95
	.p2align	2
.LBB0_94:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_92 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x0, x3, #16
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	add	x2, x2, #4
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	prfm	pldl1keep, [x0]
	add	x0, x4, x20
	ldp	d16, d17, [x3, #-16]
	fmla	v0.2s, v16.2s, v7.s[1]
	fmla	v2.2s, v16.2s, v6.s[1]
	fmla	v1.2s, v16.2s, v5.s[1]
	fmla	v3.2s, v16.2s, v4.s[1]
	fmla	v0.2s, v17.2s, v7.s[2]
	fmla	v2.2s, v17.2s, v6.s[2]
	fmla	v1.2s, v17.2s, v5.s[2]
	fmla	v3.2s, v17.2s, v4.s[2]
	ldp	d17, d16, [x3], #32
	prfm	pldl1keep, [x4]
	fmla	v0.2s, v17.2s, v7.s[3]
	ldur	q7, [x4, #-16]
	prfm	pldl1keep, [x0]
	fmla	v2.2s, v17.2s, v6.s[3]
	ldur	q6, [x0, #-16]
	add	x0, x0, x20
	fmla	v1.2s, v17.2s, v5.s[3]
	fmla	v3.2s, v17.2s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x0]
	ldur	q5, [x0, #-16]
	add	x0, x0, x20
	prfm	pldl1keep, [x0]
	ldur	q4, [x0, #-16]
	cmp	x2, x23
	b.lt	.LBB0_94
.LBB0_95:                               //   in Loop: Header=BB0_92 Depth=2
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	ldr	x4, [sp, #1032]                 // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	mov	x2, x13
	mov	x3, x12
	ldr	d17, [x8, x10, lsl #3]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	fmla	v0.2s, v17.2s, v7.s[1]
	ldr	d16, [x8, x10, lsl #3]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v2.2s, v17.2s, v6.s[1]
	fmla	v1.2s, v17.2s, v5.s[1]
	fmla	v3.2s, v17.2s, v4.s[1]
	ldr	d18, [x8, x10, lsl #3]
	fmla	v0.2s, v16.2s, v7.s[2]
	fmla	v2.2s, v16.2s, v6.s[2]
	fmla	v1.2s, v16.2s, v5.s[2]
	fmla	v3.2s, v16.2s, v4.s[2]
	fmla	v0.2s, v18.2s, v7.s[3]
	fmla	v2.2s, v18.2s, v6.s[3]
	fmla	v1.2s, v18.2s, v5.s[3]
	fmla	v3.2s, v18.2s, v4.s[3]
	cmp	x4, x21
	b.ge	.LBB0_91
	.p2align	2
.LBB0_96:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_92 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x0, x2, x20
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x0]
	ldur	s5, [x0, #-4]
	add	x0, x0, x20
	add	x2, x2, #4
	prfm	pldl1keep, [x0]
	ldur	s6, [x0, #-4]
	add	x0, x0, x20
	prfm	pldl1keep, [x0]
	ldur	s7, [x0, #-4]
	prfm	pldl1keep, [x3]
	ldur	d16, [x3, #-8]
	add	x3, x3, #8
	fmla	v0.2s, v16.2s, v4.s[0]
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x4, x21
	b.lt	.LBB0_96
	b	.LBB0_91
	.p2align	2
.LBB0_97:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x12, [sp, #1024]                // 8-byte Folded Reload
	ldr	x13, [sp, #920]                 // 8-byte Folded Reload
	cmp	x12, x13
	b.ge	.LBB0_103
// %bb.98:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x16, [sp, #1024]                // 8-byte Folded Reload
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	mov	x14, xzr
	add	x15, x16, #1
	madd	x12, x16, x29, x9
	madd	x16, x16, x19, x6
	ldr	d4, [x8]
	ldr	x17, [sp, #624]                 // 8-byte Folded Reload
	madd	x13, x15, x29, x9
	madd	x15, x15, x19, x6
	add	x12, x12, x4
	lsl	x16, x16, #2
	add	x13, x13, x4
	add	x12, x5, x12, lsl #2
	lsl	x15, x15, #2
	add	x13, x5, x13, lsl #2
	ldr	q3, [x10, x16]
	ldr	q2, [x10, x15]
	ldr	x16, [sp, #616]                 // 8-byte Folded Reload
	mov	x15, x11
	ldr	d0, [x12]
	ldr	d1, [x13]
	cmp	xzr, x23
	b.ge	.LBB0_100
	.p2align	2
.LBB0_99:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x3, x15, #16
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	add	x18, x17, x27
	prfm	pldl1keep, [x3]
	ldp	d4, d5, [x15, #-16]
	add	x1, x16, x27
	add	x0, x18, #32
	add	x2, x1, #32
	add	x14, x14, #4
	add	x17, x17, #16
	add	x16, x16, #16
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v5.2s, v3.s[2]
	fmla	v1.2s, v5.2s, v2.s[2]
	ldp	d5, d4, [x15], #32
	prfm	pldl1keep, [x2]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x1, #16]
	prfm	pldl1keep, [x0]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x18, #16]
	cmp	x14, x23
	b.lt	.LBB0_99
.LBB0_100:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldr	x1, [sp, #544]                  // 8-byte Folded Reload
	mov	x14, xzr
	mov	x15, xzr
	ldr	d5, [x8, x10, lsl #3]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	d4, [x8, x10, lsl #3]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.s[1]
	fmla	v1.2s, v5.2s, v2.s[1]
	ldr	d5, [x8, x10, lsl #3]
	ldr	x10, [sp, #56]                  // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[2]
	fmla	v1.2s, v4.2s, v2.s[2]
	add	x16, x8, x10
	fmla	v0.2s, v5.2s, v3.s[3]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	add	x17, x10, xzr
	cmp	x17, x21
	b.ge	.LBB0_102
	.p2align	2
.LBB0_101:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x10, [sp, #656]                 // 8-byte Folded Reload
	add	x17, x16, x15, lsl #3
	add	x18, x1, x14
	add	x18, x18, #4
	add	x17, x17, #8
	add	x0, x10, x14
	add	x14, x14, #4
	add	x0, x0, #4
	prfm	pldl1keep, [x0]
	ldr	s2, [x10, x15, lsl #2]
	prfm	pldl1keep, [x18]
	ldr	s3, [x1, x15, lsl #2]
	prfm	pldl1keep, [x17]
	ldr	d4, [x16, x15, lsl #3]
	add	x15, x15, #1
	fmla	v0.2s, v4.2s, v2.s[0]
	fmla	v1.2s, v4.2s, v3.s[0]
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	add	x17, x10, x15
	cmp	x17, x21
	b.lt	.LBB0_101
.LBB0_102:                              //   in Loop: Header=BB0_4 Depth=1
	str	d0, [x12]
	str	d1, [x13]
.LBB0_103:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x12, [sp, #744]                 // 8-byte Folded Reload
	ldr	x13, [sp, #920]                 // 8-byte Folded Reload
	cmp	x13, x12
	b.ge	.LBB0_109
// %bb.104:                             //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #920]                 // 8-byte Folded Reload
	ldr	d2, [x8]
	mov	x12, xzr
	madd	x9, x13, x29, x9
	madd	x10, x13, x19, x6
	ldr	x13, [sp, #888]                 // 8-byte Folded Reload
	ldr	x14, [sp, #632]                 // 8-byte Folded Reload
	ldr	x15, [sp, #880]                 // 8-byte Folded Reload
	add	x9, x9, x4
	lsl	x10, x10, #2
	add	x9, x5, x9, lsl #2
	ldr	d0, [x9]
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #640]                 // 8-byte Folded Reload
	cmp	xzr, x23
	b.ge	.LBB0_106
	.p2align	2
.LBB0_105:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x11, #16
	fmla	v0.2s, v2.2s, v1.s[0]
	add	x12, x12, #4
	prfm	pldl1keep, [x13]
	ldp	d2, d3, [x11, #-16]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v3.2s, v1.s[2]
	ldp	d3, d2, [x11], #32
	prfm	pldl1keep, [x10]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x10, #-16]
	add	x10, x10, #16
	cmp	x12, x23
	b.lt	.LBB0_105
.LBB0_106:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[0]
	mov	x10, xzr
	ldr	d3, [x8, x11, lsl #3]
	ldr	x11, [sp, #904]                 // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v1.s[1]
	ldr	d4, [x8, x11, lsl #3]
	ldr	x11, [sp, #896]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[2]
	ldr	d2, [x8, x11, lsl #3]
	ldr	x11, [sp, #56]                  // 8-byte Folded Reload
	add	x8, x8, x11
	ldr	x11, [sp, #560]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[3]
	ldr	x12, [sp, #1032]                // 8-byte Folded Reload
	add	x12, x12, xzr
	cmp	x12, x21
	b.ge	.LBB0_108
	.p2align	2
.LBB0_107:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x8, x10, lsl #3
	add	x13, x15, x11
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	ldr	s1, [x14, x10, lsl #2]
	add	x12, x12, #8
	prfm	pldl1keep, [x12]
	ldr	d2, [x8, x10, lsl #3]
	add	x10, x10, #1
	fmla	v0.2s, v2.2s, v1.s[0]
	ldr	x12, [sp, #1032]                // 8-byte Folded Reload
	add	x12, x12, x10
	cmp	x12, x21
	b.lt	.LBB0_107
.LBB0_108:                              //   in Loop: Header=BB0_4 Depth=1
	str	d0, [x9]
.LBB0_109:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x0, [sp, #848]                  // 8-byte Folded Reload
	bl	free
	ldr	x8, [sp, #144]                  // 8-byte Folded Reload
	ldr	x9, [sp, #648]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_3
.LBB0_110:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #96]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #736]                  // 8-byte Folded Reload
	ldr	x17, [sp, #776]                 // 8-byte Folded Reload
	add	x10, x0, #63
	mov	x12, xzr
	ldr	x15, [sp, #520]                 // 8-byte Folded Reload
	ldr	x16, [sp, #648]                 // 8-byte Folded Reload
	mov	x13, xzr
	mul	x9, x17, x8
	ldr	x24, [sp, #856]                 // 8-byte Folded Reload
	add	x8, x15, x29
	ldp	x1, x2, [sp, #248]              // 16-byte Folded Reload
	ldp	x3, x4, [sp, #264]              // 16-byte Folded Reload
	str	x0, [sp, #120]                  // 8-byte Folded Spill
	add	x11, x9, x16
	add	x8, x11, x8
	add	x14, x11, x29
	add	x15, x11, x15
	ldr	s2, [x24, x11, lsl #2]
	ldr	x11, [sp, #840]                 // 8-byte Folded Reload
	ldr	s0, [x24, x8, lsl #2]
	and	x8, x10, #0xffffffffffffffc0
	ldr	x10, [sp, #752]                 // 8-byte Folded Reload
	ldr	s3, [x24, x14, lsl #2]
	ldr	s1, [x24, x15, lsl #2]
	mul	x10, x17, x10
	str	x10, [sp, #520]                 // 8-byte Folded Spill
	add	x10, x10, x16
	ldp	x15, x16, [sp, #216]            // 16-byte Folded Reload
	ldr	s7, [x11, x10, lsl #2]
	ldr	x10, [sp, #760]                 // 8-byte Folded Reload
	mul	x11, x17, x10
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	lsl	x14, x11, #2
	ldp	x17, x18, [sp, #232]            // 16-byte Folded Reload
	str	x11, [sp, #776]                 // 8-byte Folded Spill
	ldr	q4, [x10, x14]
	add	x14, x11, x19
	lsl	x14, x14, #2
	ldr	q5, [x10, x14]
	add	x14, x11, x19, lsl #1
	lsl	x14, x14, #2
	ldr	q6, [x10, x14]
	orr	x10, x8, #0xc
	str	x10, [sp, #848]                 // 8-byte Folded Spill
	.p2align	2
.LBB0_111:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x10, [sp, #608]                 // 8-byte Folded Reload
	ext	v20.16b, v4.16b, v4.16b, #8
	cmp	x13, x23
	ext	v19.16b, v5.16b, v5.16b, #8
	add	x5, x10, x12
	prfm	pldl1keep, [x5, #16]
	ldr	q16, [x5]
	ext	v18.16b, v6.16b, v6.16b, #8
	ext	v17.16b, v16.16b, v16.16b, #8
	b.ge	.LBB0_113
// %bb.112:                             //   in Loop: Header=BB0_111 Depth=2
	ldr	x10, [sp, #592]                 // 8-byte Folded Reload
	ldr	x14, [sp, #864]                 // 8-byte Folded Reload
	fmla	v2.2s, v7.2s, v4.2s
	fmla	v3.2s, v7.2s, v5.2s
	fmla	v1.2s, v7.2s, v6.2s
	fmla	v0.2s, v7.2s, v16.2s
	add	x13, x13, #4
	add	x5, x10, x12
	ldr	x10, [sp, #584]                 // 8-byte Folded Reload
	add	x0, x1, x14
	add	x11, x2, x14
	add	x24, x3, x14
	add	x30, x4, x14
	add	x6, x5, #32
	add	x7, x10, x12
	ldr	x10, [sp, #880]                 // 8-byte Folded Reload
	add	x25, x7, #32
	add	x26, x10, x12
	ldr	x10, [sp, #848]                 // 8-byte Folded Reload
	add	x28, x26, #32
	add	x10, x10, x12
	add	x12, x12, #16
	stur	s7, [x10, #-12]
	prfm	pldl1keep, [x0]
	ldr	s7, [x17, x14]
	fmla	v2.2s, v7.2s, v4.s[1]
	fmla	v3.2s, v7.2s, v5.s[1]
	fmla	v1.2s, v7.2s, v6.s[1]
	fmla	v0.2s, v7.2s, v16.s[1]
	stur	s7, [x10, #-8]
	prfm	pldl1keep, [x11]
	ldr	s7, [x16, x14]
	fmla	v1.2s, v7.2s, v18.2s
	stur	s7, [x10, #-4]
	prfm	pldl1keep, [x24]
	ldr	s18, [x15, x14]
	fmla	v2.2s, v7.2s, v20.2s
	fmla	v3.2s, v7.2s, v19.2s
	ldr	x24, [sp, #856]                 // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v17.2s
	str	s18, [x10]
	prfm	pldl1keep, [x30]
	ldr	s7, [x18, x14]
	fmla	v2.2s, v18.2s, v4.s[3]
	fmla	v3.2s, v18.2s, v5.s[3]
	fmla	v1.2s, v18.2s, v6.s[3]
	prfm	pldl1keep, [x28]
	ldr	q4, [x26, #16]
	prfm	pldl1keep, [x25]
	ldr	q5, [x7, #16]
	prfm	pldl1keep, [x6]
	ldr	x10, [sp, #1016]                // 8-byte Folded Reload
	ldr	q6, [x5, #16]
	fmla	v0.2s, v18.2s, v16.s[3]
	add	x4, x4, x10
	add	x3, x3, x10
	add	x2, x2, x10
	add	x1, x1, x10
	add	x18, x18, x10
	add	x17, x17, x10
	add	x16, x16, x10
	add	x15, x15, x10
	b	.LBB0_111
	.p2align	2
.LBB0_113:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #728]                 // 8-byte Folded Reload
	ldr	x13, [sp, #912]                 // 8-byte Folded Reload
	fmla	v2.2s, v7.2s, v4.2s
	fmla	v3.2s, v7.2s, v5.2s
	ldr	x15, [sp, #520]                 // 8-byte Folded Reload
	ldr	x4, [sp, #648]                  // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v6.2s
	fmla	v0.2s, v7.2s, v16.2s
	ldr	x14, [sp, #840]                 // 8-byte Folded Reload
	str	s7, [x8, x23, lsl #2]
	mov	x12, xzr
	ldr	x16, [sp, #880]                 // 8-byte Folded Reload
	ldp	x18, x17, [sp, #200]            // 16-byte Folded Reload
	madd	x10, x13, x11, x15
	ldr	x5, [sp, #776]                  // 8-byte Folded Reload
	add	x10, x10, x4
	ldr	s7, [x14, x10, lsl #2]
	str	s7, [x8, x13, lsl #2]
	ldr	x13, [sp, #904]                 // 8-byte Folded Reload
	fmla	v2.2s, v7.2s, v4.s[1]
	fmla	v3.2s, v7.2s, v5.s[1]
	fmla	v1.2s, v7.2s, v6.s[1]
	fmla	v0.2s, v7.2s, v16.s[1]
	madd	x10, x13, x11, x15
	add	x10, x10, x4
	ldr	s7, [x14, x10, lsl #2]
	fmla	v2.2s, v7.2s, v20.2s
	str	s7, [x8, x13, lsl #2]
	ldr	x13, [sp, #896]                 // 8-byte Folded Reload
	fmla	v3.2s, v7.2s, v19.2s
	fmla	v1.2s, v7.2s, v18.2s
	fmla	v0.2s, v7.2s, v17.2s
	madd	x10, x13, x11, x15
	ldr	x11, [sp, #512]                 // 8-byte Folded Reload
	ldr	x15, [sp, #824]                 // 8-byte Folded Reload
	add	x10, x10, x4
	ldr	s7, [x14, x10, lsl #2]
	fmla	v2.2s, v7.2s, v4.s[3]
	fmla	v3.2s, v7.2s, v5.s[3]
	fmla	v1.2s, v7.2s, v6.s[3]
	fmla	v0.2s, v7.2s, v16.s[3]
	str	s7, [x8, x13, lsl #2]
	ldr	x13, [sp, #1032]                // 8-byte Folded Reload
	cmp	x13, x21
	b.ge	.LBB0_115
	.p2align	2
.LBB0_114:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x14, x16, x11
	add	x10, x17, x12
	add	x11, x11, #4
	prfm	pldl1keep, [x14]
	ldur	s4, [x14, #-4]
	add	x14, x14, x20
	prfm	pldl1keep, [x14]
	ldur	s5, [x14, #-4]
	add	x14, x14, x20
	prfm	pldl1keep, [x14]
	ldur	s6, [x14, #-4]
	add	x14, x14, x20
	prfm	pldl1keep, [x14]
	ldur	s7, [x14, #-4]
	prfm	pldl1keep, [x10]
	ldr	s16, [x18, x12]
	add	x12, x12, x15
	fmla	v2.2s, v16.2s, v4.2s
	str	s16, [x8, x13, lsl #2]
	add	x13, x13, #1
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v1.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	cmp	x13, x21
	b.lt	.LBB0_114
.LBB0_115:                              // %.preheader49
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #512]                 // 8-byte Folded Reload
	ldr	x13, [sp, #808]                 // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #12
	ldr	x14, [sp, #816]                 // 8-byte Folded Reload
	mov	w17, #1                         // =0x1
	mov	w18, #2                         // =0x2
	mov	w16, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x10
	b	.LBB0_117
	.p2align	2
.LBB0_116:                              // %.loopexit45
                                        //   in Loop: Header=BB0_117 Depth=2
	ldr	x10, [sp, #1008]                // 8-byte Folded Reload
	ldr	x4, [sp, #648]                  // 8-byte Folded Reload
	mov	x2, x15
	mov	x15, x1
	add	x14, x14, x10
	add	x13, x13, x10
.LBB0_117:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_119 Depth 3
                                        //       Child Loop BB0_121 Depth 3
	madd	x10, x2, x29, x9
	add	x10, x10, x4
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	add	x17, x17, x4
	str	s2, [x24, x10, lsl #2]
	madd	x10, x16, x29, x9
	add	x16, x18, x4
	str	s3, [x24, x17, lsl #2]
	add	x10, x10, x4
	str	s1, [x24, x16, lsl #2]
	str	s0, [x24, x10, lsl #2]
	ldr	x10, [sp, #1024]                // 8-byte Folded Reload
	cmp	x15, x10
	b.ge	.LBB0_122
// %bb.118:                             //   in Loop: Header=BB0_117 Depth=2
	add	x17, x15, #1
	madd	x10, x15, x29, x9
	add	x18, x15, #2
	add	x16, x15, #3
	madd	x0, x17, x29, x9
	ldr	s16, [x8]
	mov	x2, xzr
	add	x10, x10, x4
	madd	x1, x18, x29, x9
	madd	x3, x16, x29, x9
	add	x0, x0, x4
	add	x1, x1, x4
	ldr	s2, [x24, x10, lsl #2]
	madd	x10, x15, x19, x5
	add	x3, x3, x4
	mov	x4, x14
	ldr	s3, [x24, x0, lsl #2]
	ldr	x0, [sp, #888]                  // 8-byte Folded Reload
	ldr	s0, [x24, x3, lsl #2]
	ldr	s1, [x24, x1, lsl #2]
	add	x1, x15, #4
	mov	x3, x11
	lsl	x10, x10, #2
	ldr	q7, [x0, x10]
	madd	x10, x17, x19, x5
	lsl	x10, x10, #2
	ldr	q6, [x0, x10]
	madd	x10, x18, x19, x5
	lsl	x10, x10, #2
	ldr	q5, [x0, x10]
	madd	x10, x16, x19, x5
	lsl	x10, x10, #2
	ldr	q4, [x0, x10]
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	xzr, x23
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.ge	.LBB0_120
	.p2align	2
.LBB0_119:                              //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_117 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x10, x3, #8
	fmla	v2.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	add	x2, x2, #4
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	prfm	pldl1keep, [x10]
	add	x10, x4, x20
	ldp	s16, s21, [x3, #-8]
	fmla	v0.2s, v16.2s, v4.s[1]
	fmla	v2.2s, v16.2s, v7.s[1]
	fmla	v3.2s, v16.2s, v6.s[1]
	fmla	v1.2s, v16.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v17.2s
	fmla	v2.2s, v21.2s, v20.2s
	ldp	s17, s16, [x3], #16
	fmla	v3.2s, v21.2s, v19.2s
	fmla	v1.2s, v21.2s, v18.2s
	prfm	pldl1keep, [x4]
	fmla	v2.2s, v17.2s, v7.s[3]
	ldur	q7, [x4, #-16]
	prfm	pldl1keep, [x10]
	fmla	v3.2s, v17.2s, v6.s[3]
	ldur	q6, [x10, #-16]
	add	x10, x10, x20
	fmla	v1.2s, v17.2s, v5.s[3]
	fmla	v0.2s, v17.2s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x10]
	ldur	q5, [x10, #-16]
	add	x10, x10, x20
	prfm	pldl1keep, [x10]
	ldur	q4, [x10, #-16]
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	x2, x23
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.lt	.LBB0_119
.LBB0_120:                              //   in Loop: Header=BB0_117 Depth=2
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v2.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	ldr	x4, [sp, #1032]                 // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	mov	x2, x13
	mov	x3, x12
	ldr	s21, [x8, x10, lsl #2]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	fmla	v2.2s, v21.2s, v7.s[1]
	ldr	s16, [x8, x10, lsl #2]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v3.2s, v21.2s, v6.s[1]
	fmla	v1.2s, v21.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v4.s[1]
	ldr	s22, [x8, x10, lsl #2]
	fmla	v2.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v1.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	fmla	v2.2s, v22.2s, v7.s[3]
	fmla	v3.2s, v22.2s, v6.s[3]
	fmla	v1.2s, v22.2s, v5.s[3]
	fmla	v0.2s, v22.2s, v4.s[3]
	cmp	x4, x21
	b.ge	.LBB0_116
	.p2align	2
.LBB0_121:                              //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_117 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x10, x2, x20
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x10]
	ldur	s5, [x10, #-4]
	add	x10, x10, x20
	add	x2, x2, #4
	prfm	pldl1keep, [x10]
	ldur	s6, [x10, #-4]
	add	x10, x10, x20
	prfm	pldl1keep, [x10]
	ldur	s7, [x10, #-4]
	prfm	pldl1keep, [x3]
	ldur	s16, [x3, #-4]
	add	x3, x3, #4
	fmla	v2.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v1.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	cmp	x4, x21
	b.lt	.LBB0_121
	b	.LBB0_116
	.p2align	2
.LBB0_122:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #1024]                // 8-byte Folded Reload
	ldr	x12, [sp, #920]                 // 8-byte Folded Reload
	cmp	x10, x12
	ldr	x2, [sp, #544]                  // 8-byte Folded Reload
	b.ge	.LBB0_128
// %bb.123:                             //   in Loop: Header=BB0_4 Depth=1
	ldr	x13, [sp, #1024]                // 8-byte Folded Reload
	ldr	x16, [sp, #888]                 // 8-byte Folded Reload
	mov	x14, xzr
	mov	x15, xzr
	ldr	s4, [x8]
	madd	x12, x13, x19, x5
	add	x10, x13, #1
	lsl	x12, x12, #2
	ldr	q3, [x16, x12]
	madd	x12, x10, x19, x5
	madd	x10, x10, x29, x9
	lsl	x12, x12, #2
	ldr	q2, [x16, x12]
	madd	x12, x13, x29, x9
	add	x13, x10, x4
	ldr	s0, [x24, x13, lsl #2]
	add	x12, x12, x4
	ldr	s1, [x24, x12, lsl #2]
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	xzr, x23
	ext	v5.16b, v2.16b, v2.16b, #8
	b.ge	.LBB0_125
	.p2align	2
.LBB0_124:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x0, x8, x14
	ldr	x10, [sp, #536]                 // 8-byte Folded Reload
	ldr	x17, [sp, #528]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v3.2s
	add	x1, x0, #20
	fmla	v0.2s, v4.2s, v2.2s
	add	x15, x15, #4
	prfm	pldl1keep, [x1]
	ldp	s4, s7, [x0, #4]
	add	x10, x10, x14
	add	x17, x17, x14
	add	x14, x14, #16
	add	x16, x10, #32
	add	x18, x17, #32
	fmla	v0.2s, v4.2s, v2.s[1]
	fmla	v1.2s, v4.2s, v3.s[1]
	fmla	v0.2s, v7.2s, v5.2s
	ldp	s5, s4, [x0, #12]
	fmla	v1.2s, v7.2s, v6.2s
	prfm	pldl1keep, [x18]
	fmla	v1.2s, v5.2s, v3.s[3]
	ldr	q3, [x17, #16]
	prfm	pldl1keep, [x16]
	fmla	v0.2s, v5.2s, v2.s[3]
	ldr	q2, [x10, #16]
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	x15, x23
	ext	v5.16b, v2.16b, v2.16b, #8
	b.lt	.LBB0_124
.LBB0_125:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #912]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v3.2s
	fmla	v0.2s, v4.2s, v2.2s
	ldr	x16, [sp, #1032]                // 8-byte Folded Reload
	mov	x14, xzr
	ldr	s7, [x8, x10, lsl #2]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	s4, [x8, x10, lsl #2]
	ldr	x10, [sp, #896]                 // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v3.s[1]
	fmla	v0.2s, v7.2s, v2.s[1]
	ldr	s7, [x8, x10, lsl #2]
	ldr	x10, [sp, #104]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v6.2s
	fmla	v0.2s, v4.2s, v5.2s
	add	x15, x8, x10
	fmla	v1.2s, v7.2s, v3.s[3]
	fmla	v0.2s, v7.2s, v2.s[3]
	cmp	x16, x21
	b.ge	.LBB0_127
	.p2align	2
.LBB0_126:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [sp, #656]                  // 8-byte Folded Reload
	add	x10, x15, x14
	add	x17, x2, x14
	add	x16, x16, #1
	add	x10, x10, #4
	add	x17, x17, #4
	add	x18, x0, x14
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	prfm	pldl1keep, [x17]
	ldr	s2, [x0, x14]
	prfm	pldl1keep, [x10]
	ldr	s3, [x15, x14]
	fmla	v1.2s, v3.2s, v2.2s
	ldr	s2, [x2, x14]
	add	x14, x14, #4
	fmla	v0.2s, v3.2s, v2.2s
	cmp	x16, x21
	b.lt	.LBB0_126
.LBB0_127:                              //   in Loop: Header=BB0_4 Depth=1
	str	s1, [x24, x12, lsl #2]
	str	s0, [x24, x13, lsl #2]
.LBB0_128:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #744]                 // 8-byte Folded Reload
	ldr	x12, [sp, #920]                 // 8-byte Folded Reload
	cmp	x12, x10
	b.ge	.LBB0_2
// %bb.129:                             //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #920]                 // 8-byte Folded Reload
	ldr	x13, [sp, #888]                 // 8-byte Folded Reload
	mov	x12, xzr
	madd	x9, x10, x29, x9
	madd	x10, x10, x19, x5
	ldr	s2, [x8]
	ldr	x14, [sp, #632]                 // 8-byte Folded Reload
	add	x9, x9, x4
	lsl	x10, x10, #2
	ldr	s0, [x24, x9, lsl #2]
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #640]                 // 8-byte Folded Reload
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	xzr, x23
	b.ge	.LBB0_131
	.p2align	2
.LBB0_130:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x11, #8
	fmla	v0.2s, v2.2s, v1.2s
	add	x12, x12, #4
	prfm	pldl1keep, [x13]
	ldp	s2, s4, [x11, #-8]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v4.2s, v3.2s
	ldp	s3, s2, [x11], #16
	prfm	pldl1keep, [x10]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x10, #-16]
	add	x10, x10, #16
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	x12, x23
	b.lt	.LBB0_130
.LBB0_131:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #912]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.2s
	mov	x10, xzr
	ldr	s4, [x8, x11, lsl #2]
	ldr	x11, [sp, #904]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[1]
	ldr	s5, [x8, x11, lsl #2]
	ldr	x11, [sp, #896]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.2s
	ldr	s2, [x8, x11, lsl #2]
	ldr	x11, [sp, #104]                 // 8-byte Folded Reload
	add	x8, x8, x11
	ldr	x11, [sp, #1032]                // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[3]
	cmp	x11, x21
	b.ge	.LBB0_1
	.p2align	2
.LBB0_132:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x8, x10
	add	x13, x14, x10
	add	x11, x11, #1
	add	x12, x12, #4
	add	x13, x13, #4
	prfm	pldl1keep, [x13]
	prfm	pldl1keep, [x12]
	ldr	s1, [x8, x10]
	ldr	s2, [x14, x10]
	add	x10, x10, #4
	fmla	v0.2s, v1.2s, v2.2s
	cmp	x11, x21
	b.lt	.LBB0_132
	b	.LBB0_1
.LBB0_133:
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	bl	free
	add	sp, sp, #1040
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	sbatch_matmul_3d_nn_mlir, .Lfunc_end0-sbatch_matmul_3d_nn_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
