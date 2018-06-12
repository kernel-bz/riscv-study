	.file	"atomic_test03.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,20
	sw	a5,0(sp)
	li	a5,200
	sd	a5,8(sp)
	li	a5,10
 #APP
# 71 "atomic_test03.c" 1
	amoadd.w.aqrl a5, a5, 0(sp)
# 0 "" 2
 #NO_APP
	li	a5,100
	addi	a4,sp,8
 #APP
# 71 "atomic_test03.c" 1
	amoadd.d.aqrl a5, a5, 0(a4)
# 0 "" 2
 #NO_APP
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
