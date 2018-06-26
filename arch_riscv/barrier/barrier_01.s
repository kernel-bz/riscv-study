	.file	"barrier_01.c"
	.option nopic
	.comm	A,4,4
	.comm	B,4,4
	.text
	.align	1
	.globl	foo
	.type	foo, @function
foo:
	addi	sp,sp,-16
	sd	    s0,8(sp)
	addi	s0,sp,16
	lui	    a5,%hi(B)
	lw	    a5,%lo(B)(a5)       //a5 = B
	addiw	a5,a5,1             //B += 1
	sext.w	a4,a5               //a4 = B
	lui	    a5,%hi(A)
	sw	    a4,%lo(A)(a5)       //A = a4
	lui	    a5,%hi(B)
	li	    a4,5
	sw	    a4,%lo(B)(a5)       //B = 5
	nop
	ld	    s0,8(sp)
	addi	sp,sp,16
	jr	    ra
	.size	foo, .-foo
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	    ra,8(sp)
	sd	    s0,0(sp)
	addi	s0,sp,16
	call	foo
	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
