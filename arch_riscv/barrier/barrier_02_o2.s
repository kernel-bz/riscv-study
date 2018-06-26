	.file	"barrier_02.c"
	.option nopic
	.text
	.align	1
	.globl	foo
	.type	foo, @function
foo:
	lui	    a4,%hi(B)
	lw	    a5,%lo(B)(a4)
	lui	    a3,%hi(A)
	addiw	a5,a5,1
	sw	    a5,%lo(A)(a3)
	li	    a5,5
	sw	    a5,%lo(B)(a4)
	ret
	.size	foo, .-foo
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	    a4,%hi(B)
	lw	    a5,%lo(B)(a4)
	lui	    a3,%hi(A)
	addiw	a5,a5,1
	sw	    a5,%lo(A)(a3)
	li	    a5,5
	sw	    a5,%lo(B)(a4)
	li	    a0,0
	ret
	.size	main, .-main
	.comm	B,4,4
	.comm	A,4,4
	.ident	"GCC: (GNU) 7.2.0"
