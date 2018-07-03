	.file	"cache_test01.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
 #APP
# 15 "cache_test01.c" 1
	fence.i
# 0 "" 2
 #NO_APP
	li	a0,0        //arg0 (output)
	li	a1,0        //arg1 (input)
	li	a2,0        //arg2 (input)
	li	a7,5        //which SBI_REMOTE_FENCE_I
 #APP
# 85 "sbi.h" 1
	ecall
# 0 "" 2
 #NO_APP
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
