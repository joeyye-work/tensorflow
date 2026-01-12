	.text
	.file	"LLVMDialectModule"
	.globl	sbatch_matmul_4d_nn_mlir                    // -- Begin function sbatch_matmul_4d_nn_mlir
	.p2align	4
	.type	sbatch_matmul_4d_nn_mlir,@function
sbatch_matmul_4d_nn_mlir:                           // @sbatch_matmul_4d_nn_mlir
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
	sub	sp, sp, #1312
	.cfi_def_cfa_offset 1472
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
	cmp	x5, #0
	ldr	x13, [sp, #1544]
	ldr	x29, [sp, #1656]
	mov	x20, x6
	cinv	x8, x5, lt
	ldr	x23, [sp, #1568]
	ldr	x27, [sp, #1512]
	mov	x21, x1
	add	x9, x8, x8, lsr #63
	add	x10, x8, #3
	ldr	x24, [sp, #1504]
	ldr	x28, [sp, #1480]
	str	x7, [sp, #1056]                 // 8-byte Folded Spill
	str	x4, [sp, #520]                  // 8-byte Folded Spill
	asr	x9, x9, #1
	str	x3, [sp, #40]                   // 8-byte Folded Spill
	str	x2, [sp, #960]                  // 8-byte Folded Spill
	cinv	x9, x9, lt
	cmp	x8, #0
	str	x5, [sp, #1024]                 // 8-byte Folded Spill
	str	x13, [sp, #504]                 // 8-byte Folded Spill
	csel	x8, x10, x8, lt
	str	x9, [sp, #1280]                 // 8-byte Folded Spill
	ldr	x9, [sp, #1552]
	cmp	x5, #0
	ldr	x10, [sp, #1600]
	asr	x8, x8, #2
	cinv	x22, x8, lt
	cmp	x13, #0
	cinv	x8, x13, lt
	str	x9, [sp, #1048]                 // 8-byte Folded Spill
	ldr	x9, [sp, #1648]
	str	x10, [sp, #944]                 // 8-byte Folded Spill
	ldr	x10, [sp, #1592]
	add	x11, x8, #7
	add	x12, x8, #3
	str	x9, [sp, #1016]                 // 8-byte Folded Spill
	ldr	x9, [sp, #1640]
	str	x10, [sp, #936]                 // 8-byte Folded Spill
	add	x10, x8, #15
	str	x9, [sp, #1008]                 // 8-byte Folded Spill
	add	x9, x8, x8, lsr #63
	asr	x9, x9, #1
	cinv	x14, x9, lt
	ldr	x9, [sp, #1560]
	cmp	x8, #0
	str	x14, [sp, #1272]                // 8-byte Folded Spill
	str	x9, [sp, #1040]                 // 8-byte Folded Spill
	csel	x9, x10, x8, lt
	csel	x10, x11, x8, lt
	csel	x8, x12, x8, lt
	cmp	x13, #0
	asr	x9, x9, #4
	asr	x8, x8, #2
	asr	x10, x10, #3
	cinv	x19, x9, lt
	cinv	x9, x8, lt
	cinv	x25, x10, lt
	lsl	x8, x19, #4
	str	x9, [sp, #1264]                 // 8-byte Folded Spill
	lsl	x26, x25, #3
	str	x8, [sp, #1104]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1472]
	str	x8, [sp, #1032]                 // 8-byte Folded Spill
	lsl	x8, x9, #2
	str	x8, [sp, #592]                  // 8-byte Folded Spill
	lsl	x8, x14, #1
	str	x8, [sp, #584]                  // 8-byte Folded Spill
	lsl	x8, x6, #6
	add	x0, x8, #64
	str	x8, [sp, #1288]                 // 8-byte Folded Spill
	bl	malloc
	ldr	x16, [sp, #1280]                // 8-byte Folded Reload
	lsl	x8, x22, #2
	mov	x30, x26
	str	x27, [sp, #928]                 // 8-byte Folded Spill
	str	x8, [sp, #1296]                 // 8-byte Folded Spill
	add	x8, x0, #63
	lsl	x12, x27, #2
	lsl	x27, x28, #2
	and	x26, x8, #0xffffffffffffffc0
	lsl	x6, x20, #2
	str	x0, [sp, #16]                   // 8-byte Folded Spill
	mov	w14, #20                        // =0x14
	madd	x14, x23, x14, x12
	mov	w11, #12                        // =0xc
	str	x6, [sp, #480]                  // 8-byte Folded Spill
	mov	w17, #28                        // =0x1c
	lsl	x9, x16, #1
	mul	x3, x16, x28
	madd	x17, x23, x17, x12
	mov	w15, #24                        // =0x18
	str	x9, [sp, #1128]                 // 8-byte Folded Spill
	negs	x9, x20
	madd	x15, x23, x15, x12
	str	x23, [sp, #1000]                // 8-byte Folded Spill
	and	x8, x9, #0x3
	and	x9, x20, #0x3
	str	x24, [sp, #920]                 // 8-byte Folded Spill
	lsl	x25, x25, #5
	csneg	x7, x9, x8, mi
	ldr	x8, [sp, #960]                  // 8-byte Folded Reload
	add	x9, x20, x27
	lsl	x19, x19, #6
	lsl	x18, x7, #2
	sub	x4, x26, x7, lsl #6
	stp	xzr, xzr, [sp, #264]            // 16-byte Folded Spill
	mov	x13, xzr
	str	x21, [sp, #952]                 // 8-byte Folded Spill
	stp	x25, x19, [sp, #464]            // 16-byte Folded Spill
	lsl	x10, x8, #2
	sub	x8, x6, x18
	str	x30, [sp, #1080]                // 8-byte Folded Spill
	str	x8, [sp, #512]                  // 8-byte Folded Spill
	sub	x8, x9, x7
	mov	w9, #1                          // =0x1
	add	x2, x10, x28, lsl #3
	bfi	x9, x22, #2, #62
	str	x8, [sp, #1304]                 // 8-byte Folded Spill
	mul	x8, x22, x28
	mul	x1, x28, x9
	add	x9, x20, x3, lsl #1
	sub	x9, x9, x7
	str	x9, [sp, #1280]                 // 8-byte Folded Spill
	ldr	x9, [sp, #1264]                 // 8-byte Folded Reload
	add	x22, x10, x8, lsl #4
	add	x5, x22, x6
	lsl	x0, x9, #4
	ldr	x9, [sp, #1272]                 // 8-byte Folded Reload
	str	x0, [sp, #456]                  // 8-byte Folded Spill
	lsl	x16, x9, #3
	add	x9, x21, x2
	add	x2, x6, x10
	str	x9, [sp, #1224]                 // 8-byte Folded Spill
	sub	x9, x2, x18
	add	x2, x24, x14
	madd	x14, x28, x11, x10
	madd	x11, x23, x11, x12
	str	x9, [sp, #1272]                 // 8-byte Folded Spill
	ldr	x9, [sp, #1288]                 // 8-byte Folded Reload
	add	x9, x4, x9
	str	x9, [sp, #848]                  // 8-byte Folded Spill
	add	x9, x10, x1, lsl #2
	add	x1, x10, x3, lsl #3
	add	x3, x24, x15
	stp	x2, x3, [sp, #232]              // 16-byte Folded Spill
	add	x4, x9, x6
	add	x6, x1, x6
	str	x9, [sp, #1256]                 // 8-byte Folded Spill
	sub	x9, x20, x7
	sub	x8, x4, x18
	add	x4, x24, x17
	str	x8, [sp, #1264]                 // 8-byte Folded Spill
	sub	x8, x5, x18
	str	x8, [sp, #1248]                 // 8-byte Folded Spill
	sub	x8, x6, x18
	add	x6, x12, x23, lsl #5
	str	x8, [sp, #1216]                 // 8-byte Folded Spill
	add	x8, x21, x14
	lsl	x14, x23, #4
	str	x14, [sp, #1240]                // 8-byte Folded Spill
	add	x14, x14, x12
	str	x8, [sp, #1288]                 // 8-byte Folded Spill
	ldr	x8, [sp, #512]                  // 8-byte Folded Reload
	add	x6, x24, x6
	add	x18, x24, x14
	lsl	x14, x23, #2
	stp	x4, x6, [sp, #248]              // 16-byte Folded Spill
	str	x14, [sp, #992]                 // 8-byte Folded Spill
	add	x14, x14, x12
	add	x17, x24, x14
	add	x14, x12, x23, lsl #3
	add	x8, x8, #4
	stp	x17, x18, [sp, #216]            // 16-byte Folded Spill
	add	x15, x24, x14
	add	x14, x24, x11
	mul	x11, x23, x9
	str	x8, [sp, #448]                  // 8-byte Folded Spill
	stp	x14, x15, [sp, #200]            // 16-byte Folded Spill
	add	x11, x12, x11, lsl #2
	madd	x12, x23, x8, x12
	ldr	x8, [sp, #1272]                 // 8-byte Folded Reload
	add	x23, x24, x11
	add	x5, x24, x12
	add	x12, x8, x21
	ldr	x8, [sp, #1304]                 // 8-byte Folded Reload
	add	x24, x21, x10
	str	x9, [sp, #1304]                 // 8-byte Folded Spill
	add	x12, x12, #4
	str	x5, [sp, #192]                  // 8-byte Folded Spill
	add	x5, x5, x16
	stp	x23, x12, [sp, #176]            // 16-byte Folded Spill
	add	x11, x10, x8, lsl #2
	ldr	x8, [sp, #1280]                 // 8-byte Folded Reload
	add	x12, x10, x8, lsl #2
	add	x10, x10, x21
	lsl	x8, x28, #4
	add	x10, x8, x10
	str	x8, [sp, #1232]                 // 8-byte Folded Spill
	add	x8, x10, #32
	add	x10, x11, x21
	ldr	x11, [sp, #848]                 // 8-byte Folded Reload
	str	x8, [sp, #168]                  // 8-byte Folded Spill
	add	x8, x10, #4
	ldr	x10, [sp, #1264]                // 8-byte Folded Reload
	str	x8, [sp, #160]                  // 8-byte Folded Spill
	ldr	x8, [sp, #1256]                 // 8-byte Folded Reload
	add	x10, x21, x10
	str	x10, [sp, #1168]                // 8-byte Folded Spill
	ldr	x10, [sp, #1248]                // 8-byte Folded Reload
	add	x8, x21, x8
	str	x8, [sp, #1184]                 // 8-byte Folded Spill
	add	x8, x21, x22
	sub	x22, x9, #4
	str	x8, [sp, #1176]                 // 8-byte Folded Spill
	add	x10, x21, x10
	str	x10, [sp, #1160]                // 8-byte Folded Spill
	add	x10, x1, x21
	lsl	x1, x20, #3
	add	x10, x10, #32
	str	x1, [sp, #424]                  // 8-byte Folded Spill
	sub	x1, x1, x7, lsl #3
	str	x10, [sp, #152]                 // 8-byte Folded Spill
	add	x10, x12, x21
	lsl	x12, x20, #4
	add	x10, x10, #4
	str	x10, [sp, #144]                 // 8-byte Folded Spill
	ldr	x10, [sp, #1216]                // 8-byte Folded Reload
	str	x24, [sp, #1216]                // 8-byte Folded Spill
	add	x10, x21, x10
	str	x10, [sp, #136]                 // 8-byte Folded Spill
	lsl	x10, x20, #5
	stp	x12, x10, [sp, #432]            // 16-byte Folded Spill
	sub	x10, x10, x7, lsl #5
	sub	x12, x12, x7, lsl #4
	add	x7, x6, x16
	stp	x7, x1, [sp, #400]              // 16-byte Folded Spill
	add	x7, x4, x16
	str	x7, [sp, #392]                  // 8-byte Folded Spill
	add	x7, x3, x16
	str	x10, [sp, #416]                 // 8-byte Folded Spill
	str	x12, [sp, #280]                 // 8-byte Folded Spill
	str	x7, [sp, #384]                  // 8-byte Folded Spill
	add	x7, x2, x16
	str	x7, [sp, #840]                  // 8-byte Folded Spill
	add	x7, x18, x16
	str	x7, [sp, #832]                  // 8-byte Folded Spill
	add	x7, x17, x16
	str	x7, [sp, #824]                  // 8-byte Folded Spill
	add	x7, x15, x16
	str	x7, [sp, #816]                  // 8-byte Folded Spill
	add	x7, x14, x16
	add	x16, x23, x16
	stp	x16, x5, [sp, #120]             // 16-byte Folded Spill
	sub	x16, x9, #3
	str	x7, [sp, #808]                  // 8-byte Folded Spill
	str	x16, [sp, #984]                 // 8-byte Folded Spill
	sub	x16, x9, #2
	sub	x9, x9, #1
	str	x16, [sp, #976]                 // 8-byte Folded Spill
	add	x16, x26, #128
	str	x9, [sp, #968]                  // 8-byte Folded Spill
	ldr	x9, [sp, #1048]                 // 8-byte Folded Reload
	str	x16, [sp, #912]                 // 8-byte Folded Spill
	add	x16, x26, #256
	str	x16, [sp, #1200]                // 8-byte Folded Spill
	add	x16, x11, #64
	add	x11, x10, #32
	add	x10, x6, x25
	stp	x10, x11, [sp, #328]            // 16-byte Folded Spill
	add	x10, x4, x25
	add	x11, x12, #16
	str	x16, [sp, #1192]                // 8-byte Folded Spill
	add	x16, x6, x19
	ldr	x12, [sp, #1288]                // 8-byte Folded Reload
	str	x10, [sp, #320]                 // 8-byte Folded Spill
	add	x10, x3, x25
	lsl	x9, x9, #2
	str	x16, [sp, #376]                 // 8-byte Folded Spill
	add	x16, x4, x19
	str	x10, [sp, #776]                 // 8-byte Folded Spill
	add	x10, x2, x25
	str	x9, [sp, #32]                   // 8-byte Folded Spill
	ldr	x9, [sp, #1040]                 // 8-byte Folded Reload
	str	x16, [sp, #368]                 // 8-byte Folded Spill
	add	x16, x3, x19
	str	x10, [sp, #768]                 // 8-byte Folded Spill
	add	x10, x18, x25
	str	x16, [sp, #360]                 // 8-byte Folded Spill
	add	x16, x2, x19
	str	x10, [sp, #760]                 // 8-byte Folded Spill
	add	x10, x17, x25
	str	x16, [sp, #352]                 // 8-byte Folded Spill
	add	x16, x18, x19
	stp	x24, x12, [sp, #104]            // 16-byte Folded Spill
	str	x10, [sp, #752]                 // 8-byte Folded Spill
	add	x10, x15, x25
	str	x16, [sp, #344]                 // 8-byte Folded Spill
	add	x16, x17, x19
	str	x10, [sp, #744]                 // 8-byte Folded Spill
	add	x10, x14, x25
	lsl	x9, x9, #2
	str	x16, [sp, #800]                 // 8-byte Folded Spill
	add	x16, x15, x19
	str	x10, [sp, #736]                 // 8-byte Folded Spill
	add	x10, x6, x0
	str	x9, [sp, #496]                  // 8-byte Folded Spill
	ldr	x9, [sp, #1056]                 // 8-byte Folded Reload
	str	x16, [sp, #792]                 // 8-byte Folded Spill
	add	x16, x14, x19
	stp	x10, x11, [sp, #304]            // 16-byte Folded Spill
	add	x10, x4, x0
	ldr	x11, [sp, #1224]                // 8-byte Folded Reload
	str	x16, [sp, #784]                 // 8-byte Folded Spill
	str	x10, [sp, #296]                 // 8-byte Folded Spill
	add	x10, x3, x0
	str	x10, [sp, #728]                 // 8-byte Folded Spill
	add	x10, x2, x0
	str	x10, [sp, #720]                 // 8-byte Folded Spill
	add	x10, x18, x0
	lsl	x9, x9, #2
	str	x10, [sp, #712]                 // 8-byte Folded Spill
	add	x10, x17, x0
	str	x9, [sp, #24]                   // 8-byte Folded Spill
	ldr	x9, [sp, #1032]                 // 8-byte Folded Reload
	str	x10, [sp, #704]                 // 8-byte Folded Spill
	add	x10, x15, x0
	str	x10, [sp, #696]                 // 8-byte Folded Spill
	add	x10, x14, x0
	str	x10, [sp, #688]                 // 8-byte Folded Spill
	add	x10, x1, #8
	str	x10, [sp, #288]                 // 8-byte Folded Spill
	mov	x10, x8
	ldr	x8, [sp, #1184]                 // 8-byte Folded Reload
	lsl	x9, x9, #2
	str	x9, [sp, #488]                  // 8-byte Folded Spill
	add	x9, x24, x27
	str	x9, [sp, #1208]                 // 8-byte Folded Spill
	str	x9, [sp, #96]                   // 8-byte Folded Spill
	mov	x9, x8
	ldr	x8, [sp, #1160]                 // 8-byte Folded Reload
	stp	x8, x11, [sp, #80]              // 16-byte Folded Spill
	ldr	x8, [sp, #1168]                 // 8-byte Folded Reload
	str	x8, [sp, #72]                   // 8-byte Folded Spill
	b	.LBB0_2
	.p2align	2
.LBB0_1:                                // %.loopexit68
                                        //   in Loop: Header=BB0_2 Depth=1
	ldr	x8, [sp, #264]                  // 8-byte Folded Reload
	ldp	x10, x9, [sp, #24]              // 16-byte Folded Reload
	add	x8, x8, x10
	ldr	x13, [sp, #48]                  // 8-byte Folded Reload
	str	x8, [sp, #264]                  // 8-byte Folded Spill
	ldr	x8, [sp, #256]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #256]                  // 8-byte Folded Spill
	ldr	x8, [sp, #248]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #248]                  // 8-byte Folded Spill
	ldr	x8, [sp, #240]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #240]                  // 8-byte Folded Spill
	ldr	x8, [sp, #232]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #232]                  // 8-byte Folded Spill
	ldr	x8, [sp, #224]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #224]                  // 8-byte Folded Spill
	ldr	x8, [sp, #216]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #216]                  // 8-byte Folded Spill
	ldr	x8, [sp, #208]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #208]                  // 8-byte Folded Spill
	ldr	x8, [sp, #200]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #200]                  // 8-byte Folded Spill
	ldr	x8, [sp, #192]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #192]                  // 8-byte Folded Spill
	ldr	x8, [sp, #184]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #184]                  // 8-byte Folded Spill
	ldr	x8, [sp, #176]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #176]                  // 8-byte Folded Spill
	ldr	x8, [sp, #168]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #168]                  // 8-byte Folded Spill
	ldr	x8, [sp, #160]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #160]                  // 8-byte Folded Spill
	ldr	x8, [sp, #152]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #152]                  // 8-byte Folded Spill
	ldr	x8, [sp, #144]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #144]                  // 8-byte Folded Spill
	ldr	x8, [sp, #136]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #136]                  // 8-byte Folded Spill
	ldr	x8, [sp, #272]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #272]                  // 8-byte Folded Spill
	ldr	x8, [sp, #72]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #72]                   // 8-byte Folded Spill
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #80]                   // 8-byte Folded Spill
	ldr	x8, [sp, #88]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #88]                   // 8-byte Folded Spill
	ldr	x8, [sp, #96]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #96]                   // 8-byte Folded Spill
	ldr	x8, [sp, #104]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #104]                  // 8-byte Folded Spill
	ldr	x8, [sp, #112]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #112]                  // 8-byte Folded Spill
	ldr	x8, [sp, #128]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #128]                  // 8-byte Folded Spill
	ldr	x8, [sp, #120]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #120]                  // 8-byte Folded Spill
	ldp	x9, x8, [sp, #56]               // 16-byte Folded Reload
	add	x9, x9, x10
	add	x10, x8, x10
.LBB0_2:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_11 Depth 3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_21 Depth 5
                                        //           Child Loop BB0_23 Depth 5
                                        //         Child Loop BB0_26 Depth 4
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_32 Depth 4
                                        //         Child Loop BB0_34 Depth 4
                                        //       Child Loop BB0_40 Depth 3
                                        //       Child Loop BB0_43 Depth 3
                                        //       Child Loop BB0_46 Depth 3
                                        //         Child Loop BB0_48 Depth 4
                                        //         Child Loop BB0_50 Depth 4
                                        //       Child Loop BB0_53 Depth 3
                                        //       Child Loop BB0_55 Depth 3
                                        //       Child Loop BB0_59 Depth 3
                                        //       Child Loop BB0_61 Depth 3
                                        //       Child Loop BB0_65 Depth 3
                                        //       Child Loop BB0_68 Depth 3
                                        //       Child Loop BB0_71 Depth 3
                                        //         Child Loop BB0_73 Depth 4
                                        //         Child Loop BB0_75 Depth 4
                                        //       Child Loop BB0_78 Depth 3
                                        //       Child Loop BB0_80 Depth 3
                                        //       Child Loop BB0_84 Depth 3
                                        //       Child Loop BB0_86 Depth 3
                                        //       Child Loop BB0_90 Depth 3
                                        //       Child Loop BB0_93 Depth 3
                                        //       Child Loop BB0_96 Depth 3
                                        //         Child Loop BB0_98 Depth 4
                                        //         Child Loop BB0_100 Depth 4
                                        //       Child Loop BB0_103 Depth 3
                                        //       Child Loop BB0_105 Depth 3
                                        //       Child Loop BB0_109 Depth 3
                                        //       Child Loop BB0_111 Depth 3
                                        //       Child Loop BB0_115 Depth 3
                                        //       Child Loop BB0_118 Depth 3
                                        //       Child Loop BB0_121 Depth 3
                                        //         Child Loop BB0_123 Depth 4
                                        //         Child Loop BB0_125 Depth 4
                                        //       Child Loop BB0_128 Depth 3
                                        //       Child Loop BB0_130 Depth 3
                                        //       Child Loop BB0_134 Depth 3
                                        //       Child Loop BB0_136 Depth 3
	ldr	x8, [sp, #40]                   // 8-byte Folded Reload
	cmp	x13, x8
	b.ge	.LBB0_137
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	add	x8, x13, #1
	str	x10, [sp, #64]                  // 8-byte Folded Spill
	ldp	x15, x16, [sp, #216]            // 16-byte Folded Reload
	stp	x8, x9, [sp, #48]               // 16-byte Folded Spill
	mov	x19, xzr
	str	x10, [sp, #616]                 // 8-byte Folded Spill
	str	x9, [sp, #608]                  // 8-byte Folded Spill
	ldp	x10, x8, [sp, #120]             // 16-byte Folded Reload
	str	x13, [sp, #1064]                // 8-byte Folded Spill
	str	x8, [sp, #600]                  // 8-byte Folded Spill
	ldp	x8, x9, [sp, #104]              // 16-byte Folded Reload
	ldp	x13, x14, [sp, #200]            // 16-byte Folded Reload
	str	x9, [sp, #888]                  // 8-byte Folded Spill
	str	x8, [sp, #872]                  // 8-byte Folded Spill
	ldp	x8, x9, [sp, #88]               // 16-byte Folded Reload
	str	x9, [sp, #864]                  // 8-byte Folded Spill
	str	x8, [sp, #856]                  // 8-byte Folded Spill
	ldp	x8, x9, [sp, #72]               // 16-byte Folded Reload
	str	x8, [sp, #680]                  // 8-byte Folded Spill
	ldr	x8, [sp, #272]                  // 8-byte Folded Reload
	str	x9, [sp, #648]                  // 8-byte Folded Spill
	str	x8, [sp, #656]                  // 8-byte Folded Spill
	ldp	x12, x8, [sp, #136]             // 16-byte Folded Reload
	str	x8, [sp, #880]                  // 8-byte Folded Spill
	ldp	x9, x8, [sp, #152]              // 16-byte Folded Reload
	str	x9, [sp, #904]                  // 8-byte Folded Spill
	str	x8, [sp, #1096]                 // 8-byte Folded Spill
	ldp	x9, x8, [sp, #168]              // 16-byte Folded Reload
	str	x9, [sp, #1088]                 // 8-byte Folded Spill
	str	x8, [sp, #672]                  // 8-byte Folded Spill
	ldp	x9, x8, [sp, #184]              // 16-byte Folded Reload
	str	x8, [sp, #664]                  // 8-byte Folded Spill
	str	x9, [sp, #1152]                 // 8-byte Folded Spill
	ldp	x17, x8, [sp, #232]             // 16-byte Folded Reload
	str	x8, [sp, #640]                  // 8-byte Folded Spill
	ldp	x9, x8, [sp, #248]              // 16-byte Folded Reload
	str	x8, [sp, #624]                  // 8-byte Folded Spill
	ldr	x8, [sp, #264]                  // 8-byte Folded Reload
	str	x9, [sp, #632]                  // 8-byte Folded Spill
	str	x8, [sp, #1120]                 // 8-byte Folded Spill
	b	.LBB0_7
	.p2align	2
.LBB0_4:                                //   in Loop: Header=BB0_7 Depth=2
	str	s0, [x15, x9, lsl #2]
.LBB0_5:                                //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x30, [sp, #1080]                // 8-byte Folded Reload
.LBB0_6:                                // %.backedge69
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x9, [sp, #488]                  // 8-byte Folded Reload
	ldr	x8, [sp, #1120]                 // 8-byte Folded Reload
	add	x8, x8, x9
	ldr	x10, [sp, #624]                 // 8-byte Folded Reload
	ldr	x17, [sp, #536]                 // 8-byte Folded Reload
	ldr	x16, [sp, #544]                 // 8-byte Folded Reload
	ldr	x15, [sp, #552]                 // 8-byte Folded Reload
	ldr	x14, [sp, #560]                 // 8-byte Folded Reload
	ldr	x13, [sp, #568]                 // 8-byte Folded Reload
	ldr	x12, [sp, #896]                 // 8-byte Folded Reload
	ldr	x19, [sp, #528]                 // 8-byte Folded Reload
	add	x12, x12, x9
	str	x8, [sp, #1120]                 // 8-byte Folded Spill
	ldr	x8, [sp, #496]                  // 8-byte Folded Reload
	add	x10, x10, x8
	add	x17, x17, x8
	add	x16, x16, x8
	add	x15, x15, x8
	add	x14, x14, x8
	add	x13, x13, x8
	str	x10, [sp, #624]                 // 8-byte Folded Spill
	ldr	x10, [sp, #632]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #632]                 // 8-byte Folded Spill
	ldr	x10, [sp, #640]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #640]                 // 8-byte Folded Spill
	ldr	x10, [sp, #664]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #664]                 // 8-byte Folded Spill
	ldr	x10, [sp, #1152]                // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #1152]                // 8-byte Folded Spill
	ldr	x10, [sp, #672]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #672]                 // 8-byte Folded Spill
	ldr	x10, [sp, #1088]                // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #1088]                // 8-byte Folded Spill
	ldr	x10, [sp, #1096]                // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #1096]                // 8-byte Folded Spill
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #904]                 // 8-byte Folded Spill
	ldr	x10, [sp, #880]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #880]                 // 8-byte Folded Spill
	ldr	x10, [sp, #656]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #656]                 // 8-byte Folded Spill
	ldr	x10, [sp, #680]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #680]                 // 8-byte Folded Spill
	ldr	x10, [sp, #648]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #648]                 // 8-byte Folded Spill
	ldr	x10, [sp, #856]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #856]                 // 8-byte Folded Spill
	ldr	x10, [sp, #864]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #864]                 // 8-byte Folded Spill
	ldr	x10, [sp, #872]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #872]                 // 8-byte Folded Spill
	ldr	x10, [sp, #888]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #888]                 // 8-byte Folded Spill
	ldr	x10, [sp, #600]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #600]                 // 8-byte Folded Spill
	ldr	x10, [sp, #576]                 // 8-byte Folded Reload
	add	x10, x10, x8
	ldr	x8, [sp, #608]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #608]                  // 8-byte Folded Spill
	ldr	x8, [sp, #616]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #616]                  // 8-byte Folded Spill
.LBB0_7:                                //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_11 Depth 3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_21 Depth 5
                                        //           Child Loop BB0_23 Depth 5
                                        //         Child Loop BB0_26 Depth 4
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_32 Depth 4
                                        //         Child Loop BB0_34 Depth 4
                                        //       Child Loop BB0_40 Depth 3
                                        //       Child Loop BB0_43 Depth 3
                                        //       Child Loop BB0_46 Depth 3
                                        //         Child Loop BB0_48 Depth 4
                                        //         Child Loop BB0_50 Depth 4
                                        //       Child Loop BB0_53 Depth 3
                                        //       Child Loop BB0_55 Depth 3
                                        //       Child Loop BB0_59 Depth 3
                                        //       Child Loop BB0_61 Depth 3
                                        //       Child Loop BB0_65 Depth 3
                                        //       Child Loop BB0_68 Depth 3
                                        //       Child Loop BB0_71 Depth 3
                                        //         Child Loop BB0_73 Depth 4
                                        //         Child Loop BB0_75 Depth 4
                                        //       Child Loop BB0_78 Depth 3
                                        //       Child Loop BB0_80 Depth 3
                                        //       Child Loop BB0_84 Depth 3
                                        //       Child Loop BB0_86 Depth 3
                                        //       Child Loop BB0_90 Depth 3
                                        //       Child Loop BB0_93 Depth 3
                                        //       Child Loop BB0_96 Depth 3
                                        //         Child Loop BB0_98 Depth 4
                                        //         Child Loop BB0_100 Depth 4
                                        //       Child Loop BB0_103 Depth 3
                                        //       Child Loop BB0_105 Depth 3
                                        //       Child Loop BB0_109 Depth 3
                                        //       Child Loop BB0_111 Depth 3
                                        //       Child Loop BB0_115 Depth 3
                                        //       Child Loop BB0_118 Depth 3
                                        //       Child Loop BB0_121 Depth 3
                                        //         Child Loop BB0_123 Depth 4
                                        //         Child Loop BB0_125 Depth 4
                                        //       Child Loop BB0_128 Depth 3
                                        //       Child Loop BB0_130 Depth 3
                                        //       Child Loop BB0_134 Depth 3
                                        //       Child Loop BB0_136 Depth 3
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	cmp	x19, x8
	b.ge	.LBB0_1
// %bb.8:                               //   in Loop: Header=BB0_7 Depth=2
	add	x8, x19, #1
	str	x15, [sp, #552]                 // 8-byte Folded Spill
	mov	x0, xzr
	str	x15, [sp, #1264]                // 8-byte Folded Spill
	ldr	x15, [sp, #640]                 // 8-byte Folded Reload
	str	x8, [sp, #528]                  // 8-byte Folded Spill
	ldr	x8, [sp, #672]                  // 8-byte Folded Reload
	str	x16, [sp, #544]                 // 8-byte Folded Spill
	str	x16, [sp, #1256]                // 8-byte Folded Spill
	ldr	x16, [sp, #632]                 // 8-byte Folded Reload
	str	x17, [sp, #536]                 // 8-byte Folded Spill
	str	x17, [sp, #1248]                // 8-byte Folded Spill
	ldr	x17, [sp, #624]                 // 8-byte Folded Reload
	str	x12, [sp, #896]                 // 8-byte Folded Spill
	str	x10, [sp, #576]                 // 8-byte Folded Spill
	str	x13, [sp, #568]                 // 8-byte Folded Spill
	str	x13, [sp, #1280]                // 8-byte Folded Spill
	str	x14, [sp, #560]                 // 8-byte Folded Spill
	str	x14, [sp, #1272]                // 8-byte Folded Spill
	str	x19, [sp, #1072]                // 8-byte Folded Spill
	str	x8, [sp, #1144]                 // 8-byte Folded Spill
	ldr	x8, [sp, #664]                  // 8-byte Folded Reload
	str	x8, [sp, #1136]                 // 8-byte Folded Spill
	b	.LBB0_11
	.p2align	2
.LBB0_9:                                //   in Loop: Header=BB0_11 Depth=3
	stp	q3, q2, [x8]
	stp	q1, q0, [x8, #32]
.LBB0_10:                               // %.backedge
                                        //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #1248]                 // 8-byte Folded Reload
	ldr	x0, [sp, #1112]                 // 8-byte Folded Reload
	add	x17, x17, #64
	add	x16, x16, #64
	add	x15, x15, #64
	add	x8, x8, #64
	str	x8, [sp, #1248]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1256]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1256]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1264]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1264]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1272]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1272]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1280]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1280]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1136]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1136]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1144]                 // 8-byte Folded Reload
	add	x8, x8, #64
	str	x8, [sp, #1144]                 // 8-byte Folded Spill
.LBB0_11:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //         Child Loop BB0_19 Depth 4
                                        //           Child Loop BB0_21 Depth 5
                                        //           Child Loop BB0_23 Depth 5
                                        //         Child Loop BB0_26 Depth 4
                                        //         Child Loop BB0_28 Depth 4
                                        //         Child Loop BB0_32 Depth 4
                                        //         Child Loop BB0_34 Depth 4
	ldr	x8, [sp, #1104]                 // 8-byte Folded Reload
	cmp	x0, x8
	b.ge	.LBB0_35
// %bb.12:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #944]                  // 8-byte Folded Reload
	ldr	x9, [sp, #936]                  // 8-byte Folded Reload
	mov	x5, xzr
	mov	x7, xzr
	ldr	x10, [sp, #928]                 // 8-byte Folded Reload
	ldr	x11, [sp, #920]                 // 8-byte Folded Reload
	add	x1, x9, x8, lsl #2
	add	x8, x0, #16
	add	x14, x11, x10, lsl #2
	ldr	x11, [sp, #1008]                // 8-byte Folded Reload
	ldr	x12, [sp, #1064]                // 8-byte Folded Reload
	ldr	x10, [sp, #1040]                // 8-byte Folded Reload
	lsl	x9, x29, #1
	str	x8, [sp, #1112]                 // 8-byte Folded Spill
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	mul	x10, x19, x10
	mul	x8, x19, x8
	madd	x2, x12, x11, x8
	ldr	x11, [sp, #1048]                // 8-byte Folded Reload
	add	x8, x9, x29
	madd	x6, x12, x11, x10
	add	x10, x2, x0
	add	x11, x1, x10, lsl #2
	add	x8, x10, x8
	add	x9, x10, x9
	add	x10, x10, x29
	add	x8, x1, x8, lsl #2
	add	x9, x1, x9, lsl #2
	add	x10, x1, x10, lsl #2
	ldp	q4, q3, [x11, #32]
	ldp	q1, q0, [x11]
	add	x11, x6, x0
	ldp	q18, q16, [x8, #32]
	ldp	q23, q21, [x8]
	ldp	q19, q17, [x9, #32]
	ldp	q22, q20, [x9]
	ldr	x9, [sp, #1056]                 // 8-byte Folded Reload
	ldp	q5, q2, [x10, #32]
	add	x8, x14, x11, lsl #2
	ldp	q7, q6, [x10]
	ldr	x10, [sp, #952]                 // 8-byte Folded Reload
	ldp	q29, q28, [x8, #32]
	ldp	q31, q30, [x8]
	ldr	x8, [sp, #1032]                 // 8-byte Folded Reload
	mul	x8, x19, x8
	ldr	x19, [sp, #1120]                // 8-byte Folded Reload
	madd	x4, x12, x9, x8
	ldr	x9, [sp, #960]                  // 8-byte Folded Reload
	add	x3, x10, x9, lsl #2
	lsl	x8, x4, #2
	ldr	q26, [x3, x8]
	add	x8, x4, x28
	lsl	x8, x8, #2
	ldr	q25, [x3, x8]
	add	x8, x4, x28, lsl #1
	lsl	x8, x8, #2
	ldr	q24, [x3, x8]
	ldr	x8, [sp, #912]                  // 8-byte Folded Reload
	.p2align	2
.LBB0_13:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	x9, [sp, #1288]                 // 8-byte Folded Reload
	fmla	v1.4s, v31.4s, v26.s[0]
	fmla	v0.4s, v30.4s, v26.s[0]
	cmp	x7, x22
	add	x9, x9, x19
	prfm	pldl1keep, [x9, #16]
	ldr	q27, [x9]
	b.ge	.LBB0_15
// %bb.14:                              //   in Loop: Header=BB0_13 Depth=4
	ldr	x11, [sp, #1216]                // 8-byte Folded Reload
	ldr	x12, [sp, #1264]                // 8-byte Folded Reload
	fmla	v4.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	ldr	x9, [sp, #1224]                 // 8-byte Folded Reload
	ldr	x10, [sp, #1208]                // 8-byte Folded Reload
	fmla	v7.4s, v31.4s, v25.s[0]
	fmla	v6.4s, v30.4s, v25.s[0]
	fmla	v5.4s, v29.4s, v25.s[0]
	fmla	v2.4s, v28.4s, v25.s[0]
	stp	q31, q30, [x8, #-128]
	fmla	v17.4s, v28.4s, v24.s[0]
	fmla	v19.4s, v29.4s, v24.s[0]
	stp	q29, q28, [x8, #-96]
	add	x21, x11, x19
	ldr	x11, [sp, #1248]                // 8-byte Folded Reload
	add	x12, x12, x5
	fmla	v22.4s, v31.4s, v24.s[0]
	fmla	v20.4s, v30.4s, v24.s[0]
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v18.4s, v29.4s, v27.s[0]
	add	x30, x16, x5
	fmla	v21.4s, v30.4s, v27.s[0]
	fmla	v23.4s, v31.4s, v27.s[0]
	add	x9, x9, x19
	add	x10, x10, x19
	add	x23, x9, #32
	add	x24, x10, #32
	add	x25, x21, #32
	add	x7, x7, #4
	add	x11, x11, x5
	add	x19, x19, #16
	prfm	pldl1keep, [x11]
	ldr	x13, [sp, #1272]                // 8-byte Folded Reload
	ldp	q28, q29, [x12, #32]
	ldp	q30, q31, [x12]
	add	x12, x15, x5
	add	x11, x17, x5
	add	x18, x13, x5
	fmla	v3.4s, v29.4s, v26.s[1]
	fmla	v0.4s, v31.4s, v26.s[1]
	fmla	v2.4s, v29.4s, v25.s[1]
	fmla	v6.4s, v31.4s, v25.s[1]
	fmla	v20.4s, v31.4s, v24.s[1]
	fmla	v17.4s, v29.4s, v24.s[1]
	fmla	v21.4s, v31.4s, v27.s[1]
	fmla	v16.4s, v29.4s, v27.s[1]
	fmla	v4.4s, v28.4s, v26.s[1]
	fmla	v1.4s, v30.4s, v26.s[1]
	fmla	v5.4s, v28.4s, v25.s[1]
	fmla	v7.4s, v30.4s, v25.s[1]
	fmla	v22.4s, v30.4s, v24.s[1]
	stp	q28, q29, [x8, #-32]
	fmla	v19.4s, v28.4s, v24.s[1]
	fmla	v23.4s, v30.4s, v27.s[1]
	fmla	v18.4s, v28.4s, v27.s[1]
	stp	q30, q31, [x8, #-64]
	prfm	pldl1keep, [x12]
	ldp	q29, q28, [x18, #32]
	ldp	q31, q30, [x18]
	ldr	x12, [sp, #1280]                // 8-byte Folded Reload
	add	x12, x12, x5
	fmla	v0.4s, v30.4s, v26.s[2]
	fmla	v3.4s, v28.4s, v26.s[2]
	fmla	v2.4s, v28.4s, v25.s[2]
	fmla	v17.4s, v28.4s, v24.s[2]
	fmla	v6.4s, v30.4s, v25.s[2]
	fmla	v20.4s, v30.4s, v24.s[2]
	stp	q31, q30, [x8]
	stp	q29, q28, [x8, #32]
	prfm	pldl1keep, [x30]
	ldp	q8, q9, [x12]
	fmla	v1.4s, v31.4s, v26.s[2]
	ldp	q10, q11, [x12, #32]
	ldr	x12, [sp, #1256]                // 8-byte Folded Reload
	fmla	v4.4s, v29.4s, v26.s[2]
	fmla	v5.4s, v29.4s, v25.s[2]
	fmla	v19.4s, v29.4s, v24.s[2]
	fmla	v7.4s, v31.4s, v25.s[2]
	fmla	v22.4s, v31.4s, v24.s[2]
	add	x12, x12, x5
	fmla	v16.4s, v28.4s, v27.s[2]
	fmla	v18.4s, v29.4s, v27.s[2]
	fmla	v21.4s, v30.4s, v27.s[2]
	fmla	v23.4s, v31.4s, v27.s[2]
	fmla	v3.4s, v11.4s, v26.s[3]
	fmla	v4.4s, v10.4s, v26.s[3]
	fmla	v0.4s, v9.4s, v26.s[3]
	stp	q8, q9, [x8, #64]
	stp	q10, q11, [x8, #96]
	prfm	pldl1keep, [x11]
	fmla	v1.4s, v8.4s, v26.s[3]
	fmla	v2.4s, v11.4s, v25.s[3]
	fmla	v5.4s, v10.4s, v25.s[3]
	fmla	v6.4s, v9.4s, v25.s[3]
	fmla	v7.4s, v8.4s, v25.s[3]
	ldp	q29, q28, [x12, #32]
	fmla	v20.4s, v9.4s, v24.s[3]
	fmla	v22.4s, v8.4s, v24.s[3]
	fmla	v19.4s, v10.4s, v24.s[3]
	fmla	v17.4s, v11.4s, v24.s[3]
	ldp	q31, q30, [x12]
	prfm	pldl1keep, [x25]
	ldr	q26, [x21, #16]
	prfm	pldl1keep, [x24]
	ldr	q25, [x10, #16]
	prfm	pldl1keep, [x23]
	ldr	q24, [x9, #16]
	ldr	x9, [sp, #1240]                 // 8-byte Folded Reload
	fmla	v23.4s, v8.4s, v27.s[3]
	fmla	v21.4s, v9.4s, v27.s[3]
	fmla	v18.4s, v10.4s, v27.s[3]
	fmla	v16.4s, v11.4s, v27.s[3]
	add	x5, x5, x9
	add	x8, x8, #256
	b	.LBB0_13
	.p2align	2
.LBB0_15:                               //   in Loop: Header=BB0_11 Depth=3
	ldr	x11, [sp, #1000]                // 8-byte Folded Reload
	ldr	x12, [sp, #984]                 // 8-byte Folded Reload
	add	x9, x26, x22, lsl #6
	fmla	v4.4s, v29.4s, v26.s[0]
	ldr	x13, [sp, #976]                 // 8-byte Folded Reload
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v2.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v31.4s, v25.s[0]
	stp	q31, q30, [x9]
	stp	q29, q28, [x9, #32]
	fmla	v6.4s, v30.4s, v25.s[0]
	fmla	v5.4s, v29.4s, v25.s[0]
	fmla	v17.4s, v28.4s, v24.s[0]
	fmla	v19.4s, v29.4s, v24.s[0]
	madd	x8, x12, x11, x6
	madd	x10, x13, x11, x6
	fmla	v20.4s, v30.4s, v24.s[0]
	fmla	v22.4s, v31.4s, v24.s[0]
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v18.4s, v29.4s, v27.s[0]
	add	x5, x26, x12, lsl #6
	ldr	x12, [sp, #968]                 // 8-byte Folded Reload
	fmla	v21.4s, v30.4s, v27.s[0]
	fmla	v23.4s, v31.4s, v27.s[0]
	ldr	x18, [sp, #1136]                // 8-byte Folded Reload
	mov	x19, xzr
	add	x8, x8, x0
	add	x9, x10, x0
	add	x7, x26, x12, lsl #6
	add	x8, x14, x8, lsl #2
	add	x9, x14, x9, lsl #2
	ldp	q28, q29, [x8]
	fmla	v0.4s, v29.4s, v26.s[1]
	ldp	q30, q31, [x8, #32]
	madd	x8, x12, x11, x6
	fmla	v3.4s, v31.4s, v26.s[1]
	fmla	v6.4s, v29.4s, v25.s[1]
	fmla	v2.4s, v31.4s, v25.s[1]
	fmla	v20.4s, v29.4s, v24.s[1]
	fmla	v17.4s, v31.4s, v24.s[1]
	fmla	v21.4s, v29.4s, v27.s[1]
	fmla	v16.4s, v31.4s, v27.s[1]
	add	x6, x26, x13, lsl #6
	add	x8, x8, x0
	ldr	x13, [sp, #992]                 // 8-byte Folded Reload
	stp	q28, q29, [x5]
	fmla	v4.4s, v30.4s, v26.s[1]
	stp	q30, q31, [x5, #32]
	fmla	v1.4s, v28.4s, v26.s[1]
	fmla	v5.4s, v30.4s, v25.s[1]
	fmla	v7.4s, v28.4s, v25.s[1]
	fmla	v22.4s, v28.4s, v24.s[1]
	fmla	v19.4s, v30.4s, v24.s[1]
	fmla	v23.4s, v28.4s, v27.s[1]
	fmla	v18.4s, v30.4s, v27.s[1]
	add	x8, x14, x8, lsl #2
	ldr	x14, [sp, #1144]                // 8-byte Folded Reload
	ldp	q29, q28, [x9, #32]
	ldp	q31, q30, [x9]
	ldr	x9, [sp, #1304]                 // 8-byte Folded Reload
	fmla	v0.4s, v30.4s, v26.s[2]
	fmla	v3.4s, v28.4s, v26.s[2]
	fmla	v2.4s, v28.4s, v25.s[2]
	fmla	v6.4s, v30.4s, v25.s[2]
	fmla	v17.4s, v28.4s, v24.s[2]
	fmla	v20.4s, v30.4s, v24.s[2]
	fmla	v16.4s, v28.4s, v27.s[2]
	fmla	v21.4s, v30.4s, v27.s[2]
	stp	q31, q30, [x6]
	fmla	v1.4s, v31.4s, v26.s[2]
	stp	q29, q28, [x6, #32]
	fmla	v4.4s, v29.4s, v26.s[2]
	fmla	v7.4s, v31.4s, v25.s[2]
	fmla	v5.4s, v29.4s, v25.s[2]
	fmla	v19.4s, v29.4s, v24.s[2]
	fmla	v22.4s, v31.4s, v24.s[2]
	fmla	v18.4s, v29.4s, v27.s[2]
	fmla	v23.4s, v31.4s, v27.s[2]
	ldp	q28, q29, [x8]
	fmla	v0.4s, v29.4s, v26.s[3]
	ldp	q30, q31, [x8, #32]
	fmla	v3.4s, v31.4s, v26.s[3]
	fmla	v6.4s, v29.4s, v25.s[3]
	fmla	v2.4s, v31.4s, v25.s[3]
	fmla	v20.4s, v29.4s, v24.s[3]
	fmla	v17.4s, v31.4s, v24.s[3]
	fmla	v21.4s, v29.4s, v27.s[3]
	ldr	x8, [sp, #1152]                 // 8-byte Folded Reload
	fmla	v16.4s, v31.4s, v27.s[3]
	fmla	v4.4s, v30.4s, v26.s[3]
	fmla	v1.4s, v28.4s, v26.s[3]
	fmla	v5.4s, v30.4s, v25.s[3]
	fmla	v7.4s, v28.4s, v25.s[3]
	stp	q28, q29, [x7]
	stp	q30, q31, [x7, #32]
	fmla	v22.4s, v28.4s, v24.s[3]
	fmla	v19.4s, v30.4s, v24.s[3]
	fmla	v23.4s, v28.4s, v27.s[3]
	fmla	v18.4s, v30.4s, v27.s[3]
	cmp	x9, x20
	b.ge	.LBB0_17
	.p2align	2
.LBB0_16:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x10, x8, x27
	add	x11, x18, x19
	prfm	pldl1keep, [x8]
	ldur	s24, [x8, #-4]
	add	x12, x10, x27
	prfm	pldl1keep, [x10]
	ldur	s25, [x10, #-4]
	add	x10, x14, x19
	prfm	pldl1keep, [x12]
	ldur	s26, [x12, #-4]
	add	x12, x12, x27
	add	x19, x19, x13
	prfm	pldl1keep, [x12]
	ldur	s27, [x12, #-4]
	add	x8, x8, #4
	prfm	pldl1keep, [x11]
	ldp	q28, q29, [x10, #32]
	fmla	v3.4s, v29.4s, v24.s[0]
	fmla	v2.4s, v29.4s, v25.s[0]
	ldp	q30, q31, [x10]
	add	x10, x26, x9, lsl #6
	fmla	v0.4s, v31.4s, v24.s[0]
	fmla	v6.4s, v31.4s, v25.s[0]
	add	x9, x9, #1
	fmla	v20.4s, v31.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v26.s[0]
	fmla	v4.4s, v28.4s, v24.s[0]
	fmla	v1.4s, v30.4s, v24.s[0]
	fmla	v5.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v30.4s, v25.s[0]
	fmla	v22.4s, v30.4s, v26.s[0]
	fmla	v19.4s, v28.4s, v26.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v18.4s, v28.4s, v27.s[0]
	stp	q30, q31, [x10]
	fmla	v16.4s, v29.4s, v27.s[0]
	stp	q28, q29, [x10, #32]
	cmp	x9, x20
	b.lt	.LBB0_16
.LBB0_17:                               // %.preheader
                                        //   in Loop: Header=BB0_11 Depth=3
	ldr	x30, [sp, #1096]                // 8-byte Folded Reload
	ldr	x9, [sp, #1088]                 // 8-byte Folded Reload
	mov	x8, xzr
	mov	w19, #1                         // =0x1
	mov	w25, #2                         // =0x2
	mov	w23, #3                         // =0x3
	mov	w24, #4                         // =0x4
	b	.LBB0_19
	.p2align	2
.LBB0_18:                               // %.loopexit
                                        //   in Loop: Header=BB0_19 Depth=4
	ldr	x8, [sp, #1232]                 // 8-byte Folded Reload
	add	x9, x9, x8
	add	x30, x30, x8
	mov	x8, x24
	mov	x24, x21
.LBB0_19:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_21 Depth 5
                                        //           Child Loop BB0_23 Depth 5
	madd	x8, x8, x29, x2
	add	x8, x8, x0
	madd	x10, x19, x29, x2
	madd	x11, x25, x29, x2
	add	x10, x10, x0
	add	x11, x11, x0
	add	x8, x1, x8, lsl #2
	stp	q1, q0, [x8]
	stp	q4, q3, [x8, #32]
	add	x8, x1, x10, lsl #2
	add	x10, x1, x11, lsl #2
	stp	q7, q6, [x8]
	stp	q5, q2, [x8, #32]
	madd	x8, x23, x29, x2
	add	x8, x8, x0
	stp	q22, q20, [x10]
	stp	q19, q17, [x10, #32]
	ldr	x10, [sp, #1296]                // 8-byte Folded Reload
	cmp	x24, x10
	add	x8, x1, x8, lsl #2
	stp	q23, q21, [x8]
	stp	q18, q16, [x8, #32]
	b.ge	.LBB0_24
// %bb.20:                              //   in Loop: Header=BB0_19 Depth=4
	madd	x10, x24, x29, x2
	add	x23, x24, #3
	add	x19, x24, #1
	add	x25, x24, #2
	madd	x11, x19, x29, x2
	ldp	q28, q29, [x26, #32]
	mov	x8, xzr
	madd	x12, x25, x29, x2
	ldp	q30, q31, [x26]
	add	x21, x24, #4
	mov	x18, x9
	add	x10, x10, x0
	add	x10, x1, x10, lsl #2
	add	x11, x11, x0
	add	x11, x1, x11, lsl #2
	ldp	q4, q3, [x10, #32]
	ldp	q1, q0, [x10]
	madd	x10, x23, x29, x2
	add	x10, x10, x0
	ldp	q5, q2, [x11, #32]
	ldp	q7, q6, [x11]
	add	x11, x12, x0
	add	x11, x1, x11, lsl #2
	ldp	q19, q17, [x11, #32]
	ldp	q22, q20, [x11]
	add	x10, x1, x10, lsl #2
	ldp	q18, q16, [x10, #32]
	ldp	q23, q21, [x10]
	madd	x10, x24, x28, x4
	lsl	x10, x10, #2
	ldr	q27, [x3, x10]
	madd	x10, x19, x28, x4
	lsl	x10, x10, #2
	ldr	q26, [x3, x10]
	madd	x10, x25, x28, x4
	lsl	x10, x10, #2
	ldr	q25, [x3, x10]
	madd	x10, x23, x28, x4
	lsl	x10, x10, #2
	ldr	q24, [x3, x10]
	ldr	x10, [sp, #1200]                // 8-byte Folded Reload
	fmla	v3.4s, v29.4s, v27.s[0]
	cmp	xzr, x22
	b.ge	.LBB0_22
	.p2align	2
.LBB0_21:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        //         Parent Loop BB0_19 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	add	x14, x10, #64
	fmla	v4.4s, v28.4s, v27.s[0]
	fmla	v1.4s, v30.4s, v27.s[0]
	add	x13, x10, #128
	prfm	pldl1keep, [x14]
	ldp	q9, q8, [x10, #-160]
	fmla	v0.4s, v31.4s, v27.s[0]
	ldp	q12, q15, [x10, #-192]
	fmla	v2.4s, v29.4s, v26.s[0]
	fmla	v5.4s, v28.4s, v26.s[0]
	fmla	v6.4s, v31.4s, v26.s[0]
	fmla	v7.4s, v30.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x13]
	fmla	v19.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	ldp	q11, q10, [x10, #-128]
	fmla	v22.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	ldp	q13, q14, [x10, #-96]
	fmla	v18.4s, v28.4s, v24.s[0]
	fmla	v21.4s, v31.4s, v24.s[0]
	add	x12, x10, #192
	prfm	pldl1keep, [x12]
	fmla	v23.4s, v30.4s, v24.s[0]
	fmla	v0.4s, v15.4s, v27.s[1]
	add	x11, x10, #256
	add	x8, x8, #4
	fmla	v1.4s, v12.4s, v27.s[1]
	fmla	v4.4s, v9.4s, v27.s[1]
	fmla	v3.4s, v8.4s, v27.s[1]
	fmla	v7.4s, v12.4s, v26.s[1]
	fmla	v6.4s, v15.4s, v26.s[1]
	fmla	v5.4s, v9.4s, v26.s[1]
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
	prfm	pldl1keep, [x11]
	ldp	q28, q29, [x10, #32]
	ldp	q30, q31, [x10]
	add	x10, x18, x27
	prfm	pldl1keep, [x18]
	fmla	v3.4s, v14.4s, v27.s[2]
	fmla	v4.4s, v13.4s, v27.s[2]
	fmla	v1.4s, v11.4s, v27.s[2]
	fmla	v0.4s, v10.4s, v27.s[2]
	fmla	v2.4s, v14.4s, v26.s[2]
	fmla	v5.4s, v13.4s, v26.s[2]
	fmla	v6.4s, v10.4s, v26.s[2]
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
	fmla	v4.4s, v9.4s, v27.s[3]
	fmla	v3.4s, v8.4s, v27.s[3]
	ldur	q27, [x18, #-16]
	prfm	pldl1keep, [x10]
	add	x18, x18, #16
	fmla	v7.4s, v15.4s, v26.s[3]
	fmla	v6.4s, v12.4s, v26.s[3]
	fmla	v5.4s, v9.4s, v26.s[3]
	fmla	v2.4s, v8.4s, v26.s[3]
	ldur	q26, [x10, #-16]
	add	x10, x10, x27
	add	x12, x10, x27
	prfm	pldl1keep, [x10]
	fmla	v22.4s, v15.4s, v25.s[3]
	fmla	v20.4s, v12.4s, v25.s[3]
	fmla	v19.4s, v9.4s, v25.s[3]
	fmla	v17.4s, v8.4s, v25.s[3]
	ldur	q25, [x10, #-16]
	prfm	pldl1keep, [x12]
	mov	x10, x11
	fmla	v23.4s, v15.4s, v24.s[3]
	fmla	v21.4s, v12.4s, v24.s[3]
	fmla	v18.4s, v9.4s, v24.s[3]
	fmla	v16.4s, v8.4s, v24.s[3]
	ldur	q24, [x12, #-16]
	fmla	v3.4s, v29.4s, v27.s[0]
	cmp	x8, x22
	b.lt	.LBB0_21
.LBB0_22:                               //   in Loop: Header=BB0_19 Depth=4
	ldp	q10, q8, [x5, #32]
	ldp	q12, q11, [x5]
	fmla	v4.4s, v28.4s, v27.s[0]
	fmla	v0.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v30.4s, v27.s[0]
	fmla	v2.4s, v29.4s, v26.s[0]
	fmla	v5.4s, v28.4s, v26.s[0]
	fmla	v6.4s, v31.4s, v26.s[0]
	ldp	q9, q13, [x6, #32]
	fmla	v7.4s, v30.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v25.s[0]
	ldr	x10, [sp, #1192]                // 8-byte Folded Reload
	ldr	x11, [sp, #1304]                // 8-byte Folded Reload
	fmla	v19.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	mov	x8, x30
	fmla	v22.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	fmla	v18.4s, v28.4s, v24.s[0]
	fmla	v21.4s, v31.4s, v24.s[0]
	fmla	v23.4s, v30.4s, v24.s[0]
	ldp	q29, q30, [x6]
	ldp	q31, q28, [x7, #32]
	fmla	v1.4s, v12.4s, v27.s[1]
	fmla	v0.4s, v11.4s, v27.s[1]
	fmla	v4.4s, v10.4s, v27.s[1]
	fmla	v3.4s, v8.4s, v27.s[1]
	fmla	v7.4s, v12.4s, v26.s[1]
	fmla	v6.4s, v11.4s, v26.s[1]
	fmla	v5.4s, v10.4s, v26.s[1]
	fmla	v2.4s, v8.4s, v26.s[1]
	fmla	v22.4s, v12.4s, v25.s[1]
	fmla	v20.4s, v11.4s, v25.s[1]
	fmla	v19.4s, v10.4s, v25.s[1]
	fmla	v17.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v12.4s, v24.s[1]
	fmla	v21.4s, v11.4s, v24.s[1]
	fmla	v18.4s, v10.4s, v24.s[1]
	fmla	v16.4s, v8.4s, v24.s[1]
	ldp	q10, q8, [x7]
	fmla	v3.4s, v13.4s, v27.s[2]
	fmla	v4.4s, v9.4s, v27.s[2]
	fmla	v0.4s, v30.4s, v27.s[2]
	fmla	v1.4s, v29.4s, v27.s[2]
	fmla	v2.4s, v13.4s, v26.s[2]
	fmla	v5.4s, v9.4s, v26.s[2]
	fmla	v6.4s, v30.4s, v26.s[2]
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
	fmla	v4.4s, v31.4s, v27.s[3]
	fmla	v3.4s, v28.4s, v27.s[3]
	fmla	v7.4s, v10.4s, v26.s[3]
	fmla	v6.4s, v8.4s, v26.s[3]
	fmla	v5.4s, v31.4s, v26.s[3]
	fmla	v2.4s, v28.4s, v26.s[3]
	fmla	v22.4s, v10.4s, v25.s[3]
	fmla	v20.4s, v8.4s, v25.s[3]
	fmla	v19.4s, v31.4s, v25.s[3]
	fmla	v17.4s, v28.4s, v25.s[3]
	fmla	v23.4s, v10.4s, v24.s[3]
	fmla	v21.4s, v8.4s, v24.s[3]
	fmla	v18.4s, v31.4s, v24.s[3]
	fmla	v16.4s, v28.4s, v24.s[3]
	cmp	x11, x20
	b.ge	.LBB0_18
	.p2align	2
.LBB0_23:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        //         Parent Loop BB0_19 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	add	x12, x8, x27
	prfm	pldl1keep, [x8]
	ldur	s24, [x8, #-4]
	add	x11, x11, #1
	prfm	pldl1keep, [x12]
	ldur	s25, [x12, #-4]
	add	x12, x12, x27
	add	x8, x8, #4
	prfm	pldl1keep, [x12]
	ldur	s26, [x12, #-4]
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	ldur	s27, [x12, #-4]
	prfm	pldl1keep, [x10]
	ldp	q28, q29, [x10, #-32]
	fmla	v3.4s, v29.4s, v24.s[0]
	ldp	q30, q31, [x10, #-64]
	fmla	v0.4s, v31.4s, v24.s[0]
	fmla	v6.4s, v31.4s, v25.s[0]
	fmla	v2.4s, v29.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v26.s[0]
	fmla	v17.4s, v29.4s, v26.s[0]
	add	x10, x10, #64
	fmla	v4.4s, v28.4s, v24.s[0]
	fmla	v1.4s, v30.4s, v24.s[0]
	fmla	v5.4s, v28.4s, v25.s[0]
	fmla	v7.4s, v30.4s, v25.s[0]
	fmla	v22.4s, v30.4s, v26.s[0]
	fmla	v19.4s, v28.4s, v26.s[0]
	fmla	v23.4s, v30.4s, v27.s[0]
	fmla	v21.4s, v31.4s, v27.s[0]
	fmla	v18.4s, v28.4s, v27.s[0]
	fmla	v16.4s, v29.4s, v27.s[0]
	cmp	x11, x20
	b.lt	.LBB0_23
	b	.LBB0_18
	.p2align	2
.LBB0_24:                               //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #1296]                 // 8-byte Folded Reload
	ldr	x9, [sp, #1128]                 // 8-byte Folded Reload
	cmp	x8, x9
	ldr	x30, [sp, #1080]                // 8-byte Folded Reload
	b.ge	.LBB0_30
// %bb.25:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x12, [sp, #1296]                // 8-byte Folded Reload
	ldp	q20, q21, [x26, #32]
	mov	x9, xzr
	ldp	q18, q19, [x26]
	add	x10, x12, #1
	madd	x8, x12, x29, x2
	madd	x11, x10, x29, x2
	madd	x10, x10, x28, x4
	add	x8, x8, x0
	add	x11, x11, x0
	add	x8, x1, x8, lsl #2
	lsl	x10, x10, #2
	add	x18, x1, x11, lsl #2
	madd	x11, x12, x28, x4
	ldr	q16, [x3, x10]
	ldr	x10, [sp, #1120]                // 8-byte Folded Reload
	lsl	x11, x11, #2
	ldp	q1, q0, [x8, #32]
	ldp	q4, q2, [x8]
	ldp	q5, q3, [x18, #32]
	ldp	q7, q6, [x18]
	ldr	q17, [x3, x11]
	ldr	x11, [sp, #1200]                // 8-byte Folded Reload
	cmp	xzr, x22
	b.ge	.LBB0_27
	.p2align	2
.LBB0_26:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	x12, [sp, #1184]                // 8-byte Folded Reload
	add	x25, x11, #64
	fmla	v0.4s, v21.4s, v17.s[0]
	fmla	v1.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v18.4s, v17.s[0]
	fmla	v2.4s, v19.4s, v17.s[0]
	add	x14, x11, #128
	add	x13, x11, #192
	fmla	v3.4s, v21.4s, v16.s[0]
	fmla	v5.4s, v20.4s, v16.s[0]
	add	x19, x11, #256
	add	x9, x9, #4
	fmla	v6.4s, v19.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v16.s[0]
	add	x21, x12, x10
	ldr	x12, [sp, #1176]                // 8-byte Folded Reload
	prfm	pldl1keep, [x25]
	ldp	q23, q22, [x11, #-160]
	add	x23, x21, #32
	ldp	q24, q25, [x11, #-192]
	prfm	pldl1keep, [x14]
	fmla	v2.4s, v25.4s, v17.s[1]
	ldp	q19, q18, [x11, #-128]
	ldp	q20, q21, [x11, #-96]
	fmla	v0.4s, v22.4s, v17.s[1]
	fmla	v6.4s, v25.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v16.s[1]
	prfm	pldl1keep, [x13]
	add	x24, x12, x10
	add	x10, x10, #16
	fmla	v4.4s, v24.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v5.4s, v23.4s, v16.s[1]
	ldp	q23, q22, [x11, #-32]
	ldp	q24, q25, [x11, #-64]
	add	x12, x24, #32
	prfm	pldl1keep, [x12]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v18.4s, v17.s[2]
	fmla	v3.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v18.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v4.4s, v19.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	fmla	v2.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v25.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v16.s[3]
	fmla	v4.4s, v24.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	ldr	q17, [x24, #16]
	prfm	pldl1keep, [x23]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	ldr	q16, [x21, #16]
	prfm	pldl1keep, [x19]
	ldp	q20, q21, [x11, #32]
	ldp	q18, q19, [x11]
	mov	x11, x19
	cmp	x9, x22
	b.lt	.LBB0_26
.LBB0_27:                               //   in Loop: Header=BB0_11 Depth=3
	ldp	q23, q22, [x5, #32]
	ldp	q25, q24, [x5]
	fmla	v0.4s, v21.4s, v17.s[0]
	fmla	v1.4s, v20.4s, v17.s[0]
	fmla	v2.4s, v19.4s, v17.s[0]
	fmla	v4.4s, v18.4s, v17.s[0]
	fmla	v3.4s, v21.4s, v16.s[0]
	fmla	v5.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x6, #32]
	fmla	v6.4s, v19.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v16.s[0]
	ldp	q18, q19, [x6]
	fmla	v2.4s, v24.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	ldr	x9, [sp, #1120]                 // 8-byte Folded Reload
	ldr	x10, [sp, #1192]                // 8-byte Folded Reload
	fmla	v4.4s, v25.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	ldr	x11, [sp, #1304]                // 8-byte Folded Reload
	fmla	v7.4s, v25.4s, v16.s[1]
	fmla	v6.4s, v24.4s, v16.s[1]
	ldp	q25, q24, [x7]
	fmla	v5.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v16.s[1]
	ldp	q23, q22, [x7, #32]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v19.4s, v17.s[2]
	fmla	v3.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v19.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v4.4s, v18.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v7.4s, v18.4s, v16.s[2]
	fmla	v2.4s, v24.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v24.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v16.s[3]
	fmla	v4.4s, v25.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v25.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	cmp	x11, x20
	b.ge	.LBB0_29
	.p2align	2
.LBB0_28:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	x14, [sp, #1168]                // 8-byte Folded Reload
	ldr	x19, [sp, #1160]                // 8-byte Folded Reload
	add	x11, x11, #1
	add	x12, x14, x9
	add	x13, x19, x9
	add	x13, x13, #4
	add	x12, x12, #4
	prfm	pldl1keep, [x13]
	ldr	s16, [x19, x9]
	prfm	pldl1keep, [x12]
	ldr	s17, [x14, x9]
	prfm	pldl1keep, [x10]
	add	x9, x9, #4
	ldp	q18, q19, [x10, #-64]
	ldp	q20, q21, [x10, #-32]
	add	x10, x10, #64
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v1.4s, v20.4s, v16.s[0]
	fmla	v2.4s, v19.4s, v16.s[0]
	fmla	v4.4s, v18.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v17.s[0]
	fmla	v6.4s, v19.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	fmla	v3.4s, v21.4s, v17.s[0]
	cmp	x11, x20
	b.lt	.LBB0_28
.LBB0_29:                               //   in Loop: Header=BB0_11 Depth=3
	stp	q4, q2, [x8]
	stp	q1, q0, [x8, #32]
	stp	q7, q6, [x18]
	stp	q5, q3, [x18, #32]
.LBB0_30:                               //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #1024]                 // 8-byte Folded Reload
	ldr	x9, [sp, #1128]                 // 8-byte Folded Reload
	cmp	x9, x8
	ldr	x19, [sp, #1072]                // 8-byte Folded Reload
	b.ge	.LBB0_10
// %bb.31:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x10, [sp, #1128]                // 8-byte Folded Reload
	ldp	q7, q16, [x26, #32]
	mov	x9, xzr
	ldp	q6, q5, [x26]
	ldr	x11, [sp, #1200]                // 8-byte Folded Reload
	madd	x8, x10, x29, x2
	madd	x10, x10, x28, x4
	add	x8, x8, x0
	lsl	x10, x10, #2
	ldr	x0, [sp, #848]                  // 8-byte Folded Reload
	add	x8, x1, x8, lsl #2
	ldr	q4, [x3, x10]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	x1, [sp, #896]                  // 8-byte Folded Reload
	ldp	q1, q0, [x8, #32]
	ldp	q3, q2, [x8]
	cmp	xzr, x22
	b.ge	.LBB0_33
	.p2align	2
.LBB0_32:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x18, x11, #64
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	add	x14, x11, #128
	prfm	pldl1keep, [x18]
	ldp	q18, q17, [x11, #-160]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q19, q20, [x11, #-192]
	fmla	v2.4s, v5.4s, v4.s[0]
	prfm	pldl1keep, [x14]
	ldp	q6, q5, [x11, #-128]
	ldp	q7, q16, [x11, #-96]
	add	x13, x11, #192
	prfm	pldl1keep, [x13]
	add	x12, x11, #256
	add	x9, x9, #4
	fmla	v2.4s, v20.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v3.4s, v19.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	ldp	q18, q17, [x11, #-32]
	ldp	q19, q20, [x11, #-64]
	prfm	pldl1keep, [x10]
	fmla	v0.4s, v16.4s, v4.s[2]
	fmla	v2.4s, v5.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v20.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v19.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	ldur	q4, [x10, #-16]
	prfm	pldl1keep, [x12]
	add	x10, x10, #16
	ldp	q7, q16, [x11, #32]
	ldp	q6, q5, [x11]
	mov	x11, x12
	cmp	x9, x22
	b.lt	.LBB0_32
.LBB0_33:                               //   in Loop: Header=BB0_11 Depth=3
	ldp	q18, q17, [x5, #32]
	ldp	q20, q19, [x5]
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v5.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q5, q6, [x6]
	ldp	q7, q16, [x6, #32]
	ldr	x10, [sp, #880]                 // 8-byte Folded Reload
	mov	x9, xzr
	mov	w11, #64                        // =0x40
	fmla	v2.4s, v19.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v3.4s, v20.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	fmla	v0.4s, v16.4s, v4.s[2]
	ldp	q18, q17, [x7, #32]
	ldp	q20, q19, [x7]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v5.4s, v4.s[2]
	fmla	v2.4s, v19.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v20.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	ldr	x12, [sp, #1304]                // 8-byte Folded Reload
	add	x12, x12, xzr
	cmp	x12, x20
	b.ge	.LBB0_9
	.p2align	2
.LBB0_34:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x13, x0, x9, lsl #6
	add	x12, x0, x11
	prfm	pldl1keep, [x10]
	add	x11, x11, #64
	ldr	s4, [x1, x9, lsl #2]
	prfm	pldl1keep, [x12]
	add	x9, x9, #1
	ldp	q5, q6, [x13]
	ldp	q7, q16, [x13, #32]
	add	x10, x10, #4
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v2.4s, v6.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v5.4s, v4.s[0]
	ldr	x12, [sp, #1304]                // 8-byte Folded Reload
	add	x12, x12, x9
	cmp	x12, x20
	b.lt	.LBB0_34
	b	.LBB0_9
	.p2align	2
.LBB0_35:                               //   in Loop: Header=BB0_7 Depth=2
	cmp	x8, x30
	ldr	x8, [sp, #944]                  // 8-byte Folded Reload
	ldr	x9, [sp, #936]                  // 8-byte Folded Reload
	add	x8, x9, x8, lsl #2
	ldr	x9, [sp, #920]                  // 8-byte Folded Reload
	str	x8, [sp, #1272]                 // 8-byte Folded Spill
	lsl	x8, x29, #1
	str	x8, [sp, #1256]                 // 8-byte Folded Spill
	ldr	x8, [sp, #928]                  // 8-byte Folded Reload
	add	x8, x9, x8, lsl #2
	ldr	x9, [sp, #952]                  // 8-byte Folded Reload
	str	x8, [sp, #1264]                 // 8-byte Folded Spill
	ldr	x8, [sp, #960]                  // 8-byte Folded Reload
	add	x8, x9, x8, lsl #2
	str	x8, [sp, #1280]                 // 8-byte Folded Spill
	b.lt	.LBB0_39
// %bb.36:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #592]                  // 8-byte Folded Reload
	cmp	x30, x8
	b.lt	.LBB0_64
.LBB0_37:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #592]                  // 8-byte Folded Reload
	ldr	x9, [sp, #584]                  // 8-byte Folded Reload
	cmp	x8, x9
	b.lt	.LBB0_89
.LBB0_38:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #504]                  // 8-byte Folded Reload
	ldr	x9, [sp, #584]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_6
	b	.LBB0_114
	.p2align	2
.LBB0_39:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #440]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x9, [sp, #1040]                 // 8-byte Folded Reload
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	add	x14, x0, #63
	mov	x11, xzr
	ldr	x17, [sp, #1064]                // 8-byte Folded Reload
	ldr	x1, [sp, #1256]                 // 8-byte Folded Reload
	mul	x12, x19, x9
	ldr	x9, [sp, #1008]                 // 8-byte Folded Reload
	mul	x8, x19, x8
	ldr	x16, [sp, #1104]                // 8-byte Folded Reload
	ldr	x18, [sp, #1272]                // 8-byte Folded Reload
	add	x10, x1, x29
	ldr	x6, [sp, #992]                  // 8-byte Folded Reload
	ldr	x7, [sp, #976]                  // 8-byte Folded Reload
	ldp	x23, x21, [sp, #368]            // 16-byte Folded Reload
	madd	x9, x17, x9, x8
	ldr	x8, [sp, #1048]                 // 8-byte Folded Reload
	ldp	x25, x24, [sp, #352]            // 16-byte Folded Reload
	ldr	x30, [sp, #344]                 // 8-byte Folded Reload
	madd	x13, x17, x8, x12
	add	x12, x9, x16
	and	x8, x14, #0xffffffffffffffc0
	add	x10, x12, x10
	add	x14, x18, x12, lsl #2
	add	x15, x12, x29
	add	x12, x12, x1
	add	x10, x18, x10, lsl #2
	add	x15, x18, x15, lsl #2
	add	x12, x18, x12, lsl #2
	ldp	q1, q0, [x14]
	ldr	x14, [sp, #1056]                // 8-byte Folded Reload
	ldp	q7, q5, [x10]
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	mul	x10, x19, x10
	ldp	q6, q3, [x15]
	ldr	x15, [sp, #1280]                // 8-byte Folded Reload
	ldr	x19, [sp, #968]                 // 8-byte Folded Reload
	ldp	q4, q2, [x12]
	add	x12, x13, x16
	madd	x10, x17, x14, x10
	lsl	x14, x10, #2
	ldr	q18, [x15, x14]
	add	x14, x10, x28
	lsl	x14, x14, #2
	ldr	q17, [x15, x14]
	add	x14, x10, x28, lsl #1
	lsl	x14, x14, #2
	ldr	q16, [x15, x14]
	ldr	x14, [sp, #1264]                // 8-byte Folded Reload
	ldr	x15, [sp, #1120]                // 8-byte Folded Reload
	add	x12, x14, x12, lsl #2
	ldr	x14, [sp, #656]                 // 8-byte Folded Reload
	ldp	q21, q20, [x12]
	add	x12, x8, #64
	.p2align	2
.LBB0_40:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #1288]                // 8-byte Folded Reload
	fmla	v1.4s, v21.4s, v18.s[0]
	fmla	v0.4s, v20.4s, v18.s[0]
	cmp	x11, x22
	add	x16, x16, x15
	prfm	pldl1keep, [x16, #16]
	ldr	q19, [x16]
	b.ge	.LBB0_42
// %bb.41:                              //   in Loop: Header=BB0_40 Depth=3
	ldr	x17, [sp, #800]                 // 8-byte Folded Reload
	add	x16, x25, x14
	fmla	v6.4s, v21.4s, v17.s[0]
	fmla	v3.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v16.s[0]
	fmla	v2.4s, v20.4s, v16.s[0]
	stp	q21, q20, [x12, #-64]
	fmla	v7.4s, v21.4s, v19.s[0]
	fmla	v5.4s, v20.4s, v19.s[0]
	prfm	pldl1keep, [x16]
	add	x16, x24, x14
	add	x1, x21, x14
	add	x5, x30, x14
	add	x11, x11, #4
	add	x17, x17, x14
	ldp	q20, q21, [x17]
	ldr	x17, [sp, #792]                 // 8-byte Folded Reload
	add	x17, x17, x14
	fmla	v0.4s, v21.4s, v18.s[1]
	fmla	v3.4s, v21.4s, v17.s[1]
	fmla	v2.4s, v21.4s, v16.s[1]
	fmla	v5.4s, v21.4s, v19.s[1]
	fmla	v1.4s, v20.4s, v18.s[1]
	fmla	v6.4s, v20.4s, v17.s[1]
	fmla	v4.4s, v20.4s, v16.s[1]
	fmla	v7.4s, v20.4s, v19.s[1]
	stp	q20, q21, [x12, #-32]
	prfm	pldl1keep, [x16]
	add	x16, x23, x14
	ldp	q21, q20, [x17]
	ldr	x17, [sp, #784]                 // 8-byte Folded Reload
	add	x17, x17, x14
	fmla	v0.4s, v20.4s, v18.s[2]
	fmla	v3.4s, v20.4s, v17.s[2]
	fmla	v2.4s, v20.4s, v16.s[2]
	fmla	v5.4s, v20.4s, v19.s[2]
	fmla	v1.4s, v21.4s, v18.s[2]
	fmla	v6.4s, v21.4s, v17.s[2]
	fmla	v4.4s, v21.4s, v16.s[2]
	fmla	v7.4s, v21.4s, v19.s[2]
	stp	q21, q20, [x12]
	prfm	pldl1keep, [x16]
	ldr	x16, [sp, #1224]                // 8-byte Folded Reload
	ldp	q20, q21, [x17]
	ldr	x17, [sp, #1208]                // 8-byte Folded Reload
	ldr	x18, [sp, #1216]                // 8-byte Folded Reload
	add	x16, x16, x15
	add	x17, x17, x15
	add	x18, x18, x15
	fmla	v0.4s, v21.4s, v18.s[3]
	fmla	v3.4s, v21.4s, v17.s[3]
	fmla	v2.4s, v21.4s, v16.s[3]
	fmla	v5.4s, v21.4s, v19.s[3]
	add	x15, x15, #16
	add	x2, x16, #32
	add	x3, x17, #32
	add	x4, x18, #32
	fmla	v1.4s, v20.4s, v18.s[3]
	fmla	v6.4s, v20.4s, v17.s[3]
	fmla	v4.4s, v20.4s, v16.s[3]
	fmla	v7.4s, v20.4s, v19.s[3]
	stp	q20, q21, [x12, #32]
	prfm	pldl1keep, [x1]
	add	x12, x12, #128
	ldp	q21, q20, [x5]
	prfm	pldl1keep, [x4]
	ldr	q18, [x18, #16]
	prfm	pldl1keep, [x3]
	ldr	q17, [x17, #16]
	prfm	pldl1keep, [x2]
	ldr	q16, [x16, #16]
	ldr	x16, [sp, #1240]                // 8-byte Folded Reload
	add	x14, x14, x16
	b	.LBB0_40
	.p2align	2
.LBB0_42:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x16, [sp, #1000]                // 8-byte Folded Reload
	ldr	x12, [sp, #984]                 // 8-byte Folded Reload
	add	x11, x8, x22, lsl #5
	fmla	v6.4s, v21.4s, v17.s[0]
	ldr	x17, [sp, #1104]                // 8-byte Folded Reload
	ldr	x18, [sp, #1264]                // 8-byte Folded Reload
	fmla	v3.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v16.s[0]
	stp	q21, q20, [x11]
	fmla	v2.4s, v20.4s, v16.s[0]
	fmla	v5.4s, v20.4s, v19.s[0]
	fmla	v7.4s, v21.4s, v19.s[0]
	ldr	x23, [sp, #648]                 // 8-byte Folded Reload
	ldr	x24, [sp, #680]                 // 8-byte Folded Reload
	mov	x14, xzr
	madd	x11, x12, x16, x13
	ldr	x25, [sp, #1272]                // 8-byte Folded Reload
	mov	x15, xzr
	add	x11, x11, x17
	add	x11, x18, x11, lsl #2
	ldp	q20, q21, [x11]
	add	x11, x8, x12, lsl #5
	madd	x12, x7, x16, x13
	madd	x13, x19, x16, x13
	ldr	x16, [sp, #664]                 // 8-byte Folded Reload
	add	x12, x12, x17
	fmla	v0.4s, v21.4s, v18.s[1]
	fmla	v3.4s, v21.4s, v17.s[1]
	fmla	v2.4s, v21.4s, v16.s[1]
	fmla	v5.4s, v21.4s, v19.s[1]
	add	x13, x13, x17
	ldr	x17, [sp, #472]                 // 8-byte Folded Reload
	add	x12, x18, x12, lsl #2
	fmla	v1.4s, v20.4s, v18.s[1]
	stp	q20, q21, [x11]
	fmla	v6.4s, v20.4s, v17.s[1]
	fmla	v4.4s, v20.4s, v16.s[1]
	fmla	v7.4s, v20.4s, v19.s[1]
	add	x13, x18, x13, lsl #2
	ldr	x18, [sp, #672]                 // 8-byte Folded Reload
	add	x16, x16, x17
	ldp	q21, q20, [x12]
	add	x12, x8, x7, lsl #5
	add	x17, x18, x17
	ldr	x18, [sp, #1304]                // 8-byte Folded Reload
	fmla	v0.4s, v20.4s, v18.s[2]
	fmla	v3.4s, v20.4s, v17.s[2]
	fmla	v2.4s, v20.4s, v16.s[2]
	fmla	v5.4s, v20.4s, v19.s[2]
	stp	q21, q20, [x12]
	fmla	v1.4s, v21.4s, v18.s[2]
	fmla	v6.4s, v21.4s, v17.s[2]
	fmla	v4.4s, v21.4s, v16.s[2]
	fmla	v7.4s, v21.4s, v19.s[2]
	ldp	q20, q21, [x13]
	add	x13, x8, x19, lsl #5
	fmla	v0.4s, v21.4s, v18.s[3]
	fmla	v3.4s, v21.4s, v17.s[3]
	fmla	v2.4s, v21.4s, v16.s[3]
	fmla	v5.4s, v21.4s, v19.s[3]
	fmla	v1.4s, v20.4s, v18.s[3]
	fmla	v6.4s, v20.4s, v17.s[3]
	fmla	v4.4s, v20.4s, v16.s[3]
	fmla	v7.4s, v20.4s, v19.s[3]
	stp	q20, q21, [x13]
	cmp	x18, x20
	b.ge	.LBB0_44
	.p2align	2
.LBB0_43:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x2, [sp, #1152]                 // 8-byte Folded Reload
	add	x1, x16, x15
	add	x3, x8, x18, lsl #5
	add	x18, x18, #1
	add	x2, x2, x14
	add	x14, x14, #4
	prfm	pldl1keep, [x2]
	ldur	s16, [x2, #-4]
	add	x2, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s17, [x2, #-4]
	add	x2, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s18, [x2, #-4]
	add	x2, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s19, [x2, #-4]
	add	x2, x17, x15
	prfm	pldl1keep, [x1]
	add	x15, x15, x6
	ldp	q20, q21, [x2]
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v3.4s, v21.4s, v17.s[0]
	fmla	v2.4s, v21.4s, v18.s[0]
	fmla	v5.4s, v21.4s, v19.s[0]
	fmla	v1.4s, v20.4s, v16.s[0]
	fmla	v6.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v18.s[0]
	fmla	v7.4s, v20.4s, v19.s[0]
	stp	q20, q21, [x3]
	cmp	x18, x20
	b.lt	.LBB0_43
.LBB0_44:                               // %.preheader67
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #336]                 // 8-byte Folded Reload
	ldr	x16, [sp, #1096]                // 8-byte Folded Reload
	mov	x5, xzr
	add	x14, x8, #128
	ldr	x17, [sp, #1088]                // 8-byte Folded Reload
	mov	w2, #1                          // =0x1
	mov	w3, #2                          // =0x2
	mov	w1, #3                          // =0x3
	mov	w18, #4                         // =0x4
	add	x15, x8, x15
	b	.LBB0_46
	.p2align	2
.LBB0_45:                               // %.loopexit63
                                        //   in Loop: Header=BB0_46 Depth=3
	ldr	x5, [sp, #1232]                 // 8-byte Folded Reload
	add	x17, x17, x5
	add	x16, x16, x5
	mov	x5, x18
	mov	x18, x4
.LBB0_46:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_48 Depth 4
                                        //         Child Loop BB0_50 Depth 4
	madd	x4, x5, x29, x9
	ldr	x21, [sp, #1104]                // 8-byte Folded Reload
	add	x4, x4, x21
	madd	x2, x2, x29, x9
	madd	x3, x3, x29, x9
	madd	x1, x1, x29, x9
	add	x2, x2, x21
	add	x1, x1, x21
	add	x4, x25, x4, lsl #2
	add	x2, x25, x2, lsl #2
	stp	q1, q0, [x4]
	stp	q6, q3, [x2]
	add	x2, x3, x21
	add	x1, x25, x1, lsl #2
	add	x2, x25, x2, lsl #2
	stp	q4, q2, [x2]
	stp	q7, q5, [x1]
	ldr	x1, [sp, #1296]                 // 8-byte Folded Reload
	cmp	x18, x1
	b.ge	.LBB0_51
// %bb.47:                              //   in Loop: Header=BB0_46 Depth=3
	madd	x4, x18, x29, x9
	add	x2, x18, #1
	add	x3, x18, #2
	add	x1, x18, #3
	madd	x6, x2, x29, x9
	ldp	q20, q21, [x8]
	mov	x5, xzr
	madd	x7, x3, x29, x9
	add	x4, x4, x21
	madd	x19, x1, x29, x9
	add	x4, x25, x4, lsl #2
	ldp	q1, q0, [x4]
	add	x4, x6, x21
	add	x6, x7, x21
	add	x7, x19, x21
	add	x6, x25, x6, lsl #2
	add	x7, x25, x7, lsl #2
	add	x4, x25, x4, lsl #2
	ldp	q4, q2, [x6]
	madd	x6, x18, x28, x10
	lsl	x6, x6, #2
	ldp	q7, q5, [x7]
	ldr	x7, [sp, #1280]                 // 8-byte Folded Reload
	ldp	q6, q3, [x4]
	add	x4, x18, #4
	ldr	q19, [x7, x6]
	madd	x6, x2, x28, x10
	lsl	x6, x6, #2
	ldr	q18, [x7, x6]
	madd	x6, x3, x28, x10
	lsl	x6, x6, #2
	ldr	q17, [x7, x6]
	madd	x6, x1, x28, x10
	lsl	x6, x6, #2
	ldr	q16, [x7, x6]
	mov	x6, x14
	mov	x7, x17
	cmp	xzr, x22
	b.ge	.LBB0_49
	.p2align	2
.LBB0_48:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_46 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x19, x6, #32
	fmla	v1.4s, v20.4s, v19.s[0]
	fmla	v0.4s, v21.4s, v19.s[0]
	add	x5, x5, #4
	prfm	pldl1keep, [x19]
	ldp	q22, q23, [x6, #-96]
	fmla	v3.4s, v21.4s, v18.s[0]
	fmla	v6.4s, v20.4s, v18.s[0]
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v4.4s, v20.4s, v17.s[0]
	add	x19, x6, #96
	fmla	v5.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q21, q20, [x6, #-64]
	prfm	pldl1keep, [x19]
	add	x19, x7, x27
	add	x21, x19, x27
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
	prfm	pldl1keep, [x19]
	fmla	v6.4s, v22.4s, v18.s[3]
	ldur	q18, [x19, #-16]
	add	x19, x21, x27
	prfm	pldl1keep, [x21]
	add	x7, x7, #16
	fmla	v4.4s, v22.4s, v17.s[3]
	ldur	q17, [x21, #-16]
	prfm	pldl1keep, [x19]
	fmla	v7.4s, v22.4s, v16.s[3]
	ldur	q16, [x19, #-16]
	cmp	x5, x22
	b.lt	.LBB0_48
.LBB0_49:                               //   in Loop: Header=BB0_46 Depth=3
	ldp	q23, q22, [x11]
	fmla	v0.4s, v21.4s, v19.s[0]
	fmla	v1.4s, v20.4s, v19.s[0]
	fmla	v3.4s, v21.4s, v18.s[0]
	fmla	v6.4s, v20.4s, v18.s[0]
	ldr	x7, [sp, #1304]                 // 8-byte Folded Reload
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
	cmp	x7, x20
	b.ge	.LBB0_45
	.p2align	2
.LBB0_50:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_46 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x19, x5, x27
	prfm	pldl1keep, [x5]
	ldur	s16, [x5, #-4]
	add	x7, x7, #1
	prfm	pldl1keep, [x19]
	ldur	s17, [x19, #-4]
	add	x19, x19, x27
	add	x5, x5, #4
	prfm	pldl1keep, [x19]
	ldur	s18, [x19, #-4]
	add	x19, x19, x27
	prfm	pldl1keep, [x19]
	ldur	s19, [x19, #-4]
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
	cmp	x7, x20
	b.lt	.LBB0_50
	b	.LBB0_45
	.p2align	2
.LBB0_51:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #1296]                // 8-byte Folded Reload
	ldr	x16, [sp, #1128]                // 8-byte Folded Reload
	cmp	x15, x16
	ldr	x19, [sp, #1072]                // 8-byte Folded Reload
	b.ge	.LBB0_57
// %bb.52:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x2, [sp, #1296]                 // 8-byte Folded Reload
	ldr	x1, [sp, #1104]                 // 8-byte Folded Reload
	mov	x17, xzr
	add	x18, x2, #1
	madd	x15, x2, x29, x9
	ldp	q6, q7, [x8]
	madd	x16, x18, x29, x9
	madd	x18, x18, x28, x10
	add	x15, x15, x1
	add	x16, x16, x1
	madd	x1, x2, x28, x10
	ldr	x2, [sp, #1280]                 // 8-byte Folded Reload
	add	x15, x25, x15, lsl #2
	lsl	x18, x18, #2
	add	x16, x25, x16, lsl #2
	ldp	q1, q0, [x15]
	ldp	q3, q2, [x16]
	lsl	x1, x1, #2
	ldr	q4, [x2, x18]
	mov	x18, x14
	ldr	q5, [x2, x1]
	ldr	x1, [sp, #1120]                 // 8-byte Folded Reload
	cmp	xzr, x22
	b.ge	.LBB0_54
	.p2align	2
.LBB0_53:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x7, x18, #32
	ldr	x2, [sp, #1184]                 // 8-byte Folded Reload
	ldr	x4, [sp, #1176]                 // 8-byte Folded Reload
	fmla	v1.4s, v6.4s, v5.s[0]
	prfm	pldl1keep, [x7]
	ldp	q16, q17, [x18, #-96]
	fmla	v0.4s, v7.4s, v5.s[0]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q7, q6, [x18, #-64]
	add	x6, x18, #96
	prfm	pldl1keep, [x6]
	add	x17, x17, #4
	add	x2, x2, x1
	add	x4, x4, x1
	add	x1, x1, #16
	fmla	v0.4s, v17.4s, v5.s[1]
	fmla	v2.4s, v17.4s, v4.s[1]
	add	x3, x2, #32
	add	x5, x4, #32
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	ldp	q16, q17, [x18, #-32]
	fmla	v0.4s, v6.4s, v5.s[2]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v5.s[2]
	fmla	v3.4s, v7.4s, v4.s[2]
	fmla	v0.4s, v17.4s, v5.s[3]
	fmla	v2.4s, v17.4s, v4.s[3]
	ldp	q6, q7, [x18], #128
	prfm	pldl1keep, [x5]
	fmla	v1.4s, v16.4s, v5.s[3]
	ldr	q5, [x4, #16]
	prfm	pldl1keep, [x3]
	fmla	v3.4s, v16.4s, v4.s[3]
	ldr	q4, [x2, #16]
	cmp	x17, x22
	b.lt	.LBB0_53
.LBB0_54:                               //   in Loop: Header=BB0_7 Depth=2
	ldp	q17, q16, [x11]
	fmla	v0.4s, v7.4s, v5.s[0]
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q6, q7, [x12]
	ldr	x1, [sp, #416]                  // 8-byte Folded Reload
	ldr	x2, [sp, #1304]                 // 8-byte Folded Reload
	mov	x17, xzr
	mov	x18, xzr
	fmla	v0.4s, v16.4s, v5.s[1]
	fmla	v2.4s, v16.4s, v4.s[1]
	add	x1, x8, x1
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
	cmp	x2, x20
	b.ge	.LBB0_56
	.p2align	2
.LBB0_55:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x3, x1, x18, lsl #3
	add	x4, x24, x18
	add	x5, x23, x18
	add	x2, x2, #1
	add	x4, x4, #4
	add	x5, x5, #4
	add	x3, x3, #32
	prfm	pldl1keep, [x5]
	ldr	s4, [x23, x18]
	prfm	pldl1keep, [x4]
	add	x4, x1, x17
	ldr	s5, [x24, x18]
	prfm	pldl1keep, [x3]
	add	x18, x18, #4
	ldp	q6, q7, [x4]
	add	x17, x17, #32
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v1.4s, v6.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	fmla	v3.4s, v6.4s, v5.s[0]
	cmp	x2, x20
	b.lt	.LBB0_55
.LBB0_56:                               //   in Loop: Header=BB0_7 Depth=2
	stp	q1, q0, [x15]
	stp	q3, q2, [x16]
.LBB0_57:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #1024]                // 8-byte Folded Reload
	ldr	x16, [sp, #1128]                // 8-byte Folded Reload
	cmp	x16, x15
	b.ge	.LBB0_63
// %bb.58:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x17, [sp, #1128]                // 8-byte Folded Reload
	ldr	x16, [sp, #1104]                // 8-byte Folded Reload
	mov	x15, xzr
	madd	x9, x17, x29, x9
	madd	x10, x17, x28, x10
	ldp	q4, q3, [x8]
	ldr	x18, [sp, #896]                 // 8-byte Folded Reload
	add	x9, x9, x16
	ldr	x16, [sp, #1280]                // 8-byte Folded Reload
	lsl	x10, x10, #2
	add	x9, x25, x9, lsl #2
	ldp	q1, q0, [x9]
	ldr	q2, [x16, x10]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	cmp	xzr, x22
	b.ge	.LBB0_60
	.p2align	2
.LBB0_59:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x17, x14, #32
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	add	x16, x14, #96
	prfm	pldl1keep, [x17]
	ldp	q5, q6, [x14, #-96]
	add	x15, x15, #4
	ldp	q4, q3, [x14, #-64]
	prfm	pldl1keep, [x16]
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
	cmp	x15, x22
	b.lt	.LBB0_59
.LBB0_60:                               //   in Loop: Header=BB0_7 Depth=2
	ldp	q6, q5, [x11]
	fmla	v0.4s, v3.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldp	q3, q4, [x12]
	ldr	x11, [sp, #416]                 // 8-byte Folded Reload
	mov	x10, xzr
	mov	x14, xzr
	fmla	v0.4s, v5.4s, v2.s[1]
	add	x8, x8, x11
	ldr	x11, [sp, #1304]                // 8-byte Folded Reload
	fmla	v1.4s, v6.4s, v2.s[1]
	ldp	q6, q5, [x13]
	fmla	v0.4s, v4.4s, v2.s[2]
	fmla	v1.4s, v3.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v2.s[3]
	fmla	v1.4s, v6.4s, v2.s[3]
	cmp	x11, x20
	b.ge	.LBB0_62
	.p2align	2
.LBB0_61:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x12, x8, x14, lsl #3
	add	x13, x18, x14
	add	x11, x11, #1
	add	x13, x13, #4
	add	x12, x12, #32
	prfm	pldl1keep, [x13]
	ldr	s2, [x18, x14]
	add	x13, x8, x10
	add	x14, x14, #4
	add	x10, x10, #32
	prfm	pldl1keep, [x12]
	ldp	q3, q4, [x13]
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v3.4s, v2.s[0]
	cmp	x11, x20
	b.lt	.LBB0_61
.LBB0_62:                               //   in Loop: Header=BB0_7 Depth=2
	stp	q1, q0, [x9]
.LBB0_63:                               //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x30, [sp, #1080]                // 8-byte Folded Reload
	ldr	x8, [sp, #592]                  // 8-byte Folded Reload
	cmp	x30, x8
	b.ge	.LBB0_37
.LBB0_64:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #432]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	ldr	x9, [sp, #1008]                 // 8-byte Folded Reload
	mov	x16, x19
	mov	x12, xzr
	ldr	x15, [sp, #1064]                // 8-byte Folded Reload
	ldr	x19, [sp, #1080]                // 8-byte Folded Reload
	mul	x8, x16, x8
	ldr	x14, [sp, #1256]                // 8-byte Folded Reload
	ldr	x17, [sp, #1272]                // 8-byte Folded Reload
	add	x10, x14, x29
	ldr	x21, [sp, #992]                 // 8-byte Folded Reload
	ldr	x23, [sp, #976]                 // 8-byte Folded Reload
	ldr	x24, [sp, #968]                 // 8-byte Folded Reload
	ldp	x30, x25, [sp, #320]            // 16-byte Folded Reload
	madd	x9, x15, x9, x8
	add	x8, x9, x19
	add	x13, x8, x29
	lsl	x11, x8, #2
	add	x14, x8, x14
	add	x8, x8, x10
	lsl	x10, x13, #2
	ldr	q0, [x17, x11]
	lsl	x11, x14, #2
	ldr	x13, [sp, #1264]                // 8-byte Folded Reload
	ldr	x14, [sp, #1280]                // 8-byte Folded Reload
	lsl	x8, x8, #2
	ldr	q2, [x17, x10]
	ldr	x10, [sp, #1040]                // 8-byte Folded Reload
	mul	x10, x16, x10
	ldr	q1, [x17, x11]
	ldr	x11, [sp, #1048]                // 8-byte Folded Reload
	madd	x11, x15, x11, x10
	ldr	q3, [x17, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	add	x10, x11, x19
	lsl	x10, x10, #2
	ldr	q7, [x13, x10]
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	ldr	x13, [sp, #1056]                // 8-byte Folded Reload
	mul	x10, x16, x10
	madd	x10, x15, x13, x10
	ldr	x15, [sp, #1120]                // 8-byte Folded Reload
	lsl	x13, x10, #2
	ldr	q4, [x14, x13]
	add	x13, x10, x28
	lsl	x13, x13, #2
	ldr	q5, [x14, x13]
	add	x13, x10, x28, lsl #1
	lsl	x13, x13, #2
	ldr	q6, [x14, x13]
	ldr	x14, [sp, #656]                 // 8-byte Folded Reload
	orr	x13, x8, #0x20
	.p2align	2
.LBB0_65:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #1288]                // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	cmp	x12, x22
	add	x16, x16, x15
	prfm	pldl1keep, [x16, #16]
	ldr	q16, [x16]
	b.ge	.LBB0_67
// %bb.66:                              //   in Loop: Header=BB0_65 Depth=3
	ldr	x7, [sp, #768]                  // 8-byte Folded Reload
	ldr	x16, [sp, #1224]                // 8-byte Folded Reload
	fmla	v1.4s, v7.4s, v6.s[0]
	fmla	v3.4s, v7.4s, v16.s[0]
	ldr	x18, [sp, #1208]                // 8-byte Folded Reload
	ldr	x2, [sp, #1216]                 // 8-byte Folded Reload
	add	x5, x30, x14
	add	x4, x25, x14
	ldr	x6, [sp, #776]                  // 8-byte Folded Reload
	stur	q7, [x13, #-32]
	add	x12, x12, #4
	add	x7, x7, x14
	add	x6, x6, x14
	add	x16, x16, x15
	add	x18, x18, x15
	add	x2, x2, x15
	add	x15, x15, #16
	prfm	pldl1keep, [x7]
	ldr	x7, [sp, #752]                  // 8-byte Folded Reload
	add	x17, x16, #32
	add	x1, x18, #32
	add	x3, x2, #32
	ldr	q7, [x7, x14]
	stur	q7, [x13, #-16]
	prfm	pldl1keep, [x6]
	ldr	x6, [sp, #744]                  // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[1]
	fmla	v2.4s, v7.4s, v5.s[1]
	fmla	v1.4s, v7.4s, v6.s[1]
	fmla	v3.4s, v7.4s, v16.s[1]
	ldr	q7, [x6, x14]
	str	q7, [x13]
	prfm	pldl1keep, [x5]
	ldr	x5, [sp, #736]                  // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[2]
	fmla	v2.4s, v7.4s, v5.s[2]
	fmla	v1.4s, v7.4s, v6.s[2]
	fmla	v3.4s, v7.4s, v16.s[2]
	ldr	q7, [x5, x14]
	str	q7, [x13, #16]
	prfm	pldl1keep, [x4]
	ldr	x4, [sp, #760]                  // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[3]
	fmla	v2.4s, v7.4s, v5.s[3]
	fmla	v1.4s, v7.4s, v6.s[3]
	fmla	v3.4s, v7.4s, v16.s[3]
	add	x13, x13, #64
	ldr	q7, [x4, x14]
	prfm	pldl1keep, [x3]
	ldr	q4, [x2, #16]
	prfm	pldl1keep, [x1]
	ldr	q5, [x18, #16]
	prfm	pldl1keep, [x17]
	ldr	q6, [x16, #16]
	ldr	x16, [sp, #1240]                // 8-byte Folded Reload
	add	x14, x14, x16
	b	.LBB0_65
	.p2align	2
.LBB0_67:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #1000]                // 8-byte Folded Reload
	ldr	x6, [sp, #984]                  // 8-byte Folded Reload
	fmla	v1.4s, v7.4s, v6.s[0]
	fmla	v3.4s, v7.4s, v16.s[0]
	ldr	x16, [sp, #1264]                // 8-byte Folded Reload
	str	q7, [x8, x22, lsl #4]
	mov	x12, xzr
	ldr	x7, [sp, #1272]                 // 8-byte Folded Reload
	mov	x13, xzr
	madd	x14, x6, x15, x11
	add	x14, x14, x19
	lsl	x14, x14, #2
	ldr	q17, [x16, x14]
	madd	x14, x23, x15, x11
	madd	x11, x24, x15, x11
	ldr	x15, [sp, #672]                 // 8-byte Folded Reload
	add	x14, x14, x19
	add	x11, x11, x19
	lsl	x14, x14, #2
	lsl	x11, x11, #2
	str	q17, [x8, x6, lsl #4]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	fmla	v1.4s, v17.4s, v6.s[1]
	fmla	v3.4s, v17.4s, v16.s[1]
	ldr	q7, [x16, x14]
	ldr	x14, [sp, #464]                 // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[2]
	str	q7, [x8, x23, lsl #4]
	fmla	v2.4s, v7.4s, v5.s[2]
	fmla	v1.4s, v7.4s, v6.s[2]
	fmla	v3.4s, v7.4s, v16.s[2]
	ldr	q7, [x16, x11]
	ldr	x11, [sp, #664]                 // 8-byte Folded Reload
	add	x11, x11, x14
	add	x14, x15, x14
	ldr	x15, [sp, #1304]                // 8-byte Folded Reload
	fmla	v0.4s, v7.4s, v4.s[3]
	fmla	v2.4s, v7.4s, v5.s[3]
	fmla	v1.4s, v7.4s, v6.s[3]
	fmla	v3.4s, v7.4s, v16.s[3]
	str	q7, [x8, x24, lsl #4]
	cmp	x15, x20
	b.ge	.LBB0_69
	.p2align	2
.LBB0_68:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x17, [sp, #1152]                // 8-byte Folded Reload
	add	x16, x11, x13
	add	x17, x17, x12
	add	x12, x12, #4
	prfm	pldl1keep, [x17]
	ldur	s4, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s5, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s6, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s7, [x17, #-4]
	prfm	pldl1keep, [x16]
	ldr	q16, [x14, x13]
	add	x13, x13, x21
	fmla	v0.4s, v16.4s, v4.s[0]
	str	q16, [x8, x15, lsl #4]
	add	x15, x15, #1
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x15, x20
	b.lt	.LBB0_68
.LBB0_69:                               // %.preheader66
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #312]                 // 8-byte Folded Reload
	ldr	x13, [sp, #1096]                // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #48
	ldr	x14, [sp, #1088]                // 8-byte Folded Reload
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w18, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x12
	b	.LBB0_71
	.p2align	2
.LBB0_70:                               // %.loopexit62
                                        //   in Loop: Header=BB0_71 Depth=3
	ldr	x2, [sp, #1232]                 // 8-byte Folded Reload
	add	x14, x14, x2
	add	x13, x13, x2
	mov	x2, x15
	mov	x15, x1
.LBB0_71:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_73 Depth 4
                                        //         Child Loop BB0_75 Depth 4
	madd	x1, x2, x29, x9
	add	x1, x1, x19
	madd	x16, x16, x29, x9
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	add	x16, x16, x19
	add	x17, x17, x19
	lsl	x1, x1, #2
	lsl	x16, x16, #2
	lsl	x17, x17, #2
	str	q0, [x7, x1]
	str	q2, [x7, x16]
	add	x16, x18, x19
	lsl	x16, x16, #2
	str	q1, [x7, x17]
	str	q3, [x7, x16]
	ldr	x16, [sp, #1296]                // 8-byte Folded Reload
	cmp	x15, x16
	b.ge	.LBB0_76
// %bb.72:                              //   in Loop: Header=BB0_71 Depth=3
	add	x16, x15, #1
	add	x17, x15, #2
	madd	x1, x15, x29, x9
	add	x18, x15, #3
	madd	x3, x16, x29, x9
	ldr	q16, [x8]
	mov	x2, xzr
	add	x1, x1, x19
	madd	x4, x17, x29, x9
	add	x3, x3, x19
	add	x4, x4, x19
	lsl	x1, x1, #2
	lsl	x3, x3, #2
	lsl	x4, x4, #2
	ldr	q0, [x7, x1]
	madd	x1, x18, x29, x9
	ldr	q2, [x7, x3]
	madd	x3, x15, x28, x10
	ldr	q1, [x7, x4]
	ldr	x4, [sp, #1280]                 // 8-byte Folded Reload
	add	x1, x1, x19
	lsl	x3, x3, #2
	lsl	x1, x1, #2
	ldr	q7, [x4, x3]
	madd	x3, x16, x28, x10
	ldr	q3, [x7, x1]
	add	x1, x15, #4
	lsl	x3, x3, #2
	ldr	q6, [x4, x3]
	madd	x3, x17, x28, x10
	lsl	x3, x3, #2
	ldr	q5, [x4, x3]
	madd	x3, x18, x28, x10
	lsl	x3, x3, #2
	ldr	q4, [x4, x3]
	mov	x3, x11
	mov	x4, x14
	cmp	xzr, x22
	b.ge	.LBB0_74
	.p2align	2
.LBB0_73:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_71 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x3, #32
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	add	x2, x2, #4
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	prfm	pldl1keep, [x5]
	add	x5, x4, x27
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
	prfm	pldl1keep, [x5]
	fmla	v2.4s, v17.4s, v6.s[3]
	ldur	q6, [x5, #-16]
	add	x5, x5, x27
	fmla	v1.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x5]
	ldur	q5, [x5, #-16]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	q4, [x5, #-16]
	cmp	x2, x22
	b.lt	.LBB0_73
.LBB0_74:                               //   in Loop: Header=BB0_71 Depth=3
	ldr	q17, [x8, x6, lsl #4]
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	ldr	q16, [x8, x23, lsl #4]
	ldr	q18, [x8, x24, lsl #4]
	ldr	x4, [sp, #1304]                 // 8-byte Folded Reload
	mov	x2, x13
	mov	x3, x12
	fmla	v0.4s, v17.4s, v7.s[1]
	fmla	v2.4s, v17.4s, v6.s[1]
	fmla	v1.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	fmla	v0.4s, v16.4s, v7.s[2]
	fmla	v2.4s, v16.4s, v6.s[2]
	fmla	v1.4s, v16.4s, v5.s[2]
	fmla	v3.4s, v16.4s, v4.s[2]
	fmla	v0.4s, v18.4s, v7.s[3]
	fmla	v2.4s, v18.4s, v6.s[3]
	fmla	v1.4s, v18.4s, v5.s[3]
	fmla	v3.4s, v18.4s, v4.s[3]
	cmp	x4, x20
	b.ge	.LBB0_70
	.p2align	2
.LBB0_75:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_71 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x5]
	ldur	s5, [x5, #-4]
	add	x5, x5, x27
	add	x2, x2, #4
	prfm	pldl1keep, [x5]
	ldur	s6, [x5, #-4]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	s7, [x5, #-4]
	prfm	pldl1keep, [x3]
	ldur	q16, [x3, #-16]
	add	x3, x3, #16
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x4, x20
	b.lt	.LBB0_75
	b	.LBB0_70
	.p2align	2
.LBB0_76:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x13, [sp, #1296]                // 8-byte Folded Reload
	ldr	x14, [sp, #1128]                // 8-byte Folded Reload
	cmp	x13, x14
	b.ge	.LBB0_82
// %bb.77:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x17, [sp, #1296]                // 8-byte Folded Reload
	ldr	x18, [sp, #1280]                // 8-byte Folded Reload
	mov	x15, xzr
	add	x16, x17, #1
	madd	x13, x17, x29, x9
	madd	x17, x17, x28, x10
	ldr	q4, [x8]
	madd	x14, x16, x29, x9
	madd	x16, x16, x28, x10
	add	x13, x13, x19
	lsl	x17, x17, #2
	add	x14, x14, x19
	add	x13, x7, x13, lsl #2
	lsl	x16, x16, #2
	ldr	q3, [x18, x17]
	ldr	x17, [sp, #1120]                // 8-byte Folded Reload
	add	x14, x7, x14, lsl #2
	ldr	q2, [x18, x16]
	mov	x16, x11
	ldr	q0, [x13]
	ldr	q1, [x14]
	cmp	xzr, x22
	b.ge	.LBB0_79
	.p2align	2
.LBB0_78:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x16, #32
	ldr	x18, [sp, #1184]                // 8-byte Folded Reload
	ldr	x2, [sp, #1176]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	prfm	pldl1keep, [x4]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldp	q4, q5, [x16, #-32]
	add	x15, x15, #4
	add	x18, x18, x17
	add	x2, x2, x17
	add	x17, x17, #16
	add	x1, x18, #32
	add	x3, x2, #32
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
	ldr	q2, [x18, #16]
	cmp	x15, x22
	b.lt	.LBB0_78
.LBB0_79:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	q5, [x8, x6, lsl #4]
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldr	q4, [x8, x23, lsl #4]
	ldr	x15, [sp, #1120]                // 8-byte Folded Reload
	ldr	x16, [sp, #1304]                // 8-byte Folded Reload
	fmla	v0.4s, v5.4s, v3.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldr	q5, [x8, x24, lsl #4]
	fmla	v0.4s, v4.4s, v3.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v3.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	cmp	x16, x20
	b.ge	.LBB0_81
	.p2align	2
.LBB0_80:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x1, [sp, #1168]                 // 8-byte Folded Reload
	ldr	x2, [sp, #1160]                 // 8-byte Folded Reload
	add	x16, x16, #1
	add	x17, x1, x15
	add	x18, x2, x15
	add	x17, x17, #4
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	ldr	s2, [x2, x15]
	prfm	pldl1keep, [x17]
	ldr	s3, [x1, x15]
	prfm	pldl1keep, [x12]
	ldur	q4, [x12, #-16]
	add	x12, x12, #16
	add	x15, x15, #4
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v3.s[0]
	cmp	x16, x20
	b.lt	.LBB0_80
.LBB0_81:                               //   in Loop: Header=BB0_7 Depth=2
	str	q0, [x13]
	str	q1, [x14]
.LBB0_82:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #1024]                // 8-byte Folded Reload
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	cmp	x13, x12
	b.ge	.LBB0_88
// %bb.83:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	ldr	q2, [x8]
	mov	x12, xzr
	madd	x9, x13, x29, x9
	madd	x10, x13, x28, x10
	ldr	x13, [sp, #1280]                // 8-byte Folded Reload
	ldr	x14, [sp, #896]                 // 8-byte Folded Reload
	add	x9, x9, x19
	lsl	x10, x10, #2
	add	x9, x7, x9, lsl #2
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	q0, [x9]
	cmp	xzr, x22
	b.ge	.LBB0_85
	.p2align	2
.LBB0_84:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	cmp	x12, x22
	b.lt	.LBB0_84
.LBB0_85:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	q3, [x8, x6, lsl #4]
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x11, [sp, #280]                 // 8-byte Folded Reload
	ldr	q2, [x8, x23, lsl #4]
	mov	x10, xzr
	mov	w12, #16                        // =0x10
	fmla	v0.4s, v3.4s, v1.s[1]
	ldr	q3, [x8, x24, lsl #4]
	add	x8, x8, x11
	ldr	x11, [sp, #880]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[2]
	fmla	v0.4s, v3.4s, v1.s[3]
	ldr	x13, [sp, #1304]                // 8-byte Folded Reload
	add	x13, x13, xzr
	cmp	x13, x20
	b.ge	.LBB0_87
	.p2align	2
.LBB0_86:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x8, x12
	prfm	pldl1keep, [x11]
	ldr	s1, [x14, x10, lsl #2]
	prfm	pldl1keep, [x13]
	ldr	q2, [x8, x10, lsl #4]
	add	x10, x10, #1
	add	x12, x12, #16
	add	x11, x11, #4
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x13, [sp, #1304]                // 8-byte Folded Reload
	add	x13, x13, x10
	cmp	x13, x20
	b.lt	.LBB0_86
.LBB0_87:                               //   in Loop: Header=BB0_7 Depth=2
	str	q0, [x9]
.LBB0_88:                               //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x30, [sp, #1080]                // 8-byte Folded Reload
	ldr	x19, [sp, #1072]                // 8-byte Folded Reload
	ldr	x8, [sp, #592]                  // 8-byte Folded Reload
	ldr	x9, [sp, #584]                  // 8-byte Folded Reload
	cmp	x8, x9
	b.ge	.LBB0_38
.LBB0_89:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #424]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	ldr	x9, [sp, #1008]                 // 8-byte Folded Reload
	mov	x16, x19
	mov	x12, xzr
	ldr	x15, [sp, #1064]                // 8-byte Folded Reload
	ldr	x14, [sp, #1256]                // 8-byte Folded Reload
	mul	x8, x19, x8
	ldr	x19, [sp, #592]                 // 8-byte Folded Reload
	ldr	x17, [sp, #1272]                // 8-byte Folded Reload
	add	x10, x14, x29
	ldr	x21, [sp, #992]                 // 8-byte Folded Reload
	ldr	x23, [sp, #976]                 // 8-byte Folded Reload
	ldr	x24, [sp, #968]                 // 8-byte Folded Reload
	ldp	x30, x25, [sp, #296]            // 16-byte Folded Reload
	madd	x9, x15, x9, x8
	add	x8, x9, x19
	add	x13, x8, x29
	lsl	x11, x8, #2
	add	x14, x8, x14
	add	x8, x8, x10
	lsl	x10, x13, #2
	ldr	d0, [x17, x11]
	lsl	x11, x14, #2
	ldr	x13, [sp, #1264]                // 8-byte Folded Reload
	ldr	x14, [sp, #1280]                // 8-byte Folded Reload
	lsl	x8, x8, #2
	ldr	d2, [x17, x10]
	ldr	x10, [sp, #1040]                // 8-byte Folded Reload
	mul	x10, x16, x10
	ldr	d1, [x17, x11]
	ldr	x11, [sp, #1048]                // 8-byte Folded Reload
	madd	x11, x15, x11, x10
	ldr	d3, [x17, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	add	x10, x11, x19
	lsl	x10, x10, #2
	ldr	d7, [x13, x10]
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	ldr	x13, [sp, #1056]                // 8-byte Folded Reload
	mul	x10, x16, x10
	madd	x10, x15, x13, x10
	ldr	x15, [sp, #1120]                // 8-byte Folded Reload
	lsl	x13, x10, #2
	ldr	q4, [x14, x13]
	add	x13, x10, x28
	lsl	x13, x13, #2
	ldr	q5, [x14, x13]
	add	x13, x10, x28, lsl #1
	lsl	x13, x13, #2
	ldr	q6, [x14, x13]
	ldr	x14, [sp, #656]                 // 8-byte Folded Reload
	orr	x13, x8, #0x10
	.p2align	2
.LBB0_90:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #1288]                // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[0]
	fmla	v2.2s, v7.2s, v5.s[0]
	cmp	x12, x22
	add	x16, x16, x15
	prfm	pldl1keep, [x16, #16]
	ldr	q16, [x16]
	b.ge	.LBB0_92
// %bb.91:                              //   in Loop: Header=BB0_90 Depth=3
	ldr	x7, [sp, #720]                  // 8-byte Folded Reload
	ldr	x16, [sp, #1224]                // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v6.s[0]
	fmla	v3.2s, v7.2s, v16.s[0]
	ldr	x18, [sp, #1208]                // 8-byte Folded Reload
	ldr	x2, [sp, #1216]                 // 8-byte Folded Reload
	add	x5, x30, x14
	add	x4, x25, x14
	ldr	x6, [sp, #728]                  // 8-byte Folded Reload
	stur	d7, [x13, #-16]
	add	x12, x12, #4
	add	x7, x7, x14
	add	x6, x6, x14
	add	x16, x16, x15
	add	x18, x18, x15
	add	x2, x2, x15
	add	x15, x15, #16
	prfm	pldl1keep, [x7]
	ldr	x7, [sp, #704]                  // 8-byte Folded Reload
	add	x17, x16, #32
	add	x1, x18, #32
	add	x3, x2, #32
	ldr	d7, [x7, x14]
	stur	d7, [x13, #-8]
	prfm	pldl1keep, [x6]
	ldr	x6, [sp, #696]                  // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[1]
	fmla	v2.2s, v7.2s, v5.s[1]
	fmla	v1.2s, v7.2s, v6.s[1]
	fmla	v3.2s, v7.2s, v16.s[1]
	ldr	d7, [x6, x14]
	str	d7, [x13]
	prfm	pldl1keep, [x5]
	ldr	x5, [sp, #688]                  // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[2]
	fmla	v2.2s, v7.2s, v5.s[2]
	fmla	v1.2s, v7.2s, v6.s[2]
	fmla	v3.2s, v7.2s, v16.s[2]
	ldr	d7, [x5, x14]
	str	d7, [x13, #8]
	prfm	pldl1keep, [x4]
	ldr	x4, [sp, #712]                  // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[3]
	fmla	v2.2s, v7.2s, v5.s[3]
	fmla	v1.2s, v7.2s, v6.s[3]
	fmla	v3.2s, v7.2s, v16.s[3]
	add	x13, x13, #32
	ldr	d7, [x4, x14]
	prfm	pldl1keep, [x3]
	ldr	q4, [x2, #16]
	prfm	pldl1keep, [x1]
	ldr	q5, [x18, #16]
	prfm	pldl1keep, [x17]
	ldr	q6, [x16, #16]
	ldr	x16, [sp, #1240]                // 8-byte Folded Reload
	add	x14, x14, x16
	b	.LBB0_90
	.p2align	2
.LBB0_92:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #1000]                // 8-byte Folded Reload
	ldr	x6, [sp, #984]                  // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v6.s[0]
	fmla	v3.2s, v7.2s, v16.s[0]
	ldr	x16, [sp, #1264]                // 8-byte Folded Reload
	str	d7, [x8, x22, lsl #3]
	mov	x12, xzr
	ldr	x7, [sp, #648]                  // 8-byte Folded Reload
	ldr	x25, [sp, #680]                 // 8-byte Folded Reload
	mov	x13, xzr
	madd	x14, x6, x15, x11
	ldr	x30, [sp, #1272]                // 8-byte Folded Reload
	add	x14, x14, x19
	lsl	x14, x14, #2
	ldr	d17, [x16, x14]
	madd	x14, x23, x15, x11
	madd	x11, x24, x15, x11
	ldr	x15, [sp, #672]                 // 8-byte Folded Reload
	add	x14, x14, x19
	add	x11, x11, x19
	lsl	x14, x14, #2
	lsl	x11, x11, #2
	str	d17, [x8, x6, lsl #3]
	fmla	v0.2s, v17.2s, v4.s[1]
	fmla	v2.2s, v17.2s, v5.s[1]
	fmla	v1.2s, v17.2s, v6.s[1]
	fmla	v3.2s, v17.2s, v16.s[1]
	ldr	d7, [x16, x14]
	ldr	x14, [sp, #456]                 // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[2]
	str	d7, [x8, x23, lsl #3]
	fmla	v2.2s, v7.2s, v5.s[2]
	fmla	v1.2s, v7.2s, v6.s[2]
	fmla	v3.2s, v7.2s, v16.s[2]
	ldr	d7, [x16, x11]
	ldr	x11, [sp, #664]                 // 8-byte Folded Reload
	add	x11, x11, x14
	add	x14, x15, x14
	ldr	x15, [sp, #1304]                // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v4.s[3]
	fmla	v2.2s, v7.2s, v5.s[3]
	fmla	v1.2s, v7.2s, v6.s[3]
	fmla	v3.2s, v7.2s, v16.s[3]
	str	d7, [x8, x24, lsl #3]
	cmp	x15, x20
	b.ge	.LBB0_94
	.p2align	2
.LBB0_93:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x17, [sp, #1152]                // 8-byte Folded Reload
	add	x16, x11, x13
	add	x17, x17, x12
	add	x12, x12, #4
	prfm	pldl1keep, [x17]
	ldur	s4, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s5, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s6, [x17, #-4]
	add	x17, x17, x27
	prfm	pldl1keep, [x17]
	ldur	s7, [x17, #-4]
	prfm	pldl1keep, [x16]
	ldr	d16, [x14, x13]
	add	x13, x13, x21
	fmla	v0.2s, v16.2s, v4.s[0]
	str	d16, [x8, x15, lsl #3]
	add	x15, x15, #1
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x15, x20
	b.lt	.LBB0_93
.LBB0_94:                               // %.preheader65
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #288]                 // 8-byte Folded Reload
	ldr	x13, [sp, #1096]                // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #24
	ldr	x14, [sp, #1088]                // 8-byte Folded Reload
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w18, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x12
	b	.LBB0_96
	.p2align	2
.LBB0_95:                               // %.loopexit61
                                        //   in Loop: Header=BB0_96 Depth=3
	ldr	x2, [sp, #1232]                 // 8-byte Folded Reload
	add	x14, x14, x2
	add	x13, x13, x2
	mov	x2, x15
	mov	x15, x1
.LBB0_96:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_98 Depth 4
                                        //         Child Loop BB0_100 Depth 4
	madd	x1, x2, x29, x9
	add	x1, x1, x19
	madd	x16, x16, x29, x9
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	add	x16, x16, x19
	add	x17, x17, x19
	lsl	x1, x1, #2
	lsl	x16, x16, #2
	lsl	x17, x17, #2
	str	d0, [x30, x1]
	str	d2, [x30, x16]
	add	x16, x18, x19
	lsl	x16, x16, #2
	str	d1, [x30, x17]
	str	d3, [x30, x16]
	ldr	x16, [sp, #1296]                // 8-byte Folded Reload
	cmp	x15, x16
	b.ge	.LBB0_101
// %bb.97:                              //   in Loop: Header=BB0_96 Depth=3
	add	x16, x15, #1
	add	x17, x15, #2
	madd	x1, x15, x29, x9
	add	x18, x15, #3
	madd	x3, x16, x29, x9
	ldr	d16, [x8]
	mov	x2, xzr
	add	x1, x1, x19
	madd	x4, x17, x29, x9
	add	x3, x3, x19
	add	x4, x4, x19
	lsl	x1, x1, #2
	lsl	x3, x3, #2
	lsl	x4, x4, #2
	ldr	d0, [x30, x1]
	madd	x1, x18, x29, x9
	ldr	d2, [x30, x3]
	madd	x3, x15, x28, x10
	ldr	d1, [x30, x4]
	ldr	x4, [sp, #1280]                 // 8-byte Folded Reload
	add	x1, x1, x19
	lsl	x3, x3, #2
	lsl	x1, x1, #2
	ldr	q7, [x4, x3]
	madd	x3, x16, x28, x10
	ldr	d3, [x30, x1]
	add	x1, x15, #4
	lsl	x3, x3, #2
	ldr	q6, [x4, x3]
	madd	x3, x17, x28, x10
	lsl	x3, x3, #2
	ldr	q5, [x4, x3]
	madd	x3, x18, x28, x10
	lsl	x3, x3, #2
	ldr	q4, [x4, x3]
	mov	x3, x11
	mov	x4, x14
	cmp	xzr, x22
	b.ge	.LBB0_99
	.p2align	2
.LBB0_98:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_96 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x3, #16
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	add	x2, x2, #4
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	prfm	pldl1keep, [x5]
	add	x5, x4, x27
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
	prfm	pldl1keep, [x5]
	fmla	v2.2s, v17.2s, v6.s[3]
	ldur	q6, [x5, #-16]
	add	x5, x5, x27
	fmla	v1.2s, v17.2s, v5.s[3]
	fmla	v3.2s, v17.2s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x5]
	ldur	q5, [x5, #-16]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	q4, [x5, #-16]
	cmp	x2, x22
	b.lt	.LBB0_98
.LBB0_99:                               //   in Loop: Header=BB0_96 Depth=3
	ldr	d17, [x8, x6, lsl #3]
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	ldr	d16, [x8, x23, lsl #3]
	ldr	d18, [x8, x24, lsl #3]
	ldr	x4, [sp, #1304]                 // 8-byte Folded Reload
	mov	x2, x13
	mov	x3, x12
	fmla	v0.2s, v17.2s, v7.s[1]
	fmla	v2.2s, v17.2s, v6.s[1]
	fmla	v1.2s, v17.2s, v5.s[1]
	fmla	v3.2s, v17.2s, v4.s[1]
	fmla	v0.2s, v16.2s, v7.s[2]
	fmla	v2.2s, v16.2s, v6.s[2]
	fmla	v1.2s, v16.2s, v5.s[2]
	fmla	v3.2s, v16.2s, v4.s[2]
	fmla	v0.2s, v18.2s, v7.s[3]
	fmla	v2.2s, v18.2s, v6.s[3]
	fmla	v1.2s, v18.2s, v5.s[3]
	fmla	v3.2s, v18.2s, v4.s[3]
	cmp	x4, x20
	b.ge	.LBB0_95
	.p2align	2
.LBB0_100:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_96 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x5]
	ldur	s5, [x5, #-4]
	add	x5, x5, x27
	add	x2, x2, #4
	prfm	pldl1keep, [x5]
	ldur	s6, [x5, #-4]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	s7, [x5, #-4]
	prfm	pldl1keep, [x3]
	ldur	d16, [x3, #-8]
	add	x3, x3, #8
	fmla	v0.2s, v16.2s, v4.s[0]
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x4, x20
	b.lt	.LBB0_100
	b	.LBB0_95
	.p2align	2
.LBB0_101:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #1296]                // 8-byte Folded Reload
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	cmp	x12, x13
	b.ge	.LBB0_107
// %bb.102:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x16, [sp, #1296]                // 8-byte Folded Reload
	ldr	x17, [sp, #1280]                // 8-byte Folded Reload
	mov	x14, xzr
	add	x15, x16, #1
	madd	x12, x16, x29, x9
	madd	x16, x16, x28, x10
	ldr	d4, [x8]
	madd	x13, x15, x29, x9
	madd	x15, x15, x28, x10
	add	x12, x12, x19
	lsl	x16, x16, #2
	add	x13, x13, x19
	add	x12, x30, x12, lsl #2
	lsl	x15, x15, #2
	ldr	q3, [x17, x16]
	ldr	x16, [sp, #1120]                // 8-byte Folded Reload
	add	x13, x30, x13, lsl #2
	ldr	q2, [x17, x15]
	mov	x15, x11
	ldr	d0, [x12]
	ldr	d1, [x13]
	cmp	xzr, x22
	b.ge	.LBB0_104
	.p2align	2
.LBB0_103:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x3, x15, #16
	ldr	x17, [sp, #1184]                // 8-byte Folded Reload
	ldr	x1, [sp, #1176]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	prfm	pldl1keep, [x3]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldp	d4, d5, [x15, #-16]
	add	x14, x14, #4
	add	x17, x17, x16
	add	x1, x1, x16
	add	x16, x16, #16
	add	x18, x17, #32
	add	x2, x1, #32
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v5.2s, v3.s[2]
	fmla	v1.2s, v5.2s, v2.s[2]
	ldp	d5, d4, [x15], #32
	prfm	pldl1keep, [x2]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x1, #16]
	prfm	pldl1keep, [x18]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x17, #16]
	cmp	x14, x22
	b.lt	.LBB0_103
.LBB0_104:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	d5, [x8, x6, lsl #3]
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldr	d4, [x8, x23, lsl #3]
	ldr	x16, [sp, #408]                 // 8-byte Folded Reload
	mov	x14, xzr
	mov	x15, xzr
	add	x16, x8, x16
	fmla	v0.2s, v5.2s, v3.s[1]
	fmla	v1.2s, v5.2s, v2.s[1]
	ldr	d5, [x8, x24, lsl #3]
	fmla	v0.2s, v4.2s, v3.s[2]
	fmla	v1.2s, v4.2s, v2.s[2]
	fmla	v0.2s, v5.2s, v3.s[3]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	x17, [sp, #1304]                // 8-byte Folded Reload
	add	x17, x17, xzr
	cmp	x17, x20
	b.ge	.LBB0_106
	.p2align	2
.LBB0_105:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x17, x16, x15, lsl #3
	add	x18, x25, x14
	add	x1, x7, x14
	add	x14, x14, #4
	add	x1, x1, #4
	add	x18, x18, #4
	add	x17, x17, #8
	prfm	pldl1keep, [x1]
	ldr	s2, [x7, x15, lsl #2]
	prfm	pldl1keep, [x18]
	ldr	s3, [x25, x15, lsl #2]
	prfm	pldl1keep, [x17]
	ldr	d4, [x16, x15, lsl #3]
	add	x15, x15, #1
	fmla	v0.2s, v4.2s, v2.s[0]
	fmla	v1.2s, v4.2s, v3.s[0]
	ldr	x17, [sp, #1304]                // 8-byte Folded Reload
	add	x17, x17, x15
	cmp	x17, x20
	b.lt	.LBB0_105
.LBB0_106:                              //   in Loop: Header=BB0_7 Depth=2
	str	d0, [x12]
	str	d1, [x13]
.LBB0_107:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #1024]                // 8-byte Folded Reload
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	cmp	x13, x12
	b.ge	.LBB0_113
// %bb.108:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	ldr	d2, [x8]
	mov	x12, xzr
	madd	x9, x13, x29, x9
	madd	x10, x13, x28, x10
	ldr	x13, [sp, #1280]                // 8-byte Folded Reload
	ldr	x14, [sp, #896]                 // 8-byte Folded Reload
	add	x9, x9, x19
	lsl	x10, x10, #2
	add	x9, x30, x9, lsl #2
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ldr	d0, [x9]
	cmp	xzr, x22
	b.ge	.LBB0_110
	.p2align	2
.LBB0_109:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	cmp	x12, x22
	b.lt	.LBB0_109
.LBB0_110:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	d3, [x8, x6, lsl #3]
	fmla	v0.2s, v2.2s, v1.s[0]
	ldr	x11, [sp, #408]                 // 8-byte Folded Reload
	ldr	d4, [x8, x23, lsl #3]
	ldr	d2, [x8, x24, lsl #3]
	mov	x10, xzr
	add	x8, x8, x11
	ldr	x11, [sp, #880]                 // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v1.s[1]
	fmla	v0.2s, v4.2s, v1.s[2]
	fmla	v0.2s, v2.2s, v1.s[3]
	ldr	x12, [sp, #1304]                // 8-byte Folded Reload
	add	x12, x12, xzr
	cmp	x12, x20
	b.ge	.LBB0_112
	.p2align	2
.LBB0_111:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x12, x8, x10, lsl #3
	prfm	pldl1keep, [x11]
	ldr	s1, [x14, x10, lsl #2]
	add	x11, x11, #4
	add	x12, x12, #8
	prfm	pldl1keep, [x12]
	ldr	d2, [x8, x10, lsl #3]
	add	x10, x10, #1
	fmla	v0.2s, v2.2s, v1.s[0]
	ldr	x12, [sp, #1304]                // 8-byte Folded Reload
	add	x12, x12, x10
	cmp	x12, x20
	b.lt	.LBB0_111
.LBB0_112:                              //   in Loop: Header=BB0_7 Depth=2
	str	d0, [x9]
.LBB0_113:                              //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x30, [sp, #1080]                // 8-byte Folded Reload
	ldr	x19, [sp, #1072]                // 8-byte Folded Reload
	ldr	x8, [sp, #504]                  // 8-byte Folded Reload
	ldr	x9, [sp, #584]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_6
.LBB0_114:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #480]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #1016]                 // 8-byte Folded Reload
	ldr	x9, [sp, #1008]                 // 8-byte Folded Reload
	add	x10, x0, #63
	mov	x12, xzr
	ldr	x15, [sp, #1064]                // 8-byte Folded Reload
	ldr	x21, [sp, #584]                 // 8-byte Folded Reload
	mov	x13, xzr
	mul	x8, x19, x8
	ldr	x14, [sp, #1256]                // 8-byte Folded Reload
	ldr	x16, [sp, #1272]                // 8-byte Folded Reload
	ldr	x23, [sp, #992]                 // 8-byte Folded Reload
	ldr	x30, [sp, #384]                 // 8-byte Folded Reload
	ldp	x25, x24, [sp, #392]            // 16-byte Folded Reload
	madd	x9, x15, x9, x8
	add	x8, x9, x21
	add	x11, x8, x14
	add	x14, x14, x29
	ldr	s1, [x16, x8, lsl #2]
	add	x14, x8, x14
	add	x8, x8, x29
	ldr	s2, [x16, x11, lsl #2]
	ldr	x11, [sp, #1048]                // 8-byte Folded Reload
	ldr	s3, [x16, x8, lsl #2]
	ldr	x8, [sp, #1040]                 // 8-byte Folded Reload
	ldr	s0, [x16, x14, lsl #2]
	ldr	x14, [sp, #1264]                // 8-byte Folded Reload
	mul	x8, x19, x8
	madd	x11, x15, x11, x8
	add	x8, x11, x21
	ldr	s16, [x14, x8, lsl #2]
	and	x8, x10, #0xffffffffffffffc0
	ldr	x10, [sp, #1032]                // 8-byte Folded Reload
	ldr	x14, [sp, #1056]                // 8-byte Folded Reload
	mul	x10, x19, x10
	madd	x10, x15, x14, x10
	ldr	x15, [sp, #1280]                // 8-byte Folded Reload
	lsl	x14, x10, #2
	ldr	q4, [x15, x14]
	add	x14, x10, x28
	lsl	x14, x14, #2
	ldr	q5, [x15, x14]
	add	x14, x10, x28, lsl #1
	lsl	x14, x14, #2
	ldr	q6, [x15, x14]
	ldr	x15, [sp, #656]                 // 8-byte Folded Reload
	orr	x14, x8, #0xc
	.p2align	2
.LBB0_115:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #888]                 // 8-byte Folded Reload
	ext	v20.16b, v4.16b, v4.16b, #8
	cmp	x13, x22
	ext	v19.16b, v5.16b, v5.16b, #8
	add	x16, x16, x12
	prfm	pldl1keep, [x16, #16]
	ldr	q7, [x16]
	ext	v18.16b, v6.16b, v6.16b, #8
	ext	v17.16b, v7.16b, v7.16b, #8
	b.ge	.LBB0_117
// %bb.116:                             //   in Loop: Header=BB0_115 Depth=3
	ldr	x7, [sp, #840]                  // 8-byte Folded Reload
	add	x19, x14, x12
	ldr	x16, [sp, #856]                 // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v4.2s
	ldr	x18, [sp, #864]                 // 8-byte Folded Reload
	ldr	x2, [sp, #872]                  // 8-byte Folded Reload
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v2.2s, v16.2s, v6.2s
	stur	s16, [x19, #-12]
	fmla	v0.2s, v16.2s, v7.2s
	add	x6, x30, x15
	add	x5, x25, x15
	add	x4, x24, x15
	add	x13, x13, #4
	add	x7, x7, x15
	add	x16, x16, x12
	add	x18, x18, x12
	add	x2, x2, x12
	add	x12, x12, #16
	prfm	pldl1keep, [x7]
	ldr	x7, [sp, #824]                  // 8-byte Folded Reload
	add	x17, x16, #32
	add	x1, x18, #32
	add	x3, x2, #32
	ldr	s16, [x7, x15]
	stur	s16, [x19, #-8]
	prfm	pldl1keep, [x6]
	ldr	x6, [sp, #816]                  // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v4.s[1]
	fmla	v3.2s, v16.2s, v5.s[1]
	fmla	v2.2s, v16.2s, v6.s[1]
	fmla	v0.2s, v16.2s, v7.s[1]
	ldr	s16, [x6, x15]
	stur	s16, [x19, #-4]
	prfm	pldl1keep, [x5]
	ldr	x5, [sp, #808]                  // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v2.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	ldr	s16, [x5, x15]
	str	s16, [x19]
	prfm	pldl1keep, [x4]
	ldr	x4, [sp, #832]                  // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v4.s[3]
	fmla	v3.2s, v16.2s, v5.s[3]
	fmla	v2.2s, v16.2s, v6.s[3]
	fmla	v0.2s, v16.2s, v7.s[3]
	ldr	s16, [x4, x15]
	prfm	pldl1keep, [x3]
	ldr	q4, [x2, #16]
	prfm	pldl1keep, [x1]
	ldr	q5, [x18, #16]
	prfm	pldl1keep, [x17]
	ldr	q6, [x16, #16]
	ldr	x16, [sp, #1240]                // 8-byte Folded Reload
	add	x15, x15, x16
	b	.LBB0_115
	.p2align	2
.LBB0_117:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #1000]                // 8-byte Folded Reload
	ldr	x6, [sp, #984]                  // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	ldr	x16, [sp, #1264]                // 8-byte Folded Reload
	ldr	x7, [sp, #976]                  // 8-byte Folded Reload
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	str	s16, [x8, x22, lsl #2]
	ldr	x19, [sp, #968]                 // 8-byte Folded Reload
	mov	x12, xzr
	ldr	x24, [sp, #616]                 // 8-byte Folded Reload
	ldr	x25, [sp, #608]                 // 8-byte Folded Reload
	mov	x13, xzr
	madd	x14, x6, x15, x11
	ldr	x17, [sp, #576]                 // 8-byte Folded Reload
	ldr	x18, [sp, #600]                 // 8-byte Folded Reload
	add	x14, x14, x21
	ldr	x30, [sp, #648]                 // 8-byte Folded Reload
	ldr	s16, [x16, x14, lsl #2]
	madd	x14, x7, x15, x11
	madd	x11, x19, x15, x11
	add	x14, x14, x21
	add	x11, x11, x21
	str	s16, [x8, x6, lsl #2]
	fmla	v1.2s, v16.2s, v4.s[1]
	fmla	v3.2s, v16.2s, v5.s[1]
	fmla	v2.2s, v16.2s, v6.s[1]
	fmla	v0.2s, v16.2s, v7.s[1]
	ldr	s16, [x16, x14, lsl #2]
	ldr	x14, [sp, #1304]                // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v20.2s
	str	s16, [x8, x7, lsl #2]
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v2.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	ldr	s16, [x16, x11, lsl #2]
	ldr	x11, [sp, #512]                 // 8-byte Folded Reload
	add	x11, x8, x11
	fmla	v1.2s, v16.2s, v4.s[3]
	fmla	v3.2s, v16.2s, v5.s[3]
	fmla	v2.2s, v16.2s, v6.s[3]
	fmla	v0.2s, v16.2s, v7.s[3]
	str	s16, [x8, x19, lsl #2]
	cmp	x14, x20
	b.ge	.LBB0_119
	.p2align	2
.LBB0_118:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #1152]                // 8-byte Folded Reload
	add	x15, x18, x13
	add	x14, x14, #1
	add	x16, x16, x12
	prfm	pldl1keep, [x16]
	ldur	s4, [x16, #-4]
	add	x16, x16, x27
	prfm	pldl1keep, [x16]
	ldur	s5, [x16, #-4]
	add	x16, x16, x27
	prfm	pldl1keep, [x16]
	ldur	s6, [x16, #-4]
	add	x16, x16, x27
	prfm	pldl1keep, [x16]
	ldur	s7, [x16, #-4]
	prfm	pldl1keep, [x15]
	ldr	s16, [x17, x13]
	add	x13, x13, x23
	fmla	v1.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	str	s16, [x11, x12]
	add	x12, x12, #4
	cmp	x14, x20
	b.lt	.LBB0_118
.LBB0_119:                              // %.preheader64
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #448]                 // 8-byte Folded Reload
	ldr	x13, [sp, #1096]                // 8-byte Folded Reload
	mov	x2, xzr
	add	x11, x8, #12
	ldr	x14, [sp, #1088]                // 8-byte Folded Reload
	mov	w17, #1                         // =0x1
	mov	w18, #2                         // =0x2
	mov	w16, #3                         // =0x3
	mov	w15, #4                         // =0x4
	add	x12, x8, x12
	b	.LBB0_121
	.p2align	2
.LBB0_120:                              // %.loopexit60
                                        //   in Loop: Header=BB0_121 Depth=3
	ldr	x2, [sp, #1232]                 // 8-byte Folded Reload
	add	x14, x14, x2
	add	x13, x13, x2
	mov	x2, x15
	mov	x15, x1
.LBB0_121:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_123 Depth 4
                                        //         Child Loop BB0_125 Depth 4
	madd	x1, x2, x29, x9
	ldr	x23, [sp, #1272]                // 8-byte Folded Reload
	add	x1, x1, x21
	madd	x17, x17, x29, x9
	madd	x18, x18, x29, x9
	madd	x16, x16, x29, x9
	add	x17, x17, x21
	add	x16, x16, x21
	str	s1, [x23, x1, lsl #2]
	str	s3, [x23, x17, lsl #2]
	add	x17, x18, x21
	str	s2, [x23, x17, lsl #2]
	str	s0, [x23, x16, lsl #2]
	ldr	x16, [sp, #1296]                // 8-byte Folded Reload
	cmp	x15, x16
	b.ge	.LBB0_126
// %bb.122:                             //   in Loop: Header=BB0_121 Depth=3
	add	x17, x15, #1
	add	x18, x15, #2
	add	x16, x15, #3
	madd	x1, x15, x29, x9
	madd	x3, x17, x29, x9
	ldr	s16, [x8]
	mov	x2, xzr
	add	x1, x1, x21
	madd	x4, x18, x29, x9
	madd	x5, x16, x29, x9
	add	x3, x3, x21
	add	x4, x4, x21
	add	x5, x5, x21
	ldr	s1, [x23, x1, lsl #2]
	add	x1, x15, #4
	ldr	s3, [x23, x3, lsl #2]
	madd	x3, x15, x28, x10
	lsl	x3, x3, #2
	ldr	s2, [x23, x4, lsl #2]
	ldr	x4, [sp, #1280]                 // 8-byte Folded Reload
	ldr	s0, [x23, x5, lsl #2]
	ldr	q7, [x4, x3]
	madd	x3, x17, x28, x10
	lsl	x3, x3, #2
	ldr	q6, [x4, x3]
	madd	x3, x18, x28, x10
	lsl	x3, x3, #2
	ldr	q5, [x4, x3]
	madd	x3, x16, x28, x10
	lsl	x3, x3, #2
	ldr	q4, [x4, x3]
	mov	x3, x11
	mov	x4, x14
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	xzr, x22
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.ge	.LBB0_124
	.p2align	2
.LBB0_123:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_121 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x3, #8
	fmla	v1.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	add	x2, x2, #4
	fmla	v2.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	prfm	pldl1keep, [x5]
	add	x5, x4, x27
	ldp	s16, s21, [x3, #-8]
	fmla	v0.2s, v16.2s, v4.s[1]
	fmla	v1.2s, v16.2s, v7.s[1]
	fmla	v3.2s, v16.2s, v6.s[1]
	fmla	v2.2s, v16.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v17.2s
	fmla	v1.2s, v21.2s, v20.2s
	ldp	s17, s16, [x3], #16
	fmla	v3.2s, v21.2s, v19.2s
	fmla	v2.2s, v21.2s, v18.2s
	prfm	pldl1keep, [x4]
	fmla	v1.2s, v17.2s, v7.s[3]
	ldur	q7, [x4, #-16]
	prfm	pldl1keep, [x5]
	fmla	v3.2s, v17.2s, v6.s[3]
	ldur	q6, [x5, #-16]
	add	x5, x5, x27
	fmla	v2.2s, v17.2s, v5.s[3]
	fmla	v0.2s, v17.2s, v4.s[3]
	add	x4, x4, #16
	prfm	pldl1keep, [x5]
	ldur	q5, [x5, #-16]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	q4, [x5, #-16]
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	x2, x22
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.lt	.LBB0_123
.LBB0_124:                              //   in Loop: Header=BB0_121 Depth=3
	ldr	s21, [x8, x6, lsl #2]
	fmla	v1.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	fmla	v2.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	ldr	s16, [x8, x7, lsl #2]
	ldr	s22, [x8, x19, lsl #2]
	ldr	x4, [sp, #1304]                 // 8-byte Folded Reload
	mov	x2, x13
	mov	x3, x12
	fmla	v1.2s, v21.2s, v7.s[1]
	fmla	v3.2s, v21.2s, v6.s[1]
	fmla	v2.2s, v21.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v4.s[1]
	fmla	v1.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v2.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	fmla	v1.2s, v22.2s, v7.s[3]
	fmla	v3.2s, v22.2s, v6.s[3]
	fmla	v2.2s, v22.2s, v5.s[3]
	fmla	v0.2s, v22.2s, v4.s[3]
	cmp	x4, x20
	b.ge	.LBB0_120
	.p2align	2
.LBB0_125:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_121 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x5, x2, x27
	prfm	pldl1keep, [x2]
	ldur	s4, [x2, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x5]
	ldur	s5, [x5, #-4]
	add	x5, x5, x27
	add	x2, x2, #4
	prfm	pldl1keep, [x5]
	ldur	s6, [x5, #-4]
	add	x5, x5, x27
	prfm	pldl1keep, [x5]
	ldur	s7, [x5, #-4]
	prfm	pldl1keep, [x3]
	ldur	s16, [x3, #-4]
	add	x3, x3, #4
	fmla	v1.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	cmp	x4, x20
	b.lt	.LBB0_125
	b	.LBB0_120
	.p2align	2
.LBB0_126:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #1296]                // 8-byte Folded Reload
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	cmp	x12, x13
	b.ge	.LBB0_132
// %bb.127:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x16, [sp, #1296]                // 8-byte Folded Reload
	ldr	x17, [sp, #1280]                // 8-byte Folded Reload
	mov	x14, xzr
	mov	x15, xzr
	ldr	s4, [x8]
	madd	x12, x16, x28, x10
	add	x13, x16, #1
	lsl	x12, x12, #2
	ldr	q3, [x17, x12]
	madd	x12, x13, x28, x10
	madd	x13, x13, x29, x9
	lsl	x12, x12, #2
	add	x13, x13, x21
	ldr	q2, [x17, x12]
	madd	x12, x16, x29, x9
	ldr	x16, [sp, #1272]                // 8-byte Folded Reload
	add	x12, x12, x21
	ldr	s0, [x16, x13, lsl #2]
	ldr	s1, [x16, x12, lsl #2]
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	xzr, x22
	ext	v5.16b, v2.16b, v2.16b, #8
	b.ge	.LBB0_129
	.p2align	2
.LBB0_128:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x2, x8, x14
	fmla	v1.2s, v4.2s, v3.2s
	fmla	v0.2s, v4.2s, v2.2s
	add	x16, x25, x14
	add	x3, x2, #20
	add	x18, x24, x14
	add	x17, x16, #32
	add	x1, x18, #32
	prfm	pldl1keep, [x3]
	ldp	s4, s7, [x2, #4]
	add	x15, x15, #4
	add	x14, x14, #16
	fmla	v0.2s, v4.2s, v2.s[1]
	fmla	v1.2s, v4.2s, v3.s[1]
	fmla	v0.2s, v7.2s, v5.2s
	ldp	s5, s4, [x2, #12]
	fmla	v1.2s, v7.2s, v6.2s
	prfm	pldl1keep, [x1]
	fmla	v1.2s, v5.2s, v3.s[3]
	ldr	q3, [x18, #16]
	prfm	pldl1keep, [x17]
	fmla	v0.2s, v5.2s, v2.s[3]
	ldr	q2, [x16, #16]
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	x15, x22
	ext	v5.16b, v2.16b, v2.16b, #8
	b.lt	.LBB0_128
.LBB0_129:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	s7, [x8, x6, lsl #2]
	fmla	v1.2s, v4.2s, v3.2s
	fmla	v0.2s, v4.2s, v2.2s
	ldr	s4, [x8, x7, lsl #2]
	ldr	x15, [sp, #512]                 // 8-byte Folded Reload
	ldr	x16, [sp, #1304]                // 8-byte Folded Reload
	mov	x14, xzr
	add	x15, x8, x15
	fmla	v1.2s, v7.2s, v3.s[1]
	fmla	v0.2s, v7.2s, v2.s[1]
	ldr	s7, [x8, x19, lsl #2]
	fmla	v1.2s, v4.2s, v6.2s
	fmla	v0.2s, v4.2s, v5.2s
	fmla	v1.2s, v7.2s, v3.s[3]
	fmla	v0.2s, v7.2s, v2.s[3]
	cmp	x16, x20
	b.ge	.LBB0_131
	.p2align	2
.LBB0_130:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x2, [sp, #680]                  // 8-byte Folded Reload
	add	x17, x15, x14
	add	x1, x30, x14
	add	x16, x16, #1
	add	x17, x17, #4
	add	x1, x1, #4
	prfm	pldl1keep, [x1]
	add	x18, x2, x14
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	ldr	s2, [x30, x14]
	prfm	pldl1keep, [x17]
	ldr	s3, [x15, x14]
	fmla	v1.2s, v3.2s, v2.2s
	ldr	s2, [x2, x14]
	add	x14, x14, #4
	fmla	v0.2s, v3.2s, v2.2s
	cmp	x16, x20
	b.lt	.LBB0_130
.LBB0_131:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #1272]                // 8-byte Folded Reload
	str	s1, [x14, x12, lsl #2]
	str	s0, [x14, x13, lsl #2]
.LBB0_132:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #1024]                // 8-byte Folded Reload
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	cmp	x13, x12
	b.ge	.LBB0_5
// %bb.133:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x13, [sp, #1128]                // 8-byte Folded Reload
	ldr	x15, [sp, #1272]                // 8-byte Folded Reload
	mov	x12, xzr
	madd	x9, x13, x29, x9
	madd	x10, x13, x28, x10
	ldr	x13, [sp, #1280]                // 8-byte Folded Reload
	ldr	s2, [x8]
	ldr	x14, [sp, #896]                 // 8-byte Folded Reload
	add	x9, x9, x21
	lsl	x10, x10, #2
	ldr	s0, [x15, x9, lsl #2]
	ldr	q1, [x13, x10]
	ldr	x10, [sp, #904]                 // 8-byte Folded Reload
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	xzr, x22
	b.ge	.LBB0_135
	.p2align	2
.LBB0_134:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	cmp	x12, x22
	b.lt	.LBB0_134
.LBB0_135:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	s4, [x8, x6, lsl #2]
	fmla	v0.2s, v2.2s, v1.2s
	ldr	x11, [sp, #512]                 // 8-byte Folded Reload
	ldr	s5, [x8, x7, lsl #2]
	ldr	s2, [x8, x19, lsl #2]
	mov	x10, xzr
	add	x8, x8, x11
	ldr	x11, [sp, #1304]                // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[1]
	fmla	v0.2s, v5.2s, v3.2s
	fmla	v0.2s, v2.2s, v1.s[3]
	cmp	x11, x20
	b.ge	.LBB0_4
	.p2align	2
.LBB0_136:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	cmp	x11, x20
	b.lt	.LBB0_136
	b	.LBB0_4
.LBB0_137:
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	bl	free
	add	sp, sp, #1312
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
	.size	sbatch_matmul_4d_nn_mlir, .Lfunc_end0-sbatch_matmul_4d_nn_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
