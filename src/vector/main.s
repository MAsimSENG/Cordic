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
	.file	"main.c"
	.text
	.align	2
	.global	pow
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	pow, %function
pow:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L3
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	pow, .-pow
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Float point result%f\011 %f\011 %f\012\000"
	.align	3
.LC0:
	.word	0
	.word	1078362112
	.word	-687194767
	.word	1077579939
	.word	-1752346657
	.word	1076630126
	.word	0
	.word	1075609600
	.word	-481036337
	.word	1074568101
	.word	171798692
	.word	1073521623
	.word	171798692
	.word	1072473047
	.word	2020352616
	.word	1071424890
	.word	2020352616
	.word	1070376314
	.word	2020352616
	.word	1069327738
	.word	2020352616
	.word	1068279162
	.word	63221919
	.word	1067230922
	.word	-1807047360
	.word	1066182077
	.word	824633721
	.word	1065135112
	.text
	.align	2
	.global	vector_cordic_no_opt
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	vector_cordic_no_opt, %function
vector_cordic_no_opt:
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #200
	vstr.64	d0, [fp, #-180]
	vstr.64	d1, [fp, #-188]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	r0, fp, #172
	mov	r1, r3
	mov	r3, #112
	mov	r2, r3
	bl	memcpy
	ldrd	r2, [fp, #-180]
	strd	r2, [fp, #-12]
	ldrd	r2, [fp, #-188]
	strd	r2, [fp, #-20]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-28]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-36]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-44]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L6
.L10:
	vldr.64	d7, [fp, #-20]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L12
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-20]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-12]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-36]
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-12]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-20]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-44]
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #3
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #168
	vldr.64	d7, [r3]
	vldr.64	d6, [fp, #-28]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-60]
	ldrd	r2, [fp, #-36]
	strd	r2, [fp, #-12]
	ldrd	r2, [fp, #-44]
	strd	r2, [fp, #-20]
	ldrd	r2, [fp, #-60]
	strd	r2, [fp, #-28]
	b	.L9
.L12:
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-20]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-12]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-36]
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-12]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-20]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-44]
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #3
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #168
	vldr.64	d7, [r3]
	vldr.64	d6, [fp, #-28]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-60]
	ldrd	r2, [fp, #-36]
	strd	r2, [fp, #-12]
	ldrd	r2, [fp, #-44]
	strd	r2, [fp, #-20]
	ldrd	r2, [fp, #-60]
	strd	r2, [fp, #-28]
.L9:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L6:
	ldr	r3, [fp, #-48]
	cmp	r3, #13
	ble	.L10
	ldrd	r2, [fp, #-28]
	strd	r2, [sp, #8]
	ldrd	r2, [fp, #-44]
	strd	r2, [sp]
	ldrd	r2, [fp, #-36]
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	vector_cordic_no_opt, .-vector_cordic_no_opt
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Fix-point result %d\011 %d\011 %d\012\000"
	.align	2
.LC1:
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
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
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
	vldr.64	d6, .L18
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-8]
	vldr.64	d7, [fp, #-108]
	vldr.64	d6, .L18
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
	b	.L14
.L17:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L15
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
	b	.L16
.L15:
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
.L16:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L14:
	ldr	r3, [fp, #-28]
	cmp	r3, #13
	ble	.L17
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L19:
	.align	3
.L18:
	.word	0
	.word	1086324736
	.size	vector_cordic_arith_opt, .-vector_cordic_arith_opt
	.align	2
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
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
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
	vldr.64	d6, .L27
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r6, s15	@ int
	vldr.64	d7, [fp, #-108]
	vldr.64	d6, .L27
	vmul.f64	d7, d7, d6
	vcvt.s32.f64	s15, d7
	vmov	r5, s15	@ int
	mov	r9, #0
	mov	r7, #0
	mov	r8, #0
	mov	r10, #0
	mov	r4, #0
	b	.L21
.L26:
	cmp	r5, #0
	ble	.L22
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
	b	.L23
.L22:
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
.L23:
	cmp	r5, #0
	ble	.L24
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
	b	.L25
.L24:
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
.L25:
	add	r4, r4, #2
.L21:
	cmp	r4, #13
	ble	.L26
	mov	r3, r9
	mov	r2, r8
	mov	r1, r7
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	printf
	nop
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L28:
	.align	3
.L27:
	.word	0
	.word	1086324736
	.size	vector_cordic_all_opt, .-vector_cordic_all_opt
	.section	.rodata
	.align	2
.LC4:
	.ascii	"PLEASE ENTER 1 for NO OPT\012 2 for arith opt\012 3"
	.ascii	" for all optimization\000"
	.align	2
.LC5:
	.ascii	"%d\000"
	.align	2
.LC6:
	.ascii	"INVALID OPTIONS SELECT CLOSING PROGRAM\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-8]
	sub	r3, fp, #8
	mov	r1, r3
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	__isoc99_scanf
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L30
	vmov.f64	d1, #7.5e-1
	vldr.64	d0, .L35
	bl	vector_cordic_no_opt
	mov	r3, #0
	b	.L34
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	bne	.L32
	vmov.f64	d1, #7.5e-1
	vldr.64	d0, .L35
	bl	vector_cordic_arith_opt
	mov	r3, #0
	b	.L34
.L32:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	bne	.L33
	vmov.f64	d1, #7.5e-1
	vldr.64	d0, .L35
	bl	vector_cordic_all_opt
	mov	r3, #0
	b	.L34
.L33:
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	puts
	mov	r3, #1
.L34:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L36:
	.align	3
.L35:
	.word	858993459
	.word	1072378675
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
