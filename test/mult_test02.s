	.file	"mult_test02.c"
	.option nopic
	.globl	__addtf3
	.globl	__multf3
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	zero,-24(s0)
	li	a5,10
	sd	a5,-32(s0)
	sw	zero,-36(s0)
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsw	fa5,-40(s0)
	sd	zero,-64(s0)
	sd	zero,-56(s0)
	lui	a5,%hi(.LC1)
	ld	a4,%lo(.LC1)(a5)
	sd	a4,-80(s0)
	ld	a5,%lo(.LC1+8)(a5)
	sd	a5,-72(s0)
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	ld	a4,-32(s0)
	ld	a5,-24(s0)
	mul	a5,a4,a5
	sd	a5,-32(s0)
	flw	fa4,-36(s0)
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-36(s0)
	flw	fa4,-40(s0)
	flw	fa5,-36(s0)
	fmul.s	fa5,fa4,fa5
	fsw	fa5,-40(s0)
	lui	a5,%hi(.LC3)
	ld	a2,%lo(.LC3)(a5)
	ld	a3,%lo(.LC3+8)(a5)
	ld	a0,-64(s0)
	ld	a1,-56(s0)
	call	__addtf3
	mv	a5,a0
	mv	a6,a1
	sd	a5,-64(s0)
	sd	a6,-56(s0)
	ld	a2,-64(s0)
	ld	a3,-56(s0)
	ld	a0,-80(s0)
	ld	a1,-72(s0)
	call	__multf3
	mv	a5,a0
	mv	a6,a1
	sd	a5,-80(s0)
	sd	a6,-72(s0)
	li	a5,0
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.word	1120403456
	.align	4
.LC1:
	.word	0
	.word	0
	.word	0
	.word	1074328576
	.align	2
.LC2:
	.word	1065353216
	.align	4
.LC3:
	.word	0
	.word	0
	.word	0
	.word	1073676288
	.ident	"GCC: (GNU) 7.2.0"
