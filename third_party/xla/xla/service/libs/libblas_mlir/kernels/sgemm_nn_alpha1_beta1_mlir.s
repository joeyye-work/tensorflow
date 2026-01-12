	.text
	.file	"LLVMDialectModule"
	.globl	sgemm_nn_alpha1_beta1_mlir                            // -- Begin function sgemm_nn_alpha1_beta1_mlir
	.p2align	4
	.type	sgemm_nn_alpha1_beta1_mlir,@function
sgemm_nn_alpha1_beta1_mlir:                                   // @sgemm_nn_alpha1_beta1_mlir
	.cfi_startproc
// %bb.0:
	str	d12, [sp, #-144]!               // 8-byte Folded Spill
	stp	d11, d10, [sp, #16]             // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            // 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               // 16-byte Folded Spill
	sub	sp, sp, #512
	.cfi_def_cfa_offset 656
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
	.cfi_offset b12, -144
	cmp	x3, #0
	ldr	x29, [sp, #688]
	ldr	x20, [sp, #656]
	mov	x22, x5
	cinv	x8, x3, lt
	ldr	x26, [sp, #664]
	ldr	x27, [sp, #744]
	mov	x19, x4
	add	x10, x8, x8, lsr #63
	add	x9, x8, #7
	str	x2, [sp, #320]                  // 8-byte Folded Spill
	mov	x25, x1
	str	x3, [sp, #288]                  // 8-byte Folded Spill
	asr	x10, x10, #1
	cinv	x23, x10, lt
	cmp	x8, #0
	add	x10, x8, #3
	csel	x9, x9, x8, lt
	csel	x8, x10, x8, lt
	cmp	x3, #0
	asr	x9, x9, #3
	asr	x8, x8, #2
	cinv	x24, x9, lt
	ldr	x9, [sp, #680]
	cinv	x21, x8, lt
	cmp	x9, #0
	str	x9, [sp, #128]                  // 8-byte Folded Spill
	cinv	x10, x9, lt
	add	x8, x10, #7
	cmp	x10, #0
	str	x10, [sp, #112]                 // 8-byte Folded Spill
	csel	x8, x8, x10, lt
	cmp	x9, #0
	ldr	x10, [sp, #712]
	ldr	x9, [sp, #720]
	asr	x8, x8, #3
	cinv	x8, x8, lt
	str	x8, [sp, #16]                   // 8-byte Folded Spill
	lsl	x8, x8, #3
	str	x8, [sp, #384]                  // 8-byte Folded Spill
	lsl	x8, x4, #5
	stp	x9, x10, [sp, #256]             // 16-byte Folded Spill
	add	x0, x8, #64
	str	x8, [sp, #504]                  // 8-byte Folded Spill
	bl	malloc
	lsl	x8, x24, #3
	mul	x3, x24, x22
	mov	w9, #1                          // =0x1
	add	x12, x0, #63
	str	x8, [sp, #520]                  // 8-byte Folded Spill
	lsl	x8, x21, #2
	bfi	x9, x21, #2, #62
	and	x11, x19, #0x3
	str	x8, [sp, #336]                  // 8-byte Folded Spill
	lsl	x8, x23, #1
	mul	x9, x22, x9
	str	x0, [sp, #56]                   // 8-byte Folded Spill
	str	x8, [sp, #312]                  // 8-byte Folded Spill
	negs	x8, x19
	mul	x0, x23, x22
	mul	x2, x21, x22
	and	x13, x8, #0x3
	and	x8, x12, #0xffffffffffffffc0
	ldr	x12, [sp, #320]                 // 8-byte Folded Reload
	lsl	x5, x19, #2
	csneg	x18, x11, x13, mi
	add	x11, x19, x3, lsl #3
	add	x16, x19, x0, lsl #1
	lsl	x28, x22, #2
	lsl	x6, x18, #2
	add	x10, x19, x22, lsl #3
	lsl	x4, x22, #5
	mov	w15, #28                        // =0x1c
	sub	x23, x11, x18
	add	x11, x19, x9
	add	x9, x25, x9, lsl #2
	sub	x13, x4, x28
	lsl	x24, x12, #2
	sub	x11, x11, x18
	add	x14, x19, x2, lsl #2
	sub	x12, x5, x6
	str	x9, [sp, #168]                  // 8-byte Folded Spill
	add	x9, x24, x11, lsl #2
	lsl	x21, x26, #2
	add	x17, x12, #4
	madd	x1, x29, x15, x20
	sub	x15, x16, x18
	add	x16, x24, x25
	stp	x13, x12, [sp, #64]             // 16-byte Folded Spill
	sub	x12, x10, x18
	sub	x10, x14, x18
	madd	x14, x29, x17, x21
	add	x16, x13, x16
	add	x9, x25, x9
	add	x16, x16, #16
	str	x9, [sp, #480]                  // 8-byte Folded Spill
	add	x9, x24, x10, lsl #2
	str	x16, [sp, #240]                 // 8-byte Folded Spill
	mov	w16, #16                        // =0x10
	sub	x30, x19, x18
	sub	x13, x16, x13
	add	x9, x25, x9
	mul	x17, x29, x30
	str	x13, [sp, #232]                 // 8-byte Folded Spill
	add	x13, x20, x14
	stp	x13, x9, [sp, #464]             // 16-byte Folded Spill
	add	x9, x24, x15, lsl #2
	ldr	x13, [sp, #504]                 // 8-byte Folded Reload
	add	x14, x5, x24
	sub	x14, x14, x6
	add	x16, x21, x17, lsl #2
	add	x14, x14, x25
	add	x9, x9, x25
	sub	x10, x30, #3
	stp	x17, x18, [sp, #96]             // 16-byte Folded Spill
	add	x11, x20, x29, lsl #5
	add	x9, x9, #4
	str	x26, [sp, #280]                 // 8-byte Folded Spill
	lsl	x26, x29, #4
	stp	x20, x29, [sp, #296]            // 16-byte Folded Spill
	str	x9, [sp, #152]                  // 8-byte Folded Spill
	sub	x9, x30, #2
	sub	x17, x13, x18, lsl #5
	add	x13, x14, #4
	add	x14, x24, x12, lsl #2
	add	x12, x4, x24
	stp	x10, x9, [sp, #400]             // 16-byte Folded Spill
	sub	x9, x30, #1
	str	x13, [sp, #224]                 // 8-byte Folded Spill
	add	x13, x20, x16
	add	x12, x12, x25
	str	x9, [sp, #416]                  // 8-byte Folded Spill
	mov	w9, #20                         // =0x14
	str	x13, [sp, #456]                 // 8-byte Folded Spill
	add	x13, x12, #32
	add	x12, x14, x25
	madd	x9, x29, x9, x20
	add	x12, x12, #4
	stp	x12, x13, [sp, #208]            // 16-byte Folded Spill
	add	x12, x24, x3, lsl #5
	add	x13, x24, x23, lsl #2
	stp	x6, x14, [sp, #80]              // 16-byte Folded Spill
	mov	w10, #24                        // =0x18
	lsl	x18, x29, #2
	add	x12, x12, x25
	madd	x6, x29, x10, x20
	add	x10, x20, x18
	str	x25, [sp, #328]                 // 8-byte Folded Spill
	stp	x9, x11, [sp, #440]             // 16-byte Folded Spill
	add	x11, x20, x29, lsl #3
	add	x14, x12, #32
	add	x12, x13, x25
	add	x12, x12, #4
	add	x9, x20, x26
	mov	x7, xzr
	str	x5, [sp, #120]                  // 8-byte Folded Spill
	str	x11, [sp, #432]                 // 8-byte Folded Spill
	add	x11, x8, #64
	stp	x12, x14, [sp, #176]            // 16-byte Folded Spill
	add	x12, x17, #32
	str	x11, [sp, #192]                 // 8-byte Folded Spill
	mov	w11, #12                        // =0xc
	add	x13, x8, x17
	sub	x23, x30, #4
	madd	x11, x29, x11, x20
	mov	x20, x1
	mov	x1, x9
	add	x9, x8, x12
	stp	x9, x4, [sp, #488]              // 16-byte Folded Spill
	add	x9, x24, x0, lsl #3
	add	x5, x8, #128
	stp	x2, x0, [sp, #40]               // 16-byte Folded Spill
	mov	x0, x10
	stp	x9, x3, [sp, #24]               // 16-byte Folded Spill
	str	x12, [sp, #160]                 // 8-byte Folded Spill
	add	x9, x25, x9
	str	x30, [sp, #504]                 // 8-byte Folded Spill
	str	x24, [sp, #344]                 // 8-byte Folded Spill
	str	x9, [sp, #144]                  // 8-byte Folded Spill
	add	x9, x9, #32
	str	x11, [sp, #424]                 // 8-byte Folded Spill
	str	x18, [sp, #272]                 // 8-byte Folded Spill
	str	x9, [sp, #136]                  // 8-byte Folded Spill
	add	x9, x25, x2, lsl #4
	ldr	x25, [sp, #384]                 // 8-byte Folded Reload
	str	x13, [sp, #200]                 // 8-byte Folded Spill
	str	x9, [sp, #248]                  // 8-byte Folded Spill
	b	.LBB0_3
	.p2align	2
.LBB0_1:                                //   in Loop: Header=BB0_3 Depth=1
	stp	q1, q0, [x10]
.LBB0_2:                                // %.backedge
                                        //   in Loop: Header=BB0_3 Depth=1
	ldp	x9, x11, [sp, #440]             // 16-byte Folded Reload
	ldr	x20, [sp, #376]                 // 8-byte Folded Reload
	add	x6, x6, #32
	add	x1, x1, #32
	ldp	x7, x0, [sp, #352]              // 16-byte Folded Reload
	ldr	x30, [sp, #504]                 // 8-byte Folded Reload
	add	x10, x11, #32
	add	x20, x20, #32
	add	x0, x0, #32
	add	x9, x9, #32
	stp	x9, x10, [sp, #440]             // 16-byte Folded Spill
	ldp	x9, x11, [sp, #424]             // 16-byte Folded Reload
	add	x10, x11, #32
	add	x9, x9, #32
	stp	x9, x10, [sp, #424]             // 16-byte Folded Spill
	ldp	x9, x11, [sp, #456]             // 16-byte Folded Reload
	add	x10, x11, #32
	add	x9, x9, #32
	stp	x9, x10, [sp, #456]             // 16-byte Folded Spill
.LBB0_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_5 Depth 2
                                        //     Child Loop BB0_7 Depth 2
                                        //     Child Loop BB0_10 Depth 2
                                        //       Child Loop BB0_12 Depth 3
                                        //       Child Loop BB0_14 Depth 3
                                        //     Child Loop BB0_19 Depth 2
                                        //     Child Loop BB0_21 Depth 2
                                        //     Child Loop BB0_24 Depth 2
                                        //     Child Loop BB0_26 Depth 2
                                        //     Child Loop BB0_29 Depth 2
                                        //     Child Loop BB0_31 Depth 2
	cmp	x7, x25
	b.ge	.LBB0_32
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	add	x10, x7, #8
	add	x12, x7, x27, lsl #1
	ldr	x17, [sp, #192]                 // 8-byte Folded Reload
	mov	x9, xzr
	str	x10, [sp, #352]                 // 8-byte Folded Spill
	ldp	x11, x10, [sp, #256]            // 16-byte Folded Reload
	stp	x0, x1, [sp, #360]              // 16-byte Folded Spill
	ldp	x14, x3, [sp, #232]             // 16-byte Folded Reload
	ldp	x4, x24, [sp, #440]             // 16-byte Folded Reload
	str	x6, [sp, #392]                  // 8-byte Folded Spill
	str	x20, [sp, #376]                 // 8-byte Folded Spill
	add	x2, x10, x11, lsl #2
	add	x11, x27, x7
	lsl	x10, x7, #2
	add	x11, x2, x11, lsl #2
	add	x15, x2, x12, lsl #2
	add	x12, x12, x27
	add	x13, x2, x10
	add	x12, x2, x12, lsl #2
	ldp	q1, q0, [x13]
	ldp	q3, q2, [x11]
	add	x11, x7, x27, lsl #2
	ldp	q6, q5, [x15]
	ldp	x15, x18, [sp, #424]            // 16-byte Folded Reload
	ldp	q7, q4, [x12]
	add	x12, x2, x11, lsl #2
	add	x11, x11, x27
	add	x11, x2, x11, lsl #2
	ldp	q17, q16, [x12]
	ldp	x13, x12, [sp, #320]            // 16-byte Folded Reload
	ldp	q19, q18, [x11]
	mov	w11, #6                         // =0x6
	madd	x11, x27, x11, x7
	add	x16, x12, x13, lsl #2
	lsl	x12, x22, #3
	add	x11, x2, x11, lsl #2
	ldr	q25, [x16, x12]
	ldr	x12, [sp, #280]                 // 8-byte Folded Reload
	ldr	q26, [x16, x28]
	ldr	q28, [x16, x22, lsl #4]
	ldr	q30, [x16]
	ldp	q21, q20, [x11]
	mov	w11, #12                        // =0xc
	mul	x11, x22, x11
	ldr	q27, [x16, x11]
	sub	x11, x7, x27
	add	x11, x11, x27, lsl #3
	add	x11, x2, x11, lsl #2
	ldp	q23, q22, [x11]
	ldr	x11, [sp, #296]                 // 8-byte Folded Reload
	add	x11, x11, x12, lsl #2
	mov	w12, #20                        // =0x14
	mul	x12, x22, x12
	add	x10, x11, x10
	ldp	q8, q9, [x10]
	ldr	q24, [x16, x12]
	mov	w12, #24                        // =0x18
	mul	x12, x22, x12
	ldr	q29, [x16, x12]
	prfm	pldl1keep, [x3]
	ldur	q31, [x3, #-16]
	cmp	xzr, x23
	b.ge	.LBB0_6
	.p2align	2
.LBB0_5:                                //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x4, x21
	add	x29, x0, x21
	fmla	v1.4s, v8.4s, v30.s[0]
	fmla	v0.4s, v9.4s, v30.s[0]
	fmla	v3.4s, v8.4s, v26.s[0]
	fmla	v2.4s, v9.4s, v26.s[0]
	stp	q8, q9, [x17, #-64]
	fmla	v6.4s, v8.4s, v25.s[0]
	fmla	v5.4s, v9.4s, v25.s[0]
	prfm	pldl1keep, [x12]
	add	x25, x6, x21
	fmla	v7.4s, v8.4s, v27.s[0]
	fmla	v4.4s, v9.4s, v27.s[0]
	add	x12, x18, x21
	add	x13, x20, x21
	fmla	v16.4s, v9.4s, v28.s[0]
	fmla	v17.4s, v8.4s, v28.s[0]
	add	x10, x24, x21
	add	x9, x9, #4
	fmla	v18.4s, v9.4s, v24.s[0]
	fmla	v19.4s, v8.4s, v24.s[0]
	add	x24, x24, x26
	add	x20, x20, x26
	fmla	v20.4s, v9.4s, v29.s[0]
	fmla	v21.4s, v8.4s, v29.s[0]
	add	x6, x6, x26
	add	x4, x4, x26
	fmla	v22.4s, v9.4s, v31.s[0]
	fmla	v23.4s, v8.4s, v31.s[0]
	ldp	q8, q9, [x29]
	fmla	v0.4s, v9.4s, v30.s[1]
	fmla	v1.4s, v8.4s, v30.s[1]
	stp	q8, q9, [x17, #-32]
	prfm	pldl1keep, [x25]
	fmla	v2.4s, v9.4s, v26.s[1]
	fmla	v3.4s, v8.4s, v26.s[1]
	add	x0, x0, x26
	fmla	v5.4s, v9.4s, v25.s[1]
	fmla	v6.4s, v8.4s, v25.s[1]
	add	x18, x18, x26
	fmla	v4.4s, v9.4s, v27.s[1]
	fmla	v7.4s, v8.4s, v27.s[1]
	fmla	v17.4s, v8.4s, v28.s[1]
	fmla	v16.4s, v9.4s, v28.s[1]
	fmla	v19.4s, v8.4s, v24.s[1]
	fmla	v18.4s, v9.4s, v24.s[1]
	fmla	v21.4s, v8.4s, v29.s[1]
	fmla	v20.4s, v9.4s, v29.s[1]
	fmla	v23.4s, v8.4s, v31.s[1]
	fmla	v22.4s, v9.4s, v31.s[1]
	ldp	q9, q8, [x12]
	add	x12, x15, x21
	stp	q9, q8, [x17]
	prfm	pldl1keep, [x13]
	add	x15, x15, x26
	ldp	q11, q10, [x12]
	add	x12, x1, x21
	add	x1, x1, x26
	fmla	v1.4s, v9.4s, v30.s[2]
	fmla	v0.4s, v8.4s, v30.s[2]
	stp	q11, q10, [x17, #32]
	fmla	v3.4s, v9.4s, v26.s[2]
	fmla	v2.4s, v8.4s, v26.s[2]
	prfm	pldl1keep, [x10]
	add	x10, x3, x14
	fmla	v6.4s, v9.4s, v25.s[2]
	fmla	v5.4s, v8.4s, v25.s[2]
	add	x3, x3, #16
	add	x17, x17, #128
	fmla	v7.4s, v9.4s, v27.s[2]
	fmla	v4.4s, v8.4s, v27.s[2]
	fmla	v16.4s, v8.4s, v28.s[2]
	fmla	v17.4s, v9.4s, v28.s[2]
	fmla	v18.4s, v8.4s, v24.s[2]
	fmla	v19.4s, v9.4s, v24.s[2]
	fmla	v20.4s, v8.4s, v29.s[2]
	fmla	v21.4s, v9.4s, v29.s[2]
	fmla	v22.4s, v8.4s, v31.s[2]
	fmla	v23.4s, v9.4s, v31.s[2]
	ldp	q8, q9, [x12]
	prfm	pldl1keep, [x10]
	fmla	v0.4s, v10.4s, v30.s[3]
	fmla	v1.4s, v11.4s, v30.s[3]
	ldur	q30, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v2.4s, v10.4s, v26.s[3]
	fmla	v3.4s, v11.4s, v26.s[3]
	ldur	q26, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v5.4s, v10.4s, v25.s[3]
	fmla	v6.4s, v11.4s, v25.s[3]
	ldur	q25, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v4.4s, v10.4s, v27.s[3]
	fmla	v7.4s, v11.4s, v27.s[3]
	ldur	q27, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v17.4s, v11.4s, v28.s[3]
	fmla	v16.4s, v10.4s, v28.s[3]
	ldur	q28, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v19.4s, v11.4s, v24.s[3]
	fmla	v18.4s, v10.4s, v24.s[3]
	ldur	q24, [x10, #-16]
	add	x10, x10, x28
	prfm	pldl1keep, [x10]
	fmla	v21.4s, v11.4s, v29.s[3]
	fmla	v20.4s, v10.4s, v29.s[3]
	ldur	q29, [x10, #-16]
	fmla	v23.4s, v11.4s, v31.s[3]
	fmla	v22.4s, v10.4s, v31.s[3]
	prfm	pldl1keep, [x3]
	ldur	q31, [x3, #-16]
	cmp	x9, x23
	b.lt	.LBB0_5
.LBB0_6:                                //   in Loop: Header=BB0_3 Depth=1
	ldp	x13, x12, [sp, #400]            // 16-byte Folded Reload
	ldr	x14, [sp, #304]                 // 8-byte Folded Reload
	add	x10, x8, x23, lsl #5
	fmla	v1.4s, v8.4s, v30.s[0]
	fmla	v0.4s, v9.4s, v30.s[0]
	fmla	v3.4s, v8.4s, v26.s[0]
	fmla	v2.4s, v9.4s, v26.s[0]
	stp	q8, q9, [x10]
	fmla	v6.4s, v8.4s, v25.s[0]
	fmla	v5.4s, v9.4s, v25.s[0]
	fmla	v4.4s, v9.4s, v27.s[0]
	fmla	v7.4s, v8.4s, v27.s[0]
	ldp	x1, x18, [sp, #456]             // 16-byte Folded Reload
	madd	x9, x13, x14, x7
	fmla	v16.4s, v9.4s, v28.s[0]
	fmla	v17.4s, v8.4s, v28.s[0]
	madd	x10, x12, x14, x7
	fmla	v18.4s, v9.4s, v24.s[0]
	fmla	v19.4s, v8.4s, v24.s[0]
	add	x0, x8, x12, lsl #5
	ldr	x12, [sp, #416]                 // 8-byte Folded Reload
	fmla	v20.4s, v9.4s, v29.s[0]
	fmla	v21.4s, v8.4s, v29.s[0]
	mov	x15, xzr
	add	x9, x11, x9, lsl #2
	fmla	v22.4s, v9.4s, v31.s[0]
	fmla	v23.4s, v8.4s, v31.s[0]
	add	x10, x11, x10, lsl #2
	ldp	q8, q9, [x9]
	add	x9, x8, x13, lsl #5
	fmla	v0.4s, v9.4s, v30.s[1]
	fmla	v2.4s, v9.4s, v26.s[1]
	fmla	v5.4s, v9.4s, v25.s[1]
	fmla	v4.4s, v9.4s, v27.s[1]
	fmla	v16.4s, v9.4s, v28.s[1]
	fmla	v18.4s, v9.4s, v24.s[1]
	fmla	v20.4s, v9.4s, v29.s[1]
	fmla	v22.4s, v9.4s, v31.s[1]
	fmla	v1.4s, v8.4s, v30.s[1]
	stp	q8, q9, [x9]
	fmla	v3.4s, v8.4s, v26.s[1]
	fmla	v6.4s, v8.4s, v25.s[1]
	fmla	v7.4s, v8.4s, v27.s[1]
	fmla	v17.4s, v8.4s, v28.s[1]
	fmla	v19.4s, v8.4s, v24.s[1]
	fmla	v21.4s, v8.4s, v29.s[1]
	fmla	v23.4s, v8.4s, v31.s[1]
	ldp	q9, q8, [x10]
	madd	x10, x12, x14, x7
	ldr	x14, [sp, #272]                 // 8-byte Folded Reload
	add	x10, x11, x10, lsl #2
	fmla	v0.4s, v8.4s, v30.s[2]
	fmla	v2.4s, v8.4s, v26.s[2]
	fmla	v5.4s, v8.4s, v25.s[2]
	fmla	v4.4s, v8.4s, v27.s[2]
	fmla	v16.4s, v8.4s, v28.s[2]
	fmla	v18.4s, v8.4s, v24.s[2]
	fmla	v20.4s, v8.4s, v29.s[2]
	fmla	v22.4s, v8.4s, v31.s[2]
	mov	x11, x30
	add	x30, x8, x12, lsl #5
	stp	q9, q8, [x0]
	fmla	v1.4s, v9.4s, v30.s[2]
	fmla	v3.4s, v9.4s, v26.s[2]
	fmla	v6.4s, v9.4s, v25.s[2]
	fmla	v7.4s, v9.4s, v27.s[2]
	fmla	v17.4s, v9.4s, v28.s[2]
	fmla	v19.4s, v9.4s, v24.s[2]
	fmla	v21.4s, v9.4s, v29.s[2]
	fmla	v23.4s, v9.4s, v31.s[2]
	ldp	q8, q9, [x10]
	ldr	x10, [sp, #224]                 // 8-byte Folded Reload
	stp	q8, q9, [x30]
	fmla	v0.4s, v9.4s, v30.s[3]
	fmla	v1.4s, v8.4s, v30.s[3]
	fmla	v2.4s, v9.4s, v26.s[3]
	fmla	v3.4s, v8.4s, v26.s[3]
	fmla	v5.4s, v9.4s, v25.s[3]
	fmla	v6.4s, v8.4s, v25.s[3]
	fmla	v7.4s, v8.4s, v27.s[3]
	fmla	v4.4s, v9.4s, v27.s[3]
	fmla	v17.4s, v8.4s, v28.s[3]
	fmla	v16.4s, v9.4s, v28.s[3]
	fmla	v19.4s, v8.4s, v24.s[3]
	fmla	v18.4s, v9.4s, v24.s[3]
	fmla	v21.4s, v8.4s, v29.s[3]
	fmla	v20.4s, v9.4s, v29.s[3]
	fmla	v23.4s, v8.4s, v31.s[3]
	fmla	v22.4s, v9.4s, v31.s[3]
	cmp	x11, x19
	b.ge	.LBB0_8
	.p2align	2
.LBB0_7:                                //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x10, x28
	prfm	pldl1keep, [x10]
	ldur	s24, [x10, #-4]
	add	x10, x10, #4
	add	x13, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s25, [x12, #-4]
	add	x17, x13, x28
	prfm	pldl1keep, [x13]
	ldur	s26, [x13, #-4]
	add	x12, x17, x28
	prfm	pldl1keep, [x17]
	ldur	s27, [x17, #-4]
	add	x13, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s28, [x12, #-4]
	add	x12, x18, x15
	add	x17, x13, x28
	prfm	pldl1keep, [x13]
	ldur	s29, [x13, #-4]
	add	x13, x1, x15
	add	x15, x15, x14
	prfm	pldl1keep, [x17]
	ldur	s30, [x17, #-4]
	add	x17, x17, x28
	prfm	pldl1keep, [x17]
	ldur	s31, [x17, #-4]
	prfm	pldl1keep, [x12]
	add	x12, x8, x11, lsl #5
	add	x11, x11, #1
	ldp	q8, q9, [x13]
	fmla	v0.4s, v9.4s, v24.s[0]
	fmla	v2.4s, v9.4s, v25.s[0]
	fmla	v5.4s, v9.4s, v26.s[0]
	fmla	v4.4s, v9.4s, v27.s[0]
	fmla	v16.4s, v9.4s, v28.s[0]
	fmla	v18.4s, v9.4s, v29.s[0]
	fmla	v20.4s, v9.4s, v30.s[0]
	fmla	v1.4s, v8.4s, v24.s[0]
	fmla	v3.4s, v8.4s, v25.s[0]
	fmla	v6.4s, v8.4s, v26.s[0]
	fmla	v7.4s, v8.4s, v27.s[0]
	fmla	v17.4s, v8.4s, v28.s[0]
	fmla	v19.4s, v8.4s, v29.s[0]
	fmla	v21.4s, v8.4s, v30.s[0]
	fmla	v23.4s, v8.4s, v31.s[0]
	fmla	v22.4s, v9.4s, v31.s[0]
	stp	q8, q9, [x12]
	cmp	x11, x19
	b.lt	.LBB0_7
.LBB0_8:                                // %.preheader29
                                        //   in Loop: Header=BB0_3 Depth=1
	ldp	x18, x13, [sp, #208]            // 16-byte Folded Reload
	mov	x10, xzr
	mov	w6, #1                          // =0x1
	mov	w24, #2                         // =0x2
	mov	w20, #3                         // =0x3
	mov	w29, #4                         // =0x4
	mov	w15, #5                         // =0x5
	mov	w11, #6                         // =0x6
	mov	w25, #7                         // =0x7
	mov	w1, #8                          // =0x8
	b	.LBB0_10
	.p2align	2
.LBB0_9:                                // %.loopexit28
                                        //   in Loop: Header=BB0_10 Depth=2
	ldr	x10, [sp, #496]                 // 8-byte Folded Reload
	add	x13, x13, x10
	add	x18, x18, x10
	mov	x10, x1
	mov	x1, x3
.LBB0_10:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_12 Depth 3
                                        //       Child Loop BB0_14 Depth 3
	madd	x10, x10, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q1, q0, [x10]
	madd	x10, x6, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q3, q2, [x10]
	madd	x10, x24, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q6, q5, [x10]
	madd	x10, x20, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q7, q4, [x10]
	madd	x10, x29, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q17, q16, [x10]
	madd	x10, x15, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q19, q18, [x10]
	madd	x10, x11, x27, x7
	ldr	x11, [sp, #520]                 // 8-byte Folded Reload
	add	x10, x2, x10, lsl #2
	cmp	x1, x11
	stp	q21, q20, [x10]
	madd	x10, x25, x27, x7
	add	x10, x2, x10, lsl #2
	stp	q23, q22, [x10]
	b.ge	.LBB0_15
// %bb.11:                              //   in Loop: Header=BB0_10 Depth=2
	madd	x10, x1, x27, x7
	add	x20, x1, #3
	add	x29, x1, #4
	add	x6, x1, #1
	madd	x15, x20, x27, x7
	add	x25, x1, #7
	add	x24, x1, #2
	mov	x4, xzr
	madd	x11, x6, x27, x7
	ldp	q8, q9, [x8]
	add	x3, x1, #8
	madd	x12, x24, x27, x7
	mov	x17, x13
	add	x10, x2, x10, lsl #2
	add	x15, x2, x15, lsl #2
	ldp	q1, q0, [x10]
	madd	x10, x29, x27, x7
	add	x11, x2, x11, lsl #2
	ldp	q7, q4, [x15]
	add	x15, x1, #5
	add	x12, x2, x12, lsl #2
	ldp	q3, q2, [x11]
	add	x11, x1, #6
	add	x10, x2, x10, lsl #2
	ldp	q6, q5, [x12]
	ldp	q17, q16, [x10]
	madd	x10, x15, x27, x7
	add	x10, x2, x10, lsl #2
	ldp	q19, q18, [x10]
	madd	x10, x11, x27, x7
	add	x10, x2, x10, lsl #2
	ldp	q21, q20, [x10]
	madd	x10, x25, x27, x7
	add	x10, x2, x10, lsl #2
	ldp	q23, q22, [x10]
	mul	x10, x1, x22
	lsl	x10, x10, #2
	ldr	q31, [x16, x10]
	mul	x10, x6, x22
	lsl	x10, x10, #2
	ldr	q30, [x16, x10]
	mul	x10, x24, x22
	lsl	x10, x10, #2
	ldr	q29, [x16, x10]
	mul	x10, x20, x22
	lsl	x10, x10, #2
	ldr	q28, [x16, x10]
	mul	x10, x29, x22
	lsl	x10, x10, #2
	ldr	q27, [x16, x10]
	mul	x10, x15, x22
	lsl	x10, x10, #2
	ldr	q26, [x16, x10]
	mul	x10, x11, x22
	lsl	x10, x10, #2
	ldr	q25, [x16, x10]
	mul	x10, x25, x22
	lsl	x10, x10, #2
	ldr	q24, [x16, x10]
	mov	x10, x5
	cmp	xzr, x23
	b.ge	.LBB0_13
	.p2align	2
.LBB0_12:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x14, x10, #32
	fmla	v1.4s, v8.4s, v31.s[0]
	fmla	v0.4s, v9.4s, v31.s[0]
	add	x12, x10, #96
	fmla	v2.4s, v9.4s, v30.s[0]
	fmla	v3.4s, v8.4s, v30.s[0]
	prfm	pldl1keep, [x14]
	add	x4, x4, #4
	fmla	v5.4s, v9.4s, v29.s[0]
	fmla	v6.4s, v8.4s, v29.s[0]
	fmla	v4.4s, v9.4s, v28.s[0]
	fmla	v7.4s, v8.4s, v28.s[0]
	fmla	v16.4s, v9.4s, v27.s[0]
	fmla	v17.4s, v8.4s, v27.s[0]
	fmla	v18.4s, v9.4s, v26.s[0]
	fmla	v19.4s, v8.4s, v26.s[0]
	fmla	v20.4s, v9.4s, v25.s[0]
	fmla	v21.4s, v8.4s, v25.s[0]
	fmla	v22.4s, v9.4s, v24.s[0]
	fmla	v23.4s, v8.4s, v24.s[0]
	ldp	q8, q9, [x10, #-96]
	fmla	v0.4s, v9.4s, v31.s[1]
	fmla	v2.4s, v9.4s, v30.s[1]
	fmla	v1.4s, v8.4s, v31.s[1]
	fmla	v3.4s, v8.4s, v30.s[1]
	fmla	v6.4s, v8.4s, v29.s[1]
	fmla	v5.4s, v9.4s, v29.s[1]
	fmla	v7.4s, v8.4s, v28.s[1]
	fmla	v4.4s, v9.4s, v28.s[1]
	fmla	v17.4s, v8.4s, v27.s[1]
	fmla	v16.4s, v9.4s, v27.s[1]
	fmla	v19.4s, v8.4s, v26.s[1]
	fmla	v18.4s, v9.4s, v26.s[1]
	fmla	v21.4s, v8.4s, v25.s[1]
	fmla	v20.4s, v9.4s, v25.s[1]
	fmla	v23.4s, v8.4s, v24.s[1]
	fmla	v22.4s, v9.4s, v24.s[1]
	ldp	q9, q8, [x10, #-64]
	prfm	pldl1keep, [x12]
	ldp	q11, q10, [x10, #-32]
	add	x12, x17, x28
	fmla	v1.4s, v9.4s, v31.s[2]
	fmla	v0.4s, v8.4s, v31.s[2]
	fmla	v2.4s, v8.4s, v30.s[2]
	fmla	v3.4s, v9.4s, v30.s[2]
	fmla	v5.4s, v8.4s, v29.s[2]
	fmla	v6.4s, v9.4s, v29.s[2]
	fmla	v4.4s, v8.4s, v28.s[2]
	fmla	v7.4s, v9.4s, v28.s[2]
	fmla	v16.4s, v8.4s, v27.s[2]
	fmla	v17.4s, v9.4s, v27.s[2]
	fmla	v18.4s, v8.4s, v26.s[2]
	fmla	v19.4s, v9.4s, v26.s[2]
	fmla	v20.4s, v8.4s, v25.s[2]
	fmla	v21.4s, v9.4s, v25.s[2]
	fmla	v22.4s, v8.4s, v24.s[2]
	fmla	v23.4s, v9.4s, v24.s[2]
	ldp	q8, q9, [x10], #128
	prfm	pldl1keep, [x17]
	fmla	v0.4s, v10.4s, v31.s[3]
	fmla	v1.4s, v11.4s, v31.s[3]
	ldur	q31, [x17, #-16]
	prfm	pldl1keep, [x12]
	add	x17, x17, #16
	fmla	v3.4s, v11.4s, v30.s[3]
	fmla	v2.4s, v10.4s, v30.s[3]
	ldur	q30, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v6.4s, v11.4s, v29.s[3]
	fmla	v5.4s, v10.4s, v29.s[3]
	ldur	q29, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v7.4s, v11.4s, v28.s[3]
	fmla	v4.4s, v10.4s, v28.s[3]
	ldur	q28, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v17.4s, v11.4s, v27.s[3]
	fmla	v16.4s, v10.4s, v27.s[3]
	ldur	q27, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v19.4s, v11.4s, v26.s[3]
	fmla	v18.4s, v10.4s, v26.s[3]
	ldur	q26, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v21.4s, v11.4s, v25.s[3]
	fmla	v20.4s, v10.4s, v25.s[3]
	ldur	q25, [x12, #-16]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	fmla	v23.4s, v11.4s, v24.s[3]
	fmla	v22.4s, v10.4s, v24.s[3]
	ldur	q24, [x12, #-16]
	cmp	x4, x23
	b.lt	.LBB0_12
.LBB0_13:                               //   in Loop: Header=BB0_10 Depth=2
	ldp	q11, q10, [x9]
	fmla	v0.4s, v9.4s, v31.s[0]
	fmla	v1.4s, v8.4s, v31.s[0]
	fmla	v2.4s, v9.4s, v30.s[0]
	fmla	v3.4s, v8.4s, v30.s[0]
	ldr	x17, [sp, #488]                 // 8-byte Folded Reload
	ldr	x4, [sp, #504]                  // 8-byte Folded Reload
	fmla	v5.4s, v9.4s, v29.s[0]
	fmla	v6.4s, v8.4s, v29.s[0]
	mov	x10, x18
	fmla	v4.4s, v9.4s, v28.s[0]
	fmla	v7.4s, v8.4s, v28.s[0]
	fmla	v16.4s, v9.4s, v27.s[0]
	fmla	v17.4s, v8.4s, v27.s[0]
	fmla	v18.4s, v9.4s, v26.s[0]
	fmla	v19.4s, v8.4s, v26.s[0]
	fmla	v20.4s, v9.4s, v25.s[0]
	fmla	v21.4s, v8.4s, v25.s[0]
	fmla	v22.4s, v9.4s, v24.s[0]
	ldp	q9, q12, [x0]
	fmla	v23.4s, v8.4s, v24.s[0]
	fmla	v1.4s, v11.4s, v31.s[1]
	fmla	v0.4s, v10.4s, v31.s[1]
	fmla	v3.4s, v11.4s, v30.s[1]
	fmla	v2.4s, v10.4s, v30.s[1]
	fmla	v6.4s, v11.4s, v29.s[1]
	fmla	v5.4s, v10.4s, v29.s[1]
	fmla	v7.4s, v11.4s, v28.s[1]
	fmla	v4.4s, v10.4s, v28.s[1]
	fmla	v17.4s, v11.4s, v27.s[1]
	fmla	v16.4s, v10.4s, v27.s[1]
	fmla	v19.4s, v11.4s, v26.s[1]
	fmla	v18.4s, v10.4s, v26.s[1]
	fmla	v21.4s, v11.4s, v25.s[1]
	fmla	v20.4s, v10.4s, v25.s[1]
	fmla	v23.4s, v11.4s, v24.s[1]
	fmla	v22.4s, v10.4s, v24.s[1]
	fmla	v0.4s, v12.4s, v31.s[2]
	ldp	q10, q8, [x30]
	fmla	v1.4s, v9.4s, v31.s[2]
	fmla	v2.4s, v12.4s, v30.s[2]
	fmla	v3.4s, v9.4s, v30.s[2]
	fmla	v5.4s, v12.4s, v29.s[2]
	fmla	v6.4s, v9.4s, v29.s[2]
	fmla	v4.4s, v12.4s, v28.s[2]
	fmla	v7.4s, v9.4s, v28.s[2]
	fmla	v16.4s, v12.4s, v27.s[2]
	fmla	v17.4s, v9.4s, v27.s[2]
	fmla	v18.4s, v12.4s, v26.s[2]
	fmla	v19.4s, v9.4s, v26.s[2]
	fmla	v20.4s, v12.4s, v25.s[2]
	fmla	v21.4s, v9.4s, v25.s[2]
	fmla	v22.4s, v12.4s, v24.s[2]
	fmla	v23.4s, v9.4s, v24.s[2]
	fmla	v1.4s, v10.4s, v31.s[3]
	fmla	v0.4s, v8.4s, v31.s[3]
	fmla	v3.4s, v10.4s, v30.s[3]
	fmla	v2.4s, v8.4s, v30.s[3]
	fmla	v6.4s, v10.4s, v29.s[3]
	fmla	v5.4s, v8.4s, v29.s[3]
	fmla	v7.4s, v10.4s, v28.s[3]
	fmla	v4.4s, v8.4s, v28.s[3]
	fmla	v17.4s, v10.4s, v27.s[3]
	fmla	v16.4s, v8.4s, v27.s[3]
	fmla	v19.4s, v10.4s, v26.s[3]
	fmla	v18.4s, v8.4s, v26.s[3]
	fmla	v21.4s, v10.4s, v25.s[3]
	fmla	v20.4s, v8.4s, v25.s[3]
	fmla	v23.4s, v10.4s, v24.s[3]
	fmla	v22.4s, v8.4s, v24.s[3]
	cmp	x4, x19
	b.ge	.LBB0_9
	.p2align	2
.LBB0_14:                               //   Parent Loop BB0_3 Depth=1
                                        //     Parent Loop BB0_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	add	x12, x10, x28
	prfm	pldl1keep, [x10]
	ldur	s24, [x10, #-4]
	add	x4, x4, #1
	prfm	pldl1keep, [x12]
	ldur	s25, [x12, #-4]
	add	x12, x12, x28
	add	x10, x10, #4
	prfm	pldl1keep, [x12]
	ldur	s26, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s27, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s28, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s29, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s30, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s31, [x12, #-4]
	prfm	pldl1keep, [x17]
	ldp	q8, q9, [x17, #-32]
	add	x17, x17, #32
	fmla	v0.4s, v9.4s, v24.s[0]
	fmla	v2.4s, v9.4s, v25.s[0]
	fmla	v5.4s, v9.4s, v26.s[0]
	fmla	v4.4s, v9.4s, v27.s[0]
	fmla	v16.4s, v9.4s, v28.s[0]
	fmla	v18.4s, v9.4s, v29.s[0]
	fmla	v20.4s, v9.4s, v30.s[0]
	fmla	v1.4s, v8.4s, v24.s[0]
	fmla	v3.4s, v8.4s, v25.s[0]
	fmla	v6.4s, v8.4s, v26.s[0]
	fmla	v7.4s, v8.4s, v27.s[0]
	fmla	v17.4s, v8.4s, v28.s[0]
	fmla	v19.4s, v8.4s, v29.s[0]
	fmla	v21.4s, v8.4s, v30.s[0]
	fmla	v23.4s, v8.4s, v31.s[0]
	fmla	v22.4s, v9.4s, v31.s[0]
	cmp	x4, x19
	b.lt	.LBB0_14
	b	.LBB0_9
	.p2align	2
.LBB0_15:                               //   in Loop: Header=BB0_3 Depth=1
	ldp	x17, x24, [sp, #336]            // 16-byte Folded Reload
	ldr	x20, [sp, #312]                 // 8-byte Folded Reload
	cmp	x11, x17
	ldp	x25, x6, [sp, #384]             // 16-byte Folded Reload
	ldr	x29, [sp, #200]                 // 8-byte Folded Reload
	b.lt	.LBB0_18
// %bb.16:                              //   in Loop: Header=BB0_3 Depth=1
	cmp	x17, x20
	b.lt	.LBB0_23
.LBB0_17:                               //   in Loop: Header=BB0_3 Depth=1
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x1, [sp, #368]                  // 8-byte Folded Reload
	cmp	x20, x10
	b.ge	.LBB0_2
	b	.LBB0_28
	.p2align	2
.LBB0_18:                               //   in Loop: Header=BB0_3 Depth=1
	ldr	x15, [sp, #520]                 // 8-byte Folded Reload
	ldp	q20, q21, [x8]
	mov	x10, xzr
	add	x12, x15, #1
	add	x13, x15, #2
	mul	x11, x15, x27
	add	x14, x15, #3
	mul	x15, x15, x22
	madd	x18, x12, x27, x7
	mul	x12, x12, x22
	madd	x1, x13, x27, x7
	lsl	x3, x15, #2
	add	x11, x11, x7
	lsl	x12, x12, #2
	add	x15, x2, x18, lsl #2
	madd	x18, x14, x27, x7
	add	x17, x2, x11, lsl #2
	add	x11, x2, x1, lsl #2
	ldr	x1, [sp, #184]                  // 8-byte Folded Reload
	ldr	q18, [x16, x3]
	ldr	q19, [x16, x12]
	mul	x12, x13, x22
	mov	x13, x5
	ldp	q3, q0, [x17]
	ldp	q4, q1, [x15]
	ldp	q5, q2, [x11]
	add	x18, x2, x18, lsl #2
	lsl	x12, x12, #2
	ldr	q17, [x16, x12]
	mul	x12, x14, x22
	ldp	q7, q6, [x18]
	lsl	x12, x12, #2
	ldr	q16, [x16, x12]
	cmp	xzr, x23
	b.ge	.LBB0_20
	.p2align	2
.LBB0_19:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x13, #32
	fmla	v3.4s, v20.4s, v18.s[0]
	fmla	v0.4s, v21.4s, v18.s[0]
	add	x10, x10, #4
	prfm	pldl1keep, [x12]
	ldp	q22, q23, [x13, #-96]
	fmla	v1.4s, v21.4s, v19.s[0]
	fmla	v4.4s, v20.4s, v19.s[0]
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	add	x12, x13, #96
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q21, q20, [x13, #-64]
	prfm	pldl1keep, [x12]
	add	x12, x1, x28
	add	x14, x12, x28
	fmla	v0.4s, v23.4s, v18.s[1]
	fmla	v1.4s, v23.4s, v19.s[1]
	fmla	v2.4s, v23.4s, v17.s[1]
	fmla	v6.4s, v23.4s, v16.s[1]
	fmla	v3.4s, v22.4s, v18.s[1]
	fmla	v4.4s, v22.4s, v19.s[1]
	fmla	v5.4s, v22.4s, v17.s[1]
	fmla	v7.4s, v22.4s, v16.s[1]
	fmla	v0.4s, v20.4s, v18.s[2]
	ldp	q22, q23, [x13, #-32]
	fmla	v1.4s, v20.4s, v19.s[2]
	fmla	v2.4s, v20.4s, v17.s[2]
	fmla	v6.4s, v20.4s, v16.s[2]
	fmla	v3.4s, v21.4s, v18.s[2]
	fmla	v4.4s, v21.4s, v19.s[2]
	fmla	v5.4s, v21.4s, v17.s[2]
	fmla	v7.4s, v21.4s, v16.s[2]
	ldp	q20, q21, [x13], #128
	prfm	pldl1keep, [x1]
	fmla	v0.4s, v23.4s, v18.s[3]
	fmla	v1.4s, v23.4s, v19.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	fmla	v6.4s, v23.4s, v16.s[3]
	fmla	v3.4s, v22.4s, v18.s[3]
	ldur	q18, [x1, #-16]
	prfm	pldl1keep, [x12]
	fmla	v4.4s, v22.4s, v19.s[3]
	ldur	q19, [x12, #-16]
	add	x12, x14, x28
	prfm	pldl1keep, [x14]
	add	x1, x1, #16
	fmla	v5.4s, v22.4s, v17.s[3]
	ldur	q17, [x14, #-16]
	prfm	pldl1keep, [x12]
	fmla	v7.4s, v22.4s, v16.s[3]
	ldur	q16, [x12, #-16]
	cmp	x10, x23
	b.lt	.LBB0_19
.LBB0_20:                               //   in Loop: Header=BB0_3 Depth=1
	ldp	q23, q22, [x9]
	fmla	v0.4s, v21.4s, v18.s[0]
	fmla	v3.4s, v20.4s, v18.s[0]
	fmla	v1.4s, v21.4s, v19.s[0]
	fmla	v4.4s, v20.4s, v19.s[0]
	ldr	x10, [sp, #176]                 // 8-byte Folded Reload
	ldr	x13, [sp, #488]                 // 8-byte Folded Reload
	fmla	v2.4s, v21.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v17.s[0]
	ldr	x1, [sp, #504]                  // 8-byte Folded Reload
	fmla	v6.4s, v21.4s, v16.s[0]
	fmla	v7.4s, v20.4s, v16.s[0]
	ldp	q20, q21, [x0]
	fmla	v0.4s, v22.4s, v18.s[1]
	fmla	v1.4s, v22.4s, v19.s[1]
	fmla	v2.4s, v22.4s, v17.s[1]
	fmla	v6.4s, v22.4s, v16.s[1]
	fmla	v3.4s, v23.4s, v18.s[1]
	fmla	v4.4s, v23.4s, v19.s[1]
	fmla	v5.4s, v23.4s, v17.s[1]
	fmla	v7.4s, v23.4s, v16.s[1]
	fmla	v0.4s, v21.4s, v18.s[2]
	ldp	q23, q22, [x30]
	fmla	v1.4s, v21.4s, v19.s[2]
	fmla	v2.4s, v21.4s, v17.s[2]
	fmla	v6.4s, v21.4s, v16.s[2]
	fmla	v3.4s, v20.4s, v18.s[2]
	fmla	v4.4s, v20.4s, v19.s[2]
	fmla	v5.4s, v20.4s, v17.s[2]
	fmla	v7.4s, v20.4s, v16.s[2]
	fmla	v0.4s, v22.4s, v18.s[3]
	fmla	v1.4s, v22.4s, v19.s[3]
	fmla	v2.4s, v22.4s, v17.s[3]
	fmla	v6.4s, v22.4s, v16.s[3]
	fmla	v3.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v19.s[3]
	fmla	v5.4s, v23.4s, v17.s[3]
	fmla	v7.4s, v23.4s, v16.s[3]
	cmp	x1, x19
	b.ge	.LBB0_22
	.p2align	2
.LBB0_21:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x12, x10, x28
	prfm	pldl1keep, [x10]
	ldur	s16, [x10, #-4]
	add	x1, x1, #1
	prfm	pldl1keep, [x12]
	ldur	s17, [x12, #-4]
	add	x12, x12, x28
	add	x10, x10, #4
	prfm	pldl1keep, [x12]
	ldur	s18, [x12, #-4]
	add	x12, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s19, [x12, #-4]
	prfm	pldl1keep, [x13]
	ldp	q20, q21, [x13, #-32]
	add	x13, x13, #32
	fmla	v0.4s, v21.4s, v16.s[0]
	fmla	v1.4s, v21.4s, v17.s[0]
	fmla	v2.4s, v21.4s, v18.s[0]
	fmla	v3.4s, v20.4s, v16.s[0]
	fmla	v4.4s, v20.4s, v17.s[0]
	fmla	v5.4s, v20.4s, v18.s[0]
	fmla	v7.4s, v20.4s, v19.s[0]
	fmla	v6.4s, v21.4s, v19.s[0]
	cmp	x1, x19
	b.lt	.LBB0_21
.LBB0_22:                               //   in Loop: Header=BB0_3 Depth=1
	stp	q3, q0, [x17]
	ldr	x17, [sp, #336]                 // 8-byte Folded Reload
	stp	q4, q1, [x15]
	stp	q5, q2, [x11]
	stp	q7, q6, [x18]
	cmp	x17, x20
	b.ge	.LBB0_17
.LBB0_23:                               //   in Loop: Header=BB0_3 Depth=1
	mul	x10, x17, x27
	add	x12, x17, #1
	ldp	q6, q7, [x8]
	madd	x11, x12, x27, x7
	ldr	x18, [sp, #168]                 // 8-byte Folded Reload
	mov	x13, xzr
	mov	x15, x5
	mul	x14, x17, x22
	ldr	x17, [sp, #248]                 // 8-byte Folded Reload
	add	x10, x10, x7
	mul	x12, x12, x22
	lsl	x14, x14, #2
	add	x10, x2, x10, lsl #2
	add	x11, x2, x11, lsl #2
	lsl	x12, x12, #2
	ldr	q5, [x16, x14]
	ldr	q4, [x16, x12]
	ldp	q1, q0, [x10]
	ldp	q3, q2, [x11]
	cmp	xzr, x23
	b.ge	.LBB0_25
	.p2align	2
.LBB0_24:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x6, x15, #32
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v0.4s, v7.4s, v5.s[0]
	add	x4, x15, #96
	prfm	pldl1keep, [x6]
	ldp	q16, q17, [x15, #-96]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q7, q6, [x15, #-64]
	prfm	pldl1keep, [x4]
	add	x12, x18, x24
	add	x1, x17, x24
	add	x14, x12, #32
	add	x3, x1, #32
	add	x13, x13, #4
	add	x18, x18, #16
	add	x17, x17, #16
	fmla	v0.4s, v17.4s, v5.s[1]
	fmla	v2.4s, v17.4s, v4.s[1]
	fmla	v1.4s, v16.4s, v5.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	fmla	v0.4s, v6.4s, v5.s[2]
	ldp	q16, q17, [x15, #-32]
	fmla	v2.4s, v6.4s, v4.s[2]
	fmla	v1.4s, v7.4s, v5.s[2]
	fmla	v3.4s, v7.4s, v4.s[2]
	ldp	q6, q7, [x15], #128
	prfm	pldl1keep, [x3]
	fmla	v0.4s, v17.4s, v5.s[3]
	fmla	v2.4s, v17.4s, v4.s[3]
	fmla	v1.4s, v16.4s, v5.s[3]
	ldr	q5, [x1, #16]
	prfm	pldl1keep, [x14]
	fmla	v3.4s, v16.4s, v4.s[3]
	ldr	q4, [x12, #16]
	cmp	x13, x23
	b.lt	.LBB0_24
.LBB0_25:                               //   in Loop: Header=BB0_3 Depth=1
	ldp	q17, q16, [x9]
	fmla	v0.4s, v7.4s, v5.s[0]
	fmla	v1.4s, v6.4s, v5.s[0]
	fmla	v2.4s, v7.4s, v4.s[0]
	fmla	v3.4s, v6.4s, v4.s[0]
	ldp	q6, q7, [x0]
	ldr	x12, [sp, #504]                 // 8-byte Folded Reload
	ldr	x6, [sp, #392]                  // 8-byte Folded Reload
	mov	x13, xzr
	mov	x15, xzr
	fmla	v0.4s, v16.4s, v5.s[1]
	fmla	v2.4s, v16.4s, v4.s[1]
	fmla	v1.4s, v17.4s, v5.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	ldp	q17, q16, [x30]
	fmla	v0.4s, v7.4s, v5.s[2]
	fmla	v2.4s, v7.4s, v4.s[2]
	fmla	v1.4s, v6.4s, v5.s[2]
	fmla	v3.4s, v6.4s, v4.s[2]
	fmla	v0.4s, v16.4s, v5.s[3]
	fmla	v2.4s, v16.4s, v4.s[3]
	fmla	v1.4s, v17.4s, v5.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	cmp	x12, x19
	b.ge	.LBB0_27
	.p2align	2
.LBB0_26:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x3, x1, [sp, #472]              // 16-byte Folded Reload
	add	x14, x29, x15, lsl #3
	add	x12, x12, #1
	add	x14, x14, #32
	add	x17, x1, x15
	add	x18, x3, x15
	add	x17, x17, #4
	add	x18, x18, #4
	prfm	pldl1keep, [x18]
	ldr	s4, [x3, x15]
	prfm	pldl1keep, [x17]
	ldr	s5, [x1, x15]
	add	x17, x29, x13
	prfm	pldl1keep, [x14]
	add	x15, x15, #4
	add	x13, x13, #32
	ldp	q6, q7, [x17]
	fmla	v0.4s, v7.4s, v4.s[0]
	fmla	v1.4s, v6.4s, v4.s[0]
	fmla	v2.4s, v7.4s, v5.s[0]
	fmla	v3.4s, v6.4s, v5.s[0]
	cmp	x12, x19
	b.lt	.LBB0_26
.LBB0_27:                               //   in Loop: Header=BB0_3 Depth=1
	stp	q1, q0, [x10]
	stp	q3, q2, [x11]
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x1, [sp, #368]                  // 8-byte Folded Reload
	cmp	x20, x10
	b.ge	.LBB0_2
.LBB0_28:                               //   in Loop: Header=BB0_3 Depth=1
	mul	x10, x20, x27
	ldp	q4, q3, [x8]
	ldr	x13, [sp, #136]                 // 8-byte Folded Reload
	mul	x12, x20, x22
	mov	x11, xzr
	add	x10, x10, x7
	lsl	x12, x12, #2
	add	x10, x2, x10, lsl #2
	ldr	q2, [x16, x12]
	mov	x12, x5
	ldp	q1, q0, [x10]
	cmp	xzr, x23
	b.ge	.LBB0_30
	.p2align	2
.LBB0_29:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x15, x12, #32
	fmla	v1.4s, v4.4s, v2.s[0]
	fmla	v0.4s, v3.4s, v2.s[0]
	add	x14, x12, #96
	prfm	pldl1keep, [x15]
	ldp	q5, q6, [x12, #-96]
	add	x11, x11, #4
	ldp	q4, q3, [x12, #-64]
	prfm	pldl1keep, [x14]
	fmla	v0.4s, v6.4s, v2.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldp	q5, q6, [x12, #-32]
	prfm	pldl1keep, [x13]
	fmla	v0.4s, v3.4s, v2.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	fmla	v0.4s, v6.4s, v2.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldur	q2, [x13, #-16]
	ldp	q4, q3, [x12], #128
	add	x13, x13, #16
	cmp	x11, x23
	b.lt	.LBB0_29
.LBB0_30:                               //   in Loop: Header=BB0_3 Depth=1
	ldp	q6, q5, [x9]
	fmla	v0.4s, v3.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldp	q3, q4, [x0]
	ldp	x9, x11, [sp, #152]             // 16-byte Folded Reload
	ldr	x12, [sp, #504]                 // 8-byte Folded Reload
	ldr	x15, [sp, #144]                 // 8-byte Folded Reload
	fmla	v0.4s, v5.4s, v2.s[1]
	fmla	v1.4s, v6.4s, v2.s[1]
	ldp	q6, q5, [x30]
	fmla	v0.4s, v4.4s, v2.s[2]
	fmla	v1.4s, v3.4s, v2.s[2]
	fmla	v0.4s, v5.4s, v2.s[3]
	fmla	v1.4s, v6.4s, v2.s[3]
	cmp	x12, x19
	b.ge	.LBB0_1
	.p2align	2
.LBB0_31:                               //   Parent Loop BB0_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x14, x8, x12, lsl #5
	add	x13, x8, x11
	prfm	pldl1keep, [x9]
	add	x11, x11, #32
	ldr	s2, [x15, x12, lsl #2]
	prfm	pldl1keep, [x13]
	add	x12, x12, #1
	ldp	q3, q4, [x14]
	add	x9, x9, #4
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v3.4s, v2.s[0]
	cmp	x12, x19
	b.lt	.LBB0_31
	b	.LBB0_1
.LBB0_32:
	ldr	x0, [sp, #56]                   // 8-byte Folded Reload
	bl	free
	ldr	x9, [sp, #112]                  // 8-byte Folded Reload
	lsl	x20, x22, #3
	str	x20, [sp, #472]                 // 8-byte Folded Spill
	add	x8, x9, #3
	cmp	x9, #0
	csel	x8, x8, x9, lt
	ldr	x9, [sp, #128]                  // 8-byte Folded Reload
	asr	x8, x8, #2
	cmp	x9, #0
	cinv	x29, x8, lt
	lsl	x8, x29, #2
	str	x8, [sp, #488]                  // 8-byte Folded Spill
	cmp	x25, x8
	ldp	x9, x8, [sp, #256]              // 16-byte Folded Reload
	add	x24, x8, x9, lsl #2
	b.ge	.LBB0_63
// %bb.33:
	lsl	x8, x19, #4
	str	x29, [sp, #480]                 // 8-byte Folded Spill
	add	x0, x8, #64
	str	x8, [sp, #464]                  // 8-byte Folded Spill
	bl	malloc
	add	x8, x25, x27, lsl #1
	add	x10, x27, x25
	ldp	x6, x5, [sp, #296]              // 16-byte Folded Reload
	lsl	x10, x10, #2
	add	x13, x25, x27, lsl #2
	add	x11, x0, #63
	ldr	x18, [sp, #328]                 // 8-byte Folded Reload
	ldr	q2, [x24, x10]
	lsl	x10, x8, #2
	add	x8, x8, x27
	ldr	q1, [x24, x10]
	lsl	x10, x13, #2
	lsl	x8, x8, #2
	ldr	q3, [x24, x10]
	mov	w10, #6                         // =0x6
	ldr	x1, [sp, #344]                  // 8-byte Folded Reload
	ldr	q4, [x24, x8]
	mul	x8, x27, x10
	mov	w4, #12                         // =0xc
	add	x13, x13, x27
	lsl	x10, x13, #2
	lsl	x9, x25, #2
	mov	w16, #20                        // =0x14
	ldr	q5, [x24, x10]
	add	x10, x6, x21
	mov	w15, #24                        // =0x18
	ldr	q0, [x24, x9]
	ldr	q23, [x10, x9]
	add	x8, x8, x25
	add	x9, x18, x1
	mul	x13, x22, x15
	ldr	x7, [sp, #64]                   // 8-byte Folded Reload
	lsl	x8, x8, #2
	ldr	q22, [x9, x13]
	mov	w13, #28                        // =0x1c
	ldr	q6, [x24, x8]
	sub	x8, x25, x27
	ldr	q16, [x9]
	add	x8, x8, x27, lsl #3
	ldr	q17, [x9, x28]
	ldr	x29, [sp, #504]                 // 8-byte Folded Reload
	ldr	q18, [x9, x20]
	ldr	q20, [x9, x22, lsl #4]
	lsl	x8, x8, #2
	ldr	x30, [sp, #104]                 // 8-byte Folded Reload
	mov	x12, xzr
	ldr	q7, [x24, x8]
	and	x8, x11, #0xffffffffffffffc0
	mul	x11, x22, x4
	orr	x3, x8, #0x20
	ldr	q19, [x9, x11]
	mul	x11, x22, x16
	ldr	q21, [x9, x11]
	ldr	x11, [sp, #16]                  // 8-byte Folded Reload
	lsl	x11, x11, #5
	madd	x17, x5, x13, x11
	add	x14, x11, x5, lsl #5
	madd	x15, x5, x15, x11
	madd	x16, x5, x16, x11
	madd	x4, x5, x4, x11
	add	x2, x11, x5, lsl #3
	add	x13, x6, x14
	add	x2, x6, x2
	add	x14, x6, x17
	add	x17, x1, x18
	add	x1, x11, x5, lsl #2
	add	x18, x11, x26
	mov	w5, #16                         // =0x10
	add	x15, x6, x15
	add	x16, x6, x16
	add	x4, x6, x4
	add	x17, x7, x17
	add	x18, x6, x18
	sub	x5, x5, x7
	add	x17, x17, #16
	add	x1, x6, x1
	prfm	pldl1keep, [x17]
	ldur	q24, [x17, #-16]
	fmla	v0.4s, v23.4s, v16.s[0]
	fmla	v2.4s, v23.4s, v17.s[0]
	cmp	xzr, x23
	b.ge	.LBB0_35
	.p2align	2
.LBB0_34:                               // =>This Inner Loop Header: Depth=1
	add	x6, x16, x21
	stur	q23, [x3, #-32]
	fmla	v1.4s, v23.4s, v18.s[0]
	fmla	v4.4s, v23.4s, v19.s[0]
	prfm	pldl1keep, [x6]
	ldr	q25, [x1, x21]
	fmla	v3.4s, v23.4s, v20.s[0]
	fmla	v5.4s, v23.4s, v21.s[0]
	fmla	v6.4s, v23.4s, v22.s[0]
	fmla	v7.4s, v23.4s, v24.s[0]
	add	x6, x15, x21
	add	x7, x17, x5
	add	x20, x7, x28
	add	x25, x20, x28
	add	x12, x12, #4
	add	x15, x15, x26
	add	x16, x16, x26
	add	x17, x17, #16
	add	x1, x1, x26
	stur	q25, [x3, #-16]
	prfm	pldl1keep, [x6]
	ldr	q23, [x2, x21]
	fmla	v0.4s, v25.4s, v16.s[1]
	fmla	v2.4s, v25.4s, v17.s[1]
	fmla	v1.4s, v25.4s, v18.s[1]
	fmla	v4.4s, v25.4s, v19.s[1]
	fmla	v3.4s, v25.4s, v20.s[1]
	fmla	v5.4s, v25.4s, v21.s[1]
	fmla	v6.4s, v25.4s, v22.s[1]
	fmla	v7.4s, v25.4s, v24.s[1]
	add	x6, x14, x21
	add	x14, x14, x26
	add	x2, x2, x26
	fmla	v0.4s, v23.4s, v16.s[2]
	fmla	v2.4s, v23.4s, v17.s[2]
	fmla	v1.4s, v23.4s, v18.s[2]
	fmla	v4.4s, v23.4s, v19.s[2]
	fmla	v3.4s, v23.4s, v20.s[2]
	fmla	v5.4s, v23.4s, v21.s[2]
	fmla	v6.4s, v23.4s, v22.s[2]
	fmla	v7.4s, v23.4s, v24.s[2]
	str	q23, [x3]
	prfm	pldl1keep, [x6]
	ldr	q23, [x4, x21]
	add	x6, x13, x21
	add	x13, x13, x26
	add	x4, x4, x26
	str	q23, [x3, #16]
	prfm	pldl1keep, [x6]
	add	x6, x25, x28
	fmla	v0.4s, v23.4s, v16.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v19.s[3]
	fmla	v3.4s, v23.4s, v20.s[3]
	fmla	v5.4s, v23.4s, v21.s[3]
	fmla	v6.4s, v23.4s, v22.s[3]
	fmla	v7.4s, v23.4s, v24.s[3]
	ldr	q23, [x18, x21]
	prfm	pldl1keep, [x7]
	ldur	q16, [x7, #-16]
	prfm	pldl1keep, [x20]
	ldur	q17, [x20, #-16]
	prfm	pldl1keep, [x25]
	ldur	q18, [x25, #-16]
	ldr	x25, [sp, #384]                 // 8-byte Folded Reload
	add	x18, x18, x26
	add	x3, x3, #64
	prfm	pldl1keep, [x6]
	ldur	q19, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q20, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q21, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q22, [x6, #-16]
	prfm	pldl1keep, [x17]
	ldur	q24, [x17, #-16]
	fmla	v0.4s, v23.4s, v16.s[0]
	fmla	v2.4s, v23.4s, v17.s[0]
	cmp	x12, x23
	b.lt	.LBB0_34
.LBB0_35:
	ldp	x13, x14, [sp, #400]            // 16-byte Folded Reload
	ldr	x15, [sp, #304]                 // 8-byte Folded Reload
	fmla	v1.4s, v23.4s, v18.s[0]
	str	q23, [x8, x23, lsl #4]
	fmla	v4.4s, v23.4s, v19.s[0]
	fmla	v3.4s, v23.4s, v20.s[0]
	fmla	v5.4s, v23.4s, v21.s[0]
	fmla	v6.4s, v23.4s, v22.s[0]
	fmla	v7.4s, v23.4s, v24.s[0]
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	mul	x12, x13, x15
	add	x12, x12, x25
	lsl	x12, x12, #2
	ldr	q23, [x10, x12]
	mul	x12, x14, x15
	add	x12, x12, x25
	lsl	x12, x12, #2
	str	q23, [x8, x13, lsl #4]
	ldr	x13, [sp, #416]                 // 8-byte Folded Reload
	fmla	v0.4s, v23.4s, v16.s[1]
	fmla	v2.4s, v23.4s, v17.s[1]
	fmla	v1.4s, v23.4s, v18.s[1]
	fmla	v4.4s, v23.4s, v19.s[1]
	fmla	v3.4s, v23.4s, v20.s[1]
	fmla	v5.4s, v23.4s, v21.s[1]
	fmla	v6.4s, v23.4s, v22.s[1]
	fmla	v7.4s, v23.4s, v24.s[1]
	ldr	q23, [x10, x12]
	madd	x12, x13, x15, x25
	fmla	v0.4s, v23.4s, v16.s[2]
	str	q23, [x8, x14, lsl #4]
	fmla	v2.4s, v23.4s, v17.s[2]
	fmla	v1.4s, v23.4s, v18.s[2]
	fmla	v4.4s, v23.4s, v19.s[2]
	fmla	v3.4s, v23.4s, v20.s[2]
	fmla	v5.4s, v23.4s, v21.s[2]
	fmla	v6.4s, v23.4s, v22.s[2]
	fmla	v7.4s, v23.4s, v24.s[2]
	mov	x14, x29
	lsl	x12, x12, #2
	ldr	q23, [x10, x12]
	ldr	x10, [sp, #72]                  // 8-byte Folded Reload
	add	x12, x10, #4
	ldp	x17, x10, [sp, #272]            // 16-byte Folded Reload
	str	q23, [x8, x13, lsl #4]
	ldr	x13, [sp, #120]                 // 8-byte Folded Reload
	fmla	v0.4s, v23.4s, v16.s[3]
	fmla	v2.4s, v23.4s, v17.s[3]
	fmla	v1.4s, v23.4s, v18.s[3]
	fmla	v4.4s, v23.4s, v19.s[3]
	fmla	v3.4s, v23.4s, v20.s[3]
	fmla	v5.4s, v23.4s, v21.s[3]
	fmla	v6.4s, v23.4s, v22.s[3]
	fmla	v7.4s, v23.4s, v24.s[3]
	add	x10, x11, x10, lsl #2
	ldr	x11, [sp, #296]                 // 8-byte Folded Reload
	add	x10, x11, x10
	ldr	x11, [sp, #320]                 // 8-byte Folded Reload
	add	x11, x13, x11, lsl #2
	ldr	x13, [sp, #80]                  // 8-byte Folded Reload
	sub	x11, x11, x13
	ldr	x13, [sp, #328]                 // 8-byte Folded Reload
	add	x13, x11, x13
	mul	x11, x15, x12
	add	x12, x13, #4
	ldr	x13, [sp, #96]                  // 8-byte Folded Reload
	lsl	x13, x13, #2
	cmp	x29, x19
	b.ge	.LBB0_37
	.p2align	2
.LBB0_36:                               // =>This Inner Loop Header: Depth=1
	add	x16, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x15, x10, x11
	prfm	pldl1keep, [x16]
	ldur	s17, [x16, #-4]
	add	x16, x16, x28
	add	x12, x12, #4
	prfm	pldl1keep, [x16]
	ldur	s18, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s19, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s20, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s21, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s22, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s23, [x16, #-4]
	prfm	pldl1keep, [x15]
	ldr	q24, [x10, x13]
	add	x10, x10, x17
	fmla	v0.4s, v24.4s, v16.s[0]
	str	q24, [x8, x14, lsl #4]
	add	x14, x14, #1
	fmla	v2.4s, v24.4s, v17.s[0]
	fmla	v1.4s, v24.4s, v18.s[0]
	fmla	v4.4s, v24.4s, v19.s[0]
	fmla	v3.4s, v24.4s, v20.s[0]
	fmla	v5.4s, v24.4s, v21.s[0]
	fmla	v6.4s, v24.4s, v22.s[0]
	fmla	v7.4s, v24.4s, v23.s[0]
	cmp	x14, x19
	b.lt	.LBB0_36
.LBB0_37:                               // %.preheader27
	ldr	x10, [sp, #344]                 // 8-byte Folded Reload
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	mov	x6, xzr
	mov	w4, #7                          // =0x7
	ldr	x15, [sp, #328]                 // 8-byte Folded Reload
	ldr	x12, [sp, #88]                  // 8-byte Folded Reload
	mov	w3, #6                          // =0x6
	mov	w16, #5                         // =0x5
	mov	w1, #4                          // =0x4
	mov	w17, #3                         // =0x3
	mov	w18, #2                         // =0x2
	mov	w2, #1                          // =0x1
	add	x13, x11, x10
	sub	x10, x8, x30, lsl #4
	add	x14, x12, x15
	add	x11, x8, #48
	mov	w12, #8                         // =0x8
	add	x15, x13, x15
	add	x13, x14, #4
	add	x10, x10, x19, lsl #4
	add	x14, x15, #32
	add	x15, x10, #16
	b	.LBB0_39
	.p2align	2
.LBB0_38:                               // %.loopexit26
                                        //   in Loop: Header=BB0_39 Depth=1
	ldr	x6, [sp, #496]                  // 8-byte Folded Reload
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	add	x14, x14, x6
	ldr	x25, [sp, #384]                 // 8-byte Folded Reload
	add	x13, x13, x6
	mov	x6, x12
	mov	x12, x5
.LBB0_39:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_41 Depth 2
                                        //     Child Loop BB0_43 Depth 2
	madd	x5, x6, x27, x25
	cmp	x12, x7
	lsl	x5, x5, #2
	madd	x2, x2, x27, x25
	madd	x18, x18, x27, x25
	madd	x17, x17, x27, x25
	madd	x1, x1, x27, x25
	lsl	x2, x2, #2
	lsl	x18, x18, #2
	lsl	x17, x17, #2
	lsl	x1, x1, #2
	madd	x16, x16, x27, x25
	lsl	x16, x16, #2
	str	q0, [x24, x5]
	str	q2, [x24, x2]
	str	q1, [x24, x18]
	str	q4, [x24, x17]
	str	q3, [x24, x1]
	str	q5, [x24, x16]
	madd	x16, x3, x27, x25
	lsl	x16, x16, #2
	str	q6, [x24, x16]
	madd	x16, x4, x27, x25
	lsl	x16, x16, #2
	str	q7, [x24, x16]
	b.ge	.LBB0_44
// %bb.40:                              //   in Loop: Header=BB0_39 Depth=1
	add	x17, x12, #3
	add	x2, x12, #1
	add	x18, x12, #2
	mul	x3, x12, x27
	mul	x7, x17, x27
	add	x1, x12, #4
	add	x16, x12, #5
	ldr	q24, [x8]
	mul	x4, x2, x27
	mov	x6, xzr
	add	x3, x3, x25
	mul	x5, x18, x27
	mul	x20, x1, x27
	add	x7, x7, x25
	lsl	x3, x3, #2
	add	x4, x4, x25
	add	x5, x5, x25
	add	x20, x20, x25
	lsl	x7, x7, #2
	lsl	x4, x4, #2
	ldr	q0, [x24, x3]
	mul	x3, x16, x27
	lsl	x5, x5, #2
	lsl	x20, x20, #2
	ldr	q4, [x24, x7]
	mul	x7, x12, x22
	ldr	q2, [x24, x4]
	ldr	q1, [x24, x5]
	ldr	q3, [x24, x20]
	mov	x20, x14
	add	x3, x3, x25
	lsl	x7, x7, #2
	lsl	x3, x3, #2
	ldr	q23, [x9, x7]
	mul	x7, x2, x22
	ldr	q5, [x24, x3]
	add	x3, x12, #6
	mul	x4, x3, x27
	lsl	x7, x7, #2
	ldr	q22, [x9, x7]
	mul	x7, x18, x22
	add	x4, x4, x25
	lsl	x4, x4, #2
	lsl	x7, x7, #2
	ldr	q6, [x24, x4]
	add	x4, x12, #7
	mul	x5, x4, x27
	ldr	q21, [x9, x7]
	mul	x7, x17, x22
	add	x5, x5, x25
	lsl	x5, x5, #2
	lsl	x7, x7, #2
	ldr	q7, [x24, x5]
	add	x5, x12, #8
	ldr	q20, [x9, x7]
	mul	x7, x1, x22
	lsl	x7, x7, #2
	ldr	q19, [x9, x7]
	mul	x7, x16, x22
	lsl	x7, x7, #2
	ldr	q18, [x9, x7]
	mul	x7, x3, x22
	lsl	x7, x7, #2
	ldr	q17, [x9, x7]
	mul	x7, x4, x22
	lsl	x7, x7, #2
	ldr	q16, [x9, x7]
	mov	x7, x11
	cmp	xzr, x23
	b.ge	.LBB0_42
	.p2align	2
.LBB0_41:                               //   Parent Loop BB0_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x25, x7, #32
	fmla	v0.4s, v24.4s, v23.s[0]
	fmla	v2.4s, v24.4s, v22.s[0]
	add	x6, x6, #4
	fmla	v1.4s, v24.4s, v21.s[0]
	fmla	v4.4s, v24.4s, v20.s[0]
	prfm	pldl1keep, [x25]
	add	x25, x20, x28
	fmla	v3.4s, v24.4s, v19.s[0]
	fmla	v5.4s, v24.4s, v18.s[0]
	fmla	v6.4s, v24.4s, v17.s[0]
	fmla	v7.4s, v24.4s, v16.s[0]
	ldp	q24, q25, [x7, #-32]
	fmla	v0.4s, v24.4s, v23.s[1]
	fmla	v2.4s, v24.4s, v22.s[1]
	fmla	v1.4s, v24.4s, v21.s[1]
	fmla	v4.4s, v24.4s, v20.s[1]
	fmla	v3.4s, v24.4s, v19.s[1]
	fmla	v5.4s, v24.4s, v18.s[1]
	fmla	v6.4s, v24.4s, v17.s[1]
	fmla	v7.4s, v24.4s, v16.s[1]
	fmla	v0.4s, v25.4s, v23.s[2]
	fmla	v2.4s, v25.4s, v22.s[2]
	ldp	q26, q24, [x7], #64
	fmla	v1.4s, v25.4s, v21.s[2]
	fmla	v4.4s, v25.4s, v20.s[2]
	fmla	v3.4s, v25.4s, v19.s[2]
	prfm	pldl1keep, [x20]
	fmla	v5.4s, v25.4s, v18.s[2]
	fmla	v6.4s, v25.4s, v17.s[2]
	fmla	v7.4s, v25.4s, v16.s[2]
	fmla	v0.4s, v26.4s, v23.s[3]
	ldur	q23, [x20, #-16]
	prfm	pldl1keep, [x25]
	fmla	v2.4s, v26.4s, v22.s[3]
	ldur	q22, [x25, #-16]
	add	x25, x25, x28
	fmla	v1.4s, v26.4s, v21.s[3]
	fmla	v4.4s, v26.4s, v20.s[3]
	fmla	v3.4s, v26.4s, v19.s[3]
	fmla	v5.4s, v26.4s, v18.s[3]
	add	x20, x20, #16
	prfm	pldl1keep, [x25]
	ldur	q21, [x25, #-16]
	add	x25, x25, x28
	fmla	v6.4s, v26.4s, v17.s[3]
	fmla	v7.4s, v26.4s, v16.s[3]
	prfm	pldl1keep, [x25]
	ldur	q20, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q19, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q18, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q17, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q16, [x25, #-16]
	cmp	x6, x23
	b.lt	.LBB0_41
.LBB0_42:                               //   in Loop: Header=BB0_39 Depth=1
	ldp	x7, x6, [sp, #400]              // 16-byte Folded Reload
	fmla	v0.4s, v24.4s, v23.s[0]
	fmla	v2.4s, v24.4s, v22.s[0]
	fmla	v1.4s, v24.4s, v21.s[0]
	fmla	v4.4s, v24.4s, v20.s[0]
	mov	x20, x29
	fmla	v3.4s, v24.4s, v19.s[0]
	fmla	v5.4s, v24.4s, v18.s[0]
	ldr	q25, [x8, x7, lsl #4]
	fmla	v6.4s, v24.4s, v17.s[0]
	fmla	v7.4s, v24.4s, v16.s[0]
	ldr	q24, [x8, x6, lsl #4]
	ldr	x6, [sp, #416]                  // 8-byte Folded Reload
	mov	x7, x15
	ldr	q26, [x8, x6, lsl #4]
	mov	x6, x13
	fmla	v0.4s, v25.4s, v23.s[1]
	fmla	v2.4s, v25.4s, v22.s[1]
	fmla	v1.4s, v25.4s, v21.s[1]
	fmla	v4.4s, v25.4s, v20.s[1]
	fmla	v3.4s, v25.4s, v19.s[1]
	fmla	v5.4s, v25.4s, v18.s[1]
	fmla	v6.4s, v25.4s, v17.s[1]
	fmla	v7.4s, v25.4s, v16.s[1]
	fmla	v0.4s, v24.4s, v23.s[2]
	fmla	v2.4s, v24.4s, v22.s[2]
	fmla	v1.4s, v24.4s, v21.s[2]
	fmla	v4.4s, v24.4s, v20.s[2]
	fmla	v3.4s, v24.4s, v19.s[2]
	fmla	v5.4s, v24.4s, v18.s[2]
	fmla	v6.4s, v24.4s, v17.s[2]
	fmla	v7.4s, v24.4s, v16.s[2]
	fmla	v0.4s, v26.4s, v23.s[3]
	fmla	v2.4s, v26.4s, v22.s[3]
	fmla	v1.4s, v26.4s, v21.s[3]
	fmla	v4.4s, v26.4s, v20.s[3]
	fmla	v3.4s, v26.4s, v19.s[3]
	fmla	v5.4s, v26.4s, v18.s[3]
	fmla	v6.4s, v26.4s, v17.s[3]
	fmla	v7.4s, v26.4s, v16.s[3]
	cmp	x29, x19
	b.ge	.LBB0_38
	.p2align	2
.LBB0_43:                               //   Parent Loop BB0_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x25, x6, x28
	prfm	pldl1keep, [x6]
	ldur	s16, [x6, #-4]
	add	x20, x20, #1
	prfm	pldl1keep, [x25]
	ldur	s17, [x25, #-4]
	add	x25, x25, x28
	add	x6, x6, #4
	prfm	pldl1keep, [x25]
	ldur	s18, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s19, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s20, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s21, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s22, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s23, [x25, #-4]
	prfm	pldl1keep, [x7]
	ldur	q24, [x7, #-16]
	add	x7, x7, #16
	fmla	v0.4s, v24.4s, v16.s[0]
	fmla	v2.4s, v24.4s, v17.s[0]
	fmla	v1.4s, v24.4s, v18.s[0]
	fmla	v4.4s, v24.4s, v19.s[0]
	fmla	v3.4s, v24.4s, v20.s[0]
	fmla	v5.4s, v24.4s, v21.s[0]
	fmla	v6.4s, v24.4s, v22.s[0]
	fmla	v7.4s, v24.4s, v23.s[0]
	cmp	x20, x19
	b.lt	.LBB0_43
	b	.LBB0_38
.LBB0_44:
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	cmp	x7, x13
	b.lt	.LBB0_47
// %bb.45:
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x10
	b.lt	.LBB0_52
.LBB0_46:
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x11, x10
	b.lt	.LBB0_57
	b	.LBB0_62
.LBB0_47:
	add	x18, x7, #1
	add	x1, x7, #2
	add	x2, x7, #3
	mul	x11, x7, x27
	mul	x12, x18, x27
	mov	x16, xzr
	add	x11, x11, x25
	mul	x18, x18, x22
	mul	x13, x1, x27
	mul	x14, x2, x27
	lsl	x18, x18, #2
	mul	x15, x7, x22
	add	x12, x12, x25
	add	x13, x13, x25
	add	x14, x14, x25
	lsl	x17, x15, #2
	ldr	q5, [x9, x17]
	mov	x17, x8
	add	x11, x24, x11, lsl #2
	ldr	q7, [x9, x18]
	ldr	q16, [x17], #48
	ldr	q0, [x11]
	mul	x18, x1, x22
	lsl	x18, x18, #2
	add	x12, x24, x12, lsl #2
	add	x13, x24, x13, lsl #2
	add	x14, x24, x14, lsl #2
	ldr	q1, [x12]
	ldr	q2, [x13]
	ldr	q3, [x14]
	ldr	q6, [x9, x18]
	mul	x18, x2, x22
	ldp	x2, x1, [sp, #320]              // 16-byte Folded Reload
	lsl	x18, x18, #2
	ldr	q4, [x9, x18]
	ldr	x18, [sp, #32]                  // 8-byte Folded Reload
	lsl	x18, x18, #5
	add	x18, x18, x2, lsl #2
	add	x18, x18, x1
	add	x18, x18, #32
	cmp	xzr, x23
	b.ge	.LBB0_49
	.p2align	2
.LBB0_48:                               // =>This Inner Loop Header: Depth=1
	add	x1, x17, #32
	fmla	v0.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v7.s[0]
	add	x16, x16, #4
	fmla	v2.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	prfm	pldl1keep, [x1]
	add	x1, x18, x28
	ldp	q16, q17, [x17, #-32]
	fmla	v0.4s, v16.4s, v5.s[1]
	fmla	v1.4s, v16.4s, v7.s[1]
	fmla	v2.4s, v16.4s, v6.s[1]
	fmla	v3.4s, v16.4s, v4.s[1]
	fmla	v0.4s, v17.4s, v5.s[2]
	fmla	v1.4s, v17.4s, v7.s[2]
	fmla	v2.4s, v17.4s, v6.s[2]
	fmla	v3.4s, v17.4s, v4.s[2]
	ldp	q17, q16, [x17], #64
	prfm	pldl1keep, [x18]
	fmla	v0.4s, v17.4s, v5.s[3]
	ldur	q5, [x18, #-16]
	prfm	pldl1keep, [x1]
	fmla	v1.4s, v17.4s, v7.s[3]
	ldur	q7, [x1, #-16]
	add	x1, x1, x28
	fmla	v2.4s, v17.4s, v6.s[3]
	fmla	v3.4s, v17.4s, v4.s[3]
	add	x18, x18, #16
	prfm	pldl1keep, [x1]
	ldur	q6, [x1, #-16]
	add	x1, x1, x28
	prfm	pldl1keep, [x1]
	ldur	q4, [x1, #-16]
	cmp	x16, x23
	b.lt	.LBB0_48
.LBB0_49:
	ldp	x17, x16, [sp, #400]            // 16-byte Folded Reload
	fmla	v0.4s, v16.4s, v5.s[0]
	fmla	v1.4s, v16.4s, v7.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v4.s[0]
	add	x15, x19, x15
	sub	x15, x15, x30
	add	x10, x10, #16
	ldr	q17, [x8, x17, lsl #4]
	fmla	v0.4s, v17.4s, v5.s[1]
	ldr	q16, [x8, x16, lsl #4]
	ldr	x16, [sp, #416]                 // 8-byte Folded Reload
	fmla	v1.4s, v17.4s, v7.s[1]
	fmla	v2.4s, v17.4s, v6.s[1]
	fmla	v3.4s, v17.4s, v4.s[1]
	ldr	q18, [x8, x16, lsl #4]
	ldr	x16, [sp, #344]                 // 8-byte Folded Reload
	add	x15, x16, x15, lsl #2
	ldr	x16, [sp, #328]                 // 8-byte Folded Reload
	fmla	v0.4s, v16.4s, v5.s[2]
	fmla	v1.4s, v16.4s, v7.s[2]
	fmla	v2.4s, v16.4s, v6.s[2]
	fmla	v3.4s, v16.4s, v4.s[2]
	add	x15, x15, x16
	mov	x16, x29
	add	x15, x15, #4
	fmla	v0.4s, v18.4s, v5.s[3]
	fmla	v1.4s, v18.4s, v7.s[3]
	fmla	v2.4s, v18.4s, v6.s[3]
	fmla	v3.4s, v18.4s, v4.s[3]
	cmp	x29, x19
	b.ge	.LBB0_51
	.p2align	2
.LBB0_50:                               // =>This Inner Loop Header: Depth=1
	add	x17, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x16, x16, #1
	prfm	pldl1keep, [x17]
	ldur	s5, [x17, #-4]
	add	x17, x17, x28
	add	x15, x15, #4
	prfm	pldl1keep, [x17]
	ldur	s6, [x17, #-4]
	add	x17, x17, x28
	prfm	pldl1keep, [x17]
	ldur	s7, [x17, #-4]
	prfm	pldl1keep, [x10]
	ldur	q16, [x10, #-16]
	add	x10, x10, #16
	fmla	v0.4s, v16.4s, v4.s[0]
	fmla	v1.4s, v16.4s, v5.s[0]
	fmla	v2.4s, v16.4s, v6.s[0]
	fmla	v3.4s, v16.4s, v7.s[0]
	cmp	x16, x19
	b.lt	.LBB0_50
.LBB0_51:
	str	q0, [x11]
	str	q1, [x12]
	str	q2, [x13]
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	str	q3, [x14]
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x10
	b.ge	.LBB0_46
.LBB0_52:
	mul	x14, x13, x22
	add	x12, x13, #1
	ldr	x18, [sp, #328]                 // 8-byte Folded Reload
	mov	x16, x8
	mul	x10, x13, x27
	ldr	q4, [x16], #48
	mov	x15, xzr
	mul	x11, x12, x27
	lsl	x13, x14, #2
	add	x10, x10, x25
	add	x11, x11, x25
	ldr	q3, [x9, x13]
	mul	x13, x12, x22
	add	x10, x24, x10, lsl #2
	add	x11, x24, x11, lsl #2
	ldr	q0, [x10]
	ldr	q1, [x11]
	lsl	x17, x13, #2
	ldr	q2, [x9, x17]
	add	x17, x18, x17
	ldr	x18, [sp, #248]                 // 8-byte Folded Reload
	cmp	xzr, x23
	b.ge	.LBB0_54
	.p2align	2
.LBB0_53:                               // =>This Inner Loop Header: Depth=1
	add	x5, x16, #32
	ldr	x3, [sp, #344]                  // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	prfm	pldl1keep, [x5]
	ldp	q4, q5, [x16, #-32]
	add	x15, x15, #4
	add	x1, x17, x3
	add	x3, x18, x3
	add	x17, x17, #16
	add	x18, x18, #16
	add	x2, x1, #32
	add	x4, x3, #32
	fmla	v0.4s, v4.4s, v3.s[1]
	fmla	v1.4s, v4.4s, v2.s[1]
	fmla	v0.4s, v5.4s, v3.s[2]
	fmla	v1.4s, v5.4s, v2.s[2]
	ldp	q5, q4, [x16], #64
	prfm	pldl1keep, [x4]
	fmla	v0.4s, v5.4s, v3.s[3]
	ldr	q3, [x3, #16]
	prfm	pldl1keep, [x2]
	fmla	v1.4s, v5.4s, v2.s[3]
	ldr	q2, [x1, #16]
	cmp	x15, x23
	b.lt	.LBB0_53
.LBB0_54:
	ldr	x15, [sp, #400]                 // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v3.s[0]
	fmla	v1.4s, v4.4s, v2.s[0]
	ldr	x16, [sp, #344]                 // 8-byte Folded Reload
	add	x13, x19, x13
	ldr	x17, [sp, #328]                 // 8-byte Folded Reload
	sub	x13, x13, x30
	add	x14, x19, x14
	mul	x12, x22, x12
	ldr	x18, [sp, #40]                  // 8-byte Folded Reload
	ldr	q5, [x8, x15, lsl #4]
	ldr	x15, [sp, #408]                 // 8-byte Folded Reload
	add	x13, x16, x13, lsl #2
	add	x12, x16, x12, lsl #2
	add	x12, x17, x12
	ldr	q4, [x8, x15, lsl #4]
	ldr	x15, [sp, #416]                 // 8-byte Folded Reload
	fmla	v0.4s, v5.4s, v3.s[1]
	fmla	v1.4s, v5.4s, v2.s[1]
	ldr	q5, [x8, x15, lsl #4]
	sub	x15, x14, x30
	add	x14, x13, x17
	ldr	x13, [sp, #464]                 // 8-byte Folded Reload
	add	x15, x16, x15, lsl #2
	add	x16, x16, x18, lsl #4
	add	x14, x14, #4
	fmla	v0.4s, v4.4s, v3.s[2]
	fmla	v1.4s, v4.4s, v2.s[2]
	add	x15, x15, x17
	add	x16, x17, x16
	mov	x17, x29
	sub	x13, x13, x30, lsl #4
	add	x15, x15, #4
	fmla	v0.4s, v5.4s, v3.s[3]
	fmla	v1.4s, v5.4s, v2.s[3]
	add	x13, x13, #16
	cmp	x29, x19
	b.ge	.LBB0_56
	.p2align	2
.LBB0_55:                               // =>This Inner Loop Header: Depth=1
	add	x18, x8, x13
	prfm	pldl1keep, [x15]
	ldr	s2, [x16, x17, lsl #2]
	prfm	pldl1keep, [x14]
	ldr	s3, [x12, x17, lsl #2]
	add	x13, x13, #16
	prfm	pldl1keep, [x18]
	ldr	q4, [x8, x17, lsl #4]
	add	x17, x17, #1
	add	x14, x14, #4
	add	x15, x15, #4
	fmla	v0.4s, v4.4s, v2.s[0]
	fmla	v1.4s, v4.4s, v3.s[0]
	cmp	x17, x19
	b.lt	.LBB0_55
.LBB0_56:
	str	q0, [x10]
	str	q1, [x11]
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x11, x10
	b.ge	.LBB0_62
.LBB0_57:
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	mov	x13, x8
	mov	x12, xzr
	mul	x10, x11, x27
	mul	x11, x11, x22
	ldr	q2, [x13], #48
	lsl	x14, x11, #2
	add	x10, x10, x25
	ldr	q1, [x9, x14]
	ldr	x9, [sp, #48]                   // 8-byte Folded Reload
	ldp	x15, x14, [sp, #320]            // 16-byte Folded Reload
	add	x10, x24, x10, lsl #2
	ldr	q0, [x10]
	lsl	x9, x9, #3
	add	x9, x9, x15, lsl #2
	add	x9, x9, x14
	add	x9, x9, #32
	cmp	xzr, x23
	b.ge	.LBB0_59
	.p2align	2
.LBB0_58:                               // =>This Inner Loop Header: Depth=1
	add	x14, x13, #32
	fmla	v0.4s, v2.4s, v1.s[0]
	add	x12, x12, #4
	prfm	pldl1keep, [x14]
	ldp	q2, q3, [x13, #-32]
	fmla	v0.4s, v2.4s, v1.s[1]
	fmla	v0.4s, v3.4s, v1.s[2]
	ldp	q3, q2, [x13], #64
	prfm	pldl1keep, [x9]
	fmla	v0.4s, v3.4s, v1.s[3]
	ldur	q1, [x9, #-16]
	add	x9, x9, #16
	cmp	x12, x23
	b.lt	.LBB0_58
.LBB0_59:
	ldr	x9, [sp, #400]                  // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[0]
	ldr	x12, [sp, #328]                 // 8-byte Folded Reload
	ldr	x13, [sp, #24]                  // 8-byte Folded Reload
	ldr	q3, [x8, x9, lsl #4]
	ldr	x9, [sp, #408]                  // 8-byte Folded Reload
	fmla	v0.4s, v3.4s, v1.s[1]
	ldr	q2, [x8, x9, lsl #4]
	ldr	x9, [sp, #416]                  // 8-byte Folded Reload
	fmla	v0.4s, v2.4s, v1.s[2]
	ldr	q4, [x8, x9, lsl #4]
	add	x9, x19, x11
	ldr	x11, [sp, #344]                 // 8-byte Folded Reload
	sub	x9, x9, x30
	add	x9, x11, x9, lsl #2
	add	x11, x9, x12
	ldr	x9, [sp, #464]                  // 8-byte Folded Reload
	fmla	v0.4s, v4.4s, v1.s[3]
	add	x12, x12, x13
	mov	x13, x29
	add	x11, x11, #4
	sub	x9, x9, x30, lsl #4
	add	x9, x9, #16
	cmp	x29, x19
	b.ge	.LBB0_61
	.p2align	2
.LBB0_60:                               // =>This Inner Loop Header: Depth=1
	add	x14, x8, x9
	prfm	pldl1keep, [x11]
	ldr	s1, [x12, x13, lsl #2]
	prfm	pldl1keep, [x14]
	ldr	q2, [x8, x13, lsl #4]
	add	x13, x13, #1
	add	x9, x9, #16
	add	x11, x11, #4
	fmla	v0.4s, v2.4s, v1.s[0]
	cmp	x13, x19
	b.lt	.LBB0_60
.LBB0_61:
	str	q0, [x10]
.LBB0_62:
	bl	free
	ldp	x20, x29, [sp, #472]            // 16-byte Folded Reload
.LBB0_63:
	ldr	x8, [sp, #112]                  // 8-byte Folded Reload
	ldr	x9, [sp, #128]                  // 8-byte Folded Reload
	add	x8, x8, x8, lsr #63
	ldr	x25, [sp, #488]                 // 8-byte Folded Reload
	cmp	x9, #0
	asr	x8, x8, #1
	cinv	x8, x8, lt
	str	x8, [sp, #464]                  // 8-byte Folded Spill
	lsl	x8, x8, #1
	cmp	x25, x8
	str	x8, [sp, #480]                  // 8-byte Folded Spill
	b.ge	.LBB0_94
// %bb.64:
	lsl	x8, x19, #3
	add	x0, x8, #64
	bl	malloc
	add	x8, x27, x25
	add	x10, x25, x27, lsl #1
	ldp	x6, x5, [sp, #296]              // 16-byte Folded Reload
	add	x11, x25, x27, lsl #2
	lsl	x8, x8, #2
	ldr	x18, [sp, #328]                 // 8-byte Folded Reload
	ldr	x1, [sp, #344]                  // 8-byte Folded Reload
	ldr	d5, [x24, x8]
	lsl	x8, x10, #2
	mov	w4, #12                         // =0xc
	ldr	d0, [x24, x8]
	lsl	x8, x11, #2
	add	x10, x10, x27
	ldr	d3, [x24, x8]
	add	x8, x11, x27
	mul	x11, x22, x4
	lsl	x8, x8, #2
	lsl	x10, x10, #2
	lsl	x9, x25, #2
	add	x13, x0, #63
	ldr	d4, [x24, x8]
	mov	w8, #6                          // =0x6
	mov	w16, #20                        // =0x14
	madd	x8, x27, x8, x25
	ldr	d2, [x24, x10]
	add	x10, x6, x21
	ldr	d1, [x24, x9]
	ldr	d23, [x10, x9]
	add	x9, x18, x1
	mov	w15, #24                        // =0x18
	ldr	q19, [x9, x11]
	mul	x11, x22, x16
	ldr	q17, [x9, x28]
	ldr	x7, [sp, #64]                   // 8-byte Folded Reload
	lsl	x8, x8, #2
	ldr	q18, [x9, x20]
	ldr	q16, [x9]
	ldr	d6, [x24, x8]
	sub	x8, x25, x27
	ldr	x30, [sp, #104]                 // 8-byte Folded Reload
	add	x8, x8, x27, lsl #3
	ldr	q21, [x9, x11]
	lsl	x11, x29, #4
	ldr	q20, [x9, x22, lsl #4]
	add	x14, x11, x5, lsl #5
	madd	x16, x5, x16, x11
	lsl	x8, x8, #2
	madd	x4, x5, x4, x11
	ldr	x29, [sp, #504]                 // 8-byte Folded Reload
	add	x2, x11, x5, lsl #3
	ldr	d7, [x24, x8]
	and	x8, x13, #0xffffffffffffffc0
	mul	x13, x22, x15
	madd	x15, x5, x15, x11
	mov	x12, xzr
	add	x16, x6, x16
	add	x2, x6, x2
	orr	x3, x8, #0x10
	add	x4, x6, x4
	ldr	q22, [x9, x13]
	mov	w13, #28                        // =0x1c
	add	x15, x6, x15
	madd	x17, x5, x13, x11
	add	x13, x6, x14
	add	x14, x6, x17
	add	x17, x1, x18
	add	x1, x11, x5, lsl #2
	add	x18, x6, x26
	mov	w5, #16                         // =0x10
	add	x17, x7, x17
	add	x18, x18, x11
	sub	x5, x5, x7
	add	x17, x17, #16
	add	x1, x6, x1
	prfm	pldl1keep, [x17]
	ldur	q24, [x17, #-16]
	fmla	v1.2s, v23.2s, v16.s[0]
	fmla	v5.2s, v23.2s, v17.s[0]
	cmp	xzr, x23
	b.ge	.LBB0_66
	.p2align	2
.LBB0_65:                               // =>This Inner Loop Header: Depth=1
	add	x6, x16, x21
	stur	d23, [x3, #-16]
	fmla	v0.2s, v23.2s, v18.s[0]
	fmla	v2.2s, v23.2s, v19.s[0]
	prfm	pldl1keep, [x6]
	ldr	d25, [x1, x21]
	fmla	v3.2s, v23.2s, v20.s[0]
	fmla	v4.2s, v23.2s, v21.s[0]
	fmla	v6.2s, v23.2s, v22.s[0]
	fmla	v7.2s, v23.2s, v24.s[0]
	add	x6, x15, x21
	add	x7, x17, x5
	add	x20, x7, x28
	add	x25, x20, x28
	add	x12, x12, #4
	add	x15, x15, x26
	add	x16, x16, x26
	add	x17, x17, #16
	add	x1, x1, x26
	stur	d25, [x3, #-8]
	prfm	pldl1keep, [x6]
	ldr	d23, [x2, x21]
	fmla	v1.2s, v25.2s, v16.s[1]
	fmla	v5.2s, v25.2s, v17.s[1]
	fmla	v0.2s, v25.2s, v18.s[1]
	fmla	v2.2s, v25.2s, v19.s[1]
	fmla	v3.2s, v25.2s, v20.s[1]
	fmla	v4.2s, v25.2s, v21.s[1]
	fmla	v6.2s, v25.2s, v22.s[1]
	fmla	v7.2s, v25.2s, v24.s[1]
	add	x6, x14, x21
	add	x14, x14, x26
	add	x2, x2, x26
	fmla	v1.2s, v23.2s, v16.s[2]
	fmla	v5.2s, v23.2s, v17.s[2]
	fmla	v0.2s, v23.2s, v18.s[2]
	fmla	v2.2s, v23.2s, v19.s[2]
	fmla	v3.2s, v23.2s, v20.s[2]
	fmla	v4.2s, v23.2s, v21.s[2]
	fmla	v6.2s, v23.2s, v22.s[2]
	fmla	v7.2s, v23.2s, v24.s[2]
	str	d23, [x3]
	prfm	pldl1keep, [x6]
	ldr	d23, [x4, x21]
	add	x6, x13, x21
	add	x13, x13, x26
	add	x4, x4, x26
	str	d23, [x3, #8]
	prfm	pldl1keep, [x6]
	add	x6, x25, x28
	fmla	v1.2s, v23.2s, v16.s[3]
	fmla	v5.2s, v23.2s, v17.s[3]
	fmla	v0.2s, v23.2s, v18.s[3]
	fmla	v2.2s, v23.2s, v19.s[3]
	fmla	v3.2s, v23.2s, v20.s[3]
	fmla	v4.2s, v23.2s, v21.s[3]
	fmla	v6.2s, v23.2s, v22.s[3]
	fmla	v7.2s, v23.2s, v24.s[3]
	ldr	d23, [x18, x21]
	prfm	pldl1keep, [x7]
	ldur	q16, [x7, #-16]
	prfm	pldl1keep, [x20]
	ldur	q17, [x20, #-16]
	prfm	pldl1keep, [x25]
	ldur	q18, [x25, #-16]
	add	x18, x18, x26
	add	x3, x3, #32
	prfm	pldl1keep, [x6]
	ldur	q19, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q20, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q21, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q22, [x6, #-16]
	prfm	pldl1keep, [x17]
	ldur	q24, [x17, #-16]
	fmla	v1.2s, v23.2s, v16.s[0]
	fmla	v5.2s, v23.2s, v17.s[0]
	cmp	x12, x23
	b.lt	.LBB0_65
.LBB0_66:
	ldp	x13, x14, [sp, #400]            // 16-byte Folded Reload
	ldr	x15, [sp, #304]                 // 8-byte Folded Reload
	fmla	v0.2s, v23.2s, v18.s[0]
	ldr	x20, [sp, #488]                 // 8-byte Folded Reload
	str	d23, [x8, x23, lsl #3]
	fmla	v2.2s, v23.2s, v19.s[0]
	fmla	v3.2s, v23.2s, v20.s[0]
	fmla	v4.2s, v23.2s, v21.s[0]
	fmla	v6.2s, v23.2s, v22.s[0]
	fmla	v7.2s, v23.2s, v24.s[0]
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	madd	x12, x13, x15, x20
	lsl	x12, x12, #2
	ldr	d23, [x10, x12]
	madd	x12, x14, x15, x20
	lsl	x12, x12, #2
	str	d23, [x8, x13, lsl #3]
	ldr	x13, [sp, #416]                 // 8-byte Folded Reload
	fmla	v1.2s, v23.2s, v16.s[1]
	fmla	v5.2s, v23.2s, v17.s[1]
	fmla	v0.2s, v23.2s, v18.s[1]
	fmla	v2.2s, v23.2s, v19.s[1]
	fmla	v3.2s, v23.2s, v20.s[1]
	fmla	v4.2s, v23.2s, v21.s[1]
	fmla	v6.2s, v23.2s, v22.s[1]
	fmla	v7.2s, v23.2s, v24.s[1]
	ldr	d23, [x10, x12]
	madd	x12, x13, x15, x20
	fmla	v1.2s, v23.2s, v16.s[2]
	str	d23, [x8, x14, lsl #3]
	fmla	v5.2s, v23.2s, v17.s[2]
	fmla	v0.2s, v23.2s, v18.s[2]
	fmla	v2.2s, v23.2s, v19.s[2]
	fmla	v3.2s, v23.2s, v20.s[2]
	fmla	v4.2s, v23.2s, v21.s[2]
	fmla	v6.2s, v23.2s, v22.s[2]
	fmla	v7.2s, v23.2s, v24.s[2]
	mov	x14, x29
	lsl	x12, x12, #2
	ldr	d23, [x10, x12]
	ldr	x10, [sp, #72]                  // 8-byte Folded Reload
	add	x12, x10, #4
	ldp	x17, x10, [sp, #272]            // 16-byte Folded Reload
	str	d23, [x8, x13, lsl #3]
	ldr	x13, [sp, #120]                 // 8-byte Folded Reload
	fmla	v1.2s, v23.2s, v16.s[3]
	fmla	v5.2s, v23.2s, v17.s[3]
	fmla	v0.2s, v23.2s, v18.s[3]
	fmla	v2.2s, v23.2s, v19.s[3]
	fmla	v3.2s, v23.2s, v20.s[3]
	fmla	v4.2s, v23.2s, v21.s[3]
	fmla	v6.2s, v23.2s, v22.s[3]
	fmla	v7.2s, v23.2s, v24.s[3]
	add	x10, x11, x10, lsl #2
	ldr	x11, [sp, #296]                 // 8-byte Folded Reload
	add	x10, x11, x10
	ldr	x11, [sp, #320]                 // 8-byte Folded Reload
	add	x11, x13, x11, lsl #2
	ldr	x13, [sp, #80]                  // 8-byte Folded Reload
	sub	x11, x11, x13
	ldr	x13, [sp, #328]                 // 8-byte Folded Reload
	add	x13, x11, x13
	mul	x11, x15, x12
	add	x12, x13, #4
	ldr	x13, [sp, #96]                  // 8-byte Folded Reload
	lsl	x13, x13, #2
	cmp	x29, x19
	b.ge	.LBB0_68
	.p2align	2
.LBB0_67:                               // =>This Inner Loop Header: Depth=1
	add	x16, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x15, x10, x11
	prfm	pldl1keep, [x16]
	ldur	s17, [x16, #-4]
	add	x16, x16, x28
	add	x12, x12, #4
	prfm	pldl1keep, [x16]
	ldur	s18, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s19, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s20, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s21, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s22, [x16, #-4]
	add	x16, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s23, [x16, #-4]
	prfm	pldl1keep, [x15]
	ldr	d24, [x10, x13]
	add	x10, x10, x17
	fmla	v1.2s, v24.2s, v16.s[0]
	str	d24, [x8, x14, lsl #3]
	add	x14, x14, #1
	fmla	v5.2s, v24.2s, v17.s[0]
	fmla	v0.2s, v24.2s, v18.s[0]
	fmla	v2.2s, v24.2s, v19.s[0]
	fmla	v3.2s, v24.2s, v20.s[0]
	fmla	v4.2s, v24.2s, v21.s[0]
	fmla	v6.2s, v24.2s, v22.s[0]
	fmla	v7.2s, v24.2s, v23.s[0]
	cmp	x14, x19
	b.lt	.LBB0_67
.LBB0_68:                               // %.preheader25
	ldr	x10, [sp, #344]                 // 8-byte Folded Reload
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	mov	x6, xzr
	mov	w3, #7                          // =0x7
	ldr	x15, [sp, #328]                 // 8-byte Folded Reload
	ldr	x12, [sp, #88]                  // 8-byte Folded Reload
	mov	w2, #6                          // =0x6
	mov	w16, #5                         // =0x5
	mov	w18, #4                         // =0x4
	mov	w17, #3                         // =0x3
	mov	w1, #2                          // =0x2
	mov	w4, #1                          // =0x1
	add	x13, x11, x10
	sub	x10, x8, x30, lsl #3
	add	x14, x12, x15
	add	x11, x8, #24
	mov	w12, #8                         // =0x8
	add	x15, x13, x15
	add	x13, x14, #4
	add	x10, x10, x19, lsl #3
	add	x14, x15, #32
	add	x15, x10, #8
	b	.LBB0_70
	.p2align	2
.LBB0_69:                               // %.loopexit24
                                        //   in Loop: Header=BB0_70 Depth=1
	ldp	x20, x6, [sp, #488]             // 16-byte Folded Reload
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	add	x14, x14, x6
	add	x13, x13, x6
	mov	x6, x12
	mov	x12, x5
.LBB0_70:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_72 Depth 2
                                        //     Child Loop BB0_74 Depth 2
	madd	x5, x6, x27, x20
	cmp	x12, x7
	lsl	x5, x5, #2
	madd	x4, x4, x27, x20
	madd	x1, x1, x27, x20
	madd	x17, x17, x27, x20
	madd	x18, x18, x27, x20
	lsl	x4, x4, #2
	lsl	x1, x1, #2
	lsl	x17, x17, #2
	lsl	x18, x18, #2
	madd	x16, x16, x27, x20
	lsl	x16, x16, #2
	str	d1, [x24, x5]
	str	d5, [x24, x4]
	str	d0, [x24, x1]
	str	d2, [x24, x17]
	str	d3, [x24, x18]
	str	d4, [x24, x16]
	madd	x16, x2, x27, x20
	lsl	x16, x16, #2
	str	d6, [x24, x16]
	madd	x16, x3, x27, x20
	lsl	x16, x16, #2
	str	d7, [x24, x16]
	b.ge	.LBB0_75
// %bb.71:                              //   in Loop: Header=BB0_70 Depth=1
	add	x17, x12, #3
	add	x4, x12, #1
	add	x1, x12, #2
	madd	x2, x12, x27, x20
	madd	x7, x17, x27, x20
	add	x18, x12, #4
	add	x16, x12, #5
	mov	x25, x20
	madd	x3, x4, x27, x20
	ldr	d24, [x8]
	mov	x6, xzr
	lsl	x2, x2, #2
	madd	x5, x1, x27, x20
	madd	x20, x18, x27, x20
	lsl	x7, x7, #2
	lsl	x3, x3, #2
	ldr	d1, [x24, x2]
	madd	x2, x16, x27, x25
	lsl	x5, x5, #2
	lsl	x20, x20, #2
	ldr	d2, [x24, x7]
	mul	x7, x12, x22
	ldr	d5, [x24, x3]
	ldr	d0, [x24, x5]
	ldr	d3, [x24, x20]
	mov	x20, x14
	lsl	x2, x2, #2
	lsl	x7, x7, #2
	ldr	d4, [x24, x2]
	add	x2, x12, #6
	ldr	q23, [x9, x7]
	mul	x7, x4, x22
	madd	x3, x2, x27, x25
	lsl	x7, x7, #2
	lsl	x3, x3, #2
	ldr	q22, [x9, x7]
	mul	x7, x1, x22
	ldr	d6, [x24, x3]
	add	x3, x12, #7
	madd	x5, x3, x27, x25
	lsl	x7, x7, #2
	ldr	q21, [x9, x7]
	mul	x7, x17, x22
	lsl	x5, x5, #2
	ldr	d7, [x24, x5]
	add	x5, x12, #8
	lsl	x7, x7, #2
	ldr	q20, [x9, x7]
	mul	x7, x18, x22
	lsl	x7, x7, #2
	ldr	q19, [x9, x7]
	mul	x7, x16, x22
	lsl	x7, x7, #2
	ldr	q18, [x9, x7]
	mul	x7, x2, x22
	lsl	x7, x7, #2
	ldr	q17, [x9, x7]
	mul	x7, x3, x22
	lsl	x7, x7, #2
	ldr	q16, [x9, x7]
	mov	x7, x11
	cmp	xzr, x23
	b.ge	.LBB0_73
	.p2align	2
.LBB0_72:                               //   Parent Loop BB0_70 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x25, x7, #16
	fmla	v1.2s, v24.2s, v23.s[0]
	fmla	v5.2s, v24.2s, v22.s[0]
	add	x6, x6, #4
	fmla	v0.2s, v24.2s, v21.s[0]
	fmla	v2.2s, v24.2s, v20.s[0]
	prfm	pldl1keep, [x25]
	add	x25, x20, x28
	fmla	v3.2s, v24.2s, v19.s[0]
	fmla	v4.2s, v24.2s, v18.s[0]
	fmla	v6.2s, v24.2s, v17.s[0]
	fmla	v7.2s, v24.2s, v16.s[0]
	ldp	d24, d25, [x7, #-16]
	fmla	v1.2s, v24.2s, v23.s[1]
	fmla	v5.2s, v24.2s, v22.s[1]
	fmla	v0.2s, v24.2s, v21.s[1]
	fmla	v2.2s, v24.2s, v20.s[1]
	fmla	v3.2s, v24.2s, v19.s[1]
	fmla	v4.2s, v24.2s, v18.s[1]
	fmla	v6.2s, v24.2s, v17.s[1]
	fmla	v7.2s, v24.2s, v16.s[1]
	fmla	v1.2s, v25.2s, v23.s[2]
	fmla	v5.2s, v25.2s, v22.s[2]
	ldp	d26, d24, [x7], #32
	fmla	v0.2s, v25.2s, v21.s[2]
	fmla	v2.2s, v25.2s, v20.s[2]
	fmla	v3.2s, v25.2s, v19.s[2]
	prfm	pldl1keep, [x20]
	fmla	v4.2s, v25.2s, v18.s[2]
	fmla	v6.2s, v25.2s, v17.s[2]
	fmla	v7.2s, v25.2s, v16.s[2]
	fmla	v1.2s, v26.2s, v23.s[3]
	ldur	q23, [x20, #-16]
	prfm	pldl1keep, [x25]
	fmla	v5.2s, v26.2s, v22.s[3]
	ldur	q22, [x25, #-16]
	add	x25, x25, x28
	fmla	v0.2s, v26.2s, v21.s[3]
	fmla	v2.2s, v26.2s, v20.s[3]
	fmla	v3.2s, v26.2s, v19.s[3]
	fmla	v4.2s, v26.2s, v18.s[3]
	add	x20, x20, #16
	prfm	pldl1keep, [x25]
	ldur	q21, [x25, #-16]
	add	x25, x25, x28
	fmla	v6.2s, v26.2s, v17.s[3]
	fmla	v7.2s, v26.2s, v16.s[3]
	prfm	pldl1keep, [x25]
	ldur	q20, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q19, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q18, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q17, [x25, #-16]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	q16, [x25, #-16]
	cmp	x6, x23
	b.lt	.LBB0_72
.LBB0_73:                               //   in Loop: Header=BB0_70 Depth=1
	ldp	x7, x6, [sp, #400]              // 16-byte Folded Reload
	fmla	v1.2s, v24.2s, v23.s[0]
	fmla	v5.2s, v24.2s, v22.s[0]
	fmla	v0.2s, v24.2s, v21.s[0]
	fmla	v2.2s, v24.2s, v20.s[0]
	mov	x20, x29
	fmla	v3.2s, v24.2s, v19.s[0]
	fmla	v4.2s, v24.2s, v18.s[0]
	ldr	d25, [x8, x7, lsl #3]
	fmla	v6.2s, v24.2s, v17.s[0]
	fmla	v7.2s, v24.2s, v16.s[0]
	ldr	d24, [x8, x6, lsl #3]
	ldr	x6, [sp, #416]                  // 8-byte Folded Reload
	mov	x7, x15
	ldr	d26, [x8, x6, lsl #3]
	mov	x6, x13
	fmla	v1.2s, v25.2s, v23.s[1]
	fmla	v5.2s, v25.2s, v22.s[1]
	fmla	v0.2s, v25.2s, v21.s[1]
	fmla	v2.2s, v25.2s, v20.s[1]
	fmla	v3.2s, v25.2s, v19.s[1]
	fmla	v4.2s, v25.2s, v18.s[1]
	fmla	v6.2s, v25.2s, v17.s[1]
	fmla	v7.2s, v25.2s, v16.s[1]
	fmla	v1.2s, v24.2s, v23.s[2]
	fmla	v5.2s, v24.2s, v22.s[2]
	fmla	v0.2s, v24.2s, v21.s[2]
	fmla	v2.2s, v24.2s, v20.s[2]
	fmla	v3.2s, v24.2s, v19.s[2]
	fmla	v4.2s, v24.2s, v18.s[2]
	fmla	v6.2s, v24.2s, v17.s[2]
	fmla	v7.2s, v24.2s, v16.s[2]
	fmla	v1.2s, v26.2s, v23.s[3]
	fmla	v5.2s, v26.2s, v22.s[3]
	fmla	v0.2s, v26.2s, v21.s[3]
	fmla	v2.2s, v26.2s, v20.s[3]
	fmla	v3.2s, v26.2s, v19.s[3]
	fmla	v4.2s, v26.2s, v18.s[3]
	fmla	v6.2s, v26.2s, v17.s[3]
	fmla	v7.2s, v26.2s, v16.s[3]
	cmp	x29, x19
	b.ge	.LBB0_69
	.p2align	2
.LBB0_74:                               //   Parent Loop BB0_70 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x25, x6, x28
	prfm	pldl1keep, [x6]
	ldur	s16, [x6, #-4]
	add	x20, x20, #1
	prfm	pldl1keep, [x25]
	ldur	s17, [x25, #-4]
	add	x25, x25, x28
	add	x6, x6, #4
	prfm	pldl1keep, [x25]
	ldur	s18, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s19, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s20, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s21, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s22, [x25, #-4]
	add	x25, x25, x28
	prfm	pldl1keep, [x25]
	ldur	s23, [x25, #-4]
	prfm	pldl1keep, [x7]
	ldur	d24, [x7, #-8]
	add	x7, x7, #8
	fmla	v1.2s, v24.2s, v16.s[0]
	fmla	v5.2s, v24.2s, v17.s[0]
	fmla	v0.2s, v24.2s, v18.s[0]
	fmla	v2.2s, v24.2s, v19.s[0]
	fmla	v3.2s, v24.2s, v20.s[0]
	fmla	v4.2s, v24.2s, v21.s[0]
	fmla	v6.2s, v24.2s, v22.s[0]
	fmla	v7.2s, v24.2s, v23.s[0]
	cmp	x20, x19
	b.lt	.LBB0_74
	b	.LBB0_69
.LBB0_75:
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	cmp	x7, x13
	b.lt	.LBB0_78
// %bb.76:
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x10
	b.lt	.LBB0_83
.LBB0_77:
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x11, x10
	b.lt	.LBB0_88
	b	.LBB0_93
.LBB0_78:
	add	x18, x7, #1
	add	x1, x7, #2
	mul	x15, x7, x22
	add	x2, x7, #3
	madd	x12, x18, x27, x20
	mov	x17, x8
	ldr	d16, [x17], #24
	mul	x18, x18, x22
	mov	x16, xzr
	lsl	x14, x15, #2
	mul	x11, x7, x27
	madd	x13, x1, x27, x20
	add	x11, x11, x20
	lsl	x18, x18, #2
	add	x11, x24, x11, lsl #2
	ldr	q5, [x9, x14]
	ldr	q7, [x9, x18]
	mul	x18, x1, x22
	ldr	d0, [x11]
	madd	x14, x2, x27, x20
	lsl	x18, x18, #2
	add	x12, x24, x12, lsl #2
	add	x13, x24, x13, lsl #2
	add	x14, x24, x14, lsl #2
	ldr	d1, [x12]
	ldr	d2, [x13]
	ldr	q6, [x9, x18]
	mul	x18, x2, x22
	ldp	x2, x1, [sp, #320]              // 16-byte Folded Reload
	ldr	d3, [x14]
	lsl	x18, x18, #2
	ldr	q4, [x9, x18]
	ldr	x18, [sp, #32]                  // 8-byte Folded Reload
	lsl	x18, x18, #5
	add	x18, x18, x2, lsl #2
	add	x18, x18, x1
	add	x18, x18, #32
	cmp	xzr, x23
	b.ge	.LBB0_80
	.p2align	2
.LBB0_79:                               // =>This Inner Loop Header: Depth=1
	add	x1, x17, #16
	fmla	v0.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v7.s[0]
	add	x16, x16, #4
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	prfm	pldl1keep, [x1]
	add	x1, x18, x28
	ldp	d16, d17, [x17, #-16]
	fmla	v0.2s, v16.2s, v5.s[1]
	fmla	v1.2s, v16.2s, v7.s[1]
	fmla	v2.2s, v16.2s, v6.s[1]
	fmla	v3.2s, v16.2s, v4.s[1]
	fmla	v0.2s, v17.2s, v5.s[2]
	fmla	v1.2s, v17.2s, v7.s[2]
	fmla	v2.2s, v17.2s, v6.s[2]
	fmla	v3.2s, v17.2s, v4.s[2]
	ldp	d17, d16, [x17], #32
	prfm	pldl1keep, [x18]
	fmla	v0.2s, v17.2s, v5.s[3]
	ldur	q5, [x18, #-16]
	prfm	pldl1keep, [x1]
	fmla	v1.2s, v17.2s, v7.s[3]
	ldur	q7, [x1, #-16]
	add	x1, x1, x28
	fmla	v2.2s, v17.2s, v6.s[3]
	fmla	v3.2s, v17.2s, v4.s[3]
	add	x18, x18, #16
	prfm	pldl1keep, [x1]
	ldur	q6, [x1, #-16]
	add	x1, x1, x28
	prfm	pldl1keep, [x1]
	ldur	q4, [x1, #-16]
	cmp	x16, x23
	b.lt	.LBB0_79
.LBB0_80:
	ldp	x17, x16, [sp, #400]            // 16-byte Folded Reload
	fmla	v0.2s, v16.2s, v5.s[0]
	fmla	v1.2s, v16.2s, v7.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v4.s[0]
	add	x15, x19, x15
	sub	x15, x15, x30
	add	x10, x10, #8
	ldr	d17, [x8, x17, lsl #3]
	fmla	v0.2s, v17.2s, v5.s[1]
	ldr	d16, [x8, x16, lsl #3]
	ldr	x16, [sp, #416]                 // 8-byte Folded Reload
	fmla	v1.2s, v17.2s, v7.s[1]
	fmla	v2.2s, v17.2s, v6.s[1]
	fmla	v3.2s, v17.2s, v4.s[1]
	ldr	d18, [x8, x16, lsl #3]
	ldr	x16, [sp, #344]                 // 8-byte Folded Reload
	add	x15, x16, x15, lsl #2
	ldr	x16, [sp, #328]                 // 8-byte Folded Reload
	fmla	v0.2s, v16.2s, v5.s[2]
	fmla	v1.2s, v16.2s, v7.s[2]
	fmla	v2.2s, v16.2s, v6.s[2]
	fmla	v3.2s, v16.2s, v4.s[2]
	add	x15, x15, x16
	mov	x16, x29
	add	x15, x15, #4
	fmla	v0.2s, v18.2s, v5.s[3]
	fmla	v1.2s, v18.2s, v7.s[3]
	fmla	v2.2s, v18.2s, v6.s[3]
	fmla	v3.2s, v18.2s, v4.s[3]
	cmp	x29, x19
	b.ge	.LBB0_82
	.p2align	2
.LBB0_81:                               // =>This Inner Loop Header: Depth=1
	add	x17, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s4, [x15, #-4]
	add	x16, x16, #1
	prfm	pldl1keep, [x17]
	ldur	s5, [x17, #-4]
	add	x17, x17, x28
	add	x15, x15, #4
	prfm	pldl1keep, [x17]
	ldur	s6, [x17, #-4]
	add	x17, x17, x28
	prfm	pldl1keep, [x17]
	ldur	s7, [x17, #-4]
	prfm	pldl1keep, [x10]
	ldur	d16, [x10, #-8]
	add	x10, x10, #8
	fmla	v0.2s, v16.2s, v4.s[0]
	fmla	v1.2s, v16.2s, v5.s[0]
	fmla	v2.2s, v16.2s, v6.s[0]
	fmla	v3.2s, v16.2s, v7.s[0]
	cmp	x16, x19
	b.lt	.LBB0_81
.LBB0_82:
	str	d0, [x11]
	str	d1, [x12]
	str	d2, [x13]
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	str	d3, [x14]
	ldr	x10, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x10
	b.ge	.LBB0_77
.LBB0_83:
	mul	x10, x13, x27
	add	x12, x13, #1
	mov	x16, x8
	ldr	x18, [sp, #328]                 // 8-byte Folded Reload
	mul	x13, x13, x22
	ldr	d4, [x16], #24
	mov	x15, xzr
	madd	x11, x12, x27, x20
	lsl	x14, x13, #2
	add	x10, x10, x20
	add	x10, x24, x10, lsl #2
	ldr	q3, [x9, x14]
	mul	x14, x12, x22
	add	x11, x24, x11, lsl #2
	ldr	d0, [x10]
	ldr	d1, [x11]
	lsl	x17, x14, #2
	ldr	q2, [x9, x17]
	add	x17, x18, x17
	cmp	xzr, x23
	b.ge	.LBB0_85
	.p2align	2
.LBB0_84:                               // =>This Inner Loop Header: Depth=1
	add	x4, x16, #16
	ldr	x2, [sp, #344]                  // 8-byte Folded Reload
	ldr	x5, [sp, #248]                  // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	prfm	pldl1keep, [x4]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldp	d4, d5, [x16, #-16]
	add	x15, x15, #4
	add	x18, x17, x2
	add	x2, x5, x2
	add	x5, x5, #16
	add	x17, x17, #16
	add	x1, x18, #32
	add	x3, x2, #32
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v5.2s, v3.s[2]
	fmla	v1.2s, v5.2s, v2.s[2]
	ldp	d5, d4, [x16], #32
	prfm	pldl1keep, [x3]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x2, #16]
	prfm	pldl1keep, [x1]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x18, #16]
	str	x5, [sp, #248]                  // 8-byte Folded Spill
	cmp	x15, x23
	b.lt	.LBB0_84
.LBB0_85:
	ldr	x15, [sp, #400]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.s[0]
	fmla	v1.2s, v4.2s, v2.s[0]
	ldr	x17, [sp, #344]                 // 8-byte Folded Reload
	add	x13, x19, x13
	mul	x12, x22, x12
	ldr	x16, [sp, #328]                 // 8-byte Folded Reload
	add	x12, x17, x12, lsl #2
	ldr	d5, [x8, x15, lsl #3]
	ldr	x15, [sp, #408]                 // 8-byte Folded Reload
	add	x12, x16, x12
	ldr	d4, [x8, x15, lsl #3]
	ldr	x15, [sp, #416]                 // 8-byte Folded Reload
	fmla	v0.2s, v5.2s, v3.s[1]
	fmla	v1.2s, v5.2s, v2.s[1]
	ldr	d5, [x8, x15, lsl #3]
	sub	x15, x13, x30
	add	x13, x19, x14
	add	x14, x17, x15, lsl #2
	ldr	x15, [sp, #40]                  // 8-byte Folded Reload
	sub	x13, x13, x30
	fmla	v0.2s, v4.2s, v3.s[2]
	fmla	v1.2s, v4.2s, v2.s[2]
	add	x13, x17, x13, lsl #2
	add	x14, x14, x16
	add	x13, x13, x16
	add	x14, x14, #4
	add	x15, x17, x15, lsl #4
	add	x13, x13, #4
	fmla	v0.2s, v5.2s, v3.s[3]
	fmla	v1.2s, v5.2s, v2.s[3]
	add	x15, x16, x15
	mov	x16, x29
	cmp	x29, x19
	b.ge	.LBB0_87
	.p2align	2
.LBB0_86:                               // =>This Inner Loop Header: Depth=1
	add	x17, x8, x16, lsl #3
	prfm	pldl1keep, [x14]
	ldr	s2, [x15, x16, lsl #2]
	prfm	pldl1keep, [x13]
	ldr	s3, [x12, x16, lsl #2]
	add	x13, x13, #4
	add	x17, x17, #8
	add	x14, x14, #4
	prfm	pldl1keep, [x17]
	ldr	d4, [x8, x16, lsl #3]
	add	x16, x16, #1
	fmla	v0.2s, v4.2s, v2.s[0]
	fmla	v1.2s, v4.2s, v3.s[0]
	cmp	x16, x19
	b.lt	.LBB0_86
.LBB0_87:
	str	d0, [x10]
	str	d1, [x11]
	ldr	x10, [sp, #288]                 // 8-byte Folded Reload
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x11, x10
	b.ge	.LBB0_93
.LBB0_88:
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	mov	x13, x8
	mov	x12, xzr
	mul	x10, x11, x27
	mul	x11, x11, x22
	ldr	d2, [x13], #24
	lsl	x14, x11, #2
	add	x10, x10, x20
	ldr	q1, [x9, x14]
	ldr	x9, [sp, #48]                   // 8-byte Folded Reload
	ldp	x15, x14, [sp, #320]            // 16-byte Folded Reload
	add	x10, x24, x10, lsl #2
	ldr	d0, [x10]
	lsl	x9, x9, #3
	add	x9, x9, x15, lsl #2
	add	x9, x9, x14
	add	x9, x9, #32
	cmp	xzr, x23
	b.ge	.LBB0_90
	.p2align	2
.LBB0_89:                               // =>This Inner Loop Header: Depth=1
	add	x14, x13, #16
	fmla	v0.2s, v2.2s, v1.s[0]
	add	x12, x12, #4
	prfm	pldl1keep, [x14]
	ldp	d2, d3, [x13, #-16]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v3.2s, v1.s[2]
	ldp	d3, d2, [x13], #32
	prfm	pldl1keep, [x9]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x9, #-16]
	add	x9, x9, #16
	cmp	x12, x23
	b.lt	.LBB0_89
.LBB0_90:
	ldr	x9, [sp, #400]                  // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[0]
	ldr	x12, [sp, #24]                  // 8-byte Folded Reload
	ldr	d3, [x8, x9, lsl #3]
	ldr	x9, [sp, #408]                  // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v1.s[1]
	ldr	d2, [x8, x9, lsl #3]
	ldr	x9, [sp, #416]                  // 8-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.s[2]
	ldr	d3, [x8, x9, lsl #3]
	add	x9, x19, x11
	ldr	x11, [sp, #344]                 // 8-byte Folded Reload
	sub	x9, x9, x30
	add	x9, x11, x9, lsl #2
	ldr	x11, [sp, #328]                 // 8-byte Folded Reload
	fmla	v0.2s, v3.2s, v1.s[3]
	add	x9, x9, x11
	add	x11, x11, x12
	mov	x12, x29
	add	x9, x9, #4
	cmp	x29, x19
	b.ge	.LBB0_92
	.p2align	2
.LBB0_91:                               // =>This Inner Loop Header: Depth=1
	add	x13, x8, x12, lsl #3
	prfm	pldl1keep, [x9]
	ldr	s1, [x11, x12, lsl #2]
	add	x9, x9, #4
	add	x13, x13, #8
	prfm	pldl1keep, [x13]
	ldr	d2, [x8, x12, lsl #3]
	add	x12, x12, #1
	fmla	v0.2s, v2.2s, v1.s[0]
	cmp	x12, x19
	b.lt	.LBB0_91
.LBB0_92:
	str	d0, [x10]
.LBB0_93:
	bl	free
	ldr	x20, [sp, #472]                 // 8-byte Folded Reload
.LBB0_94:
	ldr	x8, [sp, #128]                  // 8-byte Folded Reload
	ldr	x25, [sp, #480]                 // 8-byte Folded Reload
	cmp	x25, x8
	b.ge	.LBB0_126
// %bb.95:
	ldr	x8, [sp, #120]                  // 8-byte Folded Reload
	add	x0, x8, #64
	bl	malloc
	add	x10, x25, x27, lsl #2
	ldr	x18, [sp, #328]                 // 8-byte Folded Reload
	ldr	x1, [sp, #344]                  // 8-byte Folded Reload
	mov	w5, #12                         // =0xc
	add	x9, x25, x27, lsl #1
	sub	x13, x25, x27
	mov	w11, #6                         // =0x6
	add	x8, x27, x25
	add	x16, x10, x27
	ldr	s2, [x24, x10, lsl #2]
	mul	x10, x22, x5
	add	x15, x9, x27
	ldr	s5, [x24, x9, lsl #2]
	add	x13, x13, x27, lsl #3
	ldr	s3, [x24, x16, lsl #2]
	add	x9, x18, x1
	mov	w16, #20                        // =0x14
	ldr	s4, [x24, x15, lsl #2]
	mov	w15, #24                        // =0x18
	madd	x11, x27, x11, x25
	ldr	q19, [x9, x10]
	mul	x10, x22, x16
	add	x14, x0, #63
	ldr	s0, [x24, x13, lsl #2]
	mul	x13, x22, x15
	ldr	x4, [sp, #64]                   // 8-byte Folded Reload
	ldp	x7, x6, [sp, #296]              // 16-byte Folded Reload
	ldr	q22, [x9, x13]
	mov	w13, #28                        // =0x1c
	ldr	s1, [x24, x11, lsl #2]
	add	x11, x7, x21
	ldr	q21, [x9, x10]
	ldr	x10, [sp, #464]                 // 8-byte Folded Reload
	ldr	q16, [x9]
	ldr	s7, [x24, x8, lsl #2]
	ldr	s6, [x24, x25, lsl #2]
	ldr	s23, [x11, x25, lsl #2]
	ldr	q17, [x9, x28]
	ldr	q18, [x9, x20]
	ldr	q20, [x9, x22, lsl #4]
	lsl	x10, x10, #3
	and	x8, x14, #0xffffffffffffffc0
	ldr	x29, [sp, #504]                 // 8-byte Folded Reload
	ldr	x30, [sp, #104]                 // 8-byte Folded Reload
	madd	x17, x6, x13, x10
	add	x14, x10, x6, lsl #5
	madd	x15, x6, x15, x10
	madd	x16, x6, x16, x10
	madd	x5, x6, x5, x10
	add	x2, x10, x6, lsl #3
	mov	w3, #16                         // =0x10
	mov	x12, xzr
	add	x13, x7, x14
	add	x2, x7, x2
	sub	x3, x3, x4
	add	x14, x7, x17
	add	x17, x1, x18
	add	x1, x10, x6, lsl #2
	add	x18, x26, x10
	add	x15, x7, x15
	add	x16, x7, x16
	add	x5, x7, x5
	add	x17, x4, x17
	add	x18, x7, x18
	orr	x4, x8, #0x8
	add	x17, x17, #16
	add	x1, x7, x1
	.p2align	2
.LBB0_96:                               // =>This Inner Loop Header: Depth=1
	prfm	pldl1keep, [x17]
	ldur	q24, [x17, #-16]
	ext	v31.16b, v16.16b, v16.16b, #8
	ext	v8.16b, v17.16b, v17.16b, #8
	cmp	x12, x23
	ext	v30.16b, v18.16b, v18.16b, #8
	ext	v29.16b, v19.16b, v19.16b, #8
	ext	v28.16b, v20.16b, v20.16b, #8
	ext	v27.16b, v21.16b, v21.16b, #8
	ext	v26.16b, v22.16b, v22.16b, #8
	ext	v25.16b, v24.16b, v24.16b, #8
	b.ge	.LBB0_98
// %bb.97:                              //   in Loop: Header=BB0_96 Depth=1
	add	x6, x16, x21
	stur	s23, [x4, #-8]
	fmla	v4.2s, v23.2s, v19.2s
	fmla	v6.2s, v23.2s, v16.2s
	prfm	pldl1keep, [x6]
	ldr	s9, [x1, x21]
	add	x6, x15, x21
	fmla	v7.2s, v23.2s, v17.2s
	fmla	v5.2s, v23.2s, v18.2s
	fmla	v2.2s, v23.2s, v20.2s
	fmla	v3.2s, v23.2s, v21.2s
	fmla	v1.2s, v23.2s, v22.2s
	fmla	v0.2s, v23.2s, v24.2s
	add	x7, x14, x21
	add	x20, x17, x3
	add	x25, x20, x28
	add	x12, x12, #4
	add	x14, x14, x26
	add	x15, x15, x26
	add	x16, x16, x26
	add	x17, x17, #16
	add	x1, x1, x26
	stur	s9, [x4, #-4]
	prfm	pldl1keep, [x6]
	ldr	s23, [x2, x21]
	fmla	v4.2s, v9.2s, v19.s[1]
	fmla	v6.2s, v9.2s, v16.s[1]
	fmla	v7.2s, v9.2s, v17.s[1]
	fmla	v5.2s, v9.2s, v18.s[1]
	fmla	v2.2s, v9.2s, v20.s[1]
	fmla	v3.2s, v9.2s, v21.s[1]
	fmla	v1.2s, v9.2s, v22.s[1]
	fmla	v0.2s, v9.2s, v24.s[1]
	add	x6, x13, x21
	add	x13, x13, x26
	add	x2, x2, x26
	str	s23, [x4]
	prfm	pldl1keep, [x7]
	fmla	v4.2s, v23.2s, v29.2s
	ldr	s29, [x5, x21]
	fmla	v6.2s, v23.2s, v31.2s
	fmla	v7.2s, v23.2s, v8.2s
	fmla	v5.2s, v23.2s, v30.2s
	fmla	v2.2s, v23.2s, v28.2s
	add	x7, x25, x28
	fmla	v3.2s, v23.2s, v27.2s
	fmla	v1.2s, v23.2s, v26.2s
	fmla	v0.2s, v23.2s, v25.2s
	add	x5, x5, x26
	str	s29, [x4, #4]
	prfm	pldl1keep, [x6]
	add	x6, x7, x28
	fmla	v6.2s, v29.2s, v16.s[3]
	fmla	v7.2s, v29.2s, v17.s[3]
	fmla	v5.2s, v29.2s, v18.s[3]
	fmla	v4.2s, v29.2s, v19.s[3]
	fmla	v2.2s, v29.2s, v20.s[3]
	ldr	s23, [x18, x21]
	prfm	pldl1keep, [x20]
	ldur	q16, [x20, #-16]
	prfm	pldl1keep, [x25]
	ldur	q17, [x25, #-16]
	prfm	pldl1keep, [x7]
	ldur	q18, [x7, #-16]
	fmla	v3.2s, v29.2s, v21.s[3]
	fmla	v1.2s, v29.2s, v22.s[3]
	fmla	v0.2s, v29.2s, v24.s[3]
	add	x18, x18, x26
	add	x4, x4, #16
	prfm	pldl1keep, [x6]
	ldur	q19, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q20, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q21, [x6, #-16]
	add	x6, x6, x28
	prfm	pldl1keep, [x6]
	ldur	q22, [x6, #-16]
	b	.LBB0_96
.LBB0_98:
	ldp	x13, x14, [sp, #400]            // 16-byte Folded Reload
	ldr	x15, [sp, #304]                 // 8-byte Folded Reload
	fmla	v6.2s, v23.2s, v16.2s
	ldr	x25, [sp, #480]                 // 8-byte Folded Reload
	str	s23, [x8, x23, lsl #2]
	fmla	v7.2s, v23.2s, v17.2s
	fmla	v5.2s, v23.2s, v18.2s
	fmla	v4.2s, v23.2s, v19.2s
	fmla	v2.2s, v23.2s, v20.2s
	fmla	v3.2s, v23.2s, v21.2s
	fmla	v1.2s, v23.2s, v22.2s
	fmla	v0.2s, v23.2s, v24.2s
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	ldr	x16, [sp, #96]                  // 8-byte Folded Reload
	madd	x12, x13, x15, x25
	ldr	s23, [x11, x12, lsl #2]
	madd	x12, x14, x15, x25
	str	s23, [x8, x13, lsl #2]
	ldr	x13, [sp, #416]                 // 8-byte Folded Reload
	fmla	v6.2s, v23.2s, v16.s[1]
	fmla	v7.2s, v23.2s, v17.s[1]
	fmla	v5.2s, v23.2s, v18.s[1]
	fmla	v4.2s, v23.2s, v19.s[1]
	fmla	v2.2s, v23.2s, v20.s[1]
	fmla	v3.2s, v23.2s, v21.s[1]
	fmla	v1.2s, v23.2s, v22.s[1]
	fmla	v0.2s, v23.2s, v24.s[1]
	ldr	s23, [x11, x12, lsl #2]
	madd	x12, x13, x15, x25
	fmla	v6.2s, v23.2s, v31.2s
	str	s23, [x8, x14, lsl #2]
	fmla	v7.2s, v23.2s, v8.2s
	fmla	v5.2s, v23.2s, v30.2s
	fmla	v4.2s, v23.2s, v29.2s
	fmla	v2.2s, v23.2s, v28.2s
	fmla	v3.2s, v23.2s, v27.2s
	fmla	v1.2s, v23.2s, v26.2s
	fmla	v0.2s, v23.2s, v25.2s
	ldr	s31, [x11, x12, lsl #2]
	ldr	x11, [sp, #72]                  // 8-byte Folded Reload
	ldp	x17, x12, [sp, #272]            // 16-byte Folded Reload
	add	x10, x10, x12, lsl #2
	ldr	x12, [sp, #296]                 // 8-byte Folded Reload
	add	x11, x11, #4
	mul	x11, x15, x11
	str	s31, [x8, x13, lsl #2]
	ldr	x13, [sp, #120]                 // 8-byte Folded Reload
	fmla	v6.2s, v31.2s, v16.s[3]
	fmla	v7.2s, v31.2s, v17.s[3]
	fmla	v5.2s, v31.2s, v18.s[3]
	fmla	v4.2s, v31.2s, v19.s[3]
	fmla	v2.2s, v31.2s, v20.s[3]
	fmla	v3.2s, v31.2s, v21.s[3]
	fmla	v1.2s, v31.2s, v22.s[3]
	fmla	v0.2s, v31.2s, v24.s[3]
	add	x10, x12, x10
	ldr	x12, [sp, #320]                 // 8-byte Folded Reload
	add	x12, x13, x12, lsl #2
	ldr	x13, [sp, #80]                  // 8-byte Folded Reload
	sub	x12, x12, x13
	ldr	x13, [sp, #328]                 // 8-byte Folded Reload
	add	x12, x12, x13
	mov	x13, x29
	add	x12, x12, #4
	cmp	x29, x19
	b.ge	.LBB0_100
	.p2align	2
.LBB0_99:                               // =>This Inner Loop Header: Depth=1
	add	x15, x12, x28
	prfm	pldl1keep, [x12]
	ldur	s16, [x12, #-4]
	add	x14, x10, x11
	prfm	pldl1keep, [x15]
	ldur	s17, [x15, #-4]
	add	x15, x15, x28
	add	x12, x12, #4
	prfm	pldl1keep, [x15]
	ldur	s18, [x15, #-4]
	add	x15, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s19, [x15, #-4]
	add	x15, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s20, [x15, #-4]
	add	x15, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s21, [x15, #-4]
	add	x15, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s22, [x15, #-4]
	add	x15, x15, x28
	prfm	pldl1keep, [x15]
	ldur	s23, [x15, #-4]
	prfm	pldl1keep, [x14]
	ldr	s24, [x10, x16, lsl #2]
	add	x10, x10, x17
	fmla	v6.2s, v24.2s, v16.2s
	str	s24, [x8, x13, lsl #2]
	add	x13, x13, #1
	fmla	v7.2s, v24.2s, v17.2s
	fmla	v5.2s, v24.2s, v18.2s
	fmla	v4.2s, v24.2s, v19.2s
	fmla	v2.2s, v24.2s, v20.2s
	fmla	v3.2s, v24.2s, v21.2s
	fmla	v1.2s, v24.2s, v22.2s
	fmla	v0.2s, v24.2s, v23.2s
	cmp	x13, x19
	b.lt	.LBB0_99
.LBB0_100:                              // %.preheader
	ldr	x10, [sp, #344]                 // 8-byte Folded Reload
	ldr	x11, [sp, #496]                 // 8-byte Folded Reload
	mov	x6, xzr
	mov	w16, #7                         // =0x7
	ldr	x15, [sp, #328]                 // 8-byte Folded Reload
	ldr	x12, [sp, #88]                  // 8-byte Folded Reload
	mov	w17, #6                         // =0x6
	mov	w18, #5                         // =0x5
	mov	w1, #4                          // =0x4
	mov	w2, #3                          // =0x3
	mov	w3, #2                          // =0x2
	mov	w4, #1                          // =0x1
	add	x13, x11, x10
	sub	x10, x8, x30, lsl #2
	add	x14, x12, x15
	add	x11, x8, #12
	mov	w12, #8                         // =0x8
	add	x15, x13, x15
	add	x13, x14, #4
	add	x10, x10, x19, lsl #2
	add	x14, x15, #32
	add	x15, x10, #4
	b	.LBB0_102
	.p2align	2
.LBB0_101:                              // %.loopexit
                                        //   in Loop: Header=BB0_102 Depth=1
	ldr	x6, [sp, #496]                  // 8-byte Folded Reload
	ldr	x7, [sp, #520]                  // 8-byte Folded Reload
	add	x14, x14, x6
	add	x13, x13, x6
	mov	x6, x12
	mov	x12, x5
.LBB0_102:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_104 Depth 2
                                        //     Child Loop BB0_106 Depth 2
	madd	x5, x6, x27, x25
	cmp	x12, x7
	str	s6, [x24, x5, lsl #2]
	madd	x4, x4, x27, x25
	madd	x3, x3, x27, x25
	madd	x2, x2, x27, x25
	madd	x1, x1, x27, x25
	str	s7, [x24, x4, lsl #2]
	str	s5, [x24, x3, lsl #2]
	str	s4, [x24, x2, lsl #2]
	str	s2, [x24, x1, lsl #2]
	madd	x18, x18, x27, x25
	str	s3, [x24, x18, lsl #2]
	madd	x17, x17, x27, x25
	str	s1, [x24, x17, lsl #2]
	madd	x16, x16, x27, x25
	str	s0, [x24, x16, lsl #2]
	b.ge	.LBB0_107
// %bb.103:                             //   in Loop: Header=BB0_102 Depth=1
	madd	x3, x12, x27, x25
	add	x2, x12, #3
	add	x18, x12, #5
	add	x1, x12, #4
	madd	x4, x2, x27, x25
	add	x17, x12, #6
	add	x16, x12, #7
	ldr	s24, [x8]
	madd	x7, x18, x27, x25
	mov	x6, xzr
	ldr	s6, [x24, x3, lsl #2]
	add	x3, x12, #2
	madd	x5, x1, x27, x25
	madd	x20, x17, x27, x25
	madd	x21, x16, x27, x25
	ldr	s3, [x24, x7, lsl #2]
	ldr	s4, [x24, x4, lsl #2]
	ldr	s2, [x24, x5, lsl #2]
	ldr	s0, [x24, x21, lsl #2]
	madd	x4, x3, x27, x25
	ldr	s1, [x24, x20, lsl #2]
	mov	x20, x14
	mul	x7, x12, x22
	ldr	s5, [x24, x4, lsl #2]
	add	x4, x12, #1
	lsl	x7, x7, #2
	ldr	q23, [x9, x7]
	mul	x7, x4, x22
	madd	x5, x4, x27, x25
	lsl	x7, x7, #2
	ldr	s7, [x24, x5, lsl #2]
	add	x5, x12, #8
	ldr	q22, [x9, x7]
	mul	x7, x3, x22
	lsl	x7, x7, #2
	ldr	q21, [x9, x7]
	mul	x7, x2, x22
	lsl	x7, x7, #2
	ldr	q20, [x9, x7]
	mul	x7, x1, x22
	lsl	x7, x7, #2
	ldr	q19, [x9, x7]
	mul	x7, x18, x22
	lsl	x7, x7, #2
	ldr	q18, [x9, x7]
	mul	x7, x17, x22
	lsl	x7, x7, #2
	ldr	q17, [x9, x7]
	mul	x7, x16, x22
	lsl	x7, x7, #2
	ldr	q16, [x9, x7]
	mov	x7, x11
	fmla	v6.2s, v24.2s, v23.2s
	cmp	xzr, x23
	b.ge	.LBB0_105
	.p2align	2
.LBB0_104:                              //   Parent Loop BB0_102 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x21, x7, #8
	fmla	v4.2s, v24.2s, v20.2s
	fmla	v7.2s, v24.2s, v22.2s
	add	x6, x6, #4
	prfm	pldl1keep, [x21]
	ldp	s27, s25, [x7, #-8]
	fmla	v5.2s, v24.2s, v21.2s
	fmla	v2.2s, v24.2s, v19.2s
	fmla	v3.2s, v24.2s, v18.2s
	fmla	v1.2s, v24.2s, v17.2s
	add	x21, x20, x28
	ext	v28.16b, v20.16b, v20.16b, #8
	fmla	v0.2s, v24.2s, v16.2s
	fmla	v4.2s, v27.2s, v20.s[1]
	fmla	v6.2s, v27.2s, v23.s[1]
	fmla	v7.2s, v27.2s, v22.s[1]
	fmla	v5.2s, v27.2s, v21.s[1]
	fmla	v2.2s, v27.2s, v19.s[1]
	ldp	s26, s24, [x7], #16
	prfm	pldl1keep, [x20]
	fmla	v3.2s, v27.2s, v18.s[1]
	fmla	v1.2s, v27.2s, v17.s[1]
	fmla	v0.2s, v27.2s, v16.s[1]
	fmla	v4.2s, v25.2s, v28.2s
	ext	v30.16b, v23.16b, v23.16b, #8
	ext	v31.16b, v22.16b, v22.16b, #8
	fmla	v6.2s, v25.2s, v30.2s
	fmla	v7.2s, v25.2s, v31.2s
	fmla	v6.2s, v26.2s, v23.s[3]
	ldur	q23, [x20, #-16]
	ext	v29.16b, v21.16b, v21.16b, #8
	ext	v28.16b, v19.16b, v19.16b, #8
	fmla	v5.2s, v25.2s, v29.2s
	prfm	pldl1keep, [x21]
	add	x20, x20, #16
	fmla	v2.2s, v25.2s, v28.2s
	fmla	v7.2s, v26.2s, v22.s[3]
	ldur	q22, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	fmla	v5.2s, v26.2s, v21.s[3]
	ldur	q21, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ext	v28.16b, v18.16b, v18.16b, #8
	fmla	v3.2s, v25.2s, v28.2s
	fmla	v4.2s, v26.2s, v20.s[3]
	ldur	q20, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	fmla	v2.2s, v26.2s, v19.s[3]
	ldur	q19, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	fmla	v3.2s, v26.2s, v18.s[3]
	ldur	q18, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ext	v28.16b, v17.16b, v17.16b, #8
	fmla	v1.2s, v25.2s, v28.2s
	fmla	v1.2s, v26.2s, v17.s[3]
	ldur	q17, [x21, #-16]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ext	v27.16b, v16.16b, v16.16b, #8
	fmla	v0.2s, v25.2s, v27.2s
	fmla	v0.2s, v26.2s, v16.s[3]
	ldur	q16, [x21, #-16]
	fmla	v6.2s, v24.2s, v23.2s
	cmp	x6, x23
	b.lt	.LBB0_104
.LBB0_105:                              //   in Loop: Header=BB0_102 Depth=1
	ldp	x7, x6, [sp, #400]              // 16-byte Folded Reload
	fmla	v7.2s, v24.2s, v22.2s
	fmla	v4.2s, v24.2s, v20.2s
	fmla	v5.2s, v24.2s, v21.2s
	fmla	v2.2s, v24.2s, v19.2s
	mov	x20, x29
	fmla	v3.2s, v24.2s, v18.2s
	fmla	v1.2s, v24.2s, v17.2s
	ldr	s26, [x8, x7, lsl #2]
	fmla	v0.2s, v24.2s, v16.2s
	ldr	s27, [x8, x6, lsl #2]
	ext	v24.16b, v23.16b, v23.16b, #8
	ldr	x6, [sp, #416]                  // 8-byte Folded Reload
	mov	x7, x15
	ldr	s25, [x8, x6, lsl #2]
	mov	x6, x13
	fmla	v6.2s, v26.2s, v23.s[1]
	fmla	v7.2s, v26.2s, v22.s[1]
	fmla	v4.2s, v26.2s, v20.s[1]
	fmla	v2.2s, v26.2s, v19.s[1]
	fmla	v5.2s, v26.2s, v21.s[1]
	fmla	v3.2s, v26.2s, v18.s[1]
	fmla	v1.2s, v26.2s, v17.s[1]
	fmla	v0.2s, v26.2s, v16.s[1]
	ext	v26.16b, v21.16b, v21.16b, #8
	fmla	v6.2s, v27.2s, v24.2s
	ext	v24.16b, v22.16b, v22.16b, #8
	fmla	v5.2s, v27.2s, v26.2s
	fmla	v7.2s, v27.2s, v24.2s
	ext	v24.16b, v20.16b, v20.16b, #8
	ext	v26.16b, v17.16b, v17.16b, #8
	fmla	v1.2s, v27.2s, v26.2s
	fmla	v4.2s, v27.2s, v24.2s
	ext	v24.16b, v19.16b, v19.16b, #8
	fmla	v6.2s, v25.2s, v23.s[3]
	fmla	v5.2s, v25.2s, v21.s[3]
	fmla	v2.2s, v27.2s, v24.2s
	fmla	v7.2s, v25.2s, v22.s[3]
	ext	v24.16b, v18.16b, v18.16b, #8
	fmla	v1.2s, v25.2s, v17.s[3]
	fmla	v3.2s, v27.2s, v24.2s
	ext	v24.16b, v16.16b, v16.16b, #8
	fmla	v4.2s, v25.2s, v20.s[3]
	fmla	v0.2s, v27.2s, v24.2s
	fmla	v2.2s, v25.2s, v19.s[3]
	fmla	v3.2s, v25.2s, v18.s[3]
	fmla	v0.2s, v25.2s, v16.s[3]
	cmp	x29, x19
	b.ge	.LBB0_101
	.p2align	2
.LBB0_106:                              //   Parent Loop BB0_102 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x21, x6, x28
	prfm	pldl1keep, [x6]
	ldur	s16, [x6, #-4]
	add	x20, x20, #1
	prfm	pldl1keep, [x21]
	ldur	s17, [x21, #-4]
	add	x21, x21, x28
	add	x6, x6, #4
	prfm	pldl1keep, [x21]
	ldur	s18, [x21, #-4]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ldur	s19, [x21, #-4]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ldur	s20, [x21, #-4]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ldur	s21, [x21, #-4]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ldur	s22, [x21, #-4]
	add	x21, x21, x28
	prfm	pldl1keep, [x21]
	ldur	s23, [x21, #-4]
	prfm	pldl1keep, [x7]
	ldur	s24, [x7, #-4]
	add	x7, x7, #4
	fmla	v6.2s, v24.2s, v16.2s
	fmla	v7.2s, v24.2s, v17.2s
	fmla	v5.2s, v24.2s, v18.2s
	fmla	v4.2s, v24.2s, v19.2s
	fmla	v2.2s, v24.2s, v20.2s
	fmla	v3.2s, v24.2s, v21.2s
	fmla	v1.2s, v24.2s, v22.2s
	fmla	v0.2s, v24.2s, v23.2s
	cmp	x20, x19
	b.lt	.LBB0_106
	b	.LBB0_101
.LBB0_107:
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	cmp	x7, x13
	b.lt	.LBB0_110
// %bb.108:
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x11
	b.lt	.LBB0_115
.LBB0_109:
	ldr	x11, [sp, #288]                 // 8-byte Folded Reload
	ldr	x12, [sp, #312]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.lt	.LBB0_120
	b	.LBB0_125
.LBB0_110:
	add	x18, x7, #1
	add	x1, x7, #2
	add	x2, x7, #3
	mul	x14, x7, x27
	madd	x13, x18, x27, x25
	mov	x16, xzr
	add	x14, x14, x25
	mul	x18, x18, x22
	mul	x15, x7, x22
	madd	x12, x1, x27, x25
	lsl	x17, x15, #2
	lsl	x18, x18, #2
	madd	x11, x2, x27, x25
	ldr	s2, [x24, x14, lsl #2]
	ldr	s0, [x24, x11, lsl #2]
	ldr	s1, [x24, x12, lsl #2]
	ldr	s3, [x24, x13, lsl #2]
	ldr	q6, [x9, x17]
	ldr	q7, [x9, x18]
	mul	x18, x1, x22
	mov	x17, x8
	ldr	s16, [x17], #12
	lsl	x18, x18, #2
	ldr	q5, [x9, x18]
	mul	x18, x2, x22
	lsl	x18, x18, #2
	ldp	x2, x1, [sp, #320]              // 16-byte Folded Reload
	ldr	q4, [x9, x18]
	ldr	x18, [sp, #32]                  // 8-byte Folded Reload
	lsl	x18, x18, #5
	add	x18, x18, x2, lsl #2
	add	x18, x18, x1
	add	x18, x18, #32
	ext	v20.16b, v6.16b, v6.16b, #8
	cmp	xzr, x23
	ext	v19.16b, v7.16b, v7.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.ge	.LBB0_112
	.p2align	2
.LBB0_111:                              // =>This Inner Loop Header: Depth=1
	add	x1, x17, #8
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v3.2s, v16.2s, v7.2s
	add	x16, x16, #4
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	prfm	pldl1keep, [x1]
	add	x1, x18, x28
	ldp	s16, s21, [x17, #-8]
	fmla	v0.2s, v16.2s, v4.s[1]
	fmla	v2.2s, v16.2s, v6.s[1]
	fmla	v3.2s, v16.2s, v7.s[1]
	fmla	v1.2s, v16.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v17.2s
	fmla	v2.2s, v21.2s, v20.2s
	ldp	s17, s16, [x17], #16
	fmla	v3.2s, v21.2s, v19.2s
	fmla	v1.2s, v21.2s, v18.2s
	prfm	pldl1keep, [x18]
	fmla	v2.2s, v17.2s, v6.s[3]
	ldur	q6, [x18, #-16]
	prfm	pldl1keep, [x1]
	fmla	v3.2s, v17.2s, v7.s[3]
	ldur	q7, [x1, #-16]
	add	x1, x1, x28
	fmla	v1.2s, v17.2s, v5.s[3]
	fmla	v0.2s, v17.2s, v4.s[3]
	add	x18, x18, #16
	prfm	pldl1keep, [x1]
	ldur	q5, [x1, #-16]
	add	x1, x1, x28
	prfm	pldl1keep, [x1]
	ldur	q4, [x1, #-16]
	ext	v20.16b, v6.16b, v6.16b, #8
	cmp	x16, x23
	ext	v19.16b, v7.16b, v7.16b, #8
	ext	v18.16b, v5.16b, v5.16b, #8
	ext	v17.16b, v4.16b, v4.16b, #8
	b.lt	.LBB0_111
.LBB0_112:
	ldp	x17, x16, [sp, #400]            // 16-byte Folded Reload
	fmla	v2.2s, v16.2s, v6.2s
	fmla	v3.2s, v16.2s, v7.2s
	fmla	v1.2s, v16.2s, v5.2s
	fmla	v0.2s, v16.2s, v4.2s
	add	x15, x19, x15
	ldr	s21, [x8, x17, lsl #2]
	ldr	s16, [x8, x16, lsl #2]
	ldr	x16, [sp, #416]                 // 8-byte Folded Reload
	ldr	x17, [sp, #344]                 // 8-byte Folded Reload
	ldr	s22, [x8, x16, lsl #2]
	sub	x16, x15, x30
	add	x15, x10, #4
	add	x16, x17, x16, lsl #2
	ldr	x17, [sp, #328]                 // 8-byte Folded Reload
	fmla	v2.2s, v21.2s, v6.s[1]
	fmla	v3.2s, v21.2s, v7.s[1]
	fmla	v1.2s, v21.2s, v5.s[1]
	fmla	v0.2s, v21.2s, v4.s[1]
	add	x16, x16, x17
	mov	x17, x29
	fmla	v2.2s, v16.2s, v20.2s
	fmla	v3.2s, v16.2s, v19.2s
	fmla	v1.2s, v16.2s, v18.2s
	fmla	v0.2s, v16.2s, v17.2s
	add	x16, x16, #4
	fmla	v2.2s, v22.2s, v6.s[3]
	fmla	v3.2s, v22.2s, v7.s[3]
	fmla	v1.2s, v22.2s, v5.s[3]
	fmla	v0.2s, v22.2s, v4.s[3]
	cmp	x29, x19
	b.ge	.LBB0_114
	.p2align	2
.LBB0_113:                              // =>This Inner Loop Header: Depth=1
	add	x18, x16, x28
	prfm	pldl1keep, [x16]
	ldur	s4, [x16, #-4]
	add	x17, x17, #1
	prfm	pldl1keep, [x18]
	ldur	s5, [x18, #-4]
	add	x18, x18, x28
	add	x16, x16, #4
	prfm	pldl1keep, [x18]
	ldur	s6, [x18, #-4]
	add	x18, x18, x28
	prfm	pldl1keep, [x18]
	ldur	s7, [x18, #-4]
	prfm	pldl1keep, [x15]
	ldur	s16, [x15, #-4]
	add	x15, x15, #4
	fmla	v2.2s, v16.2s, v4.2s
	fmla	v3.2s, v16.2s, v5.2s
	fmla	v1.2s, v16.2s, v6.2s
	fmla	v0.2s, v16.2s, v7.2s
	cmp	x17, x19
	b.lt	.LBB0_113
.LBB0_114:
	str	s2, [x24, x14, lsl #2]
	str	s3, [x24, x13, lsl #2]
	ldr	x13, [sp, #336]                 // 8-byte Folded Reload
	str	s1, [x24, x12, lsl #2]
	str	s0, [x24, x11, lsl #2]
	ldr	x11, [sp, #312]                 // 8-byte Folded Reload
	cmp	x13, x11
	b.ge	.LBB0_109
.LBB0_115:
	mul	x11, x13, x27
	add	x14, x13, #1
	ldr	x1, [sp, #328]                  // 8-byte Folded Reload
	ldr	x2, [sp, #344]                  // 8-byte Folded Reload
	mul	x13, x13, x22
	ldr	s4, [x8]
	mov	x15, xzr
	mov	x16, xzr
	madd	x12, x14, x27, x25
	lsl	x17, x13, #2
	mul	x14, x14, x22
	add	x18, x1, x2
	add	x11, x11, x25
	ldr	q3, [x9, x17]
	lsl	x17, x14, #2
	ldr	s0, [x24, x11, lsl #2]
	ldr	s1, [x24, x12, lsl #2]
	ldr	q2, [x9, x17]
	add	x17, x18, x17
	ldr	x18, [sp, #40]                  // 8-byte Folded Reload
	add	x18, x2, x18, lsl #4
	add	x18, x1, x18
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	xzr, x23
	ext	v5.16b, v2.16b, v2.16b, #8
	b.ge	.LBB0_117
	.p2align	2
.LBB0_116:                              // =>This Inner Loop Header: Depth=1
	add	x5, x8, x15
	fmla	v0.2s, v4.2s, v3.2s
	fmla	v1.2s, v4.2s, v2.2s
	add	x1, x17, x15
	add	x6, x5, #20
	add	x3, x18, x15
	add	x2, x1, #32
	add	x4, x3, #32
	prfm	pldl1keep, [x6]
	ldp	s4, s7, [x5, #4]
	add	x16, x16, #4
	add	x15, x15, #16
	fmla	v1.2s, v4.2s, v2.s[1]
	fmla	v0.2s, v4.2s, v3.s[1]
	fmla	v1.2s, v7.2s, v5.2s
	ldp	s5, s4, [x5, #12]
	fmla	v0.2s, v7.2s, v6.2s
	prfm	pldl1keep, [x4]
	fmla	v0.2s, v5.2s, v3.s[3]
	ldr	q3, [x3, #16]
	prfm	pldl1keep, [x2]
	fmla	v1.2s, v5.2s, v2.s[3]
	ldr	q2, [x1, #16]
	ext	v6.16b, v3.16b, v3.16b, #8
	cmp	x16, x23
	ext	v5.16b, v2.16b, v2.16b, #8
	b.lt	.LBB0_116
.LBB0_117:
	ldp	x17, x16, [sp, #400]            // 16-byte Folded Reload
	fmla	v0.2s, v4.2s, v3.2s
	fmla	v1.2s, v4.2s, v2.2s
	add	x13, x19, x13
	mov	x15, xzr
	ldr	s7, [x8, x17, lsl #2]
	ldr	s4, [x8, x16, lsl #2]
	ldr	x16, [sp, #416]                 // 8-byte Folded Reload
	ldr	x17, [sp, #328]                 // 8-byte Folded Reload
	fmla	v0.2s, v7.2s, v3.s[1]
	fmla	v1.2s, v7.2s, v2.s[1]
	ldr	s7, [x8, x16, lsl #2]
	sub	x16, x13, x30
	add	x13, x19, x14
	ldr	x14, [sp, #344]                 // 8-byte Folded Reload
	sub	x13, x13, x30
	fmla	v0.2s, v4.2s, v6.2s
	fmla	v1.2s, v4.2s, v5.2s
	add	x13, x14, x13, lsl #2
	add	x14, x14, x16, lsl #2
	mov	x16, x29
	add	x13, x17, x13
	add	x14, x17, x14
	fmla	v0.2s, v7.2s, v3.s[3]
	fmla	v1.2s, v7.2s, v2.s[3]
	cmp	x29, x19
	b.ge	.LBB0_119
	.p2align	2
.LBB0_118:                              // =>This Inner Loop Header: Depth=1
	add	x17, x10, x15
	add	x18, x13, x15
	add	x1, x14, x15
	add	x16, x16, #1
	add	x17, x17, #4
	add	x18, x18, #4
	add	x1, x1, #4
	prfm	pldl1keep, [x1]
	prfm	pldl1keep, [x18]
	ldr	s2, [x14, x15]
	prfm	pldl1keep, [x17]
	ldr	s3, [x10, x15]
	fmla	v0.2s, v3.2s, v2.2s
	ldr	s2, [x13, x15]
	add	x15, x15, #4
	fmla	v1.2s, v3.2s, v2.2s
	cmp	x16, x19
	b.lt	.LBB0_118
.LBB0_119:
	str	s0, [x24, x11, lsl #2]
	str	s1, [x24, x12, lsl #2]
	ldr	x11, [sp, #288]                 // 8-byte Folded Reload
	ldr	x12, [sp, #312]                 // 8-byte Folded Reload
	cmp	x12, x11
	b.ge	.LBB0_125
.LBB0_120:
	mul	x11, x12, x27
	mov	x14, x8
	mov	x13, xzr
	add	x11, x11, x25
	mul	x12, x12, x22
	lsl	x15, x12, #2
	ldr	s2, [x14], #12
	ldr	q1, [x9, x15]
	ldr	x9, [sp, #48]                   // 8-byte Folded Reload
	ldr	x15, [sp, #320]                 // 8-byte Folded Reload
	ldr	s0, [x24, x11, lsl #2]
	lsl	x9, x9, #3
	add	x9, x9, x15, lsl #2
	ldr	x15, [sp, #328]                 // 8-byte Folded Reload
	add	x9, x9, x15
	add	x9, x9, #32
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	xzr, x23
	b.ge	.LBB0_122
	.p2align	2
.LBB0_121:                              // =>This Inner Loop Header: Depth=1
	add	x15, x14, #8
	fmla	v0.2s, v2.2s, v1.2s
	add	x13, x13, #4
	prfm	pldl1keep, [x15]
	ldp	s2, s4, [x14, #-8]
	fmla	v0.2s, v2.2s, v1.s[1]
	fmla	v0.2s, v4.2s, v3.2s
	ldp	s3, s2, [x14], #16
	prfm	pldl1keep, [x9]
	fmla	v0.2s, v3.2s, v1.s[3]
	ldur	q1, [x9, #-16]
	add	x9, x9, #16
	ext	v3.16b, v1.16b, v1.16b, #8
	cmp	x13, x23
	b.lt	.LBB0_121
.LBB0_122:
	ldp	x14, x13, [sp, #400]            // 16-byte Folded Reload
	fmla	v0.2s, v2.2s, v1.2s
	mov	x9, xzr
	ldr	s4, [x8, x14, lsl #2]
	ldr	s2, [x8, x13, lsl #2]
	ldr	x13, [sp, #416]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[1]
	ldr	s4, [x8, x13, lsl #2]
	add	x8, x19, x12
	ldr	x12, [sp, #344]                 // 8-byte Folded Reload
	sub	x8, x8, x30
	fmla	v0.2s, v2.2s, v3.2s
	add	x8, x12, x8, lsl #2
	ldr	x12, [sp, #328]                 // 8-byte Folded Reload
	fmla	v0.2s, v4.2s, v1.s[3]
	add	x8, x12, x8
	cmp	x29, x19
	b.ge	.LBB0_124
	.p2align	2
.LBB0_123:                              // =>This Inner Loop Header: Depth=1
	add	x12, x10, x9
	add	x13, x8, x9
	add	x29, x29, #1
	add	x12, x12, #4
	add	x13, x13, #4
	prfm	pldl1keep, [x13]
	prfm	pldl1keep, [x12]
	ldr	s1, [x10, x9]
	ldr	s2, [x8, x9]
	add	x9, x9, #4
	fmla	v0.2s, v1.2s, v2.2s
	cmp	x29, x19
	b.lt	.LBB0_123
.LBB0_124:
	str	s0, [x24, x11, lsl #2]
.LBB0_125:
	bl	free
.LBB0_126:
	add	sp, sp, #512
	ldp	d9, d8, [sp, #32]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	ldr	d12, [sp], #144                 // 8-byte Folded Reload
	ret
.Lfunc_end0:
	.size	sgemm_nn_alpha1_beta1_mlir, .Lfunc_end0-sgemm_nn_alpha1_beta1_mlir
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
