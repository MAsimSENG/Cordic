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
	.file	"vector_cordic_arith_opt.c"
	.text
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Fix-point result %d\011 %d\011 %d\012\000"
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
	.global	vector_cordic_arith_opt
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	vector_cordic_arith_opt, %function
vector_cordic_arith_opt:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #104
	vstr.64	d0, [fp, #-100]
	vstr.64	d1, [fp, #-108]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #88
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	vldr.64	d7, [fp, #-100]
	vldr.64	d6, .L6
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-8]
	vldr.64	d7, [fp, #-108]
	vldr.64	d6, .L6
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L2
.L5:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L3
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-84]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	b	.L4
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-8]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	asr	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-84]
	ldr	r2, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #13
	ble	.L5
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
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
	.word	0
	.word	1086324736
	.size	vector_cordic_arith_opt, .-vector_cordic_arith_opt
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
