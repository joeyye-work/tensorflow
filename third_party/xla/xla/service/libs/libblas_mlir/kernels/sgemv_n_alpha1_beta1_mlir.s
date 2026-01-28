	.text
	.file	"LLVMDialectModule"
	.globl	sgemv_n_alpha1_beta1_mlir                            // -- Begin function sgemv_n_alpha1_beta1_mlir
	.p2align	4
	.type	sgemv_n_alpha1_beta1_mlir,@function
sgemv_n_alpha1_beta1_mlir:                                   // @sgemv_n_alpha1_beta1_mlir
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #16]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #32]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             // 16-byte Folded Spill
	.cfi_def_cfa_offset 112
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
	cmp	x4, #0
	ldr	x9, [sp, #112]
	lsl	x7, x5, #2
	mov	x27, xzr
	cinv	x8, x4, lt
	add	x0, x1, #448
	lsl	x2, x5, #4
	add	x10, x8, x8, lsr #63
	add	x11, x8, #3
	add	x12, x8, #7
	add	x19, x7, #448
	asr	x10, x10, #1
	mov	x15, x9
	cinv	x10, x10, lt
	cmp	x8, #0
	csel	x11, x11, x8, lt
	csel	x8, x12, x8, lt
	cmp	x4, #0
	asr	x11, x11, #2
	asr	x8, x8, #3
	cinv	x12, x11, lt
	cinv	x14, x8, lt
	cmp	x3, #0
	lsl	x11, x10, #3
	cinv	x6, x3, lt
	lsl	x13, x12, #4
	lsl	x16, x14, #5
	add	x21, x9, x11
	lsl	x12, x12, #2
	lsl	x14, x14, #3
	add	x8, x6, #3
	cmp	x6, #0
	csel	x8, x8, x6, lt
	cmp	x3, #0
	asr	x8, x8, #2
	cinv	x8, x8, lt
	stp	x8, x9, [sp]                    // 16-byte Folded Spill
	lsl	x17, x8, #2
	add	x8, x11, x1
	add	x20, x8, #72
	lsl	x8, x10, #1
	add	x10, x13, #128
	add	x22, x1, x10
	add	x23, x9, x10
	add	x10, x16, #256
	add	x24, x1, x10
	add	x25, x9, x10
	ldr	x10, [sp, #152]
	b	.LBB0_2
	.p2align	2
.LBB0_1:                                //   in Loop: Header=BB0_2 Depth=1
	mov	s5, v0.s[2]
	fadd	s2, s2, s0
	add	x0, x0, x2
	add	x20, x20, x2
	add	x24, x24, x2
	add	x22, x22, x2
	fadd	s3, s3, s5
	mov	s5, v0.s[1]
	mov	s0, v0.s[3]
	fadd	s4, s4, s5
	fadd	s0, s1, s0
	mov	v2.s[1], v4.s[0]
	mov	v2.s[2], v3.s[0]
	mov	v2.s[3], v0.s[0]
	str	q2, [x26]
.LBB0_2:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_4 Depth 2
                                        //     Child Loop BB0_6 Depth 2
                                        //     Child Loop BB0_8 Depth 2
                                        //     Child Loop BB0_10 Depth 2
	cmp	x27, x17
	b.ge	.LBB0_11
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	add	x26, x10, x27, lsl #2
	movi	v4.2d, #0000000000000000
	movi	v3.2d, #0000000000000000
	movi	v5.2d, #0000000000000000
	movi	v0.2d, #0000000000000000
	mov	x28, x0
	mov	x29, xzr
	mov	x30, x15
	ldr	q1, [x26]
	movi	v7.2d, #0000000000000000
	movi	v16.2d, #0000000000000000
	add	x27, x27, #4
	movi	v2.2d, #0000000000000000
	movi	v6.2d, #0000000000000000
	cmp	xzr, x14
	b.ge	.LBB0_5
	.p2align	2
.LBB0_4:                                //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sub	x18, x28, #448
	prfm	pldl1keep, [x28]
	add	x28, x28, #32
	add	x29, x29, #8
	ldp	q18, q17, [x18]
	add	x18, x18, x19
	prfm	pldl1keep, [x18]
	sub	x18, x18, #448
	add	x9, x18, x19
	ldp	q20, q19, [x18]
	prfm	pldl1keep, [x9]
	sub	x9, x9, #448
	add	x18, x9, x19
	ldp	q22, q21, [x9]
	add	x9, x30, #448
	prfm	pldl1keep, [x18]
	ldp	q23, q24, [x18, #-448]!
	prfm	pldl1keep, [x9]
	ldp	q26, q25, [x30], #32
	fmla	v6.4s, v21.4s, v25.4s
	fmla	v3.4s, v19.4s, v25.4s
	fmla	v7.4s, v24.4s, v25.4s
	fmla	v0.4s, v17.4s, v25.4s
	fmla	v5.4s, v22.4s, v26.4s
	fmla	v4.4s, v20.4s, v26.4s
	fmla	v2.4s, v18.4s, v26.4s
	fmla	v16.4s, v23.4s, v26.4s
	cmp	x29, x14
	b.lt	.LBB0_4
.LBB0_5:                                //   in Loop: Header=BB0_2 Depth=1
	mov	s17, v1.s[3]
	mov	s18, v16.s[1]
	mov	x28, x25
	mov	x29, x14
	mov	x30, x24
	fadd	s17, s17, s16
	fadd	s17, s17, s18
	mov	s18, v16.s[2]
	mov	s16, v16.s[3]
	fadd	s17, s17, s18
	fadd	s16, s17, s16
	mov	s17, v7.s[1]
	fadd	s16, s16, s7
	fadd	s16, s16, s17
	mov	s17, v7.s[2]
	mov	s7, v7.s[3]
	fadd	s16, s16, s17
	mov	s17, v5.s[1]
	fadd	s7, s16, s7
	mov	s16, v1.s[2]
	fadd	s16, s16, s5
	fadd	s16, s16, s17
	mov	s17, v5.s[2]
	mov	s5, v5.s[3]
	fadd	s16, s16, s17
	fadd	s5, s16, s5
	mov	s16, v6.s[1]
	fadd	s5, s5, s6
	fadd	s5, s5, s16
	mov	s16, v6.s[2]
	mov	s6, v6.s[3]
	fadd	s5, s5, s16
	mov	s16, v4.s[1]
	fadd	s5, s5, s6
	mov	s6, v1.s[1]
	fadd	s1, s1, s2
	fadd	s6, s6, s4
	fadd	s6, s6, s16
	mov	s16, v4.s[2]
	mov	s4, v4.s[3]
	fadd	s6, s6, s16
	fadd	s4, s6, s4
	mov	s6, v3.s[1]
	fadd	s4, s4, s3
	fadd	s4, s4, s6
	mov	s6, v3.s[2]
	mov	s3, v3.s[3]
	fadd	s4, s4, s6
	fadd	s3, s4, s3
	mov	s4, v2.s[1]
	fadd	s1, s1, s4
	mov	s4, v2.s[2]
	mov	s2, v2.s[3]
	fadd	s1, s1, s4
	movi	v4.2d, #0000000000000000
	fadd	s1, s1, s2
	mov	s2, v0.s[1]
	fadd	s1, s1, s0
	fadd	s1, s1, s2
	mov	s2, v0.s[2]
	mov	s0, v0.s[3]
	fadd	s1, s1, s2
	movi	v2.2d, #0000000000000000
	fadd	s0, s1, s0
	movi	v1.2d, #0000000000000000
	mov	v0.s[1], v3.s[0]
	movi	v3.2d, #0000000000000000
	mov	v0.s[2], v5.s[0]
	mov	v0.s[3], v7.s[0]
	str	q0, [x26]
	cmp	x14, x12
	b.ge	.LBB0_7
	.p2align	2
.LBB0_6:                                //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x9, x30, x7
	prfm	pldl1keep, [x30]
	ldur	q5, [x30, #-256]
	add	x30, x30, #16
	add	x18, x9, x7
	prfm	pldl1keep, [x9]
	ldur	q6, [x9, #-256]
	add	x29, x29, #4
	add	x9, x18, x7
	prfm	pldl1keep, [x18]
	ldur	q7, [x18, #-256]
	prfm	pldl1keep, [x9]
	ldur	q16, [x9, #-256]
	prfm	pldl1keep, [x28]
	ldur	q17, [x28, #-256]
	add	x28, x28, #16
	fmla	v3.4s, v7.4s, v17.4s
	fmla	v1.4s, v16.4s, v17.4s
	fmla	v4.4s, v6.4s, v17.4s
	fmla	v2.4s, v5.4s, v17.4s
	cmp	x29, x12
	b.lt	.LBB0_6
.LBB0_7:                                //   in Loop: Header=BB0_2 Depth=1
	mov	s5, v0.s[1]
	mov	s6, v4.s[1]
	mov	x28, x23
	mov	x29, x22
	mov	s7, v1.s[1]
	mov	x30, x12
	fadd	s5, s5, s4
	fadd	s5, s5, s6
	mov	s6, v4.s[2]
	mov	s4, v4.s[3]
	fadd	s5, s5, s6
	fadd	s6, s0, s2
	fadd	s4, s5, s4
	mov	s5, v2.s[1]
	fadd	s5, s6, s5
	mov	s6, v2.s[2]
	mov	s2, v2.s[3]
	fadd	s5, s5, s6
	movi	d6, #0000000000000000
	fadd	s2, s5, s2
	mov	s5, v3.s[1]
	mov	v2.s[1], v4.s[0]
	mov	s4, v0.s[2]
	mov	s0, v0.s[3]
	fadd	s4, s4, s3
	fadd	s0, s0, s1
	fadd	s4, s4, s5
	mov	s5, v3.s[2]
	fadd	s0, s0, s7
	mov	s7, v1.s[2]
	mov	s3, v3.s[3]
	mov	s1, v1.s[3]
	fadd	s4, s4, s5
	fadd	s0, s0, s7
	movi	d5, #0000000000000000
	fadd	s3, s4, s3
	fadd	s0, s0, s1
	movi	d4, #0000000000000000
	mov	v2.s[2], v3.s[0]
	movi	d3, #0000000000000000
	mov	v2.s[3], v0.s[0]
	str	q2, [x26]
	cmp	x12, x8
	b.ge	.LBB0_9
	.p2align	2
.LBB0_8:                                //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x9, x29, x7
	prfm	pldl1keep, [x29]
	ldur	d0, [x29, #-128]
	add	x29, x29, #8
	add	x18, x9, x7
	prfm	pldl1keep, [x9]
	ldur	d1, [x9, #-128]
	add	x30, x30, #2
	add	x9, x18, x7
	prfm	pldl1keep, [x18]
	ldur	d7, [x18, #-128]
	prfm	pldl1keep, [x9]
	ldur	d16, [x9, #-128]
	prfm	pldl1keep, [x28]
	ldur	d17, [x28, #-128]
	add	x28, x28, #8
	fmla	v5.2s, v7.2s, v17.2s
	fmla	v6.2s, v16.2s, v17.2s
	fmla	v4.2s, v1.2s, v17.2s
	fmla	v3.2s, v0.2s, v17.2s
	cmp	x30, x8
	b.lt	.LBB0_8
.LBB0_9:                                //   in Loop: Header=BB0_2 Depth=1
	mov	s0, v2.s[3]
	mov	s1, v6.s[1]
	mov	x28, x21
	mov	x29, x20
	mov	x30, x8
	fadd	s0, s0, s6
	mov	s6, v2.s[2]
	fadd	s6, s6, s5
	fadd	s1, s0, s1
	mov	s0, v2.s[1]
	fadd	s2, s2, s3
	fadd	s0, s0, s4
	mov	s4, v4.s[1]
	fadd	s4, s0, s4
	mov	s0, v5.s[1]
	fadd	s5, s6, s0
	mov	s0, v3.s[1]
	movi	d3, #0000000000000000
	fadd	s0, s2, s0
	movi	d2, #0000000000000000
	mov	v0.s[1], v4.s[0]
	movi	d4, #0000000000000000
	mov	v0.s[2], v5.s[0]
	mov	v0.s[3], v1.s[0]
	movi	d1, #0000000000000000
	str	q0, [x26]
	cmp	x8, x4
	b.ge	.LBB0_1
	.p2align	2
.LBB0_10:                               //   Parent Loop BB0_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x9, x29, x7
	prfm	pldl1keep, [x29]
	ldur	s5, [x29, #-72]
	add	x29, x29, #4
	add	x18, x9, x7
	prfm	pldl1keep, [x9]
	ldur	s6, [x9, #-72]
	add	x30, x30, #1
	prfm	pldl1keep, [x18]
	add	x9, x18, x7
	ldur	s7, [x18, #-72]
	add	x18, x28, #72
	prfm	pldl1keep, [x9]
	ldur	s16, [x9, #-72]
	prfm	pldl1keep, [x18]
	ldr	s17, [x28], #4
	fmul	s7, s7, s17
	fmul	s6, s6, s17
	fmul	s5, s5, s17
	fadd	v3.2s, v3.2s, v7.2s
	fmul	s7, s16, s17
	fadd	v4.2s, v4.2s, v6.2s
	fadd	v2.2s, v2.2s, v5.2s
	fadd	v1.2s, v1.2s, v7.2s
	cmp	x30, x4
	b.lt	.LBB0_10
	b	.LBB0_1
.LBB0_11:
	add	x9, x6, x6, lsr #63
	cmp	x3, #0
	asr	x9, x9, #1
	cinv	x2, x9, lt
	lsl	x0, x2, #1
	cmp	x17, x0
	b.ge	.LBB0_21
// %bb.12:
	ldr	x9, [sp]                        // 8-byte Folded Reload
	movi	v4.2d, #0000000000000000
	movi	v2.2d, #0000000000000000
	mov	x7, x15
	movi	v3.2d, #0000000000000000
	movi	v0.2d, #0000000000000000
	mov	x19, xzr
	mul	x9, x9, x5
	add	x18, x1, x9, lsl #4
	add	x9, x17, #1
	add	x17, x10, x17, lsl #2
	mul	x9, x5, x9
	ldr	d1, [x17]
	mov	x20, x18
	add	x6, x1, x9, lsl #2
	mov	x21, x6
	cmp	xzr, x14
	b.ge	.LBB0_14
	.p2align	2
.LBB0_13:                               // =>This Inner Loop Header: Depth=1
	add	x9, x20, #736
	add	x19, x19, #8
	prfm	pldl1keep, [x9]
	add	x9, x21, #736
	ldp	q6, q5, [x20], #32
	prfm	pldl1keep, [x9]
	add	x9, x7, #736
	ldp	q16, q7, [x21], #32
	prfm	pldl1keep, [x9]
	ldr	q17, [x7, #16]
	fmla	v0.4s, v5.4s, v17.4s
	fmla	v3.4s, v7.4s, v17.4s
	ldr	q5, [x7], #32
	fmla	v4.4s, v16.4s, v5.4s
	fmla	v2.4s, v6.4s, v5.4s
	cmp	x19, x14
	b.lt	.LBB0_13
.LBB0_14:
	mov	s5, v1.s[1]
	mov	s6, v4.s[1]
	mov	x7, x18
	mov	x19, x6
	fadd	s1, s1, s2
	mov	x20, x14
	mov	x21, x15
	fadd	s5, s5, s4
	fadd	s5, s5, s6
	mov	s6, v4.s[2]
	mov	s4, v4.s[3]
	fadd	s5, s5, s6
	fadd	s4, s5, s4
	mov	s5, v3.s[1]
	fadd	s4, s4, s3
	fadd	s4, s4, s5
	mov	s5, v3.s[2]
	mov	s3, v3.s[3]
	fadd	s4, s4, s5
	fadd	s3, s4, s3
	mov	s4, v2.s[1]
	fadd	s1, s1, s4
	mov	s4, v2.s[2]
	mov	s2, v2.s[3]
	fadd	s1, s1, s4
	fadd	s1, s1, s2
	mov	s2, v0.s[1]
	fadd	s1, s1, s0
	fadd	s1, s1, s2
	mov	s2, v0.s[2]
	mov	s0, v0.s[3]
	fadd	s1, s1, s2
	movi	v2.2d, #0000000000000000
	fadd	s0, s1, s0
	movi	v1.2d, #0000000000000000
	mov	v0.s[1], v3.s[0]
	str	d0, [x17]
	cmp	x14, x12
	b.ge	.LBB0_16
	.p2align	2
.LBB0_15:                               // =>This Inner Loop Header: Depth=1
	add	x9, x7, x16
	add	x20, x20, #4
	add	x9, x9, #432
	prfm	pldl1keep, [x9]
	add	x9, x19, x16
	ldr	q3, [x7, x16]
	add	x7, x7, #16
	add	x9, x9, #432
	prfm	pldl1keep, [x9]
	add	x9, x21, x16
	add	x9, x9, #432
	ldr	q4, [x19, x16]
	add	x19, x19, #16
	prfm	pldl1keep, [x9]
	ldr	q5, [x21, x16]
	add	x21, x21, #16
	fmla	v2.4s, v4.4s, v5.4s
	fmla	v1.4s, v3.4s, v5.4s
	cmp	x20, x12
	b.lt	.LBB0_15
.LBB0_16:
	mov	s3, v0.s[1]
	mov	s4, v2.s[1]
	mov	x7, x18
	mov	x19, x6
	fadd	s0, s0, s1
	mov	x20, x15
	mov	x21, x12
	fadd	s3, s3, s2
	fadd	s3, s3, s4
	mov	s4, v2.s[2]
	mov	s2, v2.s[3]
	fadd	s3, s3, s4
	fadd	s2, s3, s2
	mov	s3, v1.s[1]
	fadd	s0, s0, s3
	mov	s3, v1.s[2]
	mov	s1, v1.s[3]
	fadd	s0, s0, s3
	fadd	s0, s0, s1
	movi	d1, #0000000000000000
	mov	v0.s[1], v2.s[0]
	movi	d2, #0000000000000000
	str	d0, [x17]
	cmp	x12, x8
	b.ge	.LBB0_18
	.p2align	2
.LBB0_17:                               // =>This Inner Loop Header: Depth=1
	add	x9, x7, x13
	add	x21, x21, #2
	add	x9, x9, #216
	prfm	pldl1keep, [x9]
	add	x9, x19, x13
	ldr	d3, [x7, x13]
	add	x7, x7, #8
	add	x9, x9, #216
	prfm	pldl1keep, [x9]
	add	x9, x20, x13
	add	x9, x9, #216
	ldr	d4, [x19, x13]
	add	x19, x19, #8
	prfm	pldl1keep, [x9]
	ldr	d5, [x20, x13]
	add	x20, x20, #8
	fmla	v2.2s, v4.2s, v5.2s
	fmla	v1.2s, v3.2s, v5.2s
	cmp	x21, x8
	b.lt	.LBB0_17
.LBB0_18:
	mov	s3, v0.s[1]
	fadd	s0, s0, s1
	mov	x7, x15
	mov	x19, x8
	fadd	s3, s3, s2
	mov	s2, v2.s[1]
	fadd	s2, s3, s2
	mov	s3, v1.s[1]
	movi	d1, #0000000000000000
	fadd	s0, s0, s3
	mov	v0.s[1], v2.s[0]
	movi	d2, #0000000000000000
	str	d0, [x17]
	cmp	x8, x4
	b.ge	.LBB0_20
	.p2align	2
.LBB0_19:                               // =>This Inner Loop Header: Depth=1
	add	x9, x18, x11
	add	x19, x19, #1
	add	x9, x9, #128
	prfm	pldl1keep, [x9]
	add	x9, x6, x11
	ldr	s3, [x18, x11]
	add	x18, x18, #4
	add	x9, x9, #128
	prfm	pldl1keep, [x9]
	add	x9, x7, x11
	add	x9, x9, #128
	ldr	s4, [x6, x11]
	add	x6, x6, #4
	prfm	pldl1keep, [x9]
	ldr	s5, [x7, x11]
	add	x7, x7, #4
	fmul	s4, s4, s5
	fmul	s3, s3, s5
	fadd	v1.2s, v1.2s, v4.2s
	fadd	v2.2s, v2.2s, v3.2s
	cmp	x19, x4
	b.lt	.LBB0_19
.LBB0_20:
	mov	s3, v0.s[1]
	fadd	s0, s2, s0
	fadd	s1, s1, s3
	mov	v0.s[1], v1.s[0]
	str	d0, [x17]
.LBB0_21:
	cmp	x0, x3
	b.ge	.LBB0_31
// %bb.22:
	mul	x17, x2, x5
	ldr	s2, [x10, x0, lsl #2]
	movi	v0.2d, #0000000000000000
	movi	v1.2d, #0000000000000000
	mov	x18, xzr
	add	x2, x1, x17, lsl #3
	cmp	xzr, x14
	b.ge	.LBB0_24
	.p2align	2
.LBB0_23:                               // =>This Inner Loop Header: Depth=1
	add	x9, x2, #1152
	add	x18, x18, #8
	prfm	pldl1keep, [x9]
	add	x9, x15, #1152
	ldp	q3, q4, [x2], #32
	prfm	pldl1keep, [x9]
	ldr	q5, [x15]
	fmla	v1.4s, v3.4s, v5.4s
	ldr	q3, [x15, #16]
	add	x15, x15, #32
	fmla	v0.4s, v4.4s, v3.4s
	cmp	x18, x14
	b.lt	.LBB0_23
.LBB0_24:
	fadd	s2, s2, s1
	mov	s3, v1.s[1]
	ldr	x18, [sp, #8]                   // 8-byte Folded Reload
	add	x9, x16, x17, lsl #3
	add	x15, x1, x9
	add	x16, x18, x16
	fadd	s2, s2, s3
	mov	s3, v1.s[2]
	mov	s1, v1.s[3]
	fadd	s2, s2, s3
	fadd	s1, s2, s1
	mov	s2, v0.s[1]
	fadd	s1, s1, s0
	fadd	s1, s1, s2
	mov	s2, v0.s[2]
	mov	s0, v0.s[3]
	fadd	s1, s1, s2
	fadd	s0, s1, s0
	movi	v1.2d, #0000000000000000
	str	s0, [x10, x0, lsl #2]
	cmp	x14, x12
	b.ge	.LBB0_26
	.p2align	2
.LBB0_25:                               // =>This Inner Loop Header: Depth=1
	add	x9, x15, #672
	add	x14, x14, #4
	prfm	pldl1keep, [x9]
	add	x9, x16, #672
	ldr	q2, [x15], #16
	prfm	pldl1keep, [x9]
	ldr	q3, [x16], #16
	fmla	v1.4s, v2.4s, v3.4s
	cmp	x14, x12
	b.lt	.LBB0_25
.LBB0_26:
	fadd	s0, s0, s1
	mov	s2, v1.s[1]
	add	x9, x13, x17, lsl #3
	add	x13, x18, x13
	add	x14, x1, x9
	fadd	s0, s0, s2
	mov	s2, v1.s[2]
	mov	s1, v1.s[3]
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	movi	d1, #0000000000000000
	str	s0, [x10, x0, lsl #2]
	cmp	x12, x8
	b.ge	.LBB0_28
	.p2align	2
.LBB0_27:                               // =>This Inner Loop Header: Depth=1
	add	x9, x14, #336
	add	x12, x12, #2
	prfm	pldl1keep, [x9]
	add	x9, x13, #336
	ldr	d2, [x14], #8
	prfm	pldl1keep, [x9]
	ldr	d3, [x13], #8
	fmla	v1.2s, v2.2s, v3.2s
	cmp	x12, x8
	b.lt	.LBB0_27
.LBB0_28:
	fadd	s0, s0, s1
	mov	s2, v1.s[1]
	add	x9, x11, x17, lsl #3
	add	x12, x1, x9
	movi	d1, #0000000000000000
	add	x9, x18, x11
	fadd	s0, s0, s2
	str	s0, [x10, x0, lsl #2]
	cmp	x8, x4
	b.ge	.LBB0_30
	.p2align	2
.LBB0_29:                               // =>This Inner Loop Header: Depth=1
	add	x11, x12, #200
	add	x8, x8, #1
	prfm	pldl1keep, [x11]
	add	x11, x9, #200
	ldr	s2, [x12], #4
	prfm	pldl1keep, [x11]
	ldr	s3, [x9], #4
	fmul	s2, s2, s3
	fadd	v1.2s, v1.2s, v2.2s
	cmp	x8, x4
	b.lt	.LBB0_29
.LBB0_30:
	fadd	s0, s1, s0
	str	s0, [x10, x0, lsl #2]
.LBB0_31:
	ldp	x20, x19, [sp, #96]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]             // 16-byte Folded Reload
	add	sp, sp, #112
	ret
.Lfunc_end0:
	.size	sgemv_n_alpha1_beta1_mlir, .Lfunc_end0-sgemv_n_alpha1_beta1_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
