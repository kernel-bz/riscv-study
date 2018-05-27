	.file	"div_test01.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sw	zero,-20(s0)
	li	a5,10
	sw	a5,-24(s0)
	sw	zero,-28(s0)
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsw	fa5,-32(s0)
	sd	zero,-40(s0)
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	fsd	fa5,-48(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	divw	a5,a4,a5
	sw	a5,-24(s0)
	flw	fa4,-28(s0)
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-28(s0)
	flw	fa4,-32(s0)
	flw	fa5,-28(s0)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-32(s0)
	fld	fa4,-40(s0)
	lui	a5,%hi(.LC3)
	fld	fa5,%lo(.LC3)(a5)
	fadd.d	fa5,fa4,fa5
	fsd	fa5,-40(s0)
	fld	fa4,-48(s0)
	fld	fa5,-40(s0)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	li	a5,0
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.word	1120403456
	.align	3
.LC1:
	.word	0
	.word	1083129856
	.align	2
.LC2:
	.word	1065353216
	.align	3
.LC3:
	.word	0
	.word	1072693248
	.ident	"GCC: (GNU) 7.2.0"
