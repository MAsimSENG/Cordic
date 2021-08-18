	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"rotation_cordic_arith_opt.c"
	.text
	.section	.rodata
	.align	2
.LC1:
	.ascii	" X_Next: %f \011 Y_next: %f \011 Z: %f\012\000"
	.align	2
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
	.text
	.align	2
	.global	rotation_cordic_arith_opt
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rotation_cordic_arith_opt, %function
rotation_cordic_arith_opt:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #136
	str	r0, [fp, #-120]
	str	r1, [fp, #-124]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #116
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	mov	r3, #8192
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-120]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L2
.L5:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-112]
	ldr	r2, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	b	.L4
.L3:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-8]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-112]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
.L4:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L2:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6+16
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L6
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-44]
	ldr	r3, [fp, #-16]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6+16
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L6+8
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-52]
	ldr	r3, [fp, #-12]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L6+16
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vldr.64	d6, .L6+8
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-60]
	ldrd	r2, [fp, #-44]
	strd	r2, [sp, #8]
	ldrd	r2, [fp, #-60]
	strd	r2, [sp]
	ldrd	r2, [fp, #-52]
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	.align	3
.L6:
	.word	1717986918
	.word	1078765158
	.word	-1312542006
	.word	1071869486
	.word	1174405120
	.size	rotation_cordic_arith_opt, .-rotation_cordic_arith_opt
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
