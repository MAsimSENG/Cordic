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
	.file	"rotation_cordic_all_opt.c"
	.text
	.section	.rodata
	.align	2
.LC1:
	.ascii	" X_Next: %d \011 Y_next: %d \011 Z: %d\012\000"
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
	.global	rotation_cordic_all_opt
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rotation_cordic_all_opt, %function
rotation_cordic_all_opt:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #64
	str	r0, [fp, #-88]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #84
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	mov	r5, #0
	mov	r9, #0
	mov	r8, #1
	mov	r6, #8192
	ldr	r7, [fp, #-88]
	mov	r4, #0
	b	.L2
.L7:
	cmp	r7, #0
	ble	.L3
	asr	r3, r5, r4
	sub	r8, r6, r3
	asr	r3, r6, r4
	add	r9, r5, r3
	lsl	r3, r4, #2
	sub	r2, fp, #28
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	sub	r7, r7, r3
	mov	r6, r8
	mov	r5, r9
	b	.L4
.L3:
	asr	r3, r5, r4
	add	r8, r6, r3
	asr	r3, r6, r4
	sub	r9, r5, r3
	lsl	r3, r4, #2
	sub	r2, fp, #28
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	add	r7, r7, r3
	mov	r6, r8
	mov	r5, r9
.L4:
	cmp	r7, #0
	ble	.L5
	add	r3, r4, #1
	asr	r3, r5, r3
	sub	r8, r6, r3
	add	r3, r4, #1
	asr	r3, r6, r3
	add	r9, r5, r3
	add	r3, r4, #1
	lsl	r3, r3, #2
	sub	r2, fp, #28
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	sub	r7, r7, r3
	mov	r6, r8
	mov	r5, r9
	b	.L6
.L5:
	add	r3, r4, #1
	asr	r3, r5, r3
	add	r8, r6, r3
	add	r3, r4, #1
	asr	r3, r6, r3
	sub	r9, r5, r3
	add	r3, r4, #1
	lsl	r3, r3, #2
	sub	r2, fp, #28
	add	r3, r2, r3
	ldr	r3, [r3, #-56]
	add	r7, r7, r3
	mov	r6, r8
	mov	r5, r9
.L6:
	add	r4, r4, #2
.L2:
	cmp	r4, #13
	ble	.L7
	vmov	s15, r8	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L8
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r8, s15	@ int
	vmov	s15, r9	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L8
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r9, s15	@ int
	mov	r3, r7
	mov	r2, r9
	mov	r1, r8
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
.L9:
	.align	3
.L8:
	.word	-1312542006
	.word	1071869486
	.size	rotation_cordic_all_opt, .-rotation_cordic_all_opt
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
