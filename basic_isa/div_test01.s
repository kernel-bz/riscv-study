	.file	"div_test01.c"
	.option nopic

	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48

	sw	    zero,-20(s0)            //int i = 0
	li	    a5,10
	sw	    a5,-24(s0)              //int v = 10
	sw	    zero,-28(s0)            //float j = 0.0
	lui	    a5,%hi(.LC0)
	flw	    fa5,%lo(.LC0)(a5)
	fsw	    fa5,-32(s0)             //float w = 100
	sd	    zero,-40(s0)            //double k = 0.0
	lui	    a5,%hi(.LC1)
	fld	    fa5,%lo(.LC1)(a5)
	fsd	    fa5,-48(s0)             //double x = 1000

	lw	    a5,-20(s0)
	addiw	a5,a5,1
	sw	    a5,-20(s0)

	lw	    a4,-24(s0)              //v
	lw	    a5,-20(s0)              //i
	divw	a5,a4,a5                //v / i
	sw	    a5,-24(s0)              //v

	flw	    fa4,-28(s0)             //j
	lui	    a5,%hi(.LC2)
	flw	    fa5,%lo(.LC2)(a5)       //1.0
	fadd.s	fa5,fa4,fa5             //j + 1.0
	fsw	    fa5,-28(s0)             //j

	flw	    fa4,-32(s0)             //w
	flw	    fa5,-28(s0)             //j
	fdiv.s	fa5,fa4,fa5             //w / j
	fsw	    fa5,-32(s0)             //w

	fld	    fa4,-40(s0)             //k
	lui	    a5,%hi(.LC3)
	fld	    fa5,%lo(.LC3)(a5)       //1.0
	fadd.d	fa5,fa4,fa5             //k + 1.0
	fsd	    fa5,-40(s0)             //k

	fld	    fa4,-48(s0)             //x
	fld	    fa5,-40(s0)             //k
	fdiv.d	fa5,fa4,fa5             //x / k
	fsd	    fa5,-48(s0)             //x

	li	    a5,0
	mv	    a0,a5
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra                      //return 0

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
