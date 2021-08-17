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
	.file	"vector_cordic_all_opt.c"
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
	.global	vector_cordic_all_opt
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	vector_cordic_all_opt, %function
vector_cordic_all_opt:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #76
	vstr.64	d0, [fp, #-100]
	vstr.64	d1, [fp, #-108]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #92
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
	vldr.64	d6, .L8
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r6, s15	@ int
	vldr.64	d7, [fp, #-108]
	vldr.64	d6, .L8
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r5, s15	@ int
	mov	r9, #0
	mov	r7, #0
	mov	r8, #0
	mov	r10, #0
	mov	r4, #0
	b	.L2
.L7:
	cmp	r5, #0
	ble	.L3
	asr	r3, r5, r4
	add	r7, r6, r3
	asr	r3, r6, r4
	sub	r8, r5, r3
	lsl	r3, r4, #2
	sub	r2, fp, #36
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	add	r10, r9, r3
	mov	r6, r7
	mov	r5, r8
	mov	r9, r10
	b	.L4
.L3:
	asr	r3, r5, r4
	sub	r7, r6, r3
	asr	r3, r6, r4
	add	r8, r5, r3
	lsl	r3, r4, #2
	sub	r2, fp, #36
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	sub	r10, r9, r3
	mov	r6, r7
	mov	r5, r8
	mov	r9, r10
.L4:
	cmp	r5, #0
	ble	.L5
	add	r3, r4, #1
	asr	r3, r5, r3
	add	r7, r6, r3
	add	r3, r4, #1
	asr	r3, r6, r3
	sub	r8, r5, r3
	add	r3, r4, #1
	lsl	r3, r3, #2
	sub	r2, fp, #36
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	add	r10, r9, r3
	mov	r6, r7
	mov	r5, r8
	mov	r9, r10
	b	.L6
.L5:
	add	r3, r4, #1
	asr	r3, r5, r3
	sub	r7, r6, r3
	add	r3, r4, #1
	asr	r3, r6, r3
	add	r8, r5, r3
	add	r3, r4, #1
	lsl	r3, r3, #2
	sub	r2, fp, #36
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	sub	r10, r9, r3
	mov	r6, r7
	mov	r5, r8
	mov	r9, r10
.L6:
	add	r4, r4, #2
.L2:
	cmp	r4, #13
	ble	.L7
	mov	r3, r9
	mov	r2, r8
	mov	r1, r7
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L9:
	.align	3
.L8:
	.word	0
	.word	1086324736
	.size	vector_cordic_all_opt, .-vector_cordic_all_opt
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
