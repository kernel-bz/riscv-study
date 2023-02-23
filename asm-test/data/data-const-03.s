	.arch armv5t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"data-const-03.c"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #10
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L2
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L3
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	bne	.L4
	mov	r3, #5
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	bne	.L5
	mov	r3, #10
	str	r3, [fp, #-12]
	b	.L3
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #20
	bne	.L6
	mov	r3, #20
	str	r3, [fp, #-12]
	b	.L3
.L6:
	mov	r3, #30
	str	r3, [fp, #-12]
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",%progbits
