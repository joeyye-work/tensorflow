	.text
	.file	"LLVMDialectModule"
	.globl	sbatch_matmul_4d_nt_mlir                    // -- Begin function sbatch_matmul_4d_nt_mlir
	.p2align	4
	.type	sbatch_matmul_4d_nt_mlir,@function
sbatch_matmul_4d_nt_mlir:                           // @sbatch_matmul_4d_nt_mlir
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
	sub	sp, sp, #688
	.cfi_def_cfa_offset 848
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
	ldr	x13, [sp, #912]
	ldr	x14, [sp, #848]
	mov	x20, x6
	cinv	x8, x5, lt
	ldr	x28, [sp, #1032]
	ldr	x22, [sp, #856]
	mov	x27, x2
	add	x9, x8, x8, lsr #63
	add	x10, x8, #3
	ldr	x25, [sp, #944]
	str	x7, [sp, #664]                  // 8-byte Folded Spill
	stp	x13, x4, [sp, #296]             // 16-byte Folded Spill
	str	x3, [sp, #32]                   // 8-byte Folded Spill
	mov	x19, x1
	asr	x9, x9, #1
	str	x14, [sp, #656]                 // 8-byte Folded Spill
	str	x5, [sp, #528]                  // 8-byte Folded Spill
	cinv	x21, x9, lt
	ldr	x9, [sp, #1024]
	cmp	x8, #0
	csel	x8, x10, x8, lt
	ldr	x10, [sp, #976]
	cmp	x5, #0
	asr	x8, x8, #2
	cinv	x29, x8, lt
	cmp	x13, #0
	str	x9, [sp, #520]                  // 8-byte Folded Spill
	ldr	x9, [sp, #1016]
	cinv	x8, x13, lt
	add	x11, x8, #7
	add	x12, x8, #3
	str	x9, [sp, #512]                  // 8-byte Folded Spill
	ldr	x9, [sp, #968]
	stp	x9, x10, [sp, #480]             // 16-byte Folded Spill
	add	x9, x8, x8, lsr #63
	add	x10, x8, #15
	asr	x9, x9, #1
	cinv	x14, x9, lt
	cmp	x8, #0
	csel	x9, x10, x8, lt
	csel	x10, x11, x8, lt
	ldr	x11, [sp, #888]
	csel	x8, x12, x8, lt
	cmp	x13, #0
	str	x14, [sp, #616]                 // 8-byte Folded Spill
	asr	x9, x9, #4
	asr	x10, x10, #3
	asr	x8, x8, #2
	cinv	x24, x9, lt
	cinv	x26, x10, lt
	cinv	x23, x8, lt
	lsl	x8, x24, #4
	str	x11, [sp, #672]                 // 8-byte Folded Spill
	ldr	x11, [sp, #880]
	str	x8, [sp, #568]                  // 8-byte Folded Spill
	lsl	x8, x23, #2
	str	x11, [sp, #648]                 // 8-byte Folded Spill
	ldr	x11, [sp, #936]
	str	x11, [sp, #632]                 // 8-byte Folded Spill
	ldr	x11, [sp, #928]
	str	x11, [sp, #624]                 // 8-byte Folded Spill
	lsl	x11, x26, #3
	stp	x8, x11, [sp, #440]             // 16-byte Folded Spill
	lsl	x8, x14, #1
	str	x8, [sp, #432]                  // 8-byte Folded Spill
	lsl	x8, x6, #6
	add	x0, x8, #64
	str	x8, [sp, #640]                  // 8-byte Folded Spill
	bl	malloc
	add	x12, x0, #63
	mul	x9, x24, x25
	ldr	x1, [sp, #672]                  // 8-byte Folded Reload
	ldr	x2, [sp, #648]                  // 8-byte Folded Reload
	and	x24, x12, #0xffffffffffffffc0
	ldr	x12, [sp, #624]                 // 8-byte Folded Reload
	mul	x15, x21, x22
	lsl	x8, x29, #2
	str	x8, [sp, #680]                  // 8-byte Folded Spill
	lsl	x8, x21, #1
	mov	w11, #1                         // =0x1
	str	x8, [sp, #592]                  // 8-byte Folded Spill
	negs	x8, x20
	bfi	x11, x29, #2, #62
	and	x10, x20, #0x3
	lsl	x21, x22, #2
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	mul	x18, x22, x11
	and	x8, x8, #0x3
	add	x11, x20, x15, lsl #1
	lsl	x12, x12, #2
	lsl	x0, x27, #2
	mov	w14, #1                         // =0x1
	add	x1, x2, x1, lsl #2
	str	x12, [sp, #24]                  // 8-byte Folded Spill
	ldr	x12, [sp, #632]                 // 8-byte Folded Reload
	csneg	x8, x10, x8, mi
	mul	x10, x26, x25
	bfi	x14, x23, #2, #62
	add	x2, x0, x19
	mul	x16, x25, x14
	add	x4, x1, #4
	add	x5, x2, #4
	add	x9, x4, x9, lsl #6
	mul	x17, x29, x22
	sub	x29, x20, x8
	mul	x13, x23, x25
	lsl	x23, x22, #4
	add	x2, x2, x23
	add	x2, x2, #32
	lsl	x12, x12, #2
	str	x2, [sp, #152]                  // 8-byte Folded Spill
	sub	x2, x24, x8, lsl #6
	ldr	x6, [sp, #640]                  // 8-byte Folded Reload
	str	x12, [sp, #288]                 // 8-byte Folded Spill
	lsl	x12, x25, #6
	add	x18, x0, x18, lsl #2
	str	x27, [sp, #504]                 // 8-byte Folded Spill
	str	x12, [sp, #472]                 // 8-byte Folded Spill
	add	x12, x20, x21
	add	x17, x0, x17, lsl #4
	lsl	x27, x25, #2
	sub	x14, x12, x8
	sub	x12, x11, x8
	add	x15, x0, x15, lsl #3
	lsl	x0, x8, #2
	add	x12, x5, x12, lsl #2
	ldr	x11, [sp, #616]                 // 8-byte Folded Reload
	add	x2, x2, x6
	add	x6, x19, x18
	add	x16, x1, x16, lsl #2
	add	x7, x19, x17
	str	xzr, [sp, #176]                 // 8-byte Folded Spill
	mov	x3, xzr
	stp	x9, x12, [sp, #96]              // 16-byte Folded Spill
	add	x9, x4, x10, lsl #5
	lsl	x10, x20, #4
	lsl	x12, x20, #3
	add	x13, x1, x13, lsl #4
	stp	x13, x16, [sp, #136]            // 16-byte Folded Spill
	add	x13, x15, x19
	add	x13, x13, #32
	str	x9, [sp, #88]                   // 8-byte Folded Spill
	lsl	x9, x20, #5
	mul	x11, x11, x25
	lsl	x25, x20, #2
	stp	x10, x9, [sp, #248]             // 16-byte Folded Spill
	sub	x9, x9, x8, lsl #5
	str	x13, [sp, #128]                 // 8-byte Folded Spill
	add	x13, x15, x25
	sub	x10, x10, x8, lsl #4
	sub	x13, x13, x0
	add	x18, x18, x25
	add	x17, x17, x25
	stp	x9, x12, [sp, #232]             // 16-byte Folded Spill
	sub	x8, x12, x8, lsl #3
	sub	x12, x29, #3
	add	x13, x19, x13
	str	x12, [sp, #648]                 // 8-byte Folded Spill
	sub	x12, x29, #2
	add	x14, x5, x14, lsl #2
	sub	x18, x18, x0
	str	x12, [sp, #640]                 // 8-byte Folded Spill
	sub	x12, x29, #1
	sub	x17, x17, x0
	stp	x13, x14, [sp, #112]            // 16-byte Folded Spill
	str	x12, [sp, #632]                 // 8-byte Folded Spill
	ldr	x12, [sp, #664]                 // 8-byte Folded Reload
	sub	x13, x25, x0
	ldr	x0, [sp, #568]                  // 8-byte Folded Reload
	add	x9, x9, #32
	add	x11, x4, x11, lsl #3
	stp	x9, x8, [sp, #216]              // 16-byte Folded Spill
	str	x10, [sp, #184]                 // 8-byte Folded Spill
	add	x10, x10, #16
	add	x8, x8, #8
	add	x18, x19, x18
	add	x17, x19, x17
	stp	x8, x10, [sp, #200]             // 16-byte Folded Spill
	add	x8, x13, #4
	str	x19, [sp, #496]                 // 8-byte Folded Spill
	stp	x13, x25, [sp, #264]            // 16-byte Folded Spill
	lsl	x12, x12, #2
	stp	x5, x4, [sp, #160]              // 16-byte Folded Spill
	str	x18, [sp, #376]                 // 8-byte Folded Spill
	sub	x19, x29, #4
	str	x12, [sp, #16]                  // 8-byte Folded Spill
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	mov	x9, x11
	str	x8, [sp, #192]                  // 8-byte Folded Spill
	str	x7, [sp, #600]                  // 8-byte Folded Spill
	str	x6, [sp, #608]                  // 8-byte Folded Spill
	lsl	x12, x12, #2
	stp	x17, x6, [sp, #72]              // 16-byte Folded Spill
	stp	x2, x17, [sp, #360]             // 16-byte Folded Spill
	str	x18, [sp, #64]                  // 8-byte Folded Spill
	str	x12, [sp, #280]                 // 8-byte Folded Spill
	add	x12, x24, #256
	str	x12, [sp, #624]                 // 8-byte Folded Spill
	add	x12, x2, #64
	str	x12, [sp, #616]                 // 8-byte Folded Spill
	b	.LBB0_2
	.p2align	2
.LBB0_1:                                // %.loopexit40
                                        //   in Loop: Header=BB0_2 Depth=1
	ldp	x10, x9, [sp, #16]              // 16-byte Folded Reload
	ldr	x8, [sp, #168]                  // 8-byte Folded Reload
	add	x8, x8, x9
	ldr	x3, [sp, #40]                   // 8-byte Folded Reload
	str	x8, [sp, #168]                  // 8-byte Folded Spill
	ldr	x8, [sp, #160]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #160]                  // 8-byte Folded Spill
	ldr	x8, [sp, #152]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #152]                  // 8-byte Folded Spill
	ldr	x8, [sp, #120]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #120]                  // 8-byte Folded Spill
	ldr	x8, [sp, #176]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #176]                  // 8-byte Folded Spill
	ldr	x8, [sp, #128]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #128]                  // 8-byte Folded Spill
	ldr	x8, [sp, #104]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #104]                  // 8-byte Folded Spill
	ldr	x8, [sp, #112]                  // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #112]                  // 8-byte Folded Spill
	ldr	x8, [sp, #96]                   // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #96]                   // 8-byte Folded Spill
	ldr	x8, [sp, #64]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #64]                   // 8-byte Folded Spill
	ldr	x8, [sp, #72]                   // 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #72]                   // 8-byte Folded Spill
	ldr	x8, [sp, #88]                   // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #88]                   // 8-byte Folded Spill
	ldr	x8, [sp, #144]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #144]                  // 8-byte Folded Spill
	ldr	x8, [sp, #136]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #136]                  // 8-byte Folded Spill
	ldp	x7, x8, [sp, #48]               // 16-byte Folded Reload
	add	x9, x8, x9
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	add	x7, x7, x10
	add	x8, x8, x10
	str	x8, [sp, #80]                   // 8-byte Folded Spill
.LBB0_2:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_11 Depth 3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //           Child Loop BB0_18 Depth 5
                                        //           Child Loop BB0_20 Depth 5
                                        //         Child Loop BB0_23 Depth 4
                                        //         Child Loop BB0_25 Depth 4
                                        //         Child Loop BB0_29 Depth 4
                                        //         Child Loop BB0_31 Depth 4
                                        //       Child Loop BB0_37 Depth 3
                                        //       Child Loop BB0_40 Depth 3
                                        //         Child Loop BB0_42 Depth 4
                                        //         Child Loop BB0_44 Depth 4
                                        //       Child Loop BB0_47 Depth 3
                                        //       Child Loop BB0_49 Depth 3
                                        //       Child Loop BB0_53 Depth 3
                                        //       Child Loop BB0_55 Depth 3
                                        //       Child Loop BB0_59 Depth 3
                                        //       Child Loop BB0_62 Depth 3
                                        //         Child Loop BB0_64 Depth 4
                                        //         Child Loop BB0_66 Depth 4
                                        //       Child Loop BB0_69 Depth 3
                                        //       Child Loop BB0_71 Depth 3
                                        //       Child Loop BB0_75 Depth 3
                                        //       Child Loop BB0_77 Depth 3
                                        //       Child Loop BB0_81 Depth 3
                                        //       Child Loop BB0_84 Depth 3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_88 Depth 4
                                        //       Child Loop BB0_91 Depth 3
                                        //       Child Loop BB0_93 Depth 3
                                        //       Child Loop BB0_97 Depth 3
                                        //       Child Loop BB0_99 Depth 3
                                        //       Child Loop BB0_103 Depth 3
                                        //       Child Loop BB0_106 Depth 3
                                        //         Child Loop BB0_108 Depth 4
                                        //         Child Loop BB0_110 Depth 4
                                        //       Child Loop BB0_113 Depth 3
                                        //       Child Loop BB0_115 Depth 3
                                        //       Child Loop BB0_119 Depth 3
                                        //       Child Loop BB0_121 Depth 3
	ldr	x8, [sp, #32]                   // 8-byte Folded Reload
	cmp	x3, x8
	b.ge	.LBB0_122
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	add	x8, x3, #1
	str	x9, [sp, #56]                   // 8-byte Folded Spill
	mov	x25, xzr
	str	x9, [sp, #328]                  // 8-byte Folded Spill
	stp	x8, x7, [sp, #40]               // 16-byte Folded Spill
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	str	x3, [sp, #672]                  // 8-byte Folded Spill
	stp	x8, x7, [sp, #336]              // 16-byte Folded Spill
	ldp	x9, x8, [sp, #136]              // 16-byte Folded Reload
	stp	x8, x9, [sp, #400]              // 16-byte Folded Spill
	ldr	x9, [sp, #88]                   // 8-byte Folded Reload
	ldp	x11, x10, [sp, #64]             // 16-byte Folded Reload
	str	x10, [sp, #352]                 // 8-byte Folded Spill
	ldp	x10, x8, [sp, #96]              // 16-byte Folded Reload
	stp	x8, x11, [sp, #416]             // 16-byte Folded Spill
	ldr	x8, [sp, #128]                  // 8-byte Folded Reload
	stp	x10, x9, [sp, #384]             // 16-byte Folded Spill
	str	x8, [sp, #456]                  // 8-byte Folded Spill
	ldp	x12, x8, [sp, #168]             // 16-byte Folded Reload
	str	x8, [sp, #536]                  // 8-byte Folded Spill
	ldp	x11, x8, [sp, #112]             // 16-byte Folded Reload
	str	x8, [sp, #552]                  // 8-byte Folded Spill
	ldp	x8, x16, [sp, #152]             // 16-byte Folded Reload
	str	x8, [sp, #544]                  // 8-byte Folded Spill
	b	.LBB0_7
	.p2align	2
.LBB0_4:                                //   in Loop: Header=BB0_7 Depth=2
	str	s0, [x6, x9, lsl #2]
.LBB0_5:                                //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x16, [sp, #560]                 // 8-byte Folded Reload
.LBB0_6:                                // %.backedge41
                                        //   in Loop: Header=BB0_7 Depth=2
	ldp	x9, x8, [sp, #280]              // 16-byte Folded Reload
	ldr	x10, [sp, #544]                 // 8-byte Folded Reload
	add	x10, x10, x9
	ldp	x25, x12, [sp, #312]            // 16-byte Folded Reload
	add	x12, x12, x8
	ldr	x0, [sp, #568]                  // 8-byte Folded Reload
	add	x16, x16, x9
	str	x10, [sp, #544]                 // 8-byte Folded Spill
	ldr	x10, [sp, #552]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #552]                 // 8-byte Folded Spill
	ldr	x10, [sp, #536]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #536]                 // 8-byte Folded Spill
	ldp	x10, x11, [sp, #456]            // 16-byte Folded Reload
	add	x10, x10, x9
	add	x11, x11, x9
	str	x10, [sp, #456]                 // 8-byte Folded Spill
	ldr	x10, [sp, #416]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #416]                 // 8-byte Folded Spill
	ldr	x10, [sp, #384]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #384]                 // 8-byte Folded Spill
	ldr	x10, [sp, #424]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #424]                 // 8-byte Folded Spill
	ldr	x10, [sp, #352]                 // 8-byte Folded Reload
	add	x10, x10, x9
	str	x10, [sp, #352]                 // 8-byte Folded Spill
	ldr	x10, [sp, #392]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #392]                 // 8-byte Folded Spill
	ldr	x10, [sp, #400]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #400]                 // 8-byte Folded Spill
	ldr	x10, [sp, #408]                 // 8-byte Folded Reload
	add	x10, x10, x8
	str	x10, [sp, #408]                 // 8-byte Folded Spill
	ldr	x10, [sp, #328]                 // 8-byte Folded Reload
	add	x10, x10, x8
	ldr	x8, [sp, #336]                  // 8-byte Folded Reload
	add	x8, x8, x9
	stp	x10, x8, [sp, #328]             // 16-byte Folded Spill
	ldr	x8, [sp, #344]                  // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #344]                  // 8-byte Folded Spill
.LBB0_7:                                //   Parent Loop BB0_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_11 Depth 3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //           Child Loop BB0_18 Depth 5
                                        //           Child Loop BB0_20 Depth 5
                                        //         Child Loop BB0_23 Depth 4
                                        //         Child Loop BB0_25 Depth 4
                                        //         Child Loop BB0_29 Depth 4
                                        //         Child Loop BB0_31 Depth 4
                                        //       Child Loop BB0_37 Depth 3
                                        //       Child Loop BB0_40 Depth 3
                                        //         Child Loop BB0_42 Depth 4
                                        //         Child Loop BB0_44 Depth 4
                                        //       Child Loop BB0_47 Depth 3
                                        //       Child Loop BB0_49 Depth 3
                                        //       Child Loop BB0_53 Depth 3
                                        //       Child Loop BB0_55 Depth 3
                                        //       Child Loop BB0_59 Depth 3
                                        //       Child Loop BB0_62 Depth 3
                                        //         Child Loop BB0_64 Depth 4
                                        //         Child Loop BB0_66 Depth 4
                                        //       Child Loop BB0_69 Depth 3
                                        //       Child Loop BB0_71 Depth 3
                                        //       Child Loop BB0_75 Depth 3
                                        //       Child Loop BB0_77 Depth 3
                                        //       Child Loop BB0_81 Depth 3
                                        //       Child Loop BB0_84 Depth 3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_88 Depth 4
                                        //       Child Loop BB0_91 Depth 3
                                        //       Child Loop BB0_93 Depth 3
                                        //       Child Loop BB0_97 Depth 3
                                        //       Child Loop BB0_99 Depth 3
                                        //       Child Loop BB0_103 Depth 3
                                        //       Child Loop BB0_106 Depth 3
                                        //         Child Loop BB0_108 Depth 4
                                        //         Child Loop BB0_110 Depth 4
                                        //       Child Loop BB0_113 Depth 3
                                        //       Child Loop BB0_115 Depth 3
                                        //       Child Loop BB0_119 Depth 3
                                        //       Child Loop BB0_121 Depth 3
	ldr	x8, [sp, #304]                  // 8-byte Folded Reload
	cmp	x25, x8
	b.ge	.LBB0_1
// %bb.8:                               //   in Loop: Header=BB0_7 Depth=2
	mov	x10, xzr
	add	x8, x25, #1
	mov	x1, x12
	str	x11, [sp, #464]                 // 8-byte Folded Spill
	stp	x8, x12, [sp, #312]             // 16-byte Folded Spill
	str	x16, [sp, #560]                 // 8-byte Folded Spill
	b	.LBB0_11
	.p2align	2
.LBB0_9:                                //   in Loop: Header=BB0_11 Depth=3
	stp	q3, q2, [x10]
	stp	q1, q0, [x10, #32]
.LBB0_10:                               // %.backedge
                                        //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #472]                  // 8-byte Folded Reload
	ldr	x1, [sp, #584]                  // 8-byte Folded Reload
	add	x1, x1, x8
	ldr	x10, [sp, #576]                 // 8-byte Folded Reload
	ldr	x16, [sp, #560]                 // 8-byte Folded Reload
.LBB0_11:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_13 Depth 4
                                        //         Child Loop BB0_16 Depth 4
                                        //           Child Loop BB0_18 Depth 5
                                        //           Child Loop BB0_20 Depth 5
                                        //         Child Loop BB0_23 Depth 4
                                        //         Child Loop BB0_25 Depth 4
                                        //         Child Loop BB0_29 Depth 4
                                        //         Child Loop BB0_31 Depth 4
	ldp	x9, x8, [sp, #496]              // 16-byte Folded Reload
	cmp	x10, x0
	add	x26, x9, x8, lsl #2
	b.ge	.LBB0_32
// %bb.12:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	ldr	x11, [sp, #672]                 // 8-byte Folded Reload
	mov	x13, xzr
	mul	x9, x25, x8
	ldr	x8, [sp, #512]                  // 8-byte Folded Reload
	madd	x12, x11, x8, x9
	ldp	x9, x8, [sp, #480]              // 16-byte Folded Reload
	add	x11, x9, x8, lsl #2
	add	x14, x12, x10
	add	x8, x10, #16
	add	x15, x14, x28
	str	x8, [sp, #576]                  // 8-byte Folded Spill
	add	x15, x11, x15, lsl #2
	add	x9, x11, x14, lsl #2
	ldp	q3, q1, [x15, #32]
	ldp	q5, q4, [x15]
	lsl	x15, x28, #1
	ldp	q17, q6, [x9, #32]
	ldp	q2, q0, [x9]
	add	x9, x14, x15
	add	x15, x15, x28
	add	x14, x14, x15
	add	x9, x11, x9, lsl #2
	mov	x15, x1
	add	x14, x11, x14, lsl #2
	ldp	q18, q7, [x9, #32]
	ldp	q21, q20, [x9]
	ldp	q19, q16, [x14, #32]
	ldp	q23, q22, [x14]
	mov	x14, x16
	cmp	xzr, x20
	b.ge	.LBB0_14
	.p2align	2
.LBB0_13:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x16, x14, x21
	prfm	pldl1keep, [x14]
	ldur	s27, [x14, #-4]
	add	x14, x14, #4
	add	x17, x16, x21
	prfm	pldl1keep, [x16]
	ldur	s28, [x16, #-4]
	add	x16, x15, x27
	add	x18, x17, x21
	prfm	pldl1keep, [x17]
	ldur	s26, [x17, #-4]
	sub	x17, x16, #4
	prfm	pldl1keep, [x18]
	ldur	s25, [x18, #-4]
	add	x18, x16, x27
	prfm	pldl1keep, [x15]
	ldur	s24, [x15, #-4]
	add	x15, x15, #4
	prfm	pldl1keep, [x16]
	sub	x16, x18, #4
	prfm	pldl1keep, [x18]
	ld1	{ v24.s }[1], [x17]
	add	x17, x18, x27
	prfm	pldl1keep, [x17]
	ld1	{ v24.s }[2], [x16]
	add	x16, x17, x27
	sub	x17, x17, #4
	prfm	pldl1keep, [x16]
	ldur	s29, [x16, #-4]
	add	x16, x16, x27
	sub	x18, x16, #4
	add	x0, x16, x27
	ld1	{ v24.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v29.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x27
	prfm	pldl1keep, [x17]
	fmla	v2.4s, v24.4s, v27.s[0]
	ld1	{ v29.s }[2], [x16]
	add	x16, x17, x27
	sub	x17, x17, #4
	fmla	v5.4s, v24.4s, v28.s[0]
	fmla	v21.4s, v24.4s, v26.s[0]
	fmla	v23.4s, v24.4s, v25.s[0]
	prfm	pldl1keep, [x16]
	ldur	s30, [x16, #-4]
	add	x16, x16, x27
	sub	x18, x16, #4
	add	x0, x16, x27
	ld1	{ v29.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v30.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x27
	prfm	pldl1keep, [x17]
	ld1	{ v30.s }[2], [x16]
	add	x16, x17, x27
	sub	x17, x17, #4
	fmla	v0.4s, v29.4s, v27.s[0]
	fmla	v4.4s, v29.4s, v28.s[0]
	fmla	v20.4s, v29.4s, v26.s[0]
	fmla	v22.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x16]
	ldur	s31, [x16, #-4]
	add	x16, x16, x27
	sub	x18, x16, #4
	add	x0, x16, x27
	ld1	{ v30.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v31.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x27
	prfm	pldl1keep, [x17]
	fmla	v17.4s, v30.4s, v27.s[0]
	ld1	{ v31.s }[2], [x16]
	sub	x16, x17, #4
	fmla	v3.4s, v30.4s, v28.s[0]
	fmla	v18.4s, v30.4s, v26.s[0]
	fmla	v19.4s, v30.4s, v25.s[0]
	ld1	{ v31.s }[3], [x16]
	add	x16, x24, x13, lsl #6
	add	x13, x13, #1
	stp	q24, q29, [x16]
	fmla	v6.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v31.4s, v28.s[0]
	fmla	v7.4s, v31.4s, v26.s[0]
	fmla	v16.4s, v31.4s, v25.s[0]
	stp	q30, q31, [x16, #32]
	cmp	x13, x20
	b.lt	.LBB0_13
.LBB0_14:                               // %.preheader
                                        //   in Loop: Header=BB0_11 Depth=3
	ldr	x16, [sp, #552]                 // 8-byte Folded Reload
	ldr	x17, [sp, #544]                 // 8-byte Folded Reload
	mov	x13, xzr
	mov	w2, #2                          // =0x2
	str	x1, [sp, #584]                  // 8-byte Folded Spill
	mov	w1, #1                          // =0x1
	mov	w0, #3                          // =0x3
	mov	w18, #4                         // =0x4
	b	.LBB0_16
	.p2align	2
.LBB0_15:                               // %.loopexit
                                        //   in Loop: Header=BB0_16 Depth=4
	add	x17, x17, x23
	add	x16, x16, x23
	mov	x13, x18
	mov	x18, x3
.LBB0_16:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB0_18 Depth 5
                                        //           Child Loop BB0_20 Depth 5
	ldr	x8, [sp, #680]                  // 8-byte Folded Reload
	madd	x13, x13, x28, x12
	cmp	x18, x8
	madd	x14, x1, x28, x12
	madd	x15, x2, x28, x12
	ldr	x8, [sp, #648]                  // 8-byte Folded Reload
	add	x13, x13, x10
	add	x14, x14, x10
	add	x15, x15, x10
	add	x13, x11, x13, lsl #2
	stp	q2, q0, [x13]
	stp	q17, q6, [x13, #32]
	add	x13, x11, x14, lsl #2
	add	x14, x11, x15, lsl #2
	add	x15, x24, x8, lsl #6
	ldr	x8, [sp, #640]                  // 8-byte Folded Reload
	stp	q5, q4, [x13]
	stp	q3, q1, [x13, #32]
	madd	x13, x0, x28, x12
	add	x13, x13, x10
	stp	q21, q20, [x14]
	stp	q18, q7, [x14, #32]
	add	x14, x24, x8, lsl #6
	ldr	x8, [sp, #632]                  // 8-byte Folded Reload
	add	x0, x11, x13, lsl #2
	add	x13, x24, x8, lsl #6
	stp	q23, q22, [x0]
	stp	q19, q16, [x0, #32]
	b.ge	.LBB0_21
// %bb.17:                              //   in Loop: Header=BB0_16 Depth=4
	madd	x5, x18, x28, x12
	add	x1, x18, #1
	add	x2, x18, #2
	add	x0, x18, #3
	ldr	x8, [sp, #656]                  // 8-byte Folded Reload
	ldr	x9, [sp, #672]                  // 8-byte Folded Reload
	ldp	q28, q29, [x24, #32]
	ldp	q30, q31, [x24]
	mov	x4, xzr
	add	x3, x18, #4
	add	x5, x5, x10
	mul	x6, x25, x8
	ldr	x8, [sp, #664]                  // 8-byte Folded Reload
	add	x5, x11, x5, lsl #2
	ldp	q17, q6, [x5, #32]
	ldp	q2, q0, [x5]
	madd	x5, x1, x28, x12
	add	x5, x5, x10
	add	x5, x11, x5, lsl #2
	ldp	q3, q1, [x5, #32]
	ldp	q5, q4, [x5]
	madd	x5, x2, x28, x12
	add	x5, x5, x10
	add	x5, x11, x5, lsl #2
	ldp	q18, q7, [x5, #32]
	ldp	q21, q20, [x5]
	madd	x5, x0, x28, x12
	add	x5, x5, x10
	add	x5, x11, x5, lsl #2
	ldp	q19, q16, [x5, #32]
	ldp	q23, q22, [x5]
	madd	x5, x9, x8, x6
	madd	x6, x18, x22, x5
	lsl	x6, x6, #2
	ldr	q27, [x26, x6]
	madd	x6, x1, x22, x5
	lsl	x6, x6, #2
	ldr	q26, [x26, x6]
	madd	x6, x2, x22, x5
	madd	x5, x0, x22, x5
	lsl	x6, x6, #2
	lsl	x5, x5, #2
	ldr	q25, [x26, x6]
	ldr	q24, [x26, x5]
	ldr	x6, [sp, #624]                  // 8-byte Folded Reload
	mov	x5, x17
	fmla	v6.4s, v29.4s, v27.s[0]
	cmp	xzr, x19
	b.ge	.LBB0_19
	.p2align	2
.LBB0_18:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        //         Parent Loop BB0_16 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	add	x8, x6, #64
	fmla	v17.4s, v28.4s, v27.s[0]
	fmla	v2.4s, v30.4s, v27.s[0]
	add	x9, x6, #128
	prfm	pldl1keep, [x8]
	ldp	q9, q8, [x6, #-160]
	fmla	v0.4s, v31.4s, v27.s[0]
	ldp	q12, q15, [x6, #-192]
	fmla	v1.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v4.4s, v31.4s, v26.s[0]
	fmla	v5.4s, v30.4s, v26.s[0]
	fmla	v7.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x9]
	fmla	v18.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	ldp	q11, q10, [x6, #-128]
	fmla	v21.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	ldp	q13, q14, [x6, #-96]
	fmla	v19.4s, v28.4s, v24.s[0]
	fmla	v22.4s, v31.4s, v24.s[0]
	add	x30, x6, #192
	prfm	pldl1keep, [x30]
	fmla	v23.4s, v30.4s, v24.s[0]
	fmla	v0.4s, v15.4s, v27.s[1]
	add	x7, x6, #256
	add	x8, x5, x21
	fmla	v2.4s, v12.4s, v27.s[1]
	fmla	v17.4s, v9.4s, v27.s[1]
	add	x4, x4, #4
	fmla	v6.4s, v8.4s, v27.s[1]
	fmla	v5.4s, v12.4s, v26.s[1]
	fmla	v4.4s, v15.4s, v26.s[1]
	fmla	v3.4s, v9.4s, v26.s[1]
	fmla	v1.4s, v8.4s, v26.s[1]
	fmla	v21.4s, v12.4s, v25.s[1]
	fmla	v20.4s, v15.4s, v25.s[1]
	fmla	v18.4s, v9.4s, v25.s[1]
	fmla	v7.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v12.4s, v24.s[1]
	fmla	v22.4s, v15.4s, v24.s[1]
	ldp	q15, q12, [x6, #-64]
	fmla	v19.4s, v9.4s, v24.s[1]
	fmla	v16.4s, v8.4s, v24.s[1]
	ldp	q9, q8, [x6, #-32]
	prfm	pldl1keep, [x7]
	ldp	q28, q29, [x6, #32]
	fmla	v6.4s, v14.4s, v27.s[2]
	ldp	q30, q31, [x6]
	prfm	pldl1keep, [x5]
	mov	x6, x7
	fmla	v17.4s, v13.4s, v27.s[2]
	fmla	v2.4s, v11.4s, v27.s[2]
	fmla	v0.4s, v10.4s, v27.s[2]
	fmla	v1.4s, v14.4s, v26.s[2]
	fmla	v3.4s, v13.4s, v26.s[2]
	fmla	v4.4s, v10.4s, v26.s[2]
	fmla	v5.4s, v11.4s, v26.s[2]
	fmla	v7.4s, v14.4s, v25.s[2]
	fmla	v18.4s, v13.4s, v25.s[2]
	fmla	v20.4s, v10.4s, v25.s[2]
	fmla	v21.4s, v11.4s, v25.s[2]
	fmla	v16.4s, v14.4s, v24.s[2]
	fmla	v19.4s, v13.4s, v24.s[2]
	fmla	v22.4s, v10.4s, v24.s[2]
	fmla	v23.4s, v11.4s, v24.s[2]
	fmla	v0.4s, v12.4s, v27.s[3]
	fmla	v2.4s, v15.4s, v27.s[3]
	fmla	v17.4s, v9.4s, v27.s[3]
	fmla	v6.4s, v8.4s, v27.s[3]
	ldur	q27, [x5, #-16]
	prfm	pldl1keep, [x8]
	add	x5, x5, #16
	fmla	v5.4s, v15.4s, v26.s[3]
	fmla	v4.4s, v12.4s, v26.s[3]
	fmla	v3.4s, v9.4s, v26.s[3]
	fmla	v1.4s, v8.4s, v26.s[3]
	ldur	q26, [x8, #-16]
	add	x8, x8, x21
	prfm	pldl1keep, [x8]
	fmla	v21.4s, v15.4s, v25.s[3]
	fmla	v20.4s, v12.4s, v25.s[3]
	fmla	v18.4s, v9.4s, v25.s[3]
	fmla	v7.4s, v8.4s, v25.s[3]
	ldur	q25, [x8, #-16]
	add	x8, x8, x21
	prfm	pldl1keep, [x8]
	fmla	v23.4s, v15.4s, v24.s[3]
	fmla	v22.4s, v12.4s, v24.s[3]
	fmla	v19.4s, v9.4s, v24.s[3]
	fmla	v16.4s, v8.4s, v24.s[3]
	ldur	q24, [x8, #-16]
	fmla	v6.4s, v29.4s, v27.s[0]
	cmp	x4, x19
	b.lt	.LBB0_18
.LBB0_19:                               //   in Loop: Header=BB0_16 Depth=4
	ldp	q10, q8, [x15, #32]
	ldp	q11, q12, [x15]
	fmla	v17.4s, v28.4s, v27.s[0]
	fmla	v2.4s, v30.4s, v27.s[0]
	fmla	v0.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v4.4s, v31.4s, v26.s[0]
	ldp	q9, q13, [x14, #32]
	fmla	v5.4s, v30.4s, v26.s[0]
	fmla	v7.4s, v29.4s, v25.s[0]
	mov	x15, x29
	fmla	v18.4s, v28.4s, v25.s[0]
	fmla	v20.4s, v31.4s, v25.s[0]
	fmla	v21.4s, v30.4s, v25.s[0]
	fmla	v16.4s, v29.4s, v24.s[0]
	fmla	v19.4s, v28.4s, v24.s[0]
	fmla	v22.4s, v31.4s, v24.s[0]
	ldp	q31, q28, [x13, #32]
	fmla	v23.4s, v30.4s, v24.s[0]
	ldp	q29, q30, [x14]
	mov	x14, x16
	fmla	v0.4s, v12.4s, v27.s[1]
	fmla	v2.4s, v11.4s, v27.s[1]
	fmla	v17.4s, v10.4s, v27.s[1]
	fmla	v6.4s, v8.4s, v27.s[1]
	fmla	v5.4s, v11.4s, v26.s[1]
	fmla	v4.4s, v12.4s, v26.s[1]
	fmla	v3.4s, v10.4s, v26.s[1]
	fmla	v1.4s, v8.4s, v26.s[1]
	fmla	v21.4s, v11.4s, v25.s[1]
	fmla	v20.4s, v12.4s, v25.s[1]
	fmla	v18.4s, v10.4s, v25.s[1]
	fmla	v7.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v11.4s, v24.s[1]
	fmla	v22.4s, v12.4s, v24.s[1]
	fmla	v19.4s, v10.4s, v24.s[1]
	fmla	v16.4s, v8.4s, v24.s[1]
	fmla	v6.4s, v13.4s, v27.s[2]
	ldp	q8, q10, [x13]
	ldr	x13, [sp, #616]                 // 8-byte Folded Reload
	fmla	v17.4s, v9.4s, v27.s[2]
	fmla	v2.4s, v29.4s, v27.s[2]
	fmla	v0.4s, v30.4s, v27.s[2]
	fmla	v1.4s, v13.4s, v26.s[2]
	fmla	v3.4s, v9.4s, v26.s[2]
	fmla	v4.4s, v30.4s, v26.s[2]
	fmla	v5.4s, v29.4s, v26.s[2]
	fmla	v7.4s, v13.4s, v25.s[2]
	fmla	v18.4s, v9.4s, v25.s[2]
	fmla	v20.4s, v30.4s, v25.s[2]
	fmla	v21.4s, v29.4s, v25.s[2]
	fmla	v16.4s, v13.4s, v24.s[2]
	fmla	v19.4s, v9.4s, v24.s[2]
	fmla	v22.4s, v30.4s, v24.s[2]
	fmla	v23.4s, v29.4s, v24.s[2]
	fmla	v0.4s, v10.4s, v27.s[3]
	fmla	v2.4s, v8.4s, v27.s[3]
	fmla	v17.4s, v31.4s, v27.s[3]
	fmla	v6.4s, v28.4s, v27.s[3]
	fmla	v5.4s, v8.4s, v26.s[3]
	fmla	v4.4s, v10.4s, v26.s[3]
	fmla	v3.4s, v31.4s, v26.s[3]
	fmla	v1.4s, v28.4s, v26.s[3]
	fmla	v21.4s, v8.4s, v25.s[3]
	fmla	v20.4s, v10.4s, v25.s[3]
	fmla	v18.4s, v31.4s, v25.s[3]
	fmla	v7.4s, v28.4s, v25.s[3]
	fmla	v23.4s, v8.4s, v24.s[3]
	fmla	v22.4s, v10.4s, v24.s[3]
	fmla	v19.4s, v31.4s, v24.s[3]
	fmla	v16.4s, v28.4s, v24.s[3]
	cmp	x29, x20
	b.ge	.LBB0_15
	.p2align	2
.LBB0_20:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        //         Parent Loop BB0_16 Depth=4
                                        // =>        This Inner Loop Header: Depth=5
	prfm	pldl1keep, [x13]
	ldp	q24, q25, [x13, #-64]
	add	x8, x14, x21
	ldp	q26, q27, [x13, #-32]
	prfm	pldl1keep, [x14]
	add	x15, x15, #1
	ldur	s28, [x14, #-4]
	prfm	pldl1keep, [x8]
	add	x14, x14, #4
	add	x13, x13, #64
	ldur	s29, [x8, #-4]
	add	x8, x8, x21
	prfm	pldl1keep, [x8]
	fmla	v6.4s, v27.4s, v28.s[0]
	ldur	s30, [x8, #-4]
	add	x8, x8, x21
	prfm	pldl1keep, [x8]
	fmla	v17.4s, v26.4s, v28.s[0]
	fmla	v0.4s, v25.4s, v28.s[0]
	fmla	v2.4s, v24.4s, v28.s[0]
	ldur	s28, [x8, #-4]
	fmla	v4.4s, v25.4s, v29.s[0]
	fmla	v5.4s, v24.4s, v29.s[0]
	fmla	v3.4s, v26.4s, v29.s[0]
	fmla	v1.4s, v27.4s, v29.s[0]
	fmla	v21.4s, v24.4s, v30.s[0]
	fmla	v20.4s, v25.4s, v30.s[0]
	fmla	v18.4s, v26.4s, v30.s[0]
	fmla	v7.4s, v27.4s, v30.s[0]
	fmla	v23.4s, v24.4s, v28.s[0]
	fmla	v22.4s, v25.4s, v28.s[0]
	fmla	v19.4s, v26.4s, v28.s[0]
	fmla	v16.4s, v27.4s, v28.s[0]
	cmp	x15, x20
	b.lt	.LBB0_20
	b	.LBB0_15
	.p2align	2
.LBB0_21:                               //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #680]                  // 8-byte Folded Reload
	ldr	x9, [sp, #592]                  // 8-byte Folded Reload
	cmp	x8, x9
	b.ge	.LBB0_27
// %bb.22:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x9, [sp, #656]                  // 8-byte Folded Reload
	ldr	x0, [sp, #680]                  // 8-byte Folded Reload
	mov	x18, xzr
	mul	x9, x25, x9
	ldr	x17, [sp, #664]                 // 8-byte Folded Reload
	ldr	x1, [sp, #672]                  // 8-byte Folded Reload
	madd	x8, x0, x28, x12
	madd	x9, x1, x17, x9
	ldp	q20, q21, [x24, #32]
	ldp	q18, q19, [x24]
	ldr	x1, [sp, #624]                  // 8-byte Folded Reload
	madd	x17, x0, x22, x9
	add	x8, x8, x10
	add	x16, x11, x8, lsl #2
	add	x8, x0, #1
	ldr	x0, [sp, #536]                  // 8-byte Folded Reload
	lsl	x17, x17, #2
	ldr	q17, [x26, x17]
	madd	x17, x8, x28, x12
	madd	x8, x8, x22, x9
	ldp	q1, q0, [x16, #32]
	ldp	q3, q2, [x16]
	add	x17, x17, x10
	lsl	x8, x8, #2
	add	x17, x11, x17, lsl #2
	ldr	q16, [x26, x8]
	ldp	q5, q4, [x17, #32]
	ldp	q7, q6, [x17]
	cmp	xzr, x19
	b.ge	.LBB0_24
	.p2align	2
.LBB0_23:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldr	x8, [sp, #608]                  // 8-byte Folded Reload
	add	x7, x1, #64
	fmla	v0.4s, v21.4s, v17.s[0]
	fmla	v1.4s, v20.4s, v17.s[0]
	fmla	v3.4s, v18.4s, v17.s[0]
	fmla	v2.4s, v19.4s, v17.s[0]
	add	x9, x1, #128
	add	x2, x1, #256
	fmla	v4.4s, v21.4s, v16.s[0]
	fmla	v5.4s, v20.4s, v16.s[0]
	add	x18, x18, #4
	add	x3, x8, x0
	ldr	x8, [sp, #600]                  // 8-byte Folded Reload
	prfm	pldl1keep, [x7]
	ldp	q23, q22, [x1, #-160]
	ldp	q24, q25, [x1, #-192]
	fmla	v6.4s, v19.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v16.s[0]
	prfm	pldl1keep, [x9]
	ldp	q19, q18, [x1, #-128]
	add	x4, x3, #32
	ldp	q20, q21, [x1, #-96]
	fmla	v2.4s, v25.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	fmla	v6.4s, v25.4s, v16.s[1]
	fmla	v4.4s, v22.4s, v16.s[1]
	add	x5, x8, x0
	add	x8, x1, #192
	add	x0, x0, #16
	fmla	v3.4s, v24.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v5.4s, v23.4s, v16.s[1]
	prfm	pldl1keep, [x8]
	ldp	q23, q22, [x1, #-32]
	ldp	q24, q25, [x1, #-64]
	add	x6, x5, #32
	prfm	pldl1keep, [x6]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v18.4s, v17.s[2]
	fmla	v4.4s, v21.4s, v16.s[2]
	fmla	v6.4s, v18.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v3.4s, v19.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	fmla	v2.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v25.4s, v16.s[3]
	fmla	v4.4s, v22.4s, v16.s[3]
	fmla	v3.4s, v24.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	ldr	q17, [x5, #16]
	prfm	pldl1keep, [x4]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	ldr	q16, [x3, #16]
	prfm	pldl1keep, [x2]
	ldp	q20, q21, [x1, #32]
	ldp	q18, q19, [x1]
	mov	x1, x2
	cmp	x18, x19
	b.lt	.LBB0_23
.LBB0_24:                               //   in Loop: Header=BB0_11 Depth=3
	ldp	q23, q22, [x15, #32]
	ldp	q24, q25, [x15]
	fmla	v0.4s, v21.4s, v17.s[0]
	fmla	v1.4s, v20.4s, v17.s[0]
	fmla	v3.4s, v18.4s, v17.s[0]
	fmla	v2.4s, v19.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v16.s[0]
	fmla	v5.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x14, #32]
	fmla	v6.4s, v19.4s, v16.s[0]
	fmla	v7.4s, v18.4s, v16.s[0]
	ldp	q19, q18, [x14]
	fmla	v2.4s, v25.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	ldr	x18, [sp, #616]                 // 8-byte Folded Reload
	ldr	x0, [sp, #536]                  // 8-byte Folded Reload
	fmla	v3.4s, v24.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v17.s[1]
	ldp	x3, x2, [sp, #368]              // 16-byte Folded Reload
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v6.4s, v25.4s, v16.s[1]
	ldp	q24, q25, [x13]
	fmla	v5.4s, v23.4s, v16.s[1]
	fmla	v4.4s, v22.4s, v16.s[1]
	ldp	q23, q22, [x13, #32]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v2.4s, v18.4s, v17.s[2]
	mov	x1, x29
	fmla	v4.4s, v21.4s, v16.s[2]
	fmla	v1.4s, v20.4s, v17.s[2]
	fmla	v3.4s, v19.4s, v17.s[2]
	fmla	v5.4s, v20.4s, v16.s[2]
	fmla	v6.4s, v18.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	fmla	v2.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v25.4s, v16.s[3]
	fmla	v4.4s, v22.4s, v16.s[3]
	fmla	v3.4s, v24.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v5.4s, v23.4s, v16.s[3]
	cmp	x29, x20
	b.ge	.LBB0_26
	.p2align	2
.LBB0_25:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x8, x2, x0
	add	x9, x3, x0
	prfm	pldl1keep, [x18]
	add	x1, x1, #1
	add	x8, x8, #4
	add	x9, x9, #4
	ldp	q16, q17, [x18, #-64]
	ldp	q18, q19, [x18, #-32]
	prfm	pldl1keep, [x9]
	add	x18, x18, #64
	ldr	s20, [x3, x0]
	prfm	pldl1keep, [x8]
	fmla	v0.4s, v19.4s, v20.s[0]
	ldr	s21, [x2, x0]
	fmla	v1.4s, v18.4s, v20.s[0]
	fmla	v2.4s, v17.4s, v20.s[0]
	fmla	v3.4s, v16.4s, v20.s[0]
	fmla	v6.4s, v17.4s, v21.s[0]
	fmla	v7.4s, v16.4s, v21.s[0]
	fmla	v5.4s, v18.4s, v21.s[0]
	fmla	v4.4s, v19.4s, v21.s[0]
	add	x0, x0, #4
	cmp	x1, x20
	b.lt	.LBB0_25
.LBB0_26:                               //   in Loop: Header=BB0_11 Depth=3
	stp	q3, q2, [x16]
	stp	q1, q0, [x16, #32]
	stp	q7, q6, [x17]
	stp	q5, q4, [x17, #32]
.LBB0_27:                               //   in Loop: Header=BB0_11 Depth=3
	ldr	x8, [sp, #528]                  // 8-byte Folded Reload
	ldr	x9, [sp, #592]                  // 8-byte Folded Reload
	cmp	x9, x8
	ldr	x0, [sp, #568]                  // 8-byte Folded Reload
	b.ge	.LBB0_10
// %bb.28:                              //   in Loop: Header=BB0_11 Depth=3
	ldr	x17, [sp, #592]                 // 8-byte Folded Reload
	ldr	x9, [sp, #664]                  // 8-byte Folded Reload
	mov	x16, xzr
	madd	x8, x17, x28, x12
	ldp	q7, q16, [x24, #32]
	ldp	q6, q5, [x24]
	ldr	x12, [sp, #624]                 // 8-byte Folded Reload
	ldr	x1, [sp, #360]                  // 8-byte Folded Reload
	add	x8, x8, x10
	add	x10, x11, x8, lsl #2
	ldr	x8, [sp, #656]                  // 8-byte Folded Reload
	ldr	x11, [sp, #672]                 // 8-byte Folded Reload
	ldp	q1, q0, [x10, #32]
	ldp	q3, q2, [x10]
	mul	x8, x25, x8
	madd	x8, x11, x9, x8
	ldr	x11, [sp, #456]                 // 8-byte Folded Reload
	madd	x8, x17, x22, x8
	lsl	x8, x8, #2
	ldr	q4, [x26, x8]
	cmp	xzr, x19
	b.ge	.LBB0_30
	.p2align	2
.LBB0_29:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x18, x12, #64
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	add	x9, x12, #128
	prfm	pldl1keep, [x18]
	ldp	q18, q17, [x12, #-160]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q19, q20, [x12, #-192]
	fmla	v2.4s, v5.4s, v4.s[0]
	prfm	pldl1keep, [x9]
	ldp	q6, q5, [x12, #-128]
	ldp	q7, q16, [x12, #-96]
	add	x8, x12, #192
	prfm	pldl1keep, [x8]
	add	x17, x12, #256
	add	x16, x16, #4
	fmla	v2.4s, v20.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v3.4s, v19.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	ldp	q18, q17, [x12, #-32]
	ldp	q19, q20, [x12, #-64]
	prfm	pldl1keep, [x11]
	fmla	v0.4s, v16.4s, v4.s[2]
	fmla	v2.4s, v5.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v20.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v19.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	ldur	q4, [x11, #-16]
	prfm	pldl1keep, [x17]
	add	x11, x11, #16
	ldp	q7, q16, [x12, #32]
	ldp	q6, q5, [x12]
	mov	x12, x17
	cmp	x16, x19
	b.lt	.LBB0_29
.LBB0_30:                               //   in Loop: Header=BB0_11 Depth=3
	ldp	q18, q17, [x15, #32]
	ldp	q19, q20, [x15]
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	fmla	v2.4s, v5.4s, v4.s[0]
	ldp	q6, q5, [x14]
	ldp	q7, q16, [x14, #32]
	ldr	x14, [sp, #464]                 // 8-byte Folded Reload
	mov	x11, xzr
	mov	w12, #64                        // =0x40
	fmla	v2.4s, v20.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v3.4s, v19.4s, v4.s[1]
	fmla	v1.4s, v18.4s, v4.s[1]
	fmla	v0.4s, v16.4s, v4.s[2]
	ldp	q18, q17, [x13, #32]
	ldp	q19, q20, [x13]
	fmla	v2.4s, v5.4s, v4.s[2]
	ldr	x13, [sp, #416]                 // 8-byte Folded Reload
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v20.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v19.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	add	x8, x29, xzr
	cmp	x8, x20
	b.ge	.LBB0_9
	.p2align	2
.LBB0_31:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_11 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x9, x1, x11, lsl #6
	add	x8, x1, x12
	add	x12, x12, #64
	prfm	pldl1keep, [x8]
	ldp	q4, q5, [x9]
	ldp	q6, q7, [x9, #32]
	prfm	pldl1keep, [x13]
	ldr	s16, [x14, x11, lsl #2]
	add	x11, x11, #1
	add	x13, x13, #4
	fmla	v0.4s, v7.4s, v16.s[0]
	fmla	v1.4s, v6.4s, v16.s[0]
	fmla	v2.4s, v5.4s, v16.s[0]
	fmla	v3.4s, v4.4s, v16.s[0]
	add	x8, x29, x11
	cmp	x8, x20
	b.lt	.LBB0_31
	b	.LBB0_9
	.p2align	2
.LBB0_32:                               //   in Loop: Header=BB0_7 Depth=2
	ldp	x9, x8, [sp, #480]              // 16-byte Folded Reload
	ldr	x10, [sp, #448]                 // 8-byte Folded Reload
	add	x8, x9, x8, lsl #2
	cmp	x0, x10
	str	x8, [sp, #584]                  // 8-byte Folded Spill
	lsl	x8, x28, #1
	str	x8, [sp, #576]                  // 8-byte Folded Spill
	b.lt	.LBB0_36
// %bb.33:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #440]                  // 8-byte Folded Reload
	cmp	x10, x8
	b.lt	.LBB0_58
.LBB0_34:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x9, [sp, #432]                  // 8-byte Folded Reload
	cmp	x8, x9
	b.lt	.LBB0_80
.LBB0_35:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #296]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_6
	b	.LBB0_102
	.p2align	2
.LBB0_36:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #256]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	ldr	x9, [sp, #512]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldr	x12, [sp, #672]                 // 8-byte Folded Reload
	ldr	x13, [sp, #584]                 // 8-byte Folded Reload
	mul	x8, x25, x8
	ldr	x14, [sp, #576]                 // 8-byte Folded Reload
	ldr	x15, [sp, #560]                 // 8-byte Folded Reload
	madd	x9, x12, x9, x8
	ldr	x8, [sp, #568]                  // 8-byte Folded Reload
	add	x8, x9, x8
	add	x12, x13, x8, lsl #2
	ldp	q3, q2, [x12]
	add	x12, x8, x28
	add	x12, x13, x12, lsl #2
	ldp	q1, q0, [x12]
	add	x12, x8, x14
	add	x12, x13, x12, lsl #2
	ldp	q5, q4, [x12]
	add	x12, x14, x28
	add	x8, x8, x12
	add	x8, x13, x8, lsl #2
	ldp	q7, q6, [x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x20
	b.ge	.LBB0_38
	.p2align	2
.LBB0_37:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x12, [sp, #384]                 // 8-byte Folded Reload
	add	x13, x15, x10
	prfm	pldl1keep, [x13]
	ldur	s16, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s17, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s18, [x13, #-4]
	add	x13, x13, x21
	add	x12, x12, x10
	prfm	pldl1keep, [x13]
	ldur	s20, [x13, #-4]
	add	x10, x10, #4
	prfm	pldl1keep, [x12]
	ldur	s19, [x12, #-4]
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	sub	x14, x12, #4
	add	x12, x12, x27
	ld1	{ v19.s }[1], [x13]
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x27
	ld1	{ v19.s }[2], [x14]
	prfm	pldl1keep, [x12]
	ldur	s21, [x12, #-4]
	add	x12, x12, x27
	ld1	{ v19.s }[3], [x13]
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	ld1	{ v21.s }[1], [x13]
	sub	x14, x12, #4
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	sub	x12, x12, #4
	fmla	v3.4s, v19.4s, v16.s[0]
	fmla	v1.4s, v19.4s, v17.s[0]
	fmla	v5.4s, v19.4s, v18.s[0]
	fmla	v7.4s, v19.4s, v20.s[0]
	ld1	{ v21.s }[2], [x14]
	ld1	{ v21.s }[3], [x12]
	add	x12, x8, x11, lsl #5
	add	x11, x11, #1
	fmla	v2.4s, v21.4s, v16.s[0]
	fmla	v0.4s, v21.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v18.s[0]
	fmla	v6.4s, v21.4s, v20.s[0]
	stp	q19, q21, [x12]
	cmp	x11, x20
	b.lt	.LBB0_37
.LBB0_38:                               // %.preheader39
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #216]                 // 8-byte Folded Reload
	ldr	x15, [sp, #552]                 // 8-byte Folded Reload
	mov	x11, xzr
	add	x10, x8, #128
	ldr	x16, [sp, #544]                 // 8-byte Folded Reload
	mov	w18, #1                         // =0x1
	mov	w2, #2                          // =0x2
	mov	w1, #3                          // =0x3
	mov	w17, #4                         // =0x4
	add	x14, x8, x12
	b	.LBB0_40
	.p2align	2
.LBB0_39:                               // %.loopexit35
                                        //   in Loop: Header=BB0_40 Depth=3
	add	x16, x16, x23
	add	x15, x15, x23
	mov	x11, x17
	mov	x17, x3
.LBB0_40:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_42 Depth 4
                                        //         Child Loop BB0_44 Depth 4
	madd	x11, x11, x28, x9
	ldr	x7, [sp, #568]                  // 8-byte Folded Reload
	ldr	x30, [sp, #584]                 // 8-byte Folded Reload
	add	x11, x11, x7
	madd	x12, x18, x28, x9
	madd	x13, x2, x28, x9
	add	x12, x12, x7
	add	x13, x13, x7
	add	x11, x30, x11, lsl #2
	add	x12, x30, x12, lsl #2
	stp	q3, q2, [x11]
	madd	x11, x1, x28, x9
	stp	q1, q0, [x12]
	add	x12, x30, x13, lsl #2
	stp	q5, q4, [x12]
	add	x11, x11, x7
	add	x11, x30, x11, lsl #2
	stp	q7, q6, [x11]
	ldr	x11, [sp, #680]                 // 8-byte Folded Reload
	cmp	x17, x11
	ldr	x11, [sp, #648]                 // 8-byte Folded Reload
	add	x13, x8, x11, lsl #5
	ldr	x11, [sp, #640]                 // 8-byte Folded Reload
	add	x12, x8, x11, lsl #5
	ldr	x11, [sp, #632]                 // 8-byte Folded Reload
	add	x11, x8, x11, lsl #5
	b.ge	.LBB0_45
// %bb.41:                              //   in Loop: Header=BB0_40 Depth=3
	madd	x5, x17, x28, x9
	add	x18, x17, #1
	add	x2, x17, #2
	add	x1, x17, #3
	madd	x6, x18, x28, x9
	ldp	q20, q21, [x8]
	mov	x4, xzr
	add	x3, x17, #4
	add	x5, x5, x7
	add	x5, x30, x5, lsl #2
	add	x6, x6, x7
	add	x6, x30, x6, lsl #2
	ldp	q3, q2, [x5]
	madd	x5, x2, x28, x9
	ldp	q1, q0, [x6]
	madd	x6, x1, x28, x9
	add	x5, x5, x7
	add	x6, x6, x7
	add	x5, x30, x5, lsl #2
	ldr	x7, [sp, #672]                  // 8-byte Folded Reload
	add	x6, x30, x6, lsl #2
	ldp	q5, q4, [x5]
	ldr	x5, [sp, #656]                  // 8-byte Folded Reload
	mul	x5, x25, x5
	ldp	q7, q6, [x6]
	ldr	x6, [sp, #664]                  // 8-byte Folded Reload
	madd	x5, x7, x6, x5
	madd	x6, x17, x22, x5
	lsl	x6, x6, #2
	ldr	q19, [x26, x6]
	madd	x6, x18, x22, x5
	lsl	x6, x6, #2
	ldr	q18, [x26, x6]
	madd	x6, x2, x22, x5
	madd	x5, x1, x22, x5
	lsl	x6, x6, #2
	lsl	x5, x5, #2
	ldr	q17, [x26, x6]
	ldr	q16, [x26, x5]
	mov	x5, x10
	mov	x6, x16
	cmp	xzr, x19
	b.ge	.LBB0_43
	.p2align	2
.LBB0_42:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x7, x5, #32
	fmla	v3.4s, v20.4s, v19.s[0]
	fmla	v2.4s, v21.4s, v19.s[0]
	add	x4, x4, #4
	prfm	pldl1keep, [x7]
	ldp	q22, q23, [x5, #-96]
	fmla	v0.4s, v21.4s, v18.s[0]
	fmla	v1.4s, v20.4s, v18.s[0]
	fmla	v4.4s, v21.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	add	x7, x5, #96
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q21, q20, [x5, #-64]
	prfm	pldl1keep, [x7]
	add	x7, x6, x21
	add	x30, x7, x21
	fmla	v2.4s, v23.4s, v19.s[1]
	fmla	v0.4s, v23.4s, v18.s[1]
	fmla	v4.4s, v23.4s, v17.s[1]
	fmla	v6.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v19.s[1]
	fmla	v1.4s, v22.4s, v18.s[1]
	fmla	v5.4s, v22.4s, v17.s[1]
	fmla	v7.4s, v22.4s, v16.s[1]
	fmla	v2.4s, v20.4s, v19.s[2]
	ldp	q22, q23, [x5, #-32]
	fmla	v0.4s, v20.4s, v18.s[2]
	fmla	v4.4s, v20.4s, v17.s[2]
	fmla	v6.4s, v20.4s, v16.s[2]
	fmla	v3.4s, v21.4s, v19.s[2]
	fmla	v1.4s, v21.4s, v18.s[2]
	fmla	v5.4s, v21.4s, v17.s[2]
	fmla	v7.4s, v21.4s, v16.s[2]
	ldp	q20, q21, [x5], #128
	prfm	pldl1keep, [x6]
	fmla	v2.4s, v23.4s, v19.s[3]
	fmla	v0.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v17.s[3]
	fmla	v6.4s, v23.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v19.s[3]
	ldur	q19, [x6, #-16]
	prfm	pldl1keep, [x7]
	fmla	v1.4s, v22.4s, v18.s[3]
	ldur	q18, [x7, #-16]
	add	x7, x30, x21
	prfm	pldl1keep, [x30]
	add	x6, x6, #16
	fmla	v5.4s, v22.4s, v17.s[3]
	ldur	q17, [x30, #-16]
	prfm	pldl1keep, [x7]
	fmla	v7.4s, v22.4s, v16.s[3]
	ldur	q16, [x7, #-16]
	cmp	x4, x19
	b.lt	.LBB0_42
.LBB0_43:                               //   in Loop: Header=BB0_40 Depth=3
	ldp	q22, q23, [x13]
	fmla	v3.4s, v20.4s, v19.s[0]
	fmla	v2.4s, v21.4s, v19.s[0]
	fmla	v0.4s, v21.4s, v18.s[0]
	fmla	v1.4s, v20.4s, v18.s[0]
	mov	x13, x29
	fmla	v4.4s, v21.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	fmla	v2.4s, v23.4s, v19.s[1]
	ldp	q21, q20, [x12]
	fmla	v0.4s, v23.4s, v18.s[1]
	mov	x12, x15
	fmla	v4.4s, v23.4s, v17.s[1]
	fmla	v6.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v19.s[1]
	fmla	v1.4s, v22.4s, v18.s[1]
	fmla	v5.4s, v22.4s, v17.s[1]
	fmla	v7.4s, v22.4s, v16.s[1]
	ldp	q22, q23, [x11]
	mov	x11, x14
	fmla	v2.4s, v20.4s, v19.s[2]
	fmla	v0.4s, v20.4s, v18.s[2]
	fmla	v4.4s, v20.4s, v17.s[2]
	fmla	v6.4s, v20.4s, v16.s[2]
	fmla	v3.4s, v21.4s, v19.s[2]
	fmla	v1.4s, v21.4s, v18.s[2]
	fmla	v5.4s, v21.4s, v17.s[2]
	fmla	v7.4s, v21.4s, v16.s[2]
	fmla	v2.4s, v23.4s, v19.s[3]
	fmla	v0.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v17.s[3]
	fmla	v6.4s, v23.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v19.s[3]
	fmla	v1.4s, v22.4s, v18.s[3]
	fmla	v5.4s, v22.4s, v17.s[3]
	fmla	v7.4s, v22.4s, v16.s[3]
	cmp	x29, x20
	b.ge	.LBB0_39
	.p2align	2
.LBB0_44:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_40 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x12, x21
	prfm	pldl1keep, [x11]
	ldp	q16, q17, [x11, #-32]
	prfm	pldl1keep, [x12]
	ldur	s18, [x12, #-4]
	add	x13, x13, #1
	add	x12, x12, #4
	prfm	pldl1keep, [x4]
	ldur	s19, [x4, #-4]
	add	x4, x4, x21
	add	x11, x11, #32
	prfm	pldl1keep, [x4]
	ldur	s20, [x4, #-4]
	add	x4, x4, x21
	fmla	v2.4s, v17.4s, v18.s[0]
	prfm	pldl1keep, [x4]
	ldur	s21, [x4, #-4]
	fmla	v3.4s, v16.4s, v18.s[0]
	fmla	v0.4s, v17.4s, v19.s[0]
	fmla	v1.4s, v16.4s, v19.s[0]
	fmla	v4.4s, v17.4s, v20.s[0]
	fmla	v5.4s, v16.4s, v20.s[0]
	fmla	v6.4s, v17.4s, v21.s[0]
	fmla	v7.4s, v16.4s, v21.s[0]
	cmp	x13, x20
	b.lt	.LBB0_44
	b	.LBB0_39
	.p2align	2
.LBB0_45:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #680]                 // 8-byte Folded Reload
	ldr	x15, [sp, #592]                 // 8-byte Folded Reload
	mov	x7, x30
	cmp	x14, x15
	b.ge	.LBB0_51
// %bb.46:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #656]                 // 8-byte Folded Reload
	ldr	x18, [sp, #664]                 // 8-byte Folded Reload
	mov	x16, xzr
	mul	x15, x25, x15
	ldr	x3, [sp, #672]                  // 8-byte Folded Reload
	ldr	x2, [sp, #680]                  // 8-byte Folded Reload
	add	x17, x2, #1
	madd	x14, x2, x28, x9
	ldr	x1, [sp, #568]                  // 8-byte Folded Reload
	ldp	q6, q7, [x8]
	madd	x18, x3, x18, x15
	madd	x15, x2, x22, x18
	add	x14, x14, x1
	add	x14, x7, x14, lsl #2
	lsl	x15, x15, #2
	ldr	q4, [x26, x15]
	madd	x15, x17, x28, x9
	madd	x17, x17, x22, x18
	ldp	q1, q0, [x14]
	ldr	x18, [sp, #536]                 // 8-byte Folded Reload
	add	x15, x15, x1
	lsl	x17, x17, #2
	add	x15, x7, x15, lsl #2
	ldr	q5, [x26, x17]
	mov	x17, x10
	ldp	q3, q2, [x15]
	cmp	xzr, x19
	b.ge	.LBB0_48
	.p2align	2
.LBB0_47:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x6, x17, #32
	ldr	x1, [sp, #608]                  // 8-byte Folded Reload
	ldr	x3, [sp, #600]                  // 8-byte Folded Reload
	fmla	v1.4s, v6.4s, v4.s[0]
	prfm	pldl1keep, [x6]
	ldp	q16, q17, [x17, #-96]
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	fmla	v3.4s, v6.4s, v5.s[0]
	ldp	q7, q6, [x17, #-64]
	add	x5, x17, #96
	prfm	pldl1keep, [x5]
	add	x16, x16, #4
	add	x1, x1, x18
	add	x3, x3, x18
	add	x18, x18, #16
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	add	x2, x1, #32
	add	x4, x3, #32
	fmla	v1.4s, v16.4s, v4.s[1]
	fmla	v3.4s, v16.4s, v5.s[1]
	ldp	q16, q17, [x17, #-32]
	fmla	v0.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v6.4s, v5.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v7.4s, v5.s[2]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v2.4s, v17.4s, v5.s[3]
	ldp	q6, q7, [x17], #128
	prfm	pldl1keep, [x4]
	fmla	v1.4s, v16.4s, v4.s[3]
	ldr	q4, [x3, #16]
	prfm	pldl1keep, [x2]
	fmla	v3.4s, v16.4s, v5.s[3]
	ldr	q5, [x1, #16]
	cmp	x16, x19
	b.lt	.LBB0_47
.LBB0_48:                               //   in Loop: Header=BB0_7 Depth=2
	ldp	q16, q17, [x13]
	fmla	v1.4s, v6.4s, v4.s[0]
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	fmla	v3.4s, v6.4s, v5.s[0]
	ldp	q7, q6, [x12]
	ldr	x18, [sp, #232]                 // 8-byte Folded Reload
	mov	x16, xzr
	mov	x17, xzr
	mov	x1, x29
	fmla	v0.4s, v17.4s, v4.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	add	x18, x8, x18
	fmla	v1.4s, v16.4s, v4.s[1]
	fmla	v3.4s, v16.4s, v5.s[1]
	ldp	q16, q17, [x11]
	fmla	v0.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v6.4s, v5.s[2]
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v7.4s, v5.s[2]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v2.4s, v17.4s, v5.s[3]
	fmla	v1.4s, v16.4s, v4.s[3]
	fmla	v3.4s, v16.4s, v5.s[3]
	cmp	x29, x20
	b.ge	.LBB0_50
	.p2align	2
.LBB0_49:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x2, [sp, #424]                  // 8-byte Folded Reload
	ldr	x6, [sp, #352]                  // 8-byte Folded Reload
	add	x4, x18, x17, lsl #3
	add	x5, x18, x16
	add	x1, x1, #1
	add	x16, x16, #32
	add	x4, x4, #32
	prfm	pldl1keep, [x4]
	ldp	q4, q5, [x5]
	add	x2, x2, x17
	add	x3, x6, x17
	add	x2, x2, #4
	add	x3, x3, #4
	prfm	pldl1keep, [x3]
	ldr	s6, [x6, x17]
	prfm	pldl1keep, [x2]
	ldr	x2, [sp, #424]                  // 8-byte Folded Reload
	ldr	s7, [x2, x17]
	add	x17, x17, #4
	fmla	v0.4s, v5.4s, v6.s[0]
	fmla	v1.4s, v4.4s, v6.s[0]
	fmla	v2.4s, v5.4s, v7.s[0]
	fmla	v3.4s, v4.4s, v7.s[0]
	cmp	x1, x20
	b.lt	.LBB0_49
.LBB0_50:                               //   in Loop: Header=BB0_7 Depth=2
	stp	q1, q0, [x14]
	stp	q3, q2, [x15]
.LBB0_51:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #528]                 // 8-byte Folded Reload
	ldr	x15, [sp, #592]                 // 8-byte Folded Reload
	cmp	x15, x14
	b.ge	.LBB0_57
// %bb.52:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x17, [sp, #592]                 // 8-byte Folded Reload
	ldr	x15, [sp, #568]                 // 8-byte Folded Reload
	mov	x14, xzr
	madd	x9, x17, x28, x9
	ldr	x16, [sp, #664]                 // 8-byte Folded Reload
	ldr	x18, [sp, #672]                 // 8-byte Folded Reload
	ldp	q4, q3, [x8]
	add	x9, x9, x15
	ldr	x15, [sp, #656]                 // 8-byte Folded Reload
	add	x9, x7, x9, lsl #2
	mul	x15, x25, x15
	ldp	q1, q0, [x9]
	madd	x15, x18, x16, x15
	madd	x15, x17, x22, x15
	lsl	x15, x15, #2
	ldr	q2, [x26, x15]
	ldr	x15, [sp, #456]                 // 8-byte Folded Reload
	cmp	xzr, x19
	b.ge	.LBB0_54
	.p2align	2
.LBB0_53:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x17, x10, #32
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	add	x16, x10, #96
	prfm	pldl1keep, [x17]
	ldp	q5, q6, [x10, #-96]
	add	x14, x14, #4
	ldp	q4, q3, [x10, #-64]
	prfm	pldl1keep, [x16]
	fmla	v0.4s, v6.4s, v2.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldp	q5, q6, [x10, #-32]
	prfm	pldl1keep, [x15]
	fmla	v0.4s, v3.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v6.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldur	q2, [x15, #-16]
	ldp	q4, q3, [x10], #128
	add	x15, x15, #16
	cmp	x14, x19
	b.lt	.LBB0_53
.LBB0_54:                               //   in Loop: Header=BB0_7 Depth=2
	ldp	q5, q6, [x13]
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	ldp	q4, q3, [x12]
	mov	x10, xzr
	mov	x14, xzr
	fmla	v0.4s, v6.4s, v2.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldp	q5, q6, [x11]
	ldr	x11, [sp, #232]                 // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	add	x8, x8, x11
	mov	x11, x29
	fmla	v0.4s, v6.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	cmp	x29, x20
	b.ge	.LBB0_56
	.p2align	2
.LBB0_55:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x16, [sp, #464]                 // 8-byte Folded Reload
	add	x13, x8, x14, lsl #3
	add	x15, x8, x10
	add	x11, x11, #1
	add	x10, x10, #32
	add	x13, x13, #32
	prfm	pldl1keep, [x13]
	add	x12, x16, x14
	ldp	q2, q3, [x15]
	add	x12, x12, #4
	prfm	pldl1keep, [x12]
	ldr	s4, [x16, x14]
	add	x14, x14, #4
	fmla	v0.4s, v3.4s, v4.s[0]
	fmla	v1.4s, v2.4s, v4.s[0]
	cmp	x11, x20
	b.lt	.LBB0_55
.LBB0_56:                               //   in Loop: Header=BB0_7 Depth=2
	stp	q1, q0, [x9]
.LBB0_57:                               //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldp	x8, x10, [sp, #440]             // 16-byte Folded Reload
	ldr	x16, [sp, #560]                 // 8-byte Folded Reload
	cmp	x10, x8
	b.ge	.LBB0_34
.LBB0_58:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #248]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	ldr	x9, [sp, #512]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldr	x12, [sp, #672]                 // 8-byte Folded Reload
	ldr	x7, [sp, #584]                  // 8-byte Folded Reload
	mul	x8, x25, x8
	ldr	x13, [sp, #576]                 // 8-byte Folded Reload
	ldr	x15, [sp, #560]                 // 8-byte Folded Reload
	ldp	x6, x5, [sp, #368]              // 16-byte Folded Reload
	madd	x9, x12, x9, x8
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	add	x8, x9, x8
	lsl	x12, x8, #2
	ldr	q0, [x7, x12]
	add	x12, x8, x28
	lsl	x12, x12, #2
	ldr	q1, [x7, x12]
	add	x12, x8, x13
	lsl	x12, x12, #2
	ldr	q2, [x7, x12]
	add	x12, x13, x28
	add	x8, x8, x12
	lsl	x8, x8, #2
	ldr	q3, [x7, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x20
	b.ge	.LBB0_60
	.p2align	2
.LBB0_59:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x12, [sp, #392]                 // 8-byte Folded Reload
	add	x13, x15, x10
	prfm	pldl1keep, [x13]
	ldur	s4, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s5, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s6, [x13, #-4]
	add	x13, x13, x21
	add	x12, x12, x10
	prfm	pldl1keep, [x13]
	ldur	s7, [x13, #-4]
	add	x10, x10, #4
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x27
	prfm	pldl1keep, [x12]
	sub	x14, x12, #4
	add	x12, x12, x27
	ld1	{ v16.s }[1], [x13]
	prfm	pldl1keep, [x12]
	sub	x12, x12, #4
	ld1	{ v16.s }[2], [x14]
	ld1	{ v16.s }[3], [x12]
	str	q16, [x8, x11, lsl #4]
	add	x11, x11, #1
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x11, x20
	b.lt	.LBB0_59
.LBB0_60:                               // %.preheader38
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #208]                 // 8-byte Folded Reload
	ldr	x12, [sp, #552]                 // 8-byte Folded Reload
	mov	x1, xzr
	add	x10, x8, #48
	ldr	x13, [sp, #544]                 // 8-byte Folded Reload
	mov	w15, #1                         // =0x1
	mov	w16, #2                         // =0x2
	mov	w17, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_62
	.p2align	2
.LBB0_61:                               // %.loopexit34
                                        //   in Loop: Header=BB0_62 Depth=3
	add	x13, x13, x23
	add	x12, x12, x23
	mov	x1, x14
	mov	x14, x18
.LBB0_62:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_64 Depth 4
                                        //         Child Loop BB0_66 Depth 4
	madd	x18, x1, x28, x9
	ldr	x4, [sp, #448]                  // 8-byte Folded Reload
	add	x18, x18, x4
	madd	x15, x15, x28, x9
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	add	x15, x15, x4
	add	x16, x16, x4
	lsl	x18, x18, #2
	lsl	x15, x15, #2
	lsl	x16, x16, #2
	str	q0, [x7, x18]
	str	q1, [x7, x15]
	add	x15, x17, x4
	str	q2, [x7, x16]
	lsl	x15, x15, #2
	str	q3, [x7, x15]
	ldr	x15, [sp, #680]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_67
// %bb.63:                              //   in Loop: Header=BB0_62 Depth=3
	madd	x2, x14, x28, x9
	add	x15, x14, #1
	add	x17, x14, #3
	add	x16, x14, #2
	madd	x3, x16, x28, x9
	ldr	q16, [x8]
	mov	x1, xzr
	add	x18, x14, #4
	add	x2, x2, x4
	lsl	x2, x2, #2
	add	x3, x3, x4
	lsl	x3, x3, #2
	ldr	q0, [x7, x2]
	madd	x2, x15, x28, x9
	add	x2, x2, x4
	ldr	q2, [x7, x3]
	ldr	x3, [sp, #664]                  // 8-byte Folded Reload
	lsl	x2, x2, #2
	ldr	q1, [x7, x2]
	madd	x2, x17, x28, x9
	add	x2, x2, x4
	ldr	x4, [sp, #672]                  // 8-byte Folded Reload
	lsl	x2, x2, #2
	ldr	q3, [x7, x2]
	ldr	x2, [sp, #656]                  // 8-byte Folded Reload
	mul	x2, x25, x2
	madd	x2, x4, x3, x2
	madd	x3, x14, x22, x2
	lsl	x3, x3, #2
	ldr	q7, [x26, x3]
	madd	x3, x15, x22, x2
	lsl	x3, x3, #2
	ldr	q6, [x26, x3]
	madd	x3, x16, x22, x2
	madd	x2, x17, x22, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x26, x3]
	ldr	q4, [x26, x2]
	mov	x2, x10
	mov	x3, x13
	cmp	xzr, x19
	b.ge	.LBB0_65
	.p2align	2
.LBB0_64:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, #32
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	add	x1, x1, #4
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	prfm	pldl1keep, [x4]
	add	x4, x3, x21
	ldp	q16, q17, [x2, #-32]
	fmla	v0.4s, v16.4s, v7.s[1]
	fmla	v1.4s, v16.4s, v6.s[1]
	fmla	v2.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v7.s[2]
	fmla	v1.4s, v17.4s, v6.s[2]
	fmla	v2.4s, v17.4s, v5.s[2]
	fmla	v3.4s, v17.4s, v4.s[2]
	ldp	q17, q16, [x2], #64
	prfm	pldl1keep, [x3]
	fmla	v0.4s, v17.4s, v7.s[3]
	ldur	q7, [x3, #-16]
	prfm	pldl1keep, [x4]
	fmla	v1.4s, v17.4s, v6.s[3]
	ldur	q6, [x4, #-16]
	add	x4, x4, x21
	fmla	v2.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	cmp	x1, x19
	b.lt	.LBB0_64
.LBB0_65:                               //   in Loop: Header=BB0_62 Depth=3
	ldr	x1, [sp, #648]                  // 8-byte Folded Reload
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	mov	x2, x12
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	mov	x3, x29
	ldr	q17, [x8, x1, lsl #4]
	ldr	x1, [sp, #640]                  // 8-byte Folded Reload
	fmla	v0.4s, v17.4s, v7.s[1]
	ldr	q16, [x8, x1, lsl #4]
	ldr	x1, [sp, #632]                  // 8-byte Folded Reload
	fmla	v1.4s, v17.4s, v6.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	ldr	q18, [x8, x1, lsl #4]
	mov	x1, x11
	fmla	v0.4s, v16.4s, v7.s[2]
	fmla	v1.4s, v16.4s, v6.s[2]
	fmla	v2.4s, v16.4s, v5.s[2]
	fmla	v3.4s, v16.4s, v4.s[2]
	fmla	v0.4s, v18.4s, v7.s[3]
	fmla	v1.4s, v18.4s, v6.s[3]
	fmla	v2.4s, v18.4s, v5.s[3]
	fmla	v3.4s, v18.4s, v4.s[3]
	cmp	x29, x20
	b.ge	.LBB0_61
	.p2align	2
.LBB0_66:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, x21
	prfm	pldl1keep, [x1]
	ldur	q4, [x1, #-16]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #16
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x21
	fmla	v0.4s, v4.4s, v5.s[0]
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v1.4s, v4.4s, v6.s[0]
	fmla	v2.4s, v4.4s, v7.s[0]
	fmla	v3.4s, v4.4s, v16.s[0]
	cmp	x3, x20
	b.lt	.LBB0_66
	b	.LBB0_61
	.p2align	2
.LBB0_67:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #680]                 // 8-byte Folded Reload
	ldr	x13, [sp, #592]                 // 8-byte Folded Reload
	cmp	x12, x13
	b.ge	.LBB0_73
// %bb.68:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x13, [sp, #656]                 // 8-byte Folded Reload
	ldr	x15, [sp, #664]                 // 8-byte Folded Reload
	mov	x14, xzr
	mul	x13, x25, x13
	ldr	x18, [sp, #672]                 // 8-byte Folded Reload
	ldr	x16, [sp, #680]                 // 8-byte Folded Reload
	madd	x12, x16, x28, x9
	ldr	x17, [sp, #448]                 // 8-byte Folded Reload
	ldr	q4, [x8]
	madd	x15, x18, x15, x13
	madd	x13, x16, x22, x15
	add	x16, x16, #1
	madd	x15, x16, x22, x15
	add	x12, x12, x17
	add	x12, x7, x12, lsl #2
	lsl	x13, x13, #2
	ldr	q2, [x26, x13]
	madd	x13, x16, x28, x9
	lsl	x15, x15, #2
	ldr	q0, [x12]
	ldr	x16, [sp, #536]                 // 8-byte Folded Reload
	ldr	q3, [x26, x15]
	mov	x15, x10
	add	x13, x13, x17
	add	x13, x7, x13, lsl #2
	ldr	q1, [x13]
	cmp	xzr, x19
	b.ge	.LBB0_70
	.p2align	2
.LBB0_69:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x3, x15, #32
	ldr	x17, [sp, #608]                 // 8-byte Folded Reload
	ldr	x1, [sp, #600]                  // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v2.s[0]
	prfm	pldl1keep, [x3]
	fmla	v1.4s, v4.4s, v3.s[0]
	ldp	q4, q5, [x15, #-32]
	add	x14, x14, #4
	add	x17, x17, x16
	add	x1, x1, x16
	add	x16, x16, #16
	add	x18, x17, #32
	add	x2, x1, #32
	fmla	v0.4s, v4.4s, v2.s[1]
	fmla	v1.4s, v4.4s, v3.s[1]
	fmla	v0.4s, v5.4s, v2.s[2]
	fmla	v1.4s, v5.4s, v3.s[2]
	ldp	q5, q4, [x15], #64
	prfm	pldl1keep, [x2]
	fmla	v0.4s, v5.4s, v2.s[3]
	ldr	q2, [x1, #16]
	prfm	pldl1keep, [x18]
	fmla	v1.4s, v5.4s, v3.s[3]
	ldr	q3, [x17, #16]
	cmp	x14, x19
	b.lt	.LBB0_69
.LBB0_70:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #648]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v3.s[0]
	mov	x15, x29
	ldr	q5, [x8, x14, lsl #4]
	ldr	x14, [sp, #640]                 // 8-byte Folded Reload
	fmla	v0.4s, v5.4s, v2.s[1]
	ldr	q4, [x8, x14, lsl #4]
	ldr	x14, [sp, #632]                 // 8-byte Folded Reload
	fmla	v1.4s, v5.4s, v3.s[1]
	ldr	q5, [x8, x14, lsl #4]
	ldr	x14, [sp, #536]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v3.s[2]
	fmla	v0.4s, v5.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v3.s[3]
	cmp	x29, x20
	b.ge	.LBB0_72
	.p2align	2
.LBB0_71:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x5, x14
	add	x17, x6, x14
	prfm	pldl1keep, [x11]
	ldur	q2, [x11, #-16]
	add	x16, x16, #4
	add	x17, x17, #4
	add	x15, x15, #1
	add	x11, x11, #16
	prfm	pldl1keep, [x17]
	ldr	s3, [x6, x14]
	prfm	pldl1keep, [x16]
	ldr	s4, [x5, x14]
	add	x14, x14, #4
	fmla	v0.4s, v2.4s, v3.s[0]
	fmla	v1.4s, v2.4s, v4.s[0]
	cmp	x15, x20
	b.lt	.LBB0_71
.LBB0_72:                               //   in Loop: Header=BB0_7 Depth=2
	str	q0, [x12]
	str	q1, [x13]
.LBB0_73:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #528]                 // 8-byte Folded Reload
	ldr	x12, [sp, #592]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_79
// %bb.74:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #592]                 // 8-byte Folded Reload
	ldr	x12, [sp, #448]                 // 8-byte Folded Reload
	mov	x11, xzr
	madd	x9, x14, x28, x9
	ldr	x13, [sp, #664]                 // 8-byte Folded Reload
	ldr	x15, [sp, #672]                 // 8-byte Folded Reload
	ldr	q2, [x8]
	add	x9, x9, x12
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	add	x9, x7, x9, lsl #2
	ldr	q0, [x9]
	mul	x12, x25, x12
	madd	x12, x15, x13, x12
	madd	x12, x14, x22, x12
	lsl	x12, x12, #2
	ldr	q1, [x26, x12]
	ldp	x12, x14, [sp, #456]            // 16-byte Folded Reload
	cmp	xzr, x19
	b.ge	.LBB0_76
	.p2align	2
.LBB0_75:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x10, #32
	fmla	v0.4s, v2.4s, v1.s[0]
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	ldp	q2, q3, [x10, #-32]
	fmla	v0.4s, v2.4s, v1.s[1]
	fmla	v0.4s, v3.4s, v1.s[2]
	ldp	q3, q2, [x10], #64
	prfm	pldl1keep, [x12]
	fmla	v0.4s, v3.4s, v1.s[3]
	ldur	q1, [x12, #-16]
	add	x12, x12, #16
	cmp	x11, x19
	b.lt	.LBB0_75
.LBB0_76:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #648]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x12, [sp, #416]                 // 8-byte Folded Reload
	mov	x10, xzr
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #640]                 // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v1.s[1]
	ldr	q2, [x8, x11, lsl #4]
	ldr	x11, [sp, #632]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[2]
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #184]                 // 8-byte Folded Reload
	add	x8, x8, x11
	mov	w11, #16                        // =0x10
	fmla	v0.4s, v3.4s, v1.s[3]
	add	x13, x29, xzr
	cmp	x13, x20
	b.ge	.LBB0_78
	.p2align	2
.LBB0_77:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x8, x11
	add	x11, x11, #16
	prfm	pldl1keep, [x13]
	ldr	q1, [x8, x10, lsl #4]
	prfm	pldl1keep, [x12]
	add	x12, x12, #4
	ldr	s2, [x14, x10, lsl #2]
	add	x10, x10, #1
	fmla	v0.4s, v1.4s, v2.s[0]
	add	x13, x29, x10
	cmp	x13, x20
	b.lt	.LBB0_77
.LBB0_78:                               //   in Loop: Header=BB0_7 Depth=2
	str	q0, [x9]
.LBB0_79:                               //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldp	x9, x8, [sp, #432]              // 16-byte Folded Reload
	ldr	x16, [sp, #560]                 // 8-byte Folded Reload
	cmp	x8, x9
	b.ge	.LBB0_35
.LBB0_80:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #240]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	ldr	x9, [sp, #512]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldr	x12, [sp, #672]                 // 8-byte Folded Reload
	ldr	x5, [sp, #584]                  // 8-byte Folded Reload
	mul	x8, x25, x8
	ldr	x13, [sp, #576]                 // 8-byte Folded Reload
	ldr	x17, [sp, #560]                 // 8-byte Folded Reload
	madd	x9, x12, x9, x8
	ldr	x8, [sp, #440]                  // 8-byte Folded Reload
	add	x8, x9, x8
	lsl	x12, x8, #2
	ldr	d0, [x5, x12]
	add	x12, x8, x28
	lsl	x12, x12, #2
	ldr	d1, [x5, x12]
	add	x12, x8, x13
	lsl	x12, x12, #2
	ldr	d2, [x5, x12]
	add	x12, x13, x28
	add	x8, x8, x12
	lsl	x8, x8, #2
	ldr	d3, [x5, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x20
	b.ge	.LBB0_82
	.p2align	2
.LBB0_81:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldp	x12, x16, [sp, #400]            // 16-byte Folded Reload
	add	x15, x17, x10
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x15, x15, x21
	prfm	pldl1keep, [x15]
	ldur	s5, [x15, #-4]
	add	x15, x15, x21
	prfm	pldl1keep, [x15]
	ldur	s6, [x15, #-4]
	add	x15, x15, x21
	add	x12, x12, x10
	add	x14, x16, x10
	prfm	pldl1keep, [x15]
	ldur	s7, [x15, #-4]
	add	x13, x12, #4
	add	x14, x14, #4
	prfm	pldl1keep, [x14]
	prfm	pldl1keep, [x13]
	ldr	s16, [x16, x10]
	add	x10, x10, #4
	ld1	{ v16.s }[1], [x12]
	str	d16, [x8, x11, lsl #3]
	add	x11, x11, #1
	fmla	v0.2s, v16.2s, v4.s[0]
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x11, x20
	b.lt	.LBB0_81
.LBB0_82:                               // %.preheader37
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #200]                 // 8-byte Folded Reload
	ldr	x12, [sp, #552]                 // 8-byte Folded Reload
	mov	x1, xzr
	add	x10, x8, #24
	ldr	x13, [sp, #544]                 // 8-byte Folded Reload
	mov	w15, #1                         // =0x1
	mov	w16, #2                         // =0x2
	mov	w17, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_84
	.p2align	2
.LBB0_83:                               // %.loopexit33
                                        //   in Loop: Header=BB0_84 Depth=3
	add	x13, x13, x23
	add	x12, x12, x23
	mov	x1, x14
	mov	x14, x18
.LBB0_84:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_86 Depth 4
                                        //         Child Loop BB0_88 Depth 4
	madd	x18, x1, x28, x9
	ldr	x4, [sp, #440]                  // 8-byte Folded Reload
	add	x18, x18, x4
	madd	x15, x15, x28, x9
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	add	x15, x15, x4
	add	x16, x16, x4
	lsl	x18, x18, #2
	lsl	x15, x15, #2
	lsl	x16, x16, #2
	str	d0, [x5, x18]
	str	d1, [x5, x15]
	add	x15, x17, x4
	str	d2, [x5, x16]
	lsl	x15, x15, #2
	str	d3, [x5, x15]
	ldr	x15, [sp, #680]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_89
// %bb.85:                              //   in Loop: Header=BB0_84 Depth=3
	madd	x2, x14, x28, x9
	add	x15, x14, #1
	add	x17, x14, #3
	add	x16, x14, #2
	madd	x3, x16, x28, x9
	ldr	d16, [x8]
	mov	x1, xzr
	add	x18, x14, #4
	add	x2, x2, x4
	lsl	x2, x2, #2
	add	x3, x3, x4
	lsl	x3, x3, #2
	ldr	d0, [x5, x2]
	madd	x2, x15, x28, x9
	add	x2, x2, x4
	ldr	d2, [x5, x3]
	ldr	x3, [sp, #664]                  // 8-byte Folded Reload
	lsl	x2, x2, #2
	ldr	d1, [x5, x2]
	madd	x2, x17, x28, x9
	add	x2, x2, x4
	ldr	x4, [sp, #672]                  // 8-byte Folded Reload
	lsl	x2, x2, #2
	ldr	d3, [x5, x2]
	ldr	x2, [sp, #656]                  // 8-byte Folded Reload
	mul	x2, x25, x2
	madd	x2, x4, x3, x2
	madd	x3, x14, x22, x2
	lsl	x3, x3, #2
	ldr	q7, [x26, x3]
	madd	x3, x15, x22, x2
	lsl	x3, x3, #2
	ldr	q6, [x26, x3]
	madd	x3, x16, x22, x2
	madd	x2, x17, x22, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x26, x3]
	ldr	q4, [x26, x2]
	mov	x2, x10
	mov	x3, x13
	cmp	xzr, x19
	b.ge	.LBB0_87
	.p2align	2
.LBB0_86:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_84 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, #16
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	add	x1, x1, #4
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	prfm	pldl1keep, [x4]
	add	x4, x3, x21
	ldp	d16, d17, [x2, #-16]
	fmla	v0.2s, v16.2s, v7.s[1]
	fmla	v1.2s, v16.2s, v6.s[1]
	fmla	v2.2s, v16.2s, v5.s[1]
	fmla	v3.2s, v16.2s, v4.s[1]
	fmla	v0.2s, v17.2s, v7.s[2]
	fmla	v1.2s, v17.2s, v6.s[2]
	fmla	v2.2s, v17.2s, v5.s[2]
	fmla	v3.2s, v17.2s, v4.s[2]
	ldp	d17, d16, [x2], #32
	prfm	pldl1keep, [x3]
	fmla	v0.2s, v17.2s, v7.s[3]
	ldur	q7, [x3, #-16]
	prfm	pldl1keep, [x4]
	fmla	v1.2s, v17.2s, v6.s[3]
	ldur	q6, [x4, #-16]
	add	x4, x4, x21
	fmla	v2.2s, v17.2s, v5.s[3]
	fmla	v3.2s, v17.2s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	cmp	x1, x19
	b.lt	.LBB0_86
.LBB0_87:                               //   in Loop: Header=BB0_84 Depth=3
	ldr	x1, [sp, #648]                  // 8-byte Folded Reload
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	mov	x2, x12
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	mov	x3, x29
	ldr	d17, [x8, x1, lsl #3]
	ldr	x1, [sp, #640]                  // 8-byte Folded Reload
	fmla	v0.2s, v17.2s, v7.s[1]
	ldr	d16, [x8, x1, lsl #3]
	ldr	x1, [sp, #632]                  // 8-byte Folded Reload
	fmla	v1.2s, v17.2s, v6.s[1]
	fmla	v2.2s, v17.2s, v5.s[1]
	fmla	v3.2s, v17.2s, v4.s[1]
	ldr	d18, [x8, x1, lsl #3]
	mov	x1, x11
	fmla	v0.2s, v16.2s, v7.s[2]
	fmla	v1.2s, v16.2s, v6.s[2]
	fmla	v2.2s, v16.2s, v5.s[2]
	fmla	v3.2s, v16.2s, v4.s[2]
	fmla	v0.2s, v18.2s, v7.s[3]
	fmla	v1.2s, v18.2s, v6.s[3]
	fmla	v2.2s, v18.2s, v5.s[3]
	fmla	v3.2s, v18.2s, v4.s[3]
	cmp	x29, x20
	b.ge	.LBB0_83
	.p2align	2
.LBB0_88:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_84 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, x21
	prfm	pldl1keep, [x1]
	ldur	d4, [x1, #-8]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #8
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x21
	fmla	v0.2s, v4.2s, v5.s[0]
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v1.2s, v4.2s, v6.s[0]
	fmla	v2.2s, v4.2s, v7.s[0]
	fmla	v3.2s, v4.2s, v16.s[0]
	cmp	x3, x20
	b.lt	.LBB0_88
	b	.LBB0_83
	.p2align	2
.LBB0_89:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #680]                 // 8-byte Folded Reload
	ldr	x12, [sp, #592]                 // 8-byte Folded Reload
	cmp	x11, x12
	b.ge	.LBB0_95
// %bb.90:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	ldr	x14, [sp, #664]                 // 8-byte Folded Reload
	mov	x13, xzr
	mul	x12, x25, x12
	ldr	x17, [sp, #672]                 // 8-byte Folded Reload
	ldr	x15, [sp, #680]                 // 8-byte Folded Reload
	madd	x11, x15, x28, x9
	ldr	x16, [sp, #440]                 // 8-byte Folded Reload
	ldr	d4, [x8]
	madd	x14, x17, x14, x12
	madd	x12, x15, x22, x14
	add	x15, x15, #1
	madd	x14, x15, x22, x14
	add	x11, x11, x16
	add	x11, x5, x11, lsl #2
	lsl	x12, x12, #2
	ldr	q2, [x26, x12]
	madd	x12, x15, x28, x9
	lsl	x14, x14, #2
	ldr	d0, [x11]
	ldr	x15, [sp, #536]                 // 8-byte Folded Reload
	ldr	q3, [x26, x14]
	mov	x14, x10
	add	x12, x12, x16
	add	x12, x5, x12, lsl #2
	ldr	d1, [x12]
	cmp	xzr, x19
	b.ge	.LBB0_92
	.p2align	2
.LBB0_91:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x2, x14, #16
	ldr	x16, [sp, #608]                 // 8-byte Folded Reload
	ldr	x18, [sp, #600]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v2.s[0]
	prfm	pldl1keep, [x2]
	fmla	v1.2s, v4.2s, v3.s[0]
	ldp	d4, d5, [x14, #-16]
	add	x13, x13, #4
	add	x16, x16, x15
	add	x18, x18, x15
	add	x15, x15, #16
	add	x17, x16, #32
	add	x1, x18, #32
	fmla	v0.2s, v4.2s, v2.s[1]
	fmla	v1.2s, v4.2s, v3.s[1]
	fmla	v0.2s, v5.2s, v2.s[2]
	fmla	v1.2s, v5.2s, v3.s[2]
	ldp	d5, d4, [x14], #32
	prfm	pldl1keep, [x1]
	fmla	v0.2s, v5.2s, v2.s[3]
	ldr	q2, [x18, #16]
	prfm	pldl1keep, [x17]
	fmla	v1.2s, v5.2s, v3.s[3]
	ldr	q3, [x16, #16]
	cmp	x13, x19
	b.lt	.LBB0_91
.LBB0_92:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x15, [sp, #648]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v2.s[0]
	fmla	v1.2s, v4.2s, v3.s[0]
	ldr	x1, [sp, #352]                  // 8-byte Folded Reload
	ldr	x2, [sp, #424]                  // 8-byte Folded Reload
	mov	x13, xzr
	mov	x14, xzr
	ldr	d5, [x8, x15, lsl #3]
	ldr	x15, [sp, #640]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v2.s[1]
	ldr	d4, [x8, x15, lsl #3]
	ldr	x15, [sp, #632]                 // 8-byte Folded Reload
	fmla	v1.2s, v5.2s, v3.s[1]
	ldr	d5, [x8, x15, lsl #3]
	ldr	x15, [sp, #224]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v2.s[2]
	fmla	v1.2s, v4.2s, v3.s[2]
	add	x15, x8, x15
	fmla	v0.2s, v5.2s, v2.s[3]
	fmla	v1.2s, v5.2s, v3.s[3]
	add	x16, x29, xzr
	cmp	x16, x20
	b.ge	.LBB0_94
	.p2align	2
.LBB0_93:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x18, x15, x14, lsl #3
	add	x16, x2, x13
	add	x17, x1, x13
	add	x13, x13, #4
	add	x17, x17, #4
	add	x16, x16, #4
	add	x18, x18, #8
	prfm	pldl1keep, [x18]
	ldr	d2, [x15, x14, lsl #3]
	prfm	pldl1keep, [x17]
	ldr	s3, [x1, x14, lsl #2]
	prfm	pldl1keep, [x16]
	fmla	v0.2s, v2.2s, v3.s[0]
	ldr	s4, [x2, x14, lsl #2]
	fmla	v1.2s, v2.2s, v4.s[0]
	add	x14, x14, #1
	add	x16, x29, x14
	cmp	x16, x20
	b.lt	.LBB0_93
.LBB0_94:                               //   in Loop: Header=BB0_7 Depth=2
	str	d0, [x11]
	str	d1, [x12]
.LBB0_95:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #528]                 // 8-byte Folded Reload
	ldr	x12, [sp, #592]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_101
// %bb.96:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #592]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	mov	x11, xzr
	madd	x9, x14, x28, x9
	ldr	x13, [sp, #664]                 // 8-byte Folded Reload
	ldr	x15, [sp, #672]                 // 8-byte Folded Reload
	ldr	d1, [x8]
	add	x9, x9, x12
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	add	x9, x5, x9, lsl #2
	ldr	d0, [x9]
	mul	x12, x25, x12
	madd	x12, x15, x13, x12
	madd	x12, x14, x22, x12
	lsl	x12, x12, #2
	ldr	q2, [x26, x12]
	ldp	x12, x14, [sp, #456]            // 16-byte Folded Reload
	cmp	xzr, x19
	b.ge	.LBB0_98
	.p2align	2
.LBB0_97:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x10, #16
	fmla	v0.2s, v1.2s, v2.s[0]
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	ldp	d1, d3, [x10, #-16]
	fmla	v0.2s, v1.2s, v2.s[1]
	fmla	v0.2s, v3.2s, v2.s[2]
	ldp	d3, d1, [x10], #32
	prfm	pldl1keep, [x12]
	fmla	v0.2s, v3.2s, v2.s[3]
	ldur	q2, [x12, #-16]
	add	x12, x12, #16
	cmp	x11, x19
	b.lt	.LBB0_97
.LBB0_98:                               //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #648]                 // 8-byte Folded Reload
	fmla	v0.2s, v1.2s, v2.s[0]
	mov	x10, xzr
	ldr	d3, [x8, x11, lsl #3]
	ldr	x11, [sp, #640]                 // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v2.s[1]
	ldr	d4, [x8, x11, lsl #3]
	ldr	x11, [sp, #632]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v2.s[2]
	ldr	d1, [x8, x11, lsl #3]
	ldr	x11, [sp, #224]                 // 8-byte Folded Reload
	add	x8, x8, x11
	ldr	x11, [sp, #416]                 // 8-byte Folded Reload
	fmla	v0.2s, v1.2s, v2.s[3]
	add	x12, x29, xzr
	cmp	x12, x20
	b.ge	.LBB0_100
	.p2align	2
.LBB0_99:                               //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x12, x8, x10, lsl #3
	add	x12, x12, #8
	prfm	pldl1keep, [x12]
	ldr	d1, [x8, x10, lsl #3]
	prfm	pldl1keep, [x11]
	add	x11, x11, #4
	ldr	s2, [x14, x10, lsl #2]
	add	x10, x10, #1
	fmla	v0.2s, v1.2s, v2.s[0]
	add	x12, x29, x10
	cmp	x12, x20
	b.lt	.LBB0_99
.LBB0_100:                              //   in Loop: Header=BB0_7 Depth=2
	str	d0, [x9]
.LBB0_101:                              //   in Loop: Header=BB0_7 Depth=2
	bl	free
	ldr	x9, [sp, #432]                  // 8-byte Folded Reload
	ldr	x16, [sp, #560]                 // 8-byte Folded Reload
	ldr	x8, [sp, #296]                  // 8-byte Folded Reload
	cmp	x9, x8
	b.ge	.LBB0_6
.LBB0_102:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x8, [sp, #272]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #520]                  // 8-byte Folded Reload
	ldr	x9, [sp, #512]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldr	x12, [sp, #672]                 // 8-byte Folded Reload
	ldr	x13, [sp, #576]                 // 8-byte Folded Reload
	mul	x8, x25, x8
	ldr	x6, [sp, #584]                  // 8-byte Folded Reload
	ldr	x14, [sp, #560]                 // 8-byte Folded Reload
	madd	x9, x12, x9, x8
	ldr	x8, [sp, #432]                  // 8-byte Folded Reload
	add	x12, x9, x8
	add	x8, x13, x28
	add	x8, x12, x8
	add	x13, x12, x13
	ldr	s1, [x6, x12, lsl #2]
	add	x12, x12, x28
	ldr	s0, [x6, x8, lsl #2]
	ldr	s2, [x6, x13, lsl #2]
	ldr	s3, [x6, x12, lsl #2]
	ldr	x12, [sp, #328]                 // 8-byte Folded Reload
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x20
	b.ge	.LBB0_104
	.p2align	2
.LBB0_103:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x14, x10
	add	x11, x11, #1
	prfm	pldl1keep, [x13]
	ldur	s4, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s5, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s6, [x13, #-4]
	add	x13, x13, x21
	prfm	pldl1keep, [x13]
	ldur	s7, [x13, #-4]
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x12, x12, #4
	fmla	v1.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	str	s16, [x8, x10]
	add	x10, x10, #4
	cmp	x11, x20
	b.lt	.LBB0_103
.LBB0_104:                              // %.preheader36
                                        //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #192]                 // 8-byte Folded Reload
	ldr	x12, [sp, #552]                 // 8-byte Folded Reload
	mov	x1, xzr
	add	x10, x8, #12
	ldr	x13, [sp, #544]                 // 8-byte Folded Reload
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w15, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_106
	.p2align	2
.LBB0_105:                              // %.loopexit32
                                        //   in Loop: Header=BB0_106 Depth=3
	add	x13, x13, x23
	add	x12, x12, x23
	mov	x1, x14
	mov	x14, x18
.LBB0_106:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_108 Depth 4
                                        //         Child Loop BB0_110 Depth 4
	madd	x18, x1, x28, x9
	ldr	x5, [sp, #432]                  // 8-byte Folded Reload
	add	x18, x18, x5
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	madd	x15, x15, x28, x9
	add	x16, x16, x5
	add	x15, x15, x5
	str	s1, [x6, x18, lsl #2]
	str	s3, [x6, x16, lsl #2]
	add	x16, x17, x5
	str	s2, [x6, x16, lsl #2]
	str	s0, [x6, x15, lsl #2]
	ldr	x15, [sp, #680]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_111
// %bb.107:                             //   in Loop: Header=BB0_106 Depth=3
	madd	x2, x14, x28, x9
	add	x15, x14, #3
	add	x16, x14, #1
	add	x17, x14, #2
	madd	x3, x16, x28, x9
	ldr	s16, [x8]
	mov	x1, xzr
	add	x18, x14, #4
	madd	x4, x17, x28, x9
	add	x2, x2, x5
	ldr	s1, [x6, x2, lsl #2]
	madd	x2, x15, x28, x9
	add	x4, x4, x5
	ldr	s2, [x6, x4, lsl #2]
	ldr	x4, [sp, #672]                  // 8-byte Folded Reload
	add	x2, x2, x5
	ldr	s0, [x6, x2, lsl #2]
	add	x2, x3, x5
	ldr	x3, [sp, #664]                  // 8-byte Folded Reload
	ldr	s3, [x6, x2, lsl #2]
	ldr	x2, [sp, #656]                  // 8-byte Folded Reload
	mul	x2, x25, x2
	madd	x2, x4, x3, x2
	madd	x3, x14, x22, x2
	lsl	x3, x3, #2
	ldr	q7, [x26, x3]
	madd	x3, x16, x22, x2
	lsl	x3, x3, #2
	ldr	q6, [x26, x3]
	madd	x3, x17, x22, x2
	madd	x2, x15, x22, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x26, x3]
	ldr	q4, [x26, x2]
	mov	x2, x10
	mov	x3, x13
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	xzr, x19
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.ge	.LBB0_109
	.p2align	2
.LBB0_108:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_106 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, #8
	fmla	v1.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	add	x1, x1, #4
	fmla	v2.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	prfm	pldl1keep, [x4]
	add	x4, x3, x21
	ldp	s16, s21, [x2, #-8]
	fmla	v0.2s, v16.2s, v4.s[1]
	fmla	v1.2s, v16.2s, v7.s[1]
	fmla	v3.2s, v16.2s, v6.s[1]
	fmla	v2.2s, v16.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v17.2s
	fmla	v1.2s, v21.2s, v20.2s
	ldp	s17, s16, [x2], #16
	fmla	v3.2s, v21.2s, v19.2s
	fmla	v2.2s, v21.2s, v18.2s
	prfm	pldl1keep, [x3]
	fmla	v1.2s, v17.2s, v7.s[3]
	ldur	q7, [x3, #-16]
	prfm	pldl1keep, [x4]
	fmla	v3.2s, v17.2s, v6.s[3]
	ldur	q6, [x4, #-16]
	add	x4, x4, x21
	fmla	v2.2s, v17.2s, v5.s[3]
	fmla	v0.2s, v17.2s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	x1, x19
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.lt	.LBB0_108
.LBB0_109:                              //   in Loop: Header=BB0_106 Depth=3
	ldr	x1, [sp, #648]                  // 8-byte Folded Reload
	fmla	v1.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	mov	x2, x12
	fmla	v2.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	mov	x3, x29
	ldr	s21, [x8, x1, lsl #2]
	ldr	x1, [sp, #640]                  // 8-byte Folded Reload
	fmla	v1.2s, v21.2s, v7.s[1]
	ldr	s16, [x8, x1, lsl #2]
	ldr	x1, [sp, #632]                  // 8-byte Folded Reload
	fmla	v3.2s, v21.2s, v6.s[1]
	fmla	v2.2s, v21.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v4.s[1]
	ldr	s22, [x8, x1, lsl #2]
	mov	x1, x11
	fmla	v1.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v2.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	fmla	v1.2s, v22.2s, v7.s[3]
	fmla	v3.2s, v22.2s, v6.s[3]
	fmla	v2.2s, v22.2s, v5.s[3]
	fmla	v0.2s, v22.2s, v4.s[3]
	cmp	x29, x20
	b.ge	.LBB0_105
	.p2align	2
.LBB0_110:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        //       Parent Loop BB0_106 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x4, x2, x21
	prfm	pldl1keep, [x1]
	ldur	s4, [x1, #-4]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #4
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x21
	fmla	v1.2s, v4.2s, v5.2s
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x21
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v3.2s, v4.2s, v6.2s
	fmla	v2.2s, v4.2s, v7.2s
	fmla	v0.2s, v4.2s, v16.2s
	cmp	x3, x20
	b.lt	.LBB0_110
	b	.LBB0_105
	.p2align	2
.LBB0_111:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #680]                 // 8-byte Folded Reload
	ldr	x12, [sp, #592]                 // 8-byte Folded Reload
	cmp	x11, x12
	b.ge	.LBB0_117
// %bb.112:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	ldr	x15, [sp, #664]                 // 8-byte Folded Reload
	mov	x13, xzr
	mov	x14, xzr
	ldr	x18, [sp, #672]                 // 8-byte Folded Reload
	ldr	x16, [sp, #680]                 // 8-byte Folded Reload
	mul	x12, x25, x12
	madd	x11, x16, x28, x9
	ldr	x17, [sp, #432]                 // 8-byte Folded Reload
	ldr	s4, [x8]
	madd	x12, x18, x15, x12
	madd	x15, x16, x22, x12
	add	x11, x11, x17
	ldr	s1, [x6, x11, lsl #2]
	lsl	x15, x15, #2
	ldr	q2, [x26, x15]
	add	x15, x16, #1
	madd	x16, x15, x22, x12
	madd	x12, x15, x28, x9
	add	x12, x12, x17
	lsl	x15, x16, #2
	ldr	s0, [x6, x12, lsl #2]
	ldr	q3, [x26, x15]
	ext	v6.16b, v2.16b, v2.16b, #8
	cmp	xzr, x19
	ext	v5.16b, v3.16b, v3.16b, #8
	b.ge	.LBB0_114
	.p2align	2
.LBB0_113:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x1, x8, x13
	ldp	x15, x17, [sp, #336]            // 16-byte Folded Reload
	fmla	v1.2s, v4.2s, v2.2s
	add	x2, x1, #20
	fmla	v0.2s, v4.2s, v3.2s
	add	x14, x14, #4
	prfm	pldl1keep, [x2]
	ldp	s4, s7, [x1, #4]
	add	x15, x15, x13
	add	x17, x17, x13
	add	x13, x13, #16
	add	x16, x15, #32
	add	x18, x17, #32
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v7.2s, v5.2s
	ldp	s5, s4, [x1, #12]
	fmla	v1.2s, v7.2s, v6.2s
	prfm	pldl1keep, [x18]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x17, #16]
	prfm	pldl1keep, [x16]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x15, #16]
	ext	v6.16b, v2.16b, v2.16b, #8
	cmp	x14, x19
	ext	v5.16b, v3.16b, v3.16b, #8
	b.lt	.LBB0_113
.LBB0_114:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #648]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v2.2s
	fmla	v0.2s, v4.2s, v3.2s
	ldr	x1, [sp, #352]                  // 8-byte Folded Reload
	ldr	x2, [sp, #424]                  // 8-byte Folded Reload
	mov	x13, xzr
	mov	x15, x29
	ldr	s7, [x8, x14, lsl #2]
	ldr	x14, [sp, #640]                 // 8-byte Folded Reload
	fmla	v1.2s, v7.2s, v2.s[1]
	ldr	s4, [x8, x14, lsl #2]
	ldr	x14, [sp, #632]                 // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v3.s[1]
	ldr	s7, [x8, x14, lsl #2]
	ldr	x14, [sp, #264]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v6.2s
	fmla	v0.2s, v4.2s, v5.2s
	add	x14, x8, x14
	fmla	v1.2s, v7.2s, v2.s[3]
	fmla	v0.2s, v7.2s, v3.s[3]
	cmp	x29, x20
	b.ge	.LBB0_116
	.p2align	2
.LBB0_115:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x2, x13
	add	x17, x1, x13
	add	x18, x14, x13
	add	x15, x15, #1
	add	x16, x16, #4
	add	x17, x17, #4
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	ldr	s2, [x14, x13]
	prfm	pldl1keep, [x17]
	prfm	pldl1keep, [x16]
	ldr	s3, [x1, x13]
	fmla	v1.2s, v2.2s, v3.2s
	ldr	s3, [x2, x13]
	add	x13, x13, #4
	fmla	v0.2s, v2.2s, v3.2s
	cmp	x15, x20
	b.lt	.LBB0_115
.LBB0_116:                              //   in Loop: Header=BB0_7 Depth=2
	str	s1, [x6, x11, lsl #2]
	str	s0, [x6, x12, lsl #2]
.LBB0_117:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #528]                 // 8-byte Folded Reload
	ldr	x12, [sp, #592]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_5
// %bb.118:                             //   in Loop: Header=BB0_7 Depth=2
	ldr	x14, [sp, #592]                 // 8-byte Folded Reload
	ldr	x12, [sp, #432]                 // 8-byte Folded Reload
	mov	x11, xzr
	madd	x9, x14, x28, x9
	ldr	x13, [sp, #664]                 // 8-byte Folded Reload
	ldr	x15, [sp, #672]                 // 8-byte Folded Reload
	ldr	s2, [x8]
	add	x9, x9, x12
	ldr	x12, [sp, #656]                 // 8-byte Folded Reload
	ldr	s0, [x6, x9, lsl #2]
	mul	x12, x25, x12
	madd	x12, x15, x13, x12
	madd	x12, x14, x22, x12
	lsl	x12, x12, #2
	ldr	q1, [x26, x12]
	ldp	x12, x14, [sp, #456]            // 16-byte Folded Reload
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	xzr, x19
	b.ge	.LBB0_120
	.p2align	2
.LBB0_119:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x13, x10, #8
	fmla	v0.2s, v2.2s, v1.2s
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	ldp	s2, s4, [x10, #-8]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v4.2s, v3.2s
	ldp	s3, s2, [x10], #16
	prfm	pldl1keep, [x12]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x12, #-16]
	add	x12, x12, #16
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	x11, x19
	b.lt	.LBB0_119
.LBB0_120:                              //   in Loop: Header=BB0_7 Depth=2
	ldr	x11, [sp, #648]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.2s
	mov	x10, xzr
	ldr	s4, [x8, x11, lsl #2]
	ldr	x11, [sp, #640]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[1]
	ldr	s5, [x8, x11, lsl #2]
	ldr	x11, [sp, #632]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.2s
	ldr	s2, [x8, x11, lsl #2]
	ldr	x11, [sp, #264]                 // 8-byte Folded Reload
	add	x8, x8, x11
	mov	x11, x29
	fmla	v0.2s, v2.2s, v1.s[3]
	cmp	x29, x20
	b.ge	.LBB0_4
	.p2align	2
.LBB0_121:                              //   Parent Loop BB0_2 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x12, x14, x10
	add	x13, x8, x10
	add	x11, x11, #1
	add	x12, x12, #4
	add	x13, x13, #4
	prfm	pldl1keep, [x13]
	ldr	s1, [x8, x10]
	prfm	pldl1keep, [x12]
	ldr	s2, [x14, x10]
	add	x10, x10, #4
	fmla	v0.2s, v1.2s, v2.2s
	cmp	x11, x20
	b.lt	.LBB0_121
	b	.LBB0_4
.LBB0_122:
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	bl	free
	add	sp, sp, #688
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
	.size	sbatch_matmul_4d_nt_mlir, .Lfunc_end0-sbatch_matmul_4d_nt_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
