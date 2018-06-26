	.file	"read_once.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a0,1
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
