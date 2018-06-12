	.file	"spin_lock01.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,1
	addi	a4,sp,8
 #APP
# 30 "spin_lock01.c" 1
		amoswap.w a5, a5, 0(a4)
	fence r , rw

# 0 "" 2
 #NO_APP
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
