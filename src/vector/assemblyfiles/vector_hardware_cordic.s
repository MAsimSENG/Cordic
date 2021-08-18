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
	.file	"vector_hardware_cordic.c"
	.text
	.section	.rodata
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
	.global	vector_hardware_cordic
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	vector_hardware_cordic, %function
vector_hardware_cordic:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #76
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
	str	r2, [fp, #-96]
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
	mov	r6, #0
	mov	r7, #0
	mov	r4, #0
	mov	r8, #0
	mov	r5, #0
	b	.L2
.L3:
	.syntax divided
@ 18 "vector_hardware_cordic.c" 1
	CORDIC_V_xy r3, r7, r4
@ 0 "" 2
	.arm
	.syntax unified
	mov	r6, r3
	.syntax divided
@ 21 "vector_hardware_cordic.c" 1
	CORDIC_V_xz r3, r7, r4
@ 0 "" 2
	.arm
	.syntax unified
	mov	r8, r3
	asr	r3, r6, #16
	str	r3, [fp, #-88]
	lsl	r3, r6, #16
	asr	r3, r3, #16
	str	r3, [fp, #-92]
	lsl	r3, r8, #16
	asr	r4, r3, #16
	ldr	r3, [fp, #-96]
	str	r4, [r3]
	add	r5, r5, #2
.L2:
	cmp	r5, #13
	ble	.L3
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, pc}
	.size	vector_hardware_cordic, .-vector_hardware_cordic
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
