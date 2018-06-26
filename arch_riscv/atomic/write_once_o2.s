	.file	"write_once.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	    a5,10
	sw	    a5,12(sp)       //v=10, w=10
	li	    a0,1            //x=1
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
