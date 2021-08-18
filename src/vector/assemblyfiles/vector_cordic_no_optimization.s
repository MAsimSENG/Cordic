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
	.file	"vector_cordic_no_optimization.c"
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
.LC1:
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
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	vector_cordic_no_opt, .-vector_cordic_no_opt
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
