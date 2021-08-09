	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cordic_rotation.c"
	.text
	.align	2
	.global	rotation_cordic
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rotation_cordic, %function
rotation_cordic:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #76
	mov	ip, r0
	mov	r5, r1
	add	r4, sp, #16
	movw	lr, #:lower16:.LANCHOR0
	movt	lr, #:upper16:.LANCHOR0
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	cmp	r5, #0
	ble	.L6
	add	r0, sp, #16
	mov	r3, #0
	mov	r1, #8192
	mov	r2, r3
.L5:
	cmp	ip, #0
	subgt	lr, r1, r2, asr r3
	addgt	r2, r2, r1, asr r3
	ldrgt	r1, [r0]
	subgt	ip, ip, r1
	addle	lr, r1, r2, asr r3
	suble	r2, r2, r1, asr r3
	ldrle	r1, [r0]
	addle	ip, ip, r1
	mov	r1, lr
	add	r3, r3, #1
	add	r0, r0, #4
	cmp	r5, r3
	bne	.L5
.L2:
	vmov	s15, r1	@ int
	vcvt.f32.s32	s12, s15
	vldr.32	s11, .L9+16
	vmul.f32	s12, s12, s11
	vcvt.f64.f32	d6, s12
	vldr.64	d4, .L9
	vmov	s15, ip	@ int
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s11
	vcvt.f64.f32	d7, s14
	vldr.64	d3, .L9+8
	vmul.f64	d7, d7, d3
	vstr.64	d7, [sp, #8]
	vmov	s15, r2	@ int
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s11
	vcvt.f64.f32	d7, s14
	vmul.f64	d7, d7, d4
	vstr.64	d7, [sp]
	vmul.f64	d7, d6, d4
	vmov	r2, r3, d7
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, pc}
.L6:
	mov	r1, #1
	mov	r2, #0
	b	.L2
.L10:
	.align	3
.L9:
	.word	-1312542006
	.word	1071869486
	.word	1717986918
	.word	1078765158
	.word	956301312
	.size	rotation_cordic, .-rotation_cordic
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
	.ascii	" X_Next: %f \011 Y_next: %f \011 Z: %f\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
