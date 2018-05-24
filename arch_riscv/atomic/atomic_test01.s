	.file	"atomic_test01.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	s0,88(sp)
	addi	s0,sp,96
	sw	zero,-20(s0)
	sd	zero,-32(s0)
	li	a5,1
	sw	a5,-84(s0)
	ld	a5,-40(s0)
	sd	a5,-96(s0)
	ld	a5,-96(s0)
	lw	a4,-84(s0)
	ld	a3,-96(s0)
 #APP
# 52 "atomic_test01.c" 1
	amoadd.w zero, a4, 0(a5)
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)
	sw	a5,-68(s0)
	ld	a5,-40(s0)
	sd	a5,-80(s0)
	ld	a5,-80(s0)
	lw	a4,-68(s0)
	ld	a3,-80(s0)
 #APP
# 52 "atomic_test01.c" 1
	amoadd.w zero, a4, 0(a5)
# 0 "" 2
 #NO_APP
	ld	a5,-32(s0)
	sd	a5,-56(s0)
	ld	a5,-48(s0)
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	ld	a4,-56(s0)
	ld	a3,-64(s0)
 #APP
# 52 "atomic_test01.c" 1
	amoadd.d zero, a4, 0(a5)
# 0 "" 2
 #NO_APP
	li	a5,0
	mv	a0,a5
	ld	s0,88(sp)
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
