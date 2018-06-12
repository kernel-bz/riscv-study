	.file	"atomic_test03.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	s0,88(sp)
	addi	s0,sp,96
	li	a5,10
	sw	a5,-20(s0)
	addi	a5,s0,-88
	sd	a5,-32(s0)
	ld	a5,-32(s0)
	li	a4,20
	sw	a4,0(a5)
	li	a5,100
	sd	a5,-40(s0)
	addi	a5,s0,-96
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	li	a4,200
	sd	a4,0(a5)
	lw	a5,-20(s0)
	sw	a5,-68(s0)
	ld	a5,-32(s0)
	sd	a5,-80(s0)
	ld	a5,-80(s0)
	lw	a4,-68(s0)
	ld	a3,-80(s0)
 #APP
# 74 "atomic_test03.c" 1
	amoadd.w.aqrl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	ld	a5,-40(s0)
	sd	a5,-56(s0)
	ld	a5,-48(s0)
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	ld	a4,-56(s0)
	ld	a3,-64(s0)
 #APP
# 74 "atomic_test03.c" 1
	amoadd.d.aqrl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	li	a5,0
	mv	a0,a5
	ld	s0,88(sp)
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
