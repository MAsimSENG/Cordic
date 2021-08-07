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
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	vpush.64	{d8, d9, d10}
	movw	ip, #:lower16:.LANCHOR0
	mov	r9, r1
	sub	sp, sp, #72
	add	lr, sp, #16
	movt	ip, #:upper16:.LANCHOR0
	mov	r5, r0
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1}
	cmp	r9, #0
	stm	lr, {r0, r1}
	ble	.L2
	mov	r4, #0
	movw	r10, #:lower16:.LC1
	mov	r7, r4
	mov	r6, #8192
	vldr.32	s20, .L10+32
	vldr.64	d9, .L10
	add	r8, sp, #16
	movt	r10, #:upper16:.LC1
.L3:
	cmp	r5, #0
	asr	ip, r7, r4
	asr	r1, r6, r4
	ldr	r3, [r8], #4
	ble	.L4
	sub	r5, r5, r3
	vmov	s15, r5	@ int
	vcvt.f32.s32	s16, s15
	vmul.f32	s16, s16, s20
	vcvt.f64.f32	d8, s16
	vmul.f64	d8, d8, d9
	add	r4, r4, #1
	vmov	r2, r3, d8
	mov	r0, r10
	sub	r6, r6, ip
	add	r7, r7, r1
	bl	printf
	cmp	r9, r4
	bne	.L3
.L6:
	vmov	s15, r6	@ int
	vmov	s13, r7	@ int
	vcvt.f32.s32	s14, s15
	vcvt.f32.s32	s12, s13
	vldr.32	s15, .L10+32
	vmul.f32	s12, s12, s15
	vmul.f32	s14, s14, s15
	vldr.64	d5, .L10+8
	vcvt.f64.f32	d7, s14
	vcvt.f64.f32	d6, s12
	vmul.f64	d7, d7, d5
	vmul.f64	d6, d6, d5
.L7:
	movw	r0, #:lower16:.LC2
	vstr.64	d8, [sp, #8]
	vstr.64	d6, [sp]
	vmov	r2, r3, d7
	movt	r0, #:upper16:.LC2
	bl	printf
	add	sp, sp, #72
	@ sp needed
	vldm	sp!, {d8-d10}
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L4:
	add	r5, r5, r3
	vmov	s15, r5	@ int
	vcvt.f32.s32	s16, s15
	vmul.f32	s16, s16, s20
	vcvt.f64.f32	d8, s16
	vmul.f64	d8, d8, d9
	add	r4, r4, #1
	vmov	r2, r3, d8
	mov	r0, r10
	add	r6, r6, ip
	sub	r7, r7, r1
	bl	printf
	cmp	r9, r4
	bne	.L3
	b	.L6
.L2:
	vmov	s14, r5	@ int
	vcvt.f32.s32	s14, s14, #13
	vldr.64	d8, .L10
	vcvt.f64.f32	d7, s14
	vldr.64	d6, .L10+16
	vmul.f64	d8, d7, d8
	vldr.64	d7, .L10+24
	b	.L7
.L11:
	.align	3
.L10:
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
	.ascii	"the angle: %f \012\000"
.LC2:
	.ascii	" X_Next: %f \011 Y_next: %f \011 Z: %f\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
