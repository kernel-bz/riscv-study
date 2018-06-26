	.file	"cpu_relax.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
 #APP
# 14 "cpu_relax.c" 1
	div a5, a5, zero
# 0 "" 2
 #NO_APP
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
