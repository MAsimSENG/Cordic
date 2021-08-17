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
	.file	"rotation_no_optimization.c"
	.text
	.align	2
	.global	pow
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	pow, %function
pow:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r2, #0
	mov	r3, #0
	movt	r3, 16368
	strd	r2, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, [fp, #-12]
	vmul.f64	d7, d6, d7
	vstr.64	d7, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L3
	ldrd	r2, [fp, #-12]
	vmov	d7, r2, r3
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	pow, .-pow
	.section	.rodata
	.align	2
.LC1:
	.ascii	"X_Next: %f \011 Y_next: %f \011 Z: %f\012\000"
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
	.global	rotation_cordic_no_optimization
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	rotation_cordic_no_optimization, %function
rotation_cordic_no_optimization:
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #216
	str	r0, [fp, #-200]
	str	r1, [fp, #-204]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	r0, fp, #196
	mov	r1, r3
	mov	r3, #112
	mov	r2, r3
	bl	memcpy
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-12]
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-20]
	mov	r2, #0
	mov	r3, #0
	movt	r3, 16368
	strd	r2, [fp, #-28]
	mov	r2, #0
	mov	r3, #0
	movt	r3, 16368
	strd	r2, [fp, #-36]
	ldr	r3, [fp, #-200]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vstr.64	d7, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L6
.L10:
	vldr.64	d7, [fp, #-44]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L12
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-12]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-36]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-28]
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-36]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-12]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-20]
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #3
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #192
	vldr.64	d7, [r3]
	vldr.64	d6, [fp, #-44]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-60]
	ldrd	r2, [fp, #-28]
	strd	r2, [fp, #-36]
	ldrd	r2, [fp, #-20]
	strd	r2, [fp, #-12]
	ldrd	r2, [fp, #-60]
	strd	r2, [fp, #-44]
	b	.L9
.L12:
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-12]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-36]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-28]
	ldr	r1, [fp, #-48]
	mov	r0, #2
	bl	pow
	vmov.f64	d5, d0
	vmov.f64	d7, #1.0e+0
	vdiv.f64	d6, d7, d5
	vldr.64	d7, [fp, #-36]
	vmul.f64	d7, d6, d7
	vldr.64	d6, [fp, #-12]
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-20]
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #3
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #192
	vldr.64	d7, [r3]
	vldr.64	d6, [fp, #-44]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-60]
	ldrd	r2, [fp, #-28]
	strd	r2, [fp, #-36]
	ldrd	r2, [fp, #-20]
	strd	r2, [fp, #-12]
	ldrd	r2, [fp, #-60]
	strd	r2, [fp, #-44]
.L9:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L6:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-204]
	cmp	r2, r3
	blt	.L10
	vldr.64	d7, [fp, #-44]
	vldr.64	d6, .L13
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-68]
	vldr.64	d7, [fp, #-28]
	vldr.64	d6, .L13+8
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-76]
	vldr.64	d7, [fp, #-20]
	vldr.64	d6, .L13+8
	vmul.f64	d7, d7, d6
	vstr.64	d7, [fp, #-84]
	ldrd	r2, [fp, #-68]
	strd	r2, [sp, #8]
	ldrd	r2, [fp, #-84]
	strd	r2, [sp]
	ldrd	r2, [fp, #-76]
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L14:
	.align	3
.L13:
	.word	1717986918
	.word	1078765158
	.word	-1312542006
	.word	1071869486
	.size	rotation_cordic_no_optimization, .-rotation_cordic_no_optimization
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
