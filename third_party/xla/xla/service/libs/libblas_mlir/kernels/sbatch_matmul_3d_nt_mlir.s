	.text
	.file	"LLVMDialectModule"
	.globl	sbatch_matmul_3d_nt_mlir                    // -- Begin function sbatch_matmul_3d_nt_mlir
	.p2align	4
	.type	sbatch_matmul_3d_nt_mlir,@function
sbatch_matmul_3d_nt_mlir:                           // @sbatch_matmul_3d_nt_mlir
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
	sub	sp, sp, #512
	.cfi_def_cfa_offset 672
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
	ldr	x13, [sp, #712]
	ldr	x14, [sp, #768]
	mov	x19, x7
	cinv	x8, x4, lt
	ldr	x12, [sp, #760]
	ldr	x28, [sp, #808]
	mov	x21, x5
	add	x9, x8, x8, lsr #63
	add	x10, x8, #3
	ldr	x23, [sp, #728]
	ldr	x27, [sp, #736]
	str	x6, [sp, #448]                  // 8-byte Folded Spill
	stp	x13, x3, [sp, #136]             // 16-byte Folded Spill
	mov	x26, x2
	mov	x25, x1
	asr	x9, x9, #1
	stp	x12, x14, [sp, #328]            // 16-byte Folded Spill
	cinv	x22, x9, lt
	cmp	x8, #0
	csel	x8, x10, x8, lt
	cmp	x4, #0
	ldr	x10, [sp, #800]
	asr	x8, x8, #2
	cinv	x24, x8, lt
	cmp	x13, #0
	cinv	x8, x13, lt
	add	x9, x8, x8, lsr #63
	stp	x10, x4, [sp, #360]             // 16-byte Folded Spill
	add	x10, x8, #15
	add	x11, x8, #7
	add	x12, x8, #3
	asr	x9, x9, #1
	cinv	x14, x9, lt
	cmp	x8, #0
	csel	x9, x10, x8, lt
	csel	x10, x11, x8, lt
	ldr	x11, [sp, #696]
	csel	x8, x12, x8, lt
	cmp	x13, #0
	asr	x9, x9, #4
	asr	x10, x10, #3
	asr	x8, x8, #2
	cinv	x9, x9, lt
	cinv	x10, x10, lt
	cinv	x29, x8, lt
	lsl	x8, x14, #1
	stp	x9, x10, [sp, #456]             // 16-byte Folded Spill
	lsl	x9, x9, #4
	str	x8, [sp, #168]                  // 8-byte Folded Spill
	lsl	x8, x5, #6
	lsl	x20, x29, #2
	stp	x11, x14, [sp, #488]            // 16-byte Folded Spill
	ldr	x11, [sp, #688]
	str	x9, [sp, #416]                  // 8-byte Folded Spill
	lsl	x9, x10, #3
	add	x0, x8, #64
	stp	x8, x11, [sp, #472]             // 16-byte Folded Spill
	str	x9, [sp, #280]                  // 8-byte Folded Spill
	bl	malloc
	lsl	x8, x24, #2
	mov	x12, x22
	lsl	x10, x23, #2
	mul	x11, x24, x19
	str	x8, [sp, #504]                  // 8-byte Folded Spill
	lsl	x8, x22, #1
	and	x9, x21, #0x3
	lsl	x22, x19, #2
	str	x8, [sp, #440]                  // 8-byte Folded Spill
	negs	x8, x21
	str	x10, [sp, #128]                 // 8-byte Folded Spill
	lsl	x10, x27, #6
	mul	x13, x12, x19
	str	x0, [sp, #16]                   // 8-byte Folded Spill
	add	x12, x0, #63
	and	x8, x8, #0x3
	ldp	x0, x18, [sp, #480]             // 16-byte Folded Reload
	str	x10, [sp, #320]                 // 8-byte Folded Spill
	mov	w10, #1                         // =0x1
	add	x14, x21, x22
	csneg	x8, x9, x8, mi
	lsl	x2, x26, #2
	bfi	x10, x24, #2, #62
	sub	x14, x14, x8
	and	x23, x12, #0xffffffffffffffc0
	mul	x12, x19, x10
	lsl	x24, x19, #4
	add	x14, x2, x14, lsl #2
	lsl	x9, x11, #4
	add	x11, x21, x11, lsl #2
	add	x18, x0, x18, lsl #2
	add	x0, x24, x2
	add	x0, x0, x25
	add	x14, x14, x25
	sub	x11, x11, x8
	add	x0, x0, #32
	add	x14, x14, #4
	lsl	x17, x12, #2
	add	x12, x21, x12
	lsl	x11, x11, #2
	stp	x14, x0, [sp, #384]             // 16-byte Folded Spill
	ldr	x0, [sp, #472]                  // 8-byte Folded Reload
	add	x16, x21, x13, lsl #1
	str	x11, [sp, #264]                 // 8-byte Folded Spill
	sub	x11, x12, x8
	ldr	x10, [sp, #456]                 // 8-byte Folded Reload
	lsl	x11, x11, #2
	sub	x14, x23, x8, lsl #6
	str	x11, [sp, #256]                 // 8-byte Folded Spill
	sub	x11, x16, x8
	mov	w15, #1                         // =0x1
	lsl	x16, x11, #2
	add	x13, x2, x13, lsl #3
	bfi	x15, x29, #2, #62
	add	x16, x16, #4
	add	x0, x14, x0
	add	x14, x25, x17
	lsl	x4, x21, #2
	mul	x10, x10, x27
	str	x14, [sp, #296]                 // 8-byte Folded Spill
	add	x14, x25, x9
	mul	x12, x29, x27
	mul	x15, x27, x15
	str	x14, [sp, #288]                 // 8-byte Folded Spill
	add	x14, x13, x25
	str	x16, [sp, #272]                 // 8-byte Folded Spill
	add	x13, x13, x4
	lsl	x16, x8, #2
	add	x14, x14, #32
	sub	x13, x13, x16
	ldr	x11, [sp, #464]                 // 8-byte Folded Reload
	str	x14, [sp, #304]                 // 8-byte Folded Spill
	ldr	x14, [sp, #496]                 // 8-byte Folded Reload
	add	x13, x25, x13
	add	x3, x18, #4
	str	x13, [sp, #376]                 // 8-byte Folded Spill
	add	x13, x17, x2
	add	x17, x18, x15, lsl #2
	add	x18, x18, x12, lsl #4
	add	x12, x13, x4
	add	x10, x3, x10, lsl #6
	mul	x11, x11, x27
	str	x10, [sp, #232]                 // 8-byte Folded Spill
	sub	x12, x12, x16
	add	x9, x9, x2
	mov	x15, x0
	lsl	x0, x21, #3
	mul	x14, x14, x27
	add	x10, x25, x12
	add	x12, x25, x13
	add	x13, x25, x9
	str	x10, [sp, #240]                 // 8-byte Folded Spill
	add	x10, x9, x4
	lsl	x9, x21, #5
	str	x26, [sp, #352]                 // 8-byte Folded Spill
	sub	x10, x10, x16
	lsl	x26, x27, #2
	sub	x27, x21, x8
	str	x0, [sp, #80]                   // 8-byte Folded Spill
	add	x10, x25, x10
	sub	x0, x0, x8, lsl #3
	str	x2, [sp, #456]                  // 8-byte Folded Spill
	add	x2, x25, x2
	str	x10, [sp, #312]                 // 8-byte Folded Spill
	add	x10, x3, x11, lsl #5
	sub	x11, x4, x16
	lsl	x16, x21, #4
	add	x14, x3, x14, lsl #3
	stp	x16, x9, [sp, #88]              // 16-byte Folded Spill
	sub	x9, x9, x8, lsl #5
	sub	x16, x16, x8, lsl #4
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	str	x14, [sp, #224]                 // 8-byte Folded Spill
	sub	x14, x27, #3
	mov	x1, x20
	str	x14, [sp, #496]                 // 8-byte Folded Spill
	sub	x14, x27, #2
	stp	x0, x9, [sp, #64]               // 16-byte Folded Spill
	add	x9, x9, #32
	str	x14, [sp, #488]                 // 8-byte Folded Spill
	sub	x14, x27, #1
	str	x9, [sp, #56]                   // 8-byte Folded Spill
	add	x9, x16, #16
	str	x14, [sp, #480]                 // 8-byte Folded Spill
	lsl	x14, x8, #2
	str	x9, [sp, #48]                   // 8-byte Folded Spill
	add	x9, x0, #8
	stp	x4, x14, [sp, #112]             // 16-byte Folded Spill
	add	x14, x2, #4
	mov	x20, xzr
	sub	x29, x27, #4
	str	x14, [sp, #400]                 // 8-byte Folded Spill
	add	x14, x23, #256
	str	x9, [sp, #40]                   // 8-byte Folded Spill
	add	x9, x11, #4
	str	x14, [sp, #472]                 // 8-byte Folded Spill
	add	x14, x15, #64
	str	x25, [sp, #344]                 // 8-byte Folded Spill
	str	x14, [sp, #464]                 // 8-byte Folded Spill
	str	x11, [sp, #104]                 // 8-byte Folded Spill
	stp	x16, x9, [sp, #24]              // 16-byte Folded Spill
	str	x1, [sp, #176]                  // 8-byte Folded Spill
	str	x15, [sp, #248]                 // 8-byte Folded Spill
	b	.LBB0_4
	.p2align	2
.LBB0_1:                                //   in Loop: Header=BB0_4 Depth=1
	str	s0, [x15, x9, lsl #2]
.LBB0_2:                                //   in Loop: Header=BB0_4 Depth=1
	bl	free
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
.LBB0_3:                                // %.backedge28
                                        //   in Loop: Header=BB0_4 Depth=1
	ldp	x14, x9, [sp, #120]             // 16-byte Folded Reload
	ldp	x10, x2, [sp, #400]             // 16-byte Folded Reload
	ldp	x20, x3, [sp, #152]             // 16-byte Folded Reload
	ldr	x17, [sp, #216]                 // 8-byte Folded Reload
	add	x10, x10, x14
	ldp	x13, x12, [sp, #184]            // 16-byte Folded Reload
	add	x3, x3, x9
	add	x2, x2, x14
	add	x17, x17, x9
	add	x12, x12, x14
	add	x13, x13, x14
	str	x10, [sp, #400]                 // 8-byte Folded Spill
	ldr	x10, [sp, #392]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #392]                 // 8-byte Folded Spill
	ldr	x10, [sp, #384]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #384]                 // 8-byte Folded Spill
	ldr	x10, [sp, #296]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #296]                 // 8-byte Folded Spill
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #288]                 // 8-byte Folded Spill
	ldr	x10, [sp, #304]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #304]                 // 8-byte Folded Spill
	ldr	x10, [sp, #376]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #376]                 // 8-byte Folded Spill
	ldp	x11, x10, [sp, #224]            // 16-byte Folded Reload
	add	x10, x10, x9
	add	x11, x11, x9
	stp	x11, x10, [sp, #224]            // 16-byte Folded Spill
	ldr	x10, [sp, #240]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #240]                 // 8-byte Folded Spill
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	add	x10, x10, x14
	str	x10, [sp, #312]                 // 8-byte Folded Spill
	ldp	x10, x18, [sp, #200]            // 16-byte Folded Reload
	add	x10, x10, x9
	add	x18, x18, x9
.LBB0_4:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_8 Depth 2
                                        //       Child Loop BB0_10 Depth 3
                                        //       Child Loop BB0_13 Depth 3
                                        //         Child Loop BB0_15 Depth 4
                                        //         Child Loop BB0_17 Depth 4
                                        //       Child Loop BB0_20 Depth 3
                                        //       Child Loop BB0_22 Depth 3
                                        //       Child Loop BB0_26 Depth 3
                                        //       Child Loop BB0_28 Depth 3
                                        //     Child Loop BB0_34 Depth 2
                                        //     Child Loop BB0_37 Depth 2
                                        //       Child Loop BB0_39 Depth 3
                                        //       Child Loop BB0_41 Depth 3
                                        //     Child Loop BB0_44 Depth 2
                                        //     Child Loop BB0_46 Depth 2
                                        //     Child Loop BB0_50 Depth 2
                                        //     Child Loop BB0_52 Depth 2
                                        //     Child Loop BB0_56 Depth 2
                                        //     Child Loop BB0_59 Depth 2
                                        //       Child Loop BB0_61 Depth 3
                                        //       Child Loop BB0_63 Depth 3
                                        //     Child Loop BB0_66 Depth 2
                                        //     Child Loop BB0_68 Depth 2
                                        //     Child Loop BB0_72 Depth 2
                                        //     Child Loop BB0_74 Depth 2
                                        //     Child Loop BB0_78 Depth 2
                                        //     Child Loop BB0_81 Depth 2
                                        //       Child Loop BB0_83 Depth 3
                                        //       Child Loop BB0_85 Depth 3
                                        //     Child Loop BB0_88 Depth 2
                                        //     Child Loop BB0_90 Depth 2
                                        //     Child Loop BB0_94 Depth 2
                                        //     Child Loop BB0_96 Depth 2
                                        //     Child Loop BB0_100 Depth 2
                                        //     Child Loop BB0_103 Depth 2
                                        //       Child Loop BB0_105 Depth 3
                                        //       Child Loop BB0_107 Depth 3
                                        //     Child Loop BB0_110 Depth 2
                                        //     Child Loop BB0_112 Depth 2
                                        //     Child Loop BB0_116 Depth 2
                                        //     Child Loop BB0_118 Depth 2
	ldr	x9, [sp, #144]                  // 8-byte Folded Reload
	cmp	x20, x9
	b.ge	.LBB0_119
// %bb.5:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x0, [sp, #416]                  // 8-byte Folded Reload
	ldr	x30, [sp, #280]                 // 8-byte Folded Reload
	add	x9, x20, #1
	stp	x10, x18, [sp, #200]            // 16-byte Folded Spill
	mov	x10, xzr
	str	x2, [sp, #408]                  // 8-byte Folded Spill
	stp	x13, x12, [sp, #184]            // 16-byte Folded Spill
	str	x17, [sp, #216]                 // 8-byte Folded Spill
	stp	x9, x3, [sp, #152]              // 16-byte Folded Spill
	b	.LBB0_8
	.p2align	2
.LBB0_6:                                //   in Loop: Header=BB0_8 Depth=2
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	stp	q3, q2, [x10]
	stp	q1, q0, [x10, #32]
.LBB0_7:                                // %.backedge
                                        //   in Loop: Header=BB0_8 Depth=2
	ldr	x9, [sp, #320]                  // 8-byte Folded Reload
	ldp	x10, x3, [sp, #424]             // 16-byte Folded Reload
	add	x3, x3, x9
.LBB0_8:                                //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_10 Depth 3
                                        //       Child Loop BB0_13 Depth 3
                                        //         Child Loop BB0_15 Depth 4
                                        //         Child Loop BB0_17 Depth 4
                                        //       Child Loop BB0_20 Depth 3
                                        //       Child Loop BB0_22 Depth 3
                                        //       Child Loop BB0_26 Depth 3
                                        //       Child Loop BB0_28 Depth 3
	ldp	x11, x9, [sp, #344]             // 16-byte Folded Reload
	ldr	x16, [sp, #400]                 // 8-byte Folded Reload
	cmp	x10, x0
	add	x25, x11, x9, lsl #2
	b.ge	.LBB0_29
// %bb.9:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x9, [sp, #360]                  // 8-byte Folded Reload
	mov	x13, xzr
	mul	x12, x20, x9
	add	x14, x12, x10
	ldp	x11, x9, [sp, #328]             // 16-byte Folded Reload
	add	x11, x11, x9, lsl #2
	add	x15, x14, x28
	add	x15, x11, x15, lsl #2
	add	x9, x11, x14, lsl #2
	ldp	q3, q1, [x15, #32]
	ldp	q5, q4, [x15]
	lsl	x15, x28, #1
	ldp	q16, q6, [x9, #32]
	ldp	q2, q0, [x9]
	add	x9, x14, x15
	add	x15, x15, x28
	add	x14, x14, x15
	add	x9, x11, x9, lsl #2
	mov	x15, x3
	add	x14, x11, x14, lsl #2
	ldp	q17, q7, [x9, #32]
	ldp	q20, q18, [x9]
	add	x9, x10, #16
	str	x9, [sp, #424]                  // 8-byte Folded Spill
	ldp	q21, q19, [x14, #32]
	ldp	q23, q22, [x14]
	mov	x14, x16
	cmp	xzr, x21
	b.ge	.LBB0_11
	.p2align	2
.LBB0_10:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x16, x14, x22
	prfm	pldl1keep, [x14]
	ldur	s27, [x14, #-4]
	add	x14, x14, #4
	add	x17, x16, x22
	prfm	pldl1keep, [x16]
	ldur	s28, [x16, #-4]
	add	x16, x15, x26
	add	x18, x17, x22
	prfm	pldl1keep, [x17]
	ldur	s26, [x17, #-4]
	sub	x17, x16, #4
	prfm	pldl1keep, [x18]
	ldur	s25, [x18, #-4]
	add	x18, x16, x26
	prfm	pldl1keep, [x15]
	ldur	s24, [x15, #-4]
	add	x15, x15, #4
	prfm	pldl1keep, [x16]
	sub	x16, x18, #4
	prfm	pldl1keep, [x18]
	ld1	{ v24.s }[1], [x17]
	add	x17, x18, x26
	prfm	pldl1keep, [x17]
	ld1	{ v24.s }[2], [x16]
	add	x16, x17, x26
	sub	x17, x17, #4
	prfm	pldl1keep, [x16]
	ldur	s29, [x16, #-4]
	add	x16, x16, x26
	sub	x18, x16, #4
	add	x0, x16, x26
	ld1	{ v24.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v29.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x26
	prfm	pldl1keep, [x17]
	fmla	v2.4s, v24.4s, v27.s[0]
	ld1	{ v29.s }[2], [x16]
	add	x16, x17, x26
	sub	x17, x17, #4
	fmla	v5.4s, v24.4s, v28.s[0]
	fmla	v20.4s, v24.4s, v26.s[0]
	fmla	v23.4s, v24.4s, v25.s[0]
	prfm	pldl1keep, [x16]
	ldur	s30, [x16, #-4]
	add	x16, x16, x26
	sub	x18, x16, #4
	add	x0, x16, x26
	ld1	{ v29.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v30.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x26
	prfm	pldl1keep, [x17]
	ld1	{ v30.s }[2], [x16]
	add	x16, x17, x26
	sub	x17, x17, #4
	fmla	v0.4s, v29.4s, v27.s[0]
	fmla	v4.4s, v29.4s, v28.s[0]
	fmla	v18.4s, v29.4s, v26.s[0]
	fmla	v22.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x16]
	ldur	s31, [x16, #-4]
	add	x16, x16, x26
	sub	x18, x16, #4
	add	x0, x16, x26
	ld1	{ v30.s }[3], [x17]
	prfm	pldl1keep, [x16]
	prfm	pldl1keep, [x0]
	ld1	{ v31.s }[1], [x18]
	sub	x16, x0, #4
	add	x17, x0, x26
	prfm	pldl1keep, [x17]
	fmla	v16.4s, v30.4s, v27.s[0]
	ld1	{ v31.s }[2], [x16]
	sub	x16, x17, #4
	fmla	v3.4s, v30.4s, v28.s[0]
	fmla	v17.4s, v30.4s, v26.s[0]
	fmla	v21.4s, v30.4s, v25.s[0]
	ld1	{ v31.s }[3], [x16]
	add	x16, x23, x13, lsl #6
	add	x13, x13, #1
	stp	q24, q29, [x16]
	fmla	v6.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v31.4s, v28.s[0]
	fmla	v7.4s, v31.4s, v26.s[0]
	fmla	v19.4s, v31.4s, v25.s[0]
	stp	q30, q31, [x16, #32]
	cmp	x13, x21
	b.lt	.LBB0_10
.LBB0_11:                               // %.preheader
                                        //   in Loop: Header=BB0_8 Depth=2
	ldp	x13, x14, [sp, #384]            // 16-byte Folded Reload
	str	x3, [sp, #432]                  // 8-byte Folded Spill
	mov	x1, xzr
	mov	w17, #1                         // =0x1
	mov	w18, #2                         // =0x2
	mov	w16, #3                         // =0x3
	mov	w15, #4                         // =0x4
	b	.LBB0_13
	.p2align	2
.LBB0_12:                               // %.loopexit
                                        //   in Loop: Header=BB0_13 Depth=3
	add	x14, x14, x24
	add	x13, x13, x24
	mov	x1, x15
	mov	x15, x0
.LBB0_13:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB0_15 Depth 4
                                        //         Child Loop BB0_17 Depth 4
	madd	x0, x1, x28, x12
	ldr	x9, [sp, #504]                  // 8-byte Folded Reload
	add	x0, x0, x10
	madd	x17, x17, x28, x12
	madd	x18, x18, x28, x12
	madd	x16, x16, x28, x12
	add	x17, x17, x10
	add	x18, x18, x10
	add	x16, x16, x10
	cmp	x15, x9
	add	x0, x11, x0, lsl #2
	add	x17, x11, x17, lsl #2
	stp	q2, q0, [x0]
	add	x18, x11, x18, lsl #2
	add	x16, x11, x16, lsl #2
	stp	q16, q6, [x0, #32]
	stp	q5, q4, [x17]
	stp	q3, q1, [x17, #32]
	stp	q20, q18, [x18]
	stp	q17, q7, [x18, #32]
	stp	q23, q22, [x16]
	stp	q21, q19, [x16, #32]
	b.ge	.LBB0_18
// %bb.14:                              //   in Loop: Header=BB0_13 Depth=3
	add	x17, x15, #1
	add	x16, x15, #3
	mul	x2, x20, x8
	add	x18, x15, #2
	madd	x3, x17, x28, x12
	ldp	q28, q29, [x23, #32]
	mov	x1, xzr
	madd	x0, x15, x28, x12
	ldp	q30, q31, [x23]
	add	x0, x0, x10
	add	x3, x3, x10
	add	x0, x11, x0, lsl #2
	add	x3, x11, x3, lsl #2
	ldp	q16, q6, [x0, #32]
	ldp	q2, q0, [x0]
	madd	x0, x18, x28, x12
	ldp	q3, q1, [x3, #32]
	add	x0, x0, x10
	ldp	q5, q4, [x3]
	madd	x3, x16, x28, x12
	add	x3, x3, x10
	add	x0, x11, x0, lsl #2
	add	x3, x11, x3, lsl #2
	ldp	q17, q7, [x0, #32]
	ldp	q20, q18, [x0]
	add	x0, x15, #4
	ldp	q21, q19, [x3, #32]
	ldp	q23, q22, [x3]
	madd	x3, x15, x19, x2
	lsl	x3, x3, #2
	ldr	q27, [x25, x3]
	madd	x3, x17, x19, x2
	lsl	x3, x3, #2
	ldr	q26, [x25, x3]
	madd	x3, x18, x19, x2
	madd	x2, x16, x19, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q25, [x25, x3]
	ldr	q24, [x25, x2]
	ldr	x3, [sp, #472]                  // 8-byte Folded Reload
	mov	x2, x14
	fmla	v6.4s, v29.4s, v27.s[0]
	cmp	xzr, x29
	b.ge	.LBB0_16
	.p2align	2
.LBB0_15:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        //       Parent Loop BB0_13 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	x7, x3, #64
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v2.4s, v30.4s, v27.s[0]
	add	x6, x3, #128
	prfm	pldl1keep, [x7]
	ldp	q9, q8, [x3, #-160]
	fmla	v0.4s, v31.4s, v27.s[0]
	ldp	q12, q15, [x3, #-192]
	fmla	v1.4s, v29.4s, v26.s[0]
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v4.4s, v31.4s, v26.s[0]
	fmla	v5.4s, v30.4s, v26.s[0]
	fmla	v7.4s, v29.4s, v25.s[0]
	prfm	pldl1keep, [x6]
	fmla	v17.4s, v28.4s, v25.s[0]
	fmla	v18.4s, v31.4s, v25.s[0]
	ldp	q11, q10, [x3, #-128]
	fmla	v20.4s, v30.4s, v25.s[0]
	fmla	v19.4s, v29.4s, v24.s[0]
	ldp	q13, q14, [x3, #-96]
	fmla	v21.4s, v28.4s, v24.s[0]
	fmla	v22.4s, v31.4s, v24.s[0]
	add	x5, x3, #192
	prfm	pldl1keep, [x5]
	fmla	v23.4s, v30.4s, v24.s[0]
	fmla	v0.4s, v15.4s, v27.s[1]
	add	x4, x3, #256
	add	x1, x1, #4
	fmla	v2.4s, v12.4s, v27.s[1]
	fmla	v16.4s, v9.4s, v27.s[1]
	fmla	v6.4s, v8.4s, v27.s[1]
	fmla	v5.4s, v12.4s, v26.s[1]
	fmla	v4.4s, v15.4s, v26.s[1]
	fmla	v3.4s, v9.4s, v26.s[1]
	fmla	v1.4s, v8.4s, v26.s[1]
	fmla	v20.4s, v12.4s, v25.s[1]
	fmla	v18.4s, v15.4s, v25.s[1]
	fmla	v17.4s, v9.4s, v25.s[1]
	fmla	v7.4s, v8.4s, v25.s[1]
	fmla	v23.4s, v12.4s, v24.s[1]
	fmla	v22.4s, v15.4s, v24.s[1]
	ldp	q15, q12, [x3, #-64]
	fmla	v21.4s, v9.4s, v24.s[1]
	fmla	v19.4s, v8.4s, v24.s[1]
	ldp	q9, q8, [x3, #-32]
	prfm	pldl1keep, [x4]
	ldp	q28, q29, [x3, #32]
	ldp	q30, q31, [x3]
	add	x3, x2, x22
	prfm	pldl1keep, [x2]
	fmla	v6.4s, v14.4s, v27.s[2]
	fmla	v16.4s, v13.4s, v27.s[2]
	fmla	v2.4s, v11.4s, v27.s[2]
	fmla	v0.4s, v10.4s, v27.s[2]
	fmla	v1.4s, v14.4s, v26.s[2]
	fmla	v3.4s, v13.4s, v26.s[2]
	fmla	v4.4s, v10.4s, v26.s[2]
	fmla	v5.4s, v11.4s, v26.s[2]
	fmla	v7.4s, v14.4s, v25.s[2]
	fmla	v17.4s, v13.4s, v25.s[2]
	fmla	v18.4s, v10.4s, v25.s[2]
	fmla	v20.4s, v11.4s, v25.s[2]
	fmla	v19.4s, v14.4s, v24.s[2]
	fmla	v21.4s, v13.4s, v24.s[2]
	fmla	v22.4s, v10.4s, v24.s[2]
	fmla	v23.4s, v11.4s, v24.s[2]
	fmla	v0.4s, v12.4s, v27.s[3]
	fmla	v2.4s, v15.4s, v27.s[3]
	fmla	v16.4s, v9.4s, v27.s[3]
	fmla	v6.4s, v8.4s, v27.s[3]
	ldur	q27, [x2, #-16]
	prfm	pldl1keep, [x3]
	add	x2, x2, #16
	fmla	v5.4s, v15.4s, v26.s[3]
	fmla	v4.4s, v12.4s, v26.s[3]
	fmla	v3.4s, v9.4s, v26.s[3]
	fmla	v1.4s, v8.4s, v26.s[3]
	ldur	q26, [x3, #-16]
	add	x3, x3, x22
	add	x5, x3, x22
	prfm	pldl1keep, [x3]
	fmla	v20.4s, v15.4s, v25.s[3]
	fmla	v18.4s, v12.4s, v25.s[3]
	fmla	v17.4s, v9.4s, v25.s[3]
	fmla	v7.4s, v8.4s, v25.s[3]
	ldur	q25, [x3, #-16]
	prfm	pldl1keep, [x5]
	mov	x3, x4
	fmla	v23.4s, v15.4s, v24.s[3]
	fmla	v22.4s, v12.4s, v24.s[3]
	fmla	v21.4s, v9.4s, v24.s[3]
	fmla	v19.4s, v8.4s, v24.s[3]
	ldur	q24, [x5, #-16]
	fmla	v6.4s, v29.4s, v27.s[0]
	cmp	x1, x29
	b.lt	.LBB0_15
.LBB0_16:                               //   in Loop: Header=BB0_13 Depth=3
	ldr	x9, [sp, #496]                  // 8-byte Folded Reload
	fmla	v16.4s, v28.4s, v27.s[0]
	fmla	v2.4s, v30.4s, v27.s[0]
	mov	x2, x13
	fmla	v0.4s, v31.4s, v27.s[0]
	fmla	v1.4s, v29.4s, v26.s[0]
	mov	x3, x27
	add	x1, x23, x9, lsl #6
	ldr	x9, [sp, #488]                  // 8-byte Folded Reload
	fmla	v3.4s, v28.4s, v26.s[0]
	fmla	v4.4s, v31.4s, v26.s[0]
	fmla	v5.4s, v30.4s, v26.s[0]
	fmla	v7.4s, v29.4s, v25.s[0]
	fmla	v17.4s, v28.4s, v25.s[0]
	fmla	v18.4s, v31.4s, v25.s[0]
	fmla	v20.4s, v30.4s, v25.s[0]
	ldp	q10, q9, [x1, #32]
	ldp	q11, q12, [x1]
	fmla	v19.4s, v29.4s, v24.s[0]
	fmla	v21.4s, v28.4s, v24.s[0]
	fmla	v22.4s, v31.4s, v24.s[0]
	add	x1, x23, x9, lsl #6
	fmla	v23.4s, v30.4s, v24.s[0]
	ldr	x9, [sp, #480]                  // 8-byte Folded Reload
	ldp	q29, q30, [x1]
	ldp	q8, q13, [x1, #32]
	fmla	v0.4s, v12.4s, v27.s[1]
	fmla	v6.4s, v9.4s, v27.s[1]
	fmla	v4.4s, v12.4s, v26.s[1]
	fmla	v1.4s, v9.4s, v26.s[1]
	fmla	v18.4s, v12.4s, v25.s[1]
	fmla	v7.4s, v9.4s, v25.s[1]
	fmla	v22.4s, v12.4s, v24.s[1]
	add	x1, x23, x9, lsl #6
	fmla	v2.4s, v11.4s, v27.s[1]
	fmla	v16.4s, v10.4s, v27.s[1]
	fmla	v5.4s, v11.4s, v26.s[1]
	fmla	v3.4s, v10.4s, v26.s[1]
	ldp	q31, q28, [x1, #32]
	fmla	v20.4s, v11.4s, v25.s[1]
	fmla	v17.4s, v10.4s, v25.s[1]
	fmla	v23.4s, v11.4s, v24.s[1]
	fmla	v21.4s, v10.4s, v24.s[1]
	fmla	v19.4s, v9.4s, v24.s[1]
	ldp	q9, q10, [x1]
	ldr	x1, [sp, #464]                  // 8-byte Folded Reload
	fmla	v6.4s, v13.4s, v27.s[2]
	fmla	v0.4s, v30.4s, v27.s[2]
	fmla	v1.4s, v13.4s, v26.s[2]
	fmla	v4.4s, v30.4s, v26.s[2]
	fmla	v7.4s, v13.4s, v25.s[2]
	fmla	v18.4s, v30.4s, v25.s[2]
	fmla	v19.4s, v13.4s, v24.s[2]
	fmla	v22.4s, v30.4s, v24.s[2]
	fmla	v16.4s, v8.4s, v27.s[2]
	fmla	v2.4s, v29.4s, v27.s[2]
	fmla	v3.4s, v8.4s, v26.s[2]
	fmla	v5.4s, v29.4s, v26.s[2]
	fmla	v17.4s, v8.4s, v25.s[2]
	fmla	v20.4s, v29.4s, v25.s[2]
	fmla	v21.4s, v8.4s, v24.s[2]
	fmla	v23.4s, v29.4s, v24.s[2]
	fmla	v0.4s, v10.4s, v27.s[3]
	fmla	v6.4s, v28.4s, v27.s[3]
	fmla	v4.4s, v10.4s, v26.s[3]
	fmla	v1.4s, v28.4s, v26.s[3]
	fmla	v18.4s, v10.4s, v25.s[3]
	fmla	v7.4s, v28.4s, v25.s[3]
	fmla	v22.4s, v10.4s, v24.s[3]
	fmla	v19.4s, v28.4s, v24.s[3]
	fmla	v2.4s, v9.4s, v27.s[3]
	fmla	v16.4s, v31.4s, v27.s[3]
	fmla	v5.4s, v9.4s, v26.s[3]
	fmla	v3.4s, v31.4s, v26.s[3]
	fmla	v20.4s, v9.4s, v25.s[3]
	fmla	v17.4s, v31.4s, v25.s[3]
	fmla	v23.4s, v9.4s, v24.s[3]
	fmla	v21.4s, v31.4s, v24.s[3]
	cmp	x27, x21
	b.ge	.LBB0_12
	.p2align	2
.LBB0_17:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        //       Parent Loop BB0_13 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	prfm	pldl1keep, [x1]
	ldp	q24, q25, [x1, #-64]
	add	x4, x2, x22
	ldp	q26, q27, [x1, #-32]
	prfm	pldl1keep, [x2]
	add	x3, x3, #1
	ldur	s28, [x2, #-4]
	prfm	pldl1keep, [x4]
	add	x2, x2, #4
	add	x1, x1, #64
	ldur	s29, [x4, #-4]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	fmla	v6.4s, v27.4s, v28.s[0]
	ldur	s30, [x4, #-4]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	fmla	v16.4s, v26.4s, v28.s[0]
	fmla	v0.4s, v25.4s, v28.s[0]
	fmla	v2.4s, v24.4s, v28.s[0]
	ldur	s28, [x4, #-4]
	fmla	v4.4s, v25.4s, v29.s[0]
	fmla	v5.4s, v24.4s, v29.s[0]
	fmla	v3.4s, v26.4s, v29.s[0]
	fmla	v1.4s, v27.4s, v29.s[0]
	fmla	v20.4s, v24.4s, v30.s[0]
	fmla	v18.4s, v25.4s, v30.s[0]
	fmla	v17.4s, v26.4s, v30.s[0]
	fmla	v7.4s, v27.4s, v30.s[0]
	fmla	v23.4s, v24.4s, v28.s[0]
	fmla	v22.4s, v25.4s, v28.s[0]
	fmla	v21.4s, v26.4s, v28.s[0]
	fmla	v19.4s, v27.4s, v28.s[0]
	cmp	x3, x21
	b.lt	.LBB0_17
	b	.LBB0_12
	.p2align	2
.LBB0_18:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x9, [sp, #504]                  // 8-byte Folded Reload
	ldr	x13, [sp, #440]                 // 8-byte Folded Reload
	cmp	x9, x13
	ldr	x9, [sp, #496]                  // 8-byte Folded Reload
	add	x15, x23, x9, lsl #6
	ldr	x9, [sp, #488]                  // 8-byte Folded Reload
	add	x14, x23, x9, lsl #6
	ldr	x9, [sp, #480]                  // 8-byte Folded Reload
	add	x13, x23, x9, lsl #6
	b.ge	.LBB0_24
// %bb.19:                              //   in Loop: Header=BB0_8 Depth=2
	ldr	x9, [sp, #504]                  // 8-byte Folded Reload
	add	x17, x12, x10
	ldp	q18, q19, [x23, #32]
	ldp	q20, q21, [x23]
	mov	x18, xzr
	add	x0, x9, #1
	mul	x16, x9, x28
	mul	x2, x9, x19
	madd	x1, x0, x28, x12
	add	x16, x17, x16
	add	x17, x11, x16, lsl #2
	add	x16, x1, x10
	mul	x1, x20, x8
	madd	x0, x0, x19, x1
	add	x16, x11, x16, lsl #2
	ldp	q2, q0, [x17, #32]
	add	x2, x1, x2
	ldp	q6, q4, [x17]
	ldp	q3, q1, [x16, #32]
	ldp	q7, q5, [x16]
	lsl	x2, x2, #2
	lsl	x0, x0, #2
	ldr	q17, [x25, x2]
	ldr	q16, [x25, x0]
	ldp	x0, x1, [sp, #288]              // 16-byte Folded Reload
	ldr	x2, [sp, #472]                  // 8-byte Folded Reload
	cmp	xzr, x29
	b.ge	.LBB0_21
	.p2align	2
.LBB0_20:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x8, [sp, #456]                  // 8-byte Folded Reload
	fmla	v0.4s, v19.4s, v17.s[0]
	fmla	v2.4s, v18.4s, v17.s[0]
	add	x9, x2, #128
	fmla	v6.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v17.s[0]
	add	x30, x2, #192
	add	x3, x2, #256
	fmla	v1.4s, v19.4s, v16.s[0]
	fmla	v3.4s, v18.4s, v16.s[0]
	add	x18, x18, #4
	add	x4, x1, x8
	add	x6, x0, x8
	add	x8, x2, #64
	fmla	v5.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	add	x1, x1, #16
	add	x0, x0, #16
	prfm	pldl1keep, [x8]
	add	x5, x4, #32
	ldp	q23, q22, [x2, #-160]
	ldp	q24, q25, [x2, #-192]
	prfm	pldl1keep, [x9]
	ldp	q19, q18, [x2, #-128]
	add	x7, x6, #32
	ldp	q20, q21, [x2, #-96]
	prfm	pldl1keep, [x30]
	fmla	v4.4s, v25.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	fmla	v5.4s, v25.4s, v16.s[1]
	fmla	v1.4s, v22.4s, v16.s[1]
	fmla	v6.4s, v24.4s, v17.s[1]
	fmla	v2.4s, v23.4s, v17.s[1]
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v3.4s, v23.4s, v16.s[1]
	fmla	v0.4s, v21.4s, v17.s[2]
	ldp	q23, q22, [x2, #-32]
	ldp	q24, q25, [x2, #-64]
	fmla	v4.4s, v18.4s, v17.s[2]
	fmla	v1.4s, v21.4s, v16.s[2]
	fmla	v5.4s, v18.4s, v16.s[2]
	prfm	pldl1keep, [x7]
	fmla	v2.4s, v20.4s, v17.s[2]
	fmla	v6.4s, v19.4s, v17.s[2]
	fmla	v3.4s, v20.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	fmla	v4.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v5.4s, v25.4s, v16.s[3]
	fmla	v1.4s, v22.4s, v16.s[3]
	fmla	v6.4s, v24.4s, v17.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	ldr	q17, [x6, #16]
	prfm	pldl1keep, [x5]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v3.4s, v23.4s, v16.s[3]
	ldr	q16, [x4, #16]
	prfm	pldl1keep, [x3]
	ldp	q18, q19, [x2, #32]
	ldp	q20, q21, [x2]
	mov	x2, x3
	cmp	x18, x29
	b.lt	.LBB0_20
.LBB0_21:                               //   in Loop: Header=BB0_8 Depth=2
	ldp	q23, q22, [x15, #32]
	ldp	q24, q25, [x15]
	fmla	v0.4s, v19.4s, v17.s[0]
	fmla	v2.4s, v18.4s, v17.s[0]
	fmla	v6.4s, v20.4s, v17.s[0]
	fmla	v4.4s, v21.4s, v17.s[0]
	fmla	v1.4s, v19.4s, v16.s[0]
	fmla	v3.4s, v18.4s, v16.s[0]
	ldp	q19, q18, [x14]
	fmla	v5.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x14, #32]
	fmla	v4.4s, v25.4s, v17.s[1]
	fmla	v0.4s, v22.4s, v17.s[1]
	ldr	x18, [sp, #464]                 // 8-byte Folded Reload
	ldr	x0, [sp, #408]                  // 8-byte Folded Reload
	fmla	v6.4s, v24.4s, v17.s[1]
	fmla	v2.4s, v23.4s, v17.s[1]
	ldr	x30, [sp, #280]                 // 8-byte Folded Reload
	mov	x1, x27
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v5.4s, v25.4s, v16.s[1]
	ldp	q24, q25, [x13]
	fmla	v3.4s, v23.4s, v16.s[1]
	fmla	v1.4s, v22.4s, v16.s[1]
	ldp	q23, q22, [x13, #32]
	fmla	v0.4s, v21.4s, v17.s[2]
	fmla	v4.4s, v18.4s, v17.s[2]
	ldp	x3, x2, [sp, #256]              // 16-byte Folded Reload
	fmla	v2.4s, v20.4s, v17.s[2]
	fmla	v6.4s, v19.4s, v17.s[2]
	fmla	v1.4s, v21.4s, v16.s[2]
	fmla	v3.4s, v20.4s, v16.s[2]
	fmla	v5.4s, v18.4s, v16.s[2]
	fmla	v7.4s, v19.4s, v16.s[2]
	fmla	v4.4s, v25.4s, v17.s[3]
	fmla	v0.4s, v22.4s, v17.s[3]
	fmla	v5.4s, v25.4s, v16.s[3]
	fmla	v1.4s, v22.4s, v16.s[3]
	fmla	v6.4s, v24.4s, v17.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v24.4s, v16.s[3]
	fmla	v3.4s, v23.4s, v16.s[3]
	cmp	x27, x21
	b.ge	.LBB0_23
	.p2align	2
.LBB0_22:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x8, x0, x3
	add	x9, x0, x2
	prfm	pldl1keep, [x18]
	add	x1, x1, #1
	add	x8, x8, #4
	add	x9, x9, #4
	ldp	q16, q17, [x18, #-64]
	ldp	q18, q19, [x18, #-32]
	prfm	pldl1keep, [x9]
	add	x18, x18, #64
	ldr	s20, [x0, x2]
	prfm	pldl1keep, [x8]
	fmla	v0.4s, v19.4s, v20.s[0]
	ldr	s21, [x0, x3]
	fmla	v2.4s, v18.4s, v20.s[0]
	fmla	v4.4s, v17.4s, v20.s[0]
	fmla	v6.4s, v16.4s, v20.s[0]
	fmla	v5.4s, v17.4s, v21.s[0]
	fmla	v7.4s, v16.4s, v21.s[0]
	fmla	v3.4s, v18.4s, v21.s[0]
	fmla	v1.4s, v19.4s, v21.s[0]
	add	x0, x0, #4
	cmp	x1, x21
	b.lt	.LBB0_22
.LBB0_23:                               //   in Loop: Header=BB0_8 Depth=2
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	stp	q6, q4, [x17]
	stp	q2, q0, [x17, #32]
	stp	q7, q5, [x16]
	stp	q3, q1, [x16, #32]
.LBB0_24:                               //   in Loop: Header=BB0_8 Depth=2
	ldp	x9, x1, [sp, #368]              // 16-byte Folded Reload
	ldr	x16, [sp, #440]                 // 8-byte Folded Reload
	cmp	x16, x9
	ldr	x0, [sp, #416]                  // 8-byte Folded Reload
	b.ge	.LBB0_7
// %bb.25:                              //   in Loop: Header=BB0_8 Depth=2
	mov	x17, x8
	add	x8, x12, x10
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	ldr	x2, [sp, #408]                  // 8-byte Folded Reload
	ldp	q7, q16, [x23, #32]
	ldp	q6, q5, [x23]
	mov	x16, xzr
	mul	x9, x12, x28
	add	x8, x8, x9
	add	x10, x11, x8, lsl #2
	mul	x8, x12, x19
	ldr	x11, [sp, #304]                 // 8-byte Folded Reload
	ldr	x12, [sp, #472]                 // 8-byte Folded Reload
	madd	x8, x20, x17, x8
	ldp	q1, q0, [x10, #32]
	ldp	q3, q2, [x10]
	lsl	x8, x8, #2
	ldr	q4, [x25, x8]
	cmp	xzr, x29
	b.ge	.LBB0_27
	.p2align	2
.LBB0_26:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	cmp	x16, x29
	b.lt	.LBB0_26
.LBB0_27:                               //   in Loop: Header=BB0_8 Depth=2
	ldp	q18, q17, [x15, #32]
	ldp	q19, q20, [x15]
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	fmla	v2.4s, v5.4s, v4.s[0]
	ldp	q6, q5, [x14]
	ldp	q7, q16, [x14, #32]
	ldr	x15, [sp, #248]                 // 8-byte Folded Reload
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
	ldr	x13, [sp, #272]                 // 8-byte Folded Reload
	fmla	v1.4s, v7.4s, v4.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v2.4s, v20.4s, v4.s[3]
	fmla	v0.4s, v17.4s, v4.s[3]
	fmla	v3.4s, v19.4s, v4.s[3]
	fmla	v1.4s, v18.4s, v4.s[3]
	add	x8, x27, xzr
	cmp	x8, x21
	b.ge	.LBB0_6
	.p2align	2
.LBB0_28:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_8 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x14, x15, x11, lsl #6
	add	x8, x2, x13
	add	x9, x15, x12
	add	x13, x13, #4
	prfm	pldl1keep, [x9]
	add	x12, x12, #64
	ldp	q4, q5, [x14]
	ldp	q6, q7, [x14, #32]
	prfm	pldl1keep, [x8]
	ldr	s16, [x1, x11, lsl #2]
	add	x11, x11, #1
	fmla	v0.4s, v7.4s, v16.s[0]
	fmla	v1.4s, v6.4s, v16.s[0]
	fmla	v2.4s, v5.4s, v16.s[0]
	fmla	v3.4s, v4.4s, v16.s[0]
	add	x8, x27, x11
	cmp	x8, x21
	b.lt	.LBB0_28
	b	.LBB0_6
	.p2align	2
.LBB0_29:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	x10, x9, [sp, #328]             // 16-byte Folded Reload
	cmp	x0, x30
	add	x11, x10, x9, lsl #2
	lsl	x9, x28, #1
	stp	x9, x11, [sp, #424]             // 16-byte Folded Spill
	b.lt	.LBB0_33
// %bb.30:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x1, [sp, #176]                  // 8-byte Folded Reload
	cmp	x30, x1
	b.lt	.LBB0_55
.LBB0_31:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x10, [sp, #168]                 // 8-byte Folded Reload
	cmp	x1, x10
	b.lt	.LBB0_77
.LBB0_32:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x9, [sp, #136]                  // 8-byte Folded Reload
	cmp	x10, x9
	b.ge	.LBB0_3
	b	.LBB0_99
	.p2align	2
.LBB0_33:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #96]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #360]                  // 8-byte Folded Reload
	ldr	x6, [sp, #432]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldr	x15, [sp, #232]                 // 8-byte Folded Reload
	ldr	x16, [sp, #400]                 // 8-byte Folded Reload
	mul	x9, x20, x8
	ldp	x8, x13, [sp, #416]             // 16-byte Folded Reload
	add	x8, x9, x8
	add	x12, x6, x8, lsl #2
	ldp	q3, q2, [x12]
	add	x12, x8, x28
	add	x12, x6, x12, lsl #2
	ldp	q1, q0, [x12]
	add	x12, x8, x13
	add	x12, x6, x12, lsl #2
	ldp	q5, q4, [x12]
	add	x12, x13, x28
	add	x8, x8, x12
	add	x8, x6, x8, lsl #2
	ldp	q7, q6, [x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x21
	b.ge	.LBB0_35
	.p2align	2
.LBB0_34:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x16, x10
	add	x12, x15, x10
	add	x10, x10, #4
	prfm	pldl1keep, [x13]
	ldur	s16, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s17, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s18, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s20, [x13, #-4]
	prfm	pldl1keep, [x12]
	ldur	s19, [x12, #-4]
	add	x12, x12, x26
	sub	x13, x12, #4
	prfm	pldl1keep, [x12]
	add	x12, x12, x26
	prfm	pldl1keep, [x12]
	sub	x14, x12, #4
	add	x12, x12, x26
	ld1	{ v19.s }[1], [x13]
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x26
	ld1	{ v19.s }[2], [x14]
	prfm	pldl1keep, [x12]
	ldur	s21, [x12, #-4]
	add	x12, x12, x26
	ld1	{ v19.s }[3], [x13]
	prfm	pldl1keep, [x12]
	sub	x13, x12, #4
	add	x12, x12, x26
	prfm	pldl1keep, [x12]
	ld1	{ v21.s }[1], [x13]
	sub	x14, x12, #4
	add	x12, x12, x26
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
	cmp	x11, x21
	b.lt	.LBB0_34
.LBB0_35:                               // %.preheader27
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x12, [sp, #56]                  // 8-byte Folded Reload
	ldp	x15, x16, [sp, #384]            // 16-byte Folded Reload
	mov	x11, xzr
	add	x10, x8, #128
	mov	w18, #1                         // =0x1
	mov	w2, #2                          // =0x2
	mov	w1, #3                          // =0x3
	mov	w17, #4                         // =0x4
	add	x14, x8, x12
	b	.LBB0_37
	.p2align	2
.LBB0_36:                               // %.loopexit23
                                        //   in Loop: Header=BB0_37 Depth=2
	add	x16, x16, x24
	add	x15, x15, x24
	mov	x11, x17
	mov	x17, x3
.LBB0_37:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_39 Depth 3
                                        //       Child Loop BB0_41 Depth 3
	madd	x11, x11, x28, x9
	ldr	x7, [sp, #416]                  // 8-byte Folded Reload
	add	x11, x11, x7
	madd	x12, x18, x28, x9
	madd	x13, x2, x28, x9
	add	x12, x12, x7
	add	x13, x13, x7
	add	x11, x6, x11, lsl #2
	add	x12, x6, x12, lsl #2
	stp	q3, q2, [x11]
	madd	x11, x1, x28, x9
	stp	q1, q0, [x12]
	add	x12, x6, x13, lsl #2
	add	x11, x11, x7
	stp	q5, q4, [x12]
	add	x11, x6, x11, lsl #2
	stp	q7, q6, [x11]
	ldr	x11, [sp, #504]                 // 8-byte Folded Reload
	cmp	x17, x11
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	add	x13, x8, x11, lsl #5
	ldr	x11, [sp, #488]                 // 8-byte Folded Reload
	add	x12, x8, x11, lsl #5
	ldr	x11, [sp, #480]                 // 8-byte Folded Reload
	add	x11, x8, x11, lsl #5
	b.ge	.LBB0_42
// %bb.38:                              //   in Loop: Header=BB0_37 Depth=2
	madd	x5, x17, x28, x9
	add	x18, x17, #1
	mov	x30, x6
	add	x2, x17, #2
	madd	x6, x18, x28, x9
	add	x1, x17, #3
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
	add	x5, x30, x5, lsl #2
	add	x6, x6, x7
	add	x6, x30, x6, lsl #2
	ldp	q5, q4, [x5]
	ldr	x5, [sp, #448]                  // 8-byte Folded Reload
	mul	x5, x20, x5
	ldp	q7, q6, [x6]
	madd	x6, x17, x19, x5
	lsl	x6, x6, #2
	ldr	q19, [x25, x6]
	madd	x6, x18, x19, x5
	lsl	x6, x6, #2
	ldr	q18, [x25, x6]
	madd	x6, x2, x19, x5
	madd	x5, x1, x19, x5
	lsl	x6, x6, #2
	lsl	x5, x5, #2
	ldr	q17, [x25, x6]
	ldr	q16, [x25, x5]
	mov	x5, x10
	mov	x6, x16
	cmp	xzr, x29
	b.ge	.LBB0_40
	.p2align	2
.LBB0_39:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
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
	add	x7, x6, x22
	add	x30, x7, x22
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
	add	x7, x30, x22
	prfm	pldl1keep, [x30]
	add	x6, x6, #16
	fmla	v5.4s, v22.4s, v17.s[3]
	ldur	q17, [x30, #-16]
	prfm	pldl1keep, [x7]
	fmla	v7.4s, v22.4s, v16.s[3]
	ldur	q16, [x7, #-16]
	cmp	x4, x29
	b.lt	.LBB0_39
.LBB0_40:                               //   in Loop: Header=BB0_37 Depth=2
	ldp	q22, q23, [x13]
	fmla	v3.4s, v20.4s, v19.s[0]
	fmla	v2.4s, v21.4s, v19.s[0]
	fmla	v0.4s, v21.4s, v18.s[0]
	fmla	v1.4s, v20.4s, v18.s[0]
	ldr	x6, [sp, #432]                  // 8-byte Folded Reload
	mov	x13, x27
	fmla	v4.4s, v21.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q21, q20, [x12]
	mov	x12, x15
	fmla	v2.4s, v23.4s, v19.s[1]
	fmla	v0.4s, v23.4s, v18.s[1]
	fmla	v4.4s, v23.4s, v17.s[1]
	fmla	v6.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v19.s[1]
	fmla	v1.4s, v22.4s, v18.s[1]
	fmla	v5.4s, v22.4s, v17.s[1]
	fmla	v7.4s, v22.4s, v16.s[1]
	fmla	v2.4s, v20.4s, v19.s[2]
	ldp	q22, q23, [x11]
	fmla	v0.4s, v20.4s, v18.s[2]
	mov	x11, x14
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
	cmp	x27, x21
	b.ge	.LBB0_36
	.p2align	2
.LBB0_41:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_37 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x12, x22
	prfm	pldl1keep, [x11]
	ldp	q16, q17, [x11, #-32]
	prfm	pldl1keep, [x12]
	ldur	s18, [x12, #-4]
	add	x13, x13, #1
	add	x12, x12, #4
	prfm	pldl1keep, [x4]
	ldur	s19, [x4, #-4]
	add	x4, x4, x22
	add	x11, x11, #32
	prfm	pldl1keep, [x4]
	ldur	s20, [x4, #-4]
	add	x4, x4, x22
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
	cmp	x13, x21
	b.lt	.LBB0_41
	b	.LBB0_36
	.p2align	2
.LBB0_42:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x14, [sp, #504]                 // 8-byte Folded Reload
	ldr	x15, [sp, #440]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_48
// %bb.43:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x1, [sp, #504]                  // 8-byte Folded Reload
	ldr	x18, [sp, #416]                 // 8-byte Folded Reload
	mov	x16, xzr
	mul	x14, x1, x28
	add	x17, x1, #1
	mul	x1, x1, x19
	ldp	q6, q7, [x8]
	madd	x15, x17, x28, x9
	add	x14, x9, x14
	add	x14, x14, x18
	add	x15, x15, x18
	ldr	x18, [sp, #448]                 // 8-byte Folded Reload
	add	x14, x6, x14, lsl #2
	add	x15, x6, x15, lsl #2
	mul	x18, x20, x18
	ldp	q1, q0, [x14]
	ldp	q3, q2, [x15]
	madd	x17, x17, x19, x18
	add	x1, x18, x1
	lsl	x1, x1, #2
	lsl	x17, x17, #2
	ldr	q5, [x25, x1]
	ldr	q4, [x25, x17]
	ldp	x18, x1, [sp, #288]             // 16-byte Folded Reload
	mov	x17, x10
	cmp	xzr, x29
	b.ge	.LBB0_45
	.p2align	2
.LBB0_44:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x7, x17, #32
	ldr	x4, [sp, #456]                  // 8-byte Folded Reload
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v0.4s, v7.4s, v5.s[0]
	prfm	pldl1keep, [x7]
	ldp	q16, q17, [x17, #-96]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q7, q6, [x17, #-64]
	add	x6, x17, #96
	prfm	pldl1keep, [x6]
	add	x16, x16, #4
	add	x2, x1, x4
	add	x4, x18, x4
	add	x1, x1, #16
	add	x18, x18, #16
	fmla	v0.4s, v17.4s, v5.s[1]
	fmla	v2.4s, v17.4s, v4.s[1]
	add	x3, x2, #32
	add	x5, x4, #32
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	ldp	q16, q17, [x17, #-32]
	fmla	v0.4s, v6.4s, v5.s[2]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v5.s[2]
	fmla	v3.4s, v7.4s, v4.s[2]
	fmla	v0.4s, v17.4s, v5.s[3]
	fmla	v2.4s, v17.4s, v4.s[3]
	ldp	q6, q7, [x17], #128
	prfm	pldl1keep, [x5]
	fmla	v1.4s, v16.4s, v5.s[3]
	ldr	q5, [x4, #16]
	prfm	pldl1keep, [x3]
	fmla	v3.4s, v16.4s, v4.s[3]
	ldr	q4, [x2, #16]
	cmp	x16, x29
	b.lt	.LBB0_44
.LBB0_45:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	q16, q17, [x13]
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v0.4s, v7.4s, v5.s[0]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q7, q6, [x12]
	ldr	x18, [sp, #72]                  // 8-byte Folded Reload
	mov	x16, xzr
	mov	x17, xzr
	mov	x1, x27
	fmla	v0.4s, v17.4s, v5.s[1]
	fmla	v2.4s, v17.4s, v4.s[1]
	add	x18, x8, x18
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	ldp	q16, q17, [x11]
	fmla	v0.4s, v6.4s, v5.s[2]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v5.s[2]
	fmla	v3.4s, v7.4s, v4.s[2]
	fmla	v0.4s, v17.4s, v5.s[3]
	fmla	v2.4s, v17.4s, v4.s[3]
	fmla	v1.4s, v16.4s, v5.s[3]
	fmla	v3.4s, v16.4s, v4.s[3]
	cmp	x27, x21
	b.ge	.LBB0_47
	.p2align	2
.LBB0_46:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x6, [sp, #240]                  // 8-byte Folded Reload
	ldr	x7, [sp, #312]                  // 8-byte Folded Reload
	add	x4, x18, x17, lsl #3
	add	x5, x18, x16
	add	x1, x1, #1
	add	x16, x16, #32
	add	x4, x4, #32
	prfm	pldl1keep, [x4]
	ldp	q4, q5, [x5]
	add	x2, x6, x17
	add	x3, x7, x17
	add	x2, x2, #4
	add	x3, x3, #4
	prfm	pldl1keep, [x3]
	ldr	s6, [x7, x17]
	prfm	pldl1keep, [x2]
	fmla	v0.4s, v5.4s, v6.s[0]
	ldr	s7, [x6, x17]
	fmla	v1.4s, v4.4s, v6.s[0]
	fmla	v2.4s, v5.4s, v7.s[0]
	fmla	v3.4s, v4.4s, v7.s[0]
	add	x17, x17, #4
	cmp	x1, x21
	b.lt	.LBB0_46
.LBB0_47:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x6, [sp, #432]                  // 8-byte Folded Reload
	stp	q1, q0, [x14]
	stp	q3, q2, [x15]
.LBB0_48:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x14, [sp, #368]                 // 8-byte Folded Reload
	ldr	x15, [sp, #440]                 // 8-byte Folded Reload
	cmp	x15, x14
	b.ge	.LBB0_54
// %bb.49:                              //   in Loop: Header=BB0_4 Depth=1
	ldp	x17, x16, [sp, #440]            // 16-byte Folded Reload
	ldp	q4, q3, [x8]
	ldr	x18, [sp, #376]                 // 8-byte Folded Reload
	mov	x14, xzr
	mul	x15, x17, x28
	add	x9, x9, x15
	ldr	x15, [sp, #416]                 // 8-byte Folded Reload
	add	x9, x9, x15
	mul	x15, x17, x19
	madd	x15, x20, x16, x15
	add	x9, x6, x9, lsl #2
	ldp	q1, q0, [x9]
	lsl	x15, x15, #2
	ldr	q2, [x25, x15]
	ldr	x15, [sp, #304]                 // 8-byte Folded Reload
	cmp	xzr, x29
	b.ge	.LBB0_51
	.p2align	2
.LBB0_50:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
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
	cmp	x14, x29
	b.lt	.LBB0_50
.LBB0_51:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	q5, q6, [x13]
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	ldp	q4, q3, [x12]
	mov	x10, xzr
	mov	x14, xzr
	fmla	v0.4s, v6.4s, v2.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldp	q5, q6, [x11]
	ldr	x11, [sp, #72]                  // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	add	x8, x8, x11
	mov	x11, x27
	fmla	v0.4s, v6.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	cmp	x27, x21
	b.ge	.LBB0_53
	.p2align	2
.LBB0_52:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x8, x14, lsl #3
	add	x12, x18, x14
	add	x15, x8, x10
	add	x11, x11, #1
	add	x12, x12, #4
	add	x10, x10, #32
	add	x13, x13, #32
	prfm	pldl1keep, [x13]
	ldp	q2, q3, [x15]
	prfm	pldl1keep, [x12]
	ldr	s4, [x18, x14]
	add	x14, x14, #4
	fmla	v0.4s, v3.4s, v4.s[0]
	fmla	v1.4s, v2.4s, v4.s[0]
	cmp	x11, x21
	b.lt	.LBB0_52
.LBB0_53:                               //   in Loop: Header=BB0_4 Depth=1
	stp	q1, q0, [x9]
.LBB0_54:                               //   in Loop: Header=BB0_4 Depth=1
	bl	free
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	ldr	x30, [sp, #280]                 // 8-byte Folded Reload
	ldr	x1, [sp, #176]                  // 8-byte Folded Reload
	cmp	x30, x1
	b.ge	.LBB0_31
.LBB0_55:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #88]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #360]                  // 8-byte Folded Reload
	ldr	x5, [sp, #280]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldp	x13, x6, [sp, #424]             // 16-byte Folded Reload
	ldr	x15, [sp, #200]                 // 8-byte Folded Reload
	mul	x9, x20, x8
	ldr	x16, [sp, #400]                 // 8-byte Folded Reload
	add	x8, x9, x5
	lsl	x12, x8, #2
	ldr	q0, [x6, x12]
	add	x12, x8, x28
	lsl	x12, x12, #2
	ldr	q1, [x6, x12]
	add	x12, x8, x13
	lsl	x12, x12, #2
	ldr	q2, [x6, x12]
	add	x12, x13, x28
	add	x8, x8, x12
	lsl	x8, x8, #2
	ldr	q3, [x6, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x21
	b.ge	.LBB0_57
	.p2align	2
.LBB0_56:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x16, x10
	add	x12, x15, x10
	add	x10, x10, #4
	prfm	pldl1keep, [x13]
	ldur	s4, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s5, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s6, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s7, [x13, #-4]
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x12, x12, x26
	sub	x13, x12, #4
	prfm	pldl1keep, [x12]
	add	x12, x12, x26
	prfm	pldl1keep, [x12]
	sub	x14, x12, #4
	add	x12, x12, x26
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
	cmp	x11, x21
	b.lt	.LBB0_56
.LBB0_57:                               // %.preheader26
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #48]                  // 8-byte Folded Reload
	ldp	x12, x13, [sp, #384]            // 16-byte Folded Reload
	mov	x1, xzr
	add	x10, x8, #48
	mov	w15, #1                         // =0x1
	mov	w16, #2                         // =0x2
	mov	w17, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_59
	.p2align	2
.LBB0_58:                               // %.loopexit22
                                        //   in Loop: Header=BB0_59 Depth=2
	add	x13, x13, x24
	add	x12, x12, x24
	mov	x1, x14
	mov	x14, x18
.LBB0_59:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_61 Depth 3
                                        //       Child Loop BB0_63 Depth 3
	madd	x18, x1, x28, x9
	add	x18, x18, x5
	madd	x15, x15, x28, x9
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	add	x15, x15, x5
	add	x16, x16, x5
	lsl	x18, x18, #2
	lsl	x15, x15, #2
	lsl	x16, x16, #2
	str	q0, [x6, x18]
	str	q1, [x6, x15]
	add	x15, x17, x5
	lsl	x15, x15, #2
	str	q2, [x6, x16]
	str	q3, [x6, x15]
	ldr	x15, [sp, #504]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_64
// %bb.60:                              //   in Loop: Header=BB0_59 Depth=2
	madd	x2, x14, x28, x9
	add	x15, x14, #1
	add	x16, x14, #2
	add	x17, x14, #3
	madd	x3, x15, x28, x9
	ldr	q16, [x8]
	mov	x1, xzr
	add	x18, x14, #4
	add	x2, x2, x5
	lsl	x2, x2, #2
	add	x3, x3, x5
	lsl	x3, x3, #2
	ldr	q0, [x6, x2]
	madd	x2, x16, x28, x9
	add	x2, x2, x5
	ldr	q1, [x6, x3]
	madd	x3, x17, x28, x9
	lsl	x2, x2, #2
	ldr	q2, [x6, x2]
	add	x2, x3, x5
	lsl	x2, x2, #2
	ldr	q3, [x6, x2]
	ldr	x2, [sp, #448]                  // 8-byte Folded Reload
	mul	x2, x20, x2
	madd	x3, x14, x19, x2
	lsl	x3, x3, #2
	ldr	q7, [x25, x3]
	madd	x3, x15, x19, x2
	lsl	x3, x3, #2
	ldr	q6, [x25, x3]
	madd	x3, x16, x19, x2
	madd	x2, x17, x19, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x25, x3]
	ldr	q4, [x25, x2]
	mov	x2, x10
	mov	x3, x13
	cmp	xzr, x29
	b.ge	.LBB0_62
	.p2align	2
.LBB0_61:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_59 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, #32
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	add	x1, x1, #4
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	prfm	pldl1keep, [x4]
	add	x4, x3, x22
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
	add	x4, x4, x22
	fmla	v2.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	cmp	x1, x29
	b.lt	.LBB0_61
.LBB0_62:                               //   in Loop: Header=BB0_59 Depth=2
	ldp	x1, x2, [sp, #488]              // 16-byte Folded Reload
	fmla	v0.4s, v16.4s, v7.s[0]
	fmla	v1.4s, v16.4s, v6.s[0]
	fmla	v2.4s, v16.4s, v5.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	mov	x3, x27
	ldr	q17, [x8, x2, lsl #4]
	ldr	q16, [x8, x1, lsl #4]
	ldr	x1, [sp, #480]                  // 8-byte Folded Reload
	mov	x2, x12
	ldr	q18, [x8, x1, lsl #4]
	mov	x1, x11
	fmla	v0.4s, v17.4s, v7.s[1]
	fmla	v1.4s, v17.4s, v6.s[1]
	fmla	v2.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	fmla	v0.4s, v16.4s, v7.s[2]
	fmla	v1.4s, v16.4s, v6.s[2]
	fmla	v2.4s, v16.4s, v5.s[2]
	fmla	v3.4s, v16.4s, v4.s[2]
	fmla	v0.4s, v18.4s, v7.s[3]
	fmla	v1.4s, v18.4s, v6.s[3]
	fmla	v2.4s, v18.4s, v5.s[3]
	fmla	v3.4s, v18.4s, v4.s[3]
	cmp	x27, x21
	b.ge	.LBB0_58
	.p2align	2
.LBB0_63:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_59 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, x22
	prfm	pldl1keep, [x1]
	ldur	q4, [x1, #-16]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #16
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x22
	fmla	v0.4s, v4.4s, v5.s[0]
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v1.4s, v4.4s, v6.s[0]
	fmla	v2.4s, v4.4s, v7.s[0]
	fmla	v3.4s, v4.4s, v16.s[0]
	cmp	x3, x21
	b.lt	.LBB0_63
	b	.LBB0_58
	.p2align	2
.LBB0_64:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x12, [sp, #504]                 // 8-byte Folded Reload
	ldr	x13, [sp, #440]                 // 8-byte Folded Reload
	cmp	x12, x13
	b.ge	.LBB0_70
// %bb.65:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x17, [sp, #504]                 // 8-byte Folded Reload
	ldr	x16, [sp, #448]                 // 8-byte Folded Reload
	mov	x14, xzr
	mul	x12, x17, x28
	add	x15, x17, #1
	mul	x16, x20, x16
	mul	x17, x17, x19
	ldr	q4, [x8]
	madd	x13, x15, x28, x9
	madd	x15, x15, x19, x16
	add	x12, x9, x12
	add	x17, x16, x17
	add	x12, x12, x5
	add	x13, x13, x5
	lsl	x17, x17, #2
	lsl	x15, x15, #2
	add	x12, x6, x12, lsl #2
	add	x13, x6, x13, lsl #2
	ldr	q3, [x25, x17]
	ldr	q2, [x25, x15]
	ldp	x16, x17, [sp, #288]            // 16-byte Folded Reload
	mov	x15, x10
	ldr	q0, [x12]
	ldr	q1, [x13]
	cmp	xzr, x29
	b.ge	.LBB0_67
	.p2align	2
.LBB0_66:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x4, x15, #32
	ldr	x2, [sp, #456]                  // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	prfm	pldl1keep, [x4]
	ldp	q4, q5, [x15, #-32]
	add	x14, x14, #4
	add	x18, x17, x2
	add	x2, x16, x2
	add	x17, x17, #16
	add	x16, x16, #16
	add	x1, x18, #32
	add	x3, x2, #32
	fmla	v0.4s, v4.4s, v3.s[1]
	fmla	v1.4s, v4.4s, v2.s[1]
	fmla	v0.4s, v5.4s, v3.s[2]
	fmla	v1.4s, v5.4s, v2.s[2]
	ldp	q5, q4, [x15], #64
	prfm	pldl1keep, [x3]
	fmla	v0.4s, v5.4s, v3.s[3]
	ldr	q3, [x2, #16]
	prfm	pldl1keep, [x1]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldr	q2, [x18, #16]
	cmp	x14, x29
	b.lt	.LBB0_66
.LBB0_67:                               //   in Loop: Header=BB0_4 Depth=1
	ldp	x14, x15, [sp, #488]            // 16-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldp	x1, x18, [sp, #256]             // 16-byte Folded Reload
	ldr	q5, [x8, x15, lsl #4]
	ldr	q4, [x8, x14, lsl #4]
	ldr	x14, [sp, #480]                 // 8-byte Folded Reload
	mov	x15, x27
	fmla	v0.4s, v5.4s, v3.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldr	q5, [x8, x14, lsl #4]
	ldr	x14, [sp, #408]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v3.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	cmp	x27, x21
	b.ge	.LBB0_69
	.p2align	2
.LBB0_68:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x16, x14, x1
	add	x17, x14, x18
	prfm	pldl1keep, [x11]
	ldur	q2, [x11, #-16]
	add	x16, x16, #4
	add	x17, x17, #4
	add	x15, x15, #1
	add	x11, x11, #16
	prfm	pldl1keep, [x17]
	ldr	s3, [x14, x18]
	prfm	pldl1keep, [x16]
	ldr	s4, [x14, x1]
	add	x14, x14, #4
	fmla	v0.4s, v2.4s, v3.s[0]
	fmla	v1.4s, v2.4s, v4.s[0]
	cmp	x15, x21
	b.lt	.LBB0_68
.LBB0_69:                               //   in Loop: Header=BB0_4 Depth=1
	str	q0, [x12]
	str	q1, [x13]
.LBB0_70:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #368]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_76
// %bb.71:                              //   in Loop: Header=BB0_4 Depth=1
	ldp	x14, x13, [sp, #440]            // 16-byte Folded Reload
	ldr	q2, [x8]
	mov	x11, xzr
	mul	x12, x14, x28
	add	x9, x9, x12
	mul	x12, x14, x19
	ldr	x14, [sp, #376]                 // 8-byte Folded Reload
	madd	x12, x20, x13, x12
	add	x9, x9, x5
	add	x9, x6, x9, lsl #2
	ldr	q0, [x9]
	lsl	x12, x12, #2
	ldr	q1, [x25, x12]
	ldr	x12, [sp, #304]                 // 8-byte Folded Reload
	cmp	xzr, x29
	b.ge	.LBB0_73
	.p2align	2
.LBB0_72:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
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
	cmp	x11, x29
	b.lt	.LBB0_72
.LBB0_73:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x12, [sp, #272]                 // 8-byte Folded Reload
	mov	x10, xzr
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #488]                 // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v1.s[1]
	ldr	q2, [x8, x11, lsl #4]
	ldr	x11, [sp, #480]                 // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[2]
	ldr	q3, [x8, x11, lsl #4]
	ldr	x11, [sp, #24]                  // 8-byte Folded Reload
	add	x8, x8, x11
	mov	w11, #16                        // =0x10
	fmla	v0.4s, v3.4s, v1.s[3]
	add	x13, x27, xzr
	cmp	x13, x21
	b.ge	.LBB0_75
	.p2align	2
.LBB0_74:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x8, x11
	add	x11, x11, #16
	prfm	pldl1keep, [x13]
	ldr	x13, [sp, #408]                 // 8-byte Folded Reload
	ldr	q1, [x8, x10, lsl #4]
	add	x13, x13, x12
	add	x12, x12, #4
	prfm	pldl1keep, [x13]
	ldr	s2, [x14, x10, lsl #2]
	add	x10, x10, #1
	fmla	v0.4s, v1.4s, v2.s[0]
	add	x13, x27, x10
	cmp	x13, x21
	b.lt	.LBB0_74
.LBB0_75:                               //   in Loop: Header=BB0_4 Depth=1
	str	q0, [x9]
.LBB0_76:                               //   in Loop: Header=BB0_4 Depth=1
	bl	free
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	ldp	x10, x1, [sp, #168]             // 16-byte Folded Reload
	cmp	x1, x10
	b.ge	.LBB0_32
.LBB0_77:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #80]                   // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #360]                  // 8-byte Folded Reload
	ldr	x5, [sp, #176]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldp	x13, x6, [sp, #424]             // 16-byte Folded Reload
	ldp	x17, x16, [sp, #208]            // 16-byte Folded Reload
	ldr	x18, [sp, #400]                 // 8-byte Folded Reload
	mul	x9, x20, x8
	add	x8, x9, x5
	lsl	x12, x8, #2
	ldr	d0, [x6, x12]
	add	x12, x8, x28
	lsl	x12, x12, #2
	ldr	d1, [x6, x12]
	add	x12, x8, x13
	lsl	x12, x12, #2
	ldr	d2, [x6, x12]
	add	x12, x13, x28
	add	x8, x8, x12
	lsl	x8, x8, #2
	ldr	d3, [x6, x8]
	add	x8, x0, #63
	and	x8, x8, #0xffffffffffffffc0
	cmp	xzr, x21
	b.ge	.LBB0_79
	.p2align	2
.LBB0_78:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x15, x18, x10
	add	x12, x16, x10
	add	x14, x17, x10
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x15, x15, x22
	add	x13, x12, #4
	add	x14, x14, #4
	prfm	pldl1keep, [x15]
	ldur	s5, [x15, #-4]
	add	x15, x15, x22
	prfm	pldl1keep, [x15]
	ldur	s6, [x15, #-4]
	add	x15, x15, x22
	prfm	pldl1keep, [x15]
	ldur	s7, [x15, #-4]
	prfm	pldl1keep, [x14]
	prfm	pldl1keep, [x13]
	ldr	s16, [x17, x10]
	add	x10, x10, #4
	ld1	{ v16.s }[1], [x12]
	fmla	v0.2s, v16.2s, v4.s[0]
	str	d16, [x8, x11, lsl #3]
	add	x11, x11, #1
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x11, x21
	b.lt	.LBB0_78
.LBB0_79:                               // %.preheader25
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #40]                  // 8-byte Folded Reload
	ldp	x12, x13, [sp, #384]            // 16-byte Folded Reload
	mov	x1, xzr
	add	x10, x8, #24
	mov	w15, #1                         // =0x1
	mov	w16, #2                         // =0x2
	mov	w17, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_81
	.p2align	2
.LBB0_80:                               // %.loopexit21
                                        //   in Loop: Header=BB0_81 Depth=2
	add	x13, x13, x24
	add	x12, x12, x24
	mov	x1, x14
	mov	x14, x18
.LBB0_81:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_83 Depth 3
                                        //       Child Loop BB0_85 Depth 3
	madd	x18, x1, x28, x9
	add	x18, x18, x5
	madd	x15, x15, x28, x9
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	add	x15, x15, x5
	add	x16, x16, x5
	lsl	x18, x18, #2
	lsl	x15, x15, #2
	lsl	x16, x16, #2
	str	d0, [x6, x18]
	str	d1, [x6, x15]
	add	x15, x17, x5
	lsl	x15, x15, #2
	str	d2, [x6, x16]
	str	d3, [x6, x15]
	ldr	x15, [sp, #504]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_86
// %bb.82:                              //   in Loop: Header=BB0_81 Depth=2
	madd	x2, x14, x28, x9
	add	x15, x14, #1
	add	x16, x14, #2
	add	x17, x14, #3
	madd	x3, x15, x28, x9
	ldr	d16, [x8]
	mov	x1, xzr
	add	x18, x14, #4
	add	x2, x2, x5
	lsl	x2, x2, #2
	add	x3, x3, x5
	lsl	x3, x3, #2
	ldr	d0, [x6, x2]
	madd	x2, x16, x28, x9
	add	x2, x2, x5
	ldr	d1, [x6, x3]
	madd	x3, x17, x28, x9
	lsl	x2, x2, #2
	ldr	d2, [x6, x2]
	add	x2, x3, x5
	lsl	x2, x2, #2
	ldr	d3, [x6, x2]
	ldr	x2, [sp, #448]                  // 8-byte Folded Reload
	mul	x2, x20, x2
	madd	x3, x14, x19, x2
	lsl	x3, x3, #2
	ldr	q7, [x25, x3]
	madd	x3, x15, x19, x2
	lsl	x3, x3, #2
	ldr	q6, [x25, x3]
	madd	x3, x16, x19, x2
	madd	x2, x17, x19, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x25, x3]
	ldr	q4, [x25, x2]
	mov	x2, x10
	mov	x3, x13
	cmp	xzr, x29
	b.ge	.LBB0_84
	.p2align	2
.LBB0_83:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_81 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, #16
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	add	x1, x1, #4
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	prfm	pldl1keep, [x4]
	add	x4, x3, x22
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
	add	x4, x4, x22
	fmla	v2.2s, v17.2s, v5.s[3]
	fmla	v3.2s, v17.2s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	cmp	x1, x29
	b.lt	.LBB0_83
.LBB0_84:                               //   in Loop: Header=BB0_81 Depth=2
	ldp	x1, x2, [sp, #488]              // 16-byte Folded Reload
	fmla	v0.2s, v16.2s, v7.s[0]
	fmla	v1.2s, v16.2s, v6.s[0]
	fmla	v2.2s, v16.2s, v5.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	mov	x3, x27
	ldr	d17, [x8, x2, lsl #3]
	ldr	d16, [x8, x1, lsl #3]
	ldr	x1, [sp, #480]                  // 8-byte Folded Reload
	mov	x2, x12
	ldr	d18, [x8, x1, lsl #3]
	mov	x1, x11
	fmla	v0.2s, v17.2s, v7.s[1]
	fmla	v1.2s, v17.2s, v6.s[1]
	fmla	v2.2s, v17.2s, v5.s[1]
	fmla	v3.2s, v17.2s, v4.s[1]
	fmla	v0.2s, v16.2s, v7.s[2]
	fmla	v1.2s, v16.2s, v6.s[2]
	fmla	v2.2s, v16.2s, v5.s[2]
	fmla	v3.2s, v16.2s, v4.s[2]
	fmla	v0.2s, v18.2s, v7.s[3]
	fmla	v1.2s, v18.2s, v6.s[3]
	fmla	v2.2s, v18.2s, v5.s[3]
	fmla	v3.2s, v18.2s, v4.s[3]
	cmp	x27, x21
	b.ge	.LBB0_80
	.p2align	2
.LBB0_85:                               //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_81 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, x22
	prfm	pldl1keep, [x1]
	ldur	d4, [x1, #-8]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #8
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x22
	fmla	v0.2s, v4.2s, v5.s[0]
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v1.2s, v4.2s, v6.s[0]
	fmla	v2.2s, v4.2s, v7.s[0]
	fmla	v3.2s, v4.2s, v16.s[0]
	cmp	x3, x21
	b.lt	.LBB0_85
	b	.LBB0_80
	.p2align	2
.LBB0_86:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #504]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	cmp	x11, x12
	b.ge	.LBB0_92
// %bb.87:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x16, [sp, #504]                 // 8-byte Folded Reload
	ldr	x15, [sp, #448]                 // 8-byte Folded Reload
	mov	x13, xzr
	mul	x11, x16, x28
	add	x14, x16, #1
	mul	x15, x20, x15
	mul	x16, x16, x19
	ldr	d4, [x8]
	madd	x12, x14, x28, x9
	madd	x14, x14, x19, x15
	add	x11, x9, x11
	add	x16, x15, x16
	add	x11, x11, x5
	add	x12, x12, x5
	lsl	x16, x16, #2
	lsl	x14, x14, #2
	add	x11, x6, x11, lsl #2
	add	x12, x6, x12, lsl #2
	ldr	q3, [x25, x16]
	ldr	q2, [x25, x14]
	ldp	x15, x16, [sp, #288]            // 16-byte Folded Reload
	mov	x14, x10
	ldr	d0, [x11]
	ldr	d1, [x12]
	cmp	xzr, x29
	b.ge	.LBB0_89
	.p2align	2
.LBB0_88:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x3, x14, #16
	ldr	x1, [sp, #456]                  // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	prfm	pldl1keep, [x3]
	ldp	d4, d5, [x14, #-16]
	add	x13, x13, #4
	add	x17, x16, x1
	add	x1, x15, x1
	add	x16, x16, #16
	add	x15, x15, #16
	add	x18, x17, #32
	add	x2, x1, #32
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v5.2s, v3.s[2]
	fmla	v1.2s, v5.2s, v2.s[2]
	ldp	d5, d4, [x14], #32
	prfm	pldl1keep, [x2]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x1, #16]
	prfm	pldl1keep, [x18]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x17, #16]
	cmp	x13, x29
	b.lt	.LBB0_88
.LBB0_89:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x15, [sp, #496]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldr	x1, [sp, #240]                  // 8-byte Folded Reload
	mov	x13, xzr
	mov	x14, xzr
	ldr	d5, [x8, x15, lsl #3]
	ldr	x15, [sp, #488]                 // 8-byte Folded Reload
	ldr	d4, [x8, x15, lsl #3]
	ldr	x15, [sp, #480]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.s[1]
	fmla	v1.2s, v5.2s, v2.s[1]
	ldr	d5, [x8, x15, lsl #3]
	ldr	x15, [sp, #64]                  // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[2]
	fmla	v1.2s, v4.2s, v2.s[2]
	add	x15, x8, x15
	fmla	v0.2s, v5.2s, v3.s[3]
	fmla	v1.2s, v5.2s, v2.s[3]
	add	x16, x27, xzr
	cmp	x16, x21
	b.ge	.LBB0_91
	.p2align	2
.LBB0_90:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x2, [sp, #312]                  // 8-byte Folded Reload
	add	x18, x15, x14, lsl #3
	add	x16, x1, x13
	add	x16, x16, #4
	add	x18, x18, #8
	prfm	pldl1keep, [x18]
	ldr	d2, [x15, x14, lsl #3]
	add	x17, x2, x13
	add	x13, x13, #4
	add	x17, x17, #4
	prfm	pldl1keep, [x17]
	ldr	s3, [x2, x14, lsl #2]
	prfm	pldl1keep, [x16]
	fmla	v0.2s, v2.2s, v3.s[0]
	ldr	s4, [x1, x14, lsl #2]
	fmla	v1.2s, v2.2s, v4.s[0]
	add	x14, x14, #1
	add	x16, x27, x14
	cmp	x16, x21
	b.lt	.LBB0_90
.LBB0_91:                               //   in Loop: Header=BB0_4 Depth=1
	str	d0, [x11]
	str	d1, [x12]
.LBB0_92:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #368]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_98
// %bb.93:                              //   in Loop: Header=BB0_4 Depth=1
	ldp	x14, x13, [sp, #440]            // 16-byte Folded Reload
	ldr	d2, [x8]
	mov	x11, xzr
	mul	x12, x14, x28
	add	x9, x9, x12
	mul	x12, x14, x19
	ldr	x14, [sp, #376]                 // 8-byte Folded Reload
	madd	x12, x20, x13, x12
	add	x9, x9, x5
	add	x9, x6, x9, lsl #2
	ldr	d0, [x9]
	lsl	x12, x12, #2
	ldr	q1, [x25, x12]
	ldr	x12, [sp, #304]                 // 8-byte Folded Reload
	cmp	xzr, x29
	b.ge	.LBB0_95
	.p2align	2
.LBB0_94:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x10, #16
	fmla	v0.2s, v2.2s, v1.s[0]
	add	x11, x11, #4
	prfm	pldl1keep, [x13]
	ldp	d2, d3, [x10, #-16]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v3.2s, v1.s[2]
	ldp	d3, d2, [x10], #32
	prfm	pldl1keep, [x12]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x12, #-16]
	add	x12, x12, #16
	cmp	x11, x29
	b.lt	.LBB0_94
.LBB0_95:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[0]
	mov	x10, xzr
	ldr	d3, [x8, x11, lsl #3]
	ldr	x11, [sp, #488]                 // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v1.s[1]
	ldr	d4, [x8, x11, lsl #3]
	ldr	x11, [sp, #480]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[2]
	ldr	d2, [x8, x11, lsl #3]
	ldr	x11, [sp, #64]                  // 8-byte Folded Reload
	add	x8, x8, x11
	ldr	x11, [sp, #272]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[3]
	add	x12, x27, xzr
	cmp	x12, x21
	b.ge	.LBB0_97
	.p2align	2
.LBB0_96:                               //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x8, x10, lsl #3
	add	x12, x12, #8
	prfm	pldl1keep, [x12]
	ldr	x12, [sp, #408]                 // 8-byte Folded Reload
	ldr	d1, [x8, x10, lsl #3]
	add	x12, x12, x11
	add	x11, x11, #4
	prfm	pldl1keep, [x12]
	ldr	s2, [x14, x10, lsl #2]
	add	x10, x10, #1
	fmla	v0.2s, v1.2s, v2.s[0]
	add	x12, x27, x10
	cmp	x12, x21
	b.lt	.LBB0_96
.LBB0_97:                               //   in Loop: Header=BB0_4 Depth=1
	str	d0, [x9]
.LBB0_98:                               //   in Loop: Header=BB0_4 Depth=1
	bl	free
	ldr	x8, [sp, #448]                  // 8-byte Folded Reload
	ldr	x10, [sp, #168]                 // 8-byte Folded Reload
	ldr	x9, [sp, #136]                  // 8-byte Folded Reload
	cmp	x10, x9
	b.ge	.LBB0_3
.LBB0_99:                               //   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #112]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	ldr	x8, [sp, #360]                  // 8-byte Folded Reload
	ldr	x5, [sp, #168]                  // 8-byte Folded Reload
	mov	x10, xzr
	mov	x11, xzr
	ldp	x13, x14, [sp, #424]            // 16-byte Folded Reload
	mul	x9, x20, x8
	add	x12, x9, x5
	add	x8, x12, x13
	add	x13, x13, x28
	ldr	s2, [x14, x12, lsl #2]
	add	x13, x12, x13
	ldr	s1, [x14, x8, lsl #2]
	add	x8, x0, #63
	ldr	s0, [x14, x13, lsl #2]
	add	x13, x12, x28
	ldr	x12, [sp, #224]                 // 8-byte Folded Reload
	and	x8, x8, #0xffffffffffffffc0
	ldr	s3, [x14, x13, lsl #2]
	ldr	x14, [sp, #400]                 // 8-byte Folded Reload
	cmp	xzr, x21
	b.ge	.LBB0_101
	.p2align	2
.LBB0_100:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x13, x14, x10
	add	x11, x11, #1
	prfm	pldl1keep, [x13]
	ldur	s4, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s5, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s6, [x13, #-4]
	add	x13, x13, x22
	prfm	pldl1keep, [x13]
	ldur	s7, [x13, #-4]
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x12, x12, #4
	fmla	v2.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v1.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	str	s16, [x8, x10]
	add	x10, x10, #4
	cmp	x11, x21
	b.lt	.LBB0_100
.LBB0_101:                              // %.preheader24
                                        //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #32]                  // 8-byte Folded Reload
	ldp	x12, x13, [sp, #384]            // 16-byte Folded Reload
	mov	x1, xzr
	ldp	x7, x6, [sp, #184]              // 16-byte Folded Reload
	add	x10, x8, #12
	mov	w16, #1                         // =0x1
	mov	w17, #2                         // =0x2
	mov	w15, #3                         // =0x3
	mov	w14, #4                         // =0x4
	add	x11, x8, x11
	b	.LBB0_103
	.p2align	2
.LBB0_102:                              // %.loopexit20
                                        //   in Loop: Header=BB0_103 Depth=2
	add	x13, x13, x24
	add	x12, x12, x24
	mov	x1, x14
	mov	x14, x18
.LBB0_103:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_105 Depth 3
                                        //       Child Loop BB0_107 Depth 3
	madd	x18, x1, x28, x9
	ldr	x30, [sp, #432]                 // 8-byte Folded Reload
	add	x18, x18, x5
	madd	x16, x16, x28, x9
	madd	x17, x17, x28, x9
	madd	x15, x15, x28, x9
	add	x16, x16, x5
	add	x15, x15, x5
	str	s2, [x30, x18, lsl #2]
	str	s3, [x30, x16, lsl #2]
	add	x16, x17, x5
	str	s1, [x30, x16, lsl #2]
	str	s0, [x30, x15, lsl #2]
	ldr	x15, [sp, #504]                 // 8-byte Folded Reload
	cmp	x14, x15
	b.ge	.LBB0_108
// %bb.104:                             //   in Loop: Header=BB0_103 Depth=2
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
	ldr	s2, [x30, x2, lsl #2]
	madd	x2, x15, x28, x9
	add	x3, x3, x5
	add	x4, x4, x5
	add	x2, x2, x5
	ldr	s3, [x30, x3, lsl #2]
	ldr	s1, [x30, x4, lsl #2]
	ldr	s0, [x30, x2, lsl #2]
	ldr	x2, [sp, #448]                  // 8-byte Folded Reload
	mul	x2, x20, x2
	madd	x3, x14, x19, x2
	lsl	x3, x3, #2
	ldr	q7, [x25, x3]
	madd	x3, x16, x19, x2
	lsl	x3, x3, #2
	ldr	q6, [x25, x3]
	madd	x3, x17, x19, x2
	madd	x2, x15, x19, x2
	lsl	x3, x3, #2
	lsl	x2, x2, #2
	ldr	q5, [x25, x3]
	ldr	q4, [x25, x2]
	mov	x2, x10
	mov	x3, x13
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	xzr, x29
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.ge	.LBB0_106
	.p2align	2
.LBB0_105:                              //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_103 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, #8
	fmla	v2.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	add	x1, x1, #4
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	prfm	pldl1keep, [x4]
	add	x4, x3, x22
	ldp	s16, s21, [x2, #-8]
	fmla	v0.2s, v16.2s, v4.s[1]
	fmla	v2.2s, v16.2s, v7.s[1]
	fmla	v3.2s, v16.2s, v6.s[1]
	fmla	v1.2s, v16.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v17.2s
	fmla	v2.2s, v21.2s, v20.2s
	ldp	s17, s16, [x2], #16
	fmla	v3.2s, v21.2s, v19.2s
	fmla	v1.2s, v21.2s, v18.2s
	prfm	pldl1keep, [x3]
	fmla	v2.2s, v17.2s, v7.s[3]
	ldur	q7, [x3, #-16]
	prfm	pldl1keep, [x4]
	fmla	v3.2s, v17.2s, v6.s[3]
	ldur	q6, [x4, #-16]
	add	x4, x4, x22
	fmla	v1.2s, v17.2s, v5.s[3]
	fmla	v0.2s, v17.2s, v4.s[3]
	add	x3, x3, #16
	prfm	pldl1keep, [x4]
	ldur	q5, [x4, #-16]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	q4, [x4, #-16]
	ext	v20.16b, v7.16b, v7.16b, #8
	cmp	x1, x29
	ext	v19.16b, v6.16b, v6.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.lt	.LBB0_105
.LBB0_106:                              //   in Loop: Header=BB0_103 Depth=2
	ldp	x1, x2, [sp, #488]              // 16-byte Folded Reload
	fmla	v2.2s, v16.2s, v7.2s
	fmla	v3.2s, v16.2s, v6.2s
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	mov	x3, x27
	ldr	s21, [x8, x2, lsl #2]
	ldr	s16, [x8, x1, lsl #2]
	ldr	x1, [sp, #480]                  // 8-byte Folded Reload
	mov	x2, x12
	ldr	s22, [x8, x1, lsl #2]
	mov	x1, x11
	fmla	v2.2s, v21.2s, v7.s[1]
	fmla	v3.2s, v21.2s, v6.s[1]
	fmla	v1.2s, v21.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v4.s[1]
	fmla	v2.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v1.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	fmla	v2.2s, v22.2s, v7.s[3]
	fmla	v3.2s, v22.2s, v6.s[3]
	fmla	v1.2s, v22.2s, v5.s[3]
	fmla	v0.2s, v22.2s, v4.s[3]
	cmp	x27, x21
	b.ge	.LBB0_102
	.p2align	2
.LBB0_107:                              //   Parent Loop BB0_4 Depth=1
                                        //     Parent Loop BB0_103 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x4, x2, x22
	prfm	pldl1keep, [x1]
	ldur	s4, [x1, #-4]
	add	x3, x3, #1
	prfm	pldl1keep, [x2]
	ldur	s5, [x2, #-4]
	add	x2, x2, #4
	add	x1, x1, #4
	prfm	pldl1keep, [x4]
	ldur	s6, [x4, #-4]
	add	x4, x4, x22
	fmla	v2.2s, v4.2s, v5.2s
	prfm	pldl1keep, [x4]
	ldur	s7, [x4, #-4]
	add	x4, x4, x22
	prfm	pldl1keep, [x4]
	ldur	s16, [x4, #-4]
	fmla	v3.2s, v4.2s, v6.2s
	fmla	v1.2s, v4.2s, v7.2s
	fmla	v0.2s, v4.2s, v16.2s
	cmp	x3, x21
	b.lt	.LBB0_107
	b	.LBB0_102
	.p2align	2
.LBB0_108:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #504]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	cmp	x11, x12
	b.ge	.LBB0_114
// %bb.109:                             //   in Loop: Header=BB0_4 Depth=1
	ldr	x16, [sp, #504]                 // 8-byte Folded Reload
	ldr	x12, [sp, #448]                 // 8-byte Folded Reload
	mov	x13, xzr
	mov	x14, xzr
	ldr	s4, [x8]
	mul	x12, x20, x12
	mul	x15, x16, x19
	mul	x11, x16, x28
	add	x15, x12, x15
	add	x11, x9, x11
	lsl	x15, x15, #2
	add	x11, x11, x5
	ldr	q2, [x25, x15]
	add	x15, x16, #1
	madd	x16, x15, x19, x12
	madd	x12, x15, x28, x9
	ldr	x15, [sp, #432]                 // 8-byte Folded Reload
	add	x12, x12, x5
	ldr	s1, [x15, x11, lsl #2]
	ldr	s0, [x15, x12, lsl #2]
	lsl	x15, x16, #2
	ldr	q3, [x25, x15]
	ext	v6.16b, v2.16b, v2.16b, #8
	cmp	xzr, x29
	ext	v5.16b, v3.16b, v3.16b, #8
	b.ge	.LBB0_111
	.p2align	2
.LBB0_110:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x1, x8, x13
	fmla	v1.2s, v4.2s, v2.2s
	fmla	v0.2s, v4.2s, v3.2s
	add	x15, x6, x13
	add	x2, x1, #20
	add	x17, x7, x13
	add	x16, x15, #32
	add	x18, x17, #32
	prfm	pldl1keep, [x2]
	ldp	s4, s7, [x1, #4]
	add	x14, x14, #4
	add	x13, x13, #16
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
	cmp	x14, x29
	ext	v5.16b, v3.16b, v3.16b, #8
	b.lt	.LBB0_110
.LBB0_111:                              //   in Loop: Header=BB0_4 Depth=1
	ldp	x14, x15, [sp, #488]            // 16-byte Folded Reload
	fmla	v1.2s, v4.2s, v2.2s
	fmla	v0.2s, v4.2s, v3.2s
	ldr	x1, [sp, #240]                  // 8-byte Folded Reload
	ldr	x3, [sp, #432]                  // 8-byte Folded Reload
	mov	x13, xzr
	ldr	s7, [x8, x15, lsl #2]
	ldr	s4, [x8, x14, lsl #2]
	ldr	x14, [sp, #480]                 // 8-byte Folded Reload
	mov	x15, x27
	fmla	v1.2s, v7.2s, v2.s[1]
	fmla	v0.2s, v7.2s, v3.s[1]
	ldr	s7, [x8, x14, lsl #2]
	ldr	x14, [sp, #104]                 // 8-byte Folded Reload
	fmla	v1.2s, v4.2s, v6.2s
	fmla	v0.2s, v4.2s, v5.2s
	add	x14, x8, x14
	fmla	v1.2s, v7.2s, v2.s[3]
	fmla	v0.2s, v7.2s, v3.s[3]
	cmp	x27, x21
	b.ge	.LBB0_113
	.p2align	2
.LBB0_112:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x2, [sp, #312]                  // 8-byte Folded Reload
	add	x16, x1, x13
	add	x18, x14, x13
	add	x15, x15, #1
	add	x16, x16, #4
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	add	x17, x2, x13
	ldr	s2, [x14, x13]
	add	x17, x17, #4
	prfm	pldl1keep, [x17]
	prfm	pldl1keep, [x16]
	ldr	s3, [x2, x13]
	fmla	v1.2s, v2.2s, v3.2s
	ldr	s3, [x1, x13]
	add	x13, x13, #4
	fmla	v0.2s, v2.2s, v3.2s
	cmp	x15, x21
	b.lt	.LBB0_112
.LBB0_113:                              //   in Loop: Header=BB0_4 Depth=1
	str	s1, [x3, x11, lsl #2]
	str	s0, [x3, x12, lsl #2]
.LBB0_114:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #368]                 // 8-byte Folded Reload
	ldr	x12, [sp, #440]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_2
// %bb.115:                             //   in Loop: Header=BB0_4 Depth=1
	ldp	x15, x13, [sp, #432]            // 16-byte Folded Reload
	ldr	s2, [x8]
	mov	x11, xzr
	ldr	x14, [sp, #376]                 // 8-byte Folded Reload
	mul	x12, x13, x28
	add	x9, x9, x12
	mul	x12, x13, x19
	ldr	x13, [sp, #448]                 // 8-byte Folded Reload
	add	x9, x9, x5
	ldr	s0, [x15, x9, lsl #2]
	madd	x12, x20, x13, x12
	lsl	x12, x12, #2
	ldr	q1, [x25, x12]
	ldr	x12, [sp, #304]                 // 8-byte Folded Reload
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	xzr, x29
	b.ge	.LBB0_117
	.p2align	2
.LBB0_116:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
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
	cmp	x11, x29
	b.lt	.LBB0_116
.LBB0_117:                              //   in Loop: Header=BB0_4 Depth=1
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.2s
	mov	x10, xzr
	ldr	s4, [x8, x11, lsl #2]
	ldr	x11, [sp, #488]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[1]
	ldr	s5, [x8, x11, lsl #2]
	ldr	x11, [sp, #480]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.2s
	ldr	s2, [x8, x11, lsl #2]
	ldr	x11, [sp, #104]                 // 8-byte Folded Reload
	add	x8, x8, x11
	mov	x11, x27
	fmla	v0.2s, v2.2s, v1.s[3]
	cmp	x27, x21
	b.ge	.LBB0_1
	.p2align	2
.LBB0_118:                              //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
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
	cmp	x11, x21
	b.lt	.LBB0_118
	b	.LBB0_1
.LBB0_119:
	ldr	x0, [sp, #16]                   // 8-byte Folded Reload
	bl	free
	add	sp, sp, #512
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
	.size	sbatch_matmul_3d_nt_mlir, .Lfunc_end0-sbatch_matmul_3d_nt_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
