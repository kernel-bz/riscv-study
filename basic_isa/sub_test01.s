	.file	"sub_test01.c"
	.option nopic
	.text

	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48           //sp = sp - 48
	sd	    s0,40(sp)           //[sp+40] = s0
	addi	s0,sp,48            //s0 = sp + 48

	sw	    zero,-20(s0)        //[s0-20] = zero    //int i = 0
	li	    a5,10               //a5 = 10
	sw	    a5,-24(s0)          //[s0-24] = a5      //int v = 10

	sw	    zero,-28(s0)        //[s0-28] = zero    //float j = 0.0
	lui	    a5,%hi(.LC0)        //a5 = Upper[LC0]
	flw	    fa5,%lo(.LC0)(a5)   //fa5 = Lower[LC0]
	fsw	    fa5,-32(s0)         //[s0-32] = fa5     //float w = 100.0

	sd	    zero,-40(s0)        //[s0-40] = zero    //double k = 0.0
	lui	    a5,%hi(.LC1)        //a5 = Upper[LC1]
	fld	    fa5,%lo(.LC1)(a5)   //fa5 = Lower[LC1]
	fsd	    fa5,-48(s0)         //[s0-48] = fa5     //double x = 1000.0

	lw	    a5,-20(s0)          //a5 = [s0-20]      //i
	addiw	a5,a5,-1            //a5 = a5 - 1       //i--
	sw	    a5,-20(s0)          //[s0-20] = a5

	lw	    a4,-24(s0)          //a4 = [s0-24]      //v
	lw	    a5,-20(s0)          //a5 = [s0-20]      //i
	subw	a5,a4,a5            //a5 = a4 - a5      //v - i
	sw	    a5,-24(s0)          //[s0-24] = a5      //v

	flw	    fa4,-28(s0)         //fa4 = [s0-28]     //j
	lui	    a5,%hi(.LC2)        //a5 = Upper[LC2]
	flw	    fa5,%lo(.LC2)(a5)   //fa5 = Lower[LC2]
	fsub.s	fa5,fa4,fa5         //fa5 = fa4 - fa5   //j - 1.0
	fsw	    fa5,-28(s0)         //[s0-28] = fa5     //j
	flw	    fa4,-32(s0)         //fa4 = [s0-32]     //w
	flw	    fa5,-28(s0)         //fa5 = [s0-28]     //j
	fsub.s	fa5,fa4,fa5         //fa5 = fa4 - fa5   //w - j
	fsw	    fa5,-32(s0)         //[s0-32] = fa5     //w

	fld	    fa4,-40(s0)         //fa4 = [s0-40]     //k
	lui	    a5,%hi(.LC3)        //a5 = Upper[LC3]
	fld	    fa5,%lo(.LC3)(a5)   //fa5 = Lower[LC3]
	fsub.d	fa5,fa4,fa5         //fa5 = fa4 - fa5   //k - 1.0
	fsd	    fa5,-40(s0)         //[s0-40] = fa5     //k
	fld	    fa4,-48(s0)         //fa4 = [s0-48]     //x
	fld	    fa5,-40(s0)         //fa5 = [s0-40]     //k
	fsub.d	fa5,fa4,fa5         //fa5 = fa4 - fa5   //x - k
	fsd	    fa5,-48(s0)         //[s0-48] = fa5     //x

	li	    a5,0
	mv	    a0,a5
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra                  //return 0

	.size	main, .-main
	.section	.rodata

	.align	2
.LC0:                           //100.0
	.word	1120403456

	.align	3
.LC1:                           //1000.0
	.word	0
	.word	1083129856

	.align	2
.LC2:                           //1.0
	.word	1065353216

	.align	3
.LC3:                           //1.0
	.word	0
	.word	1072693248

	.ident	"GCC: (GNU) 7.2.0"
