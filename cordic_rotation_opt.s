	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cordic_rotation_opt.c"
	.text
	.align	2
	.global	rotation_cordic_opt
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rotation_cordic_opt, %function
rotation_cordic_opt:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9, d10}
	movw	ip, #:lower16:.LANCHOR0
	mov	r10, r1
	sub	sp, sp, #84
	add	lr, sp, #24
	movt	ip, #:upper16:.LANCHOR0
	mov	r5, r0
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1}
	cmp	r10, #0
	stm	lr, {r0, r1}
	ble	.L2
	mov	r4, #0
	movw	fp, #:lower16:.LC1
	sub	r10, r10, #1
	bic	r10, r10, #1
	add	r3, r10, #2
	add	r9, sp, #24
	mov	r8, r4
	mov	r7, #8192
	vldr.32	s20, .L15+32
	vldr.64	d9, .L15
	str	r3, [sp, #20]
	movt	fp, #:upper16:.LC1
	b	.L3
.L14:
	sub	r5, r5, r3
	vmov	s15, r5	@ int
	vcvt.f32.s32	s16, s15
	vmul.f32	s16, s16, s20
	vcvt.f64.f32	d8, s16
	vmul.f64	d8, d8, d9
	movw	r0, #:lower16:.LC2
	vmov	r2, r3, d8
	add	r4, r4, #2
	movt	r0, #:upper16:.LC2
.L11:
	bl	printf
	ldr	r3, [sp, #20]
	add	r9, r9, #8
	cmp	r4, r3
	beq	.L13
.L3:
	mov	r1, r4
	mov	r0, fp
	bl	printf
	ldr	r3, [r9]
	cmp	r5, #0
	subgt	r5, r5, r3
	addle	r5, r5, r3
	vmov	s15, r5	@ int
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s20
	vcvt.f64.f32	d7, s14
	movw	r0, #:lower16:.LC2
	vmul.f64	d7, d7, d9
	asr	r6, r7, r4
	asr	r1, r8, r4
	vmov	r2, r3, d7
	movt	r0, #:upper16:.LC2
	subgt	r10, r7, r1
	addgt	r6, r8, r6
	addle	r10, r7, r1
	suble	r6, r8, r6
	bl	printf
	add	r3, r4, #1
	asr	ip, r6, r3
	asr	lr, r10, r3
	cmp	r5, #0
	sub	r7, r10, ip
	add	r8, r6, lr
	ldr	r3, [r9, #4]
	bgt	.L14
	add	r5, r5, r3
	vmov	s15, r5	@ int
	vcvt.f32.s32	s16, s15
	vmul.f32	s16, s16, s20
	vcvt.f64.f32	d8, s16
	movw	r0, #:lower16:.LC2
	vmul.f64	d8, d8, d9
	add	r4, r4, #2
	movt	r0, #:upper16:.LC2
	vmov	r2, r3, d8
	add	r7, r10, ip
	sub	r8, r6, lr
	b	.L11
.L13:
	vmov	s15, r7	@ int
	vmov	s13, r8	@ int
	vcvt.f32.s32	s14, s15
	vcvt.f32.s32	s12, s13
	vldr.32	s15, .L15+32
	vmul.f32	s12, s12, s15
	vmul.f32	s14, s14, s15
	vldr.64	d5, .L15+8
	vcvt.f64.f32	d7, s14
	vcvt.f64.f32	d6, s12
	vmul.f64	d7, d7, d5
	vmul.f64	d6, d6, d5
.L9:
	movw	r0, #:lower16:.LC3
	vstr.64	d8, [sp, #8]
	vstr.64	d6, [sp]
	vmov	r2, r3, d7
	movt	r0, #:upper16:.LC3
	bl	printf
	add	sp, sp, #84
	@ sp needed
	vldm	sp!, {d8-d10}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L2:
	vmov	s14, r5	@ int
	vcvt.f32.s32	s14, s14, #13
	vldr.64	d8, .L15
	vcvt.f64.f32	d7, s14
	vldr.64	d6, .L15+16
	vmul.f64	d8, d7, d8
	vldr.64	d7, .L15+24
	b	.L9
.L16:
	.align	3
.L15:
	.word	1717986918
	.word	1078765158
	.word	-1312542006
	.word	1071869486
	.word	0
	.word	0
	.word	-1312542006
	.word	1058237998
	.word	956301312
	.size	rotation_cordic_opt, .-rotation_cordic_opt
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	6433
	.word	3797
	.word	2005
	.word	1018
	.word	510
	.word	254
	.word	127
	.word	62
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"iteration: %d \012\000"
.LC2:
	.ascii	"the angle: %f \012\000"
.LC3:
	.ascii	" X_Next: %f \011 Y_next: %f \011 Z: %f\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
