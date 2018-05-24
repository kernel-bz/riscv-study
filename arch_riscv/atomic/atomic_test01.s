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
	li	a5,10
	sw	a5,-20(s0)      //i = 10
	ld	a5,-32(s0)      //v
	li	a4,20
	sw	a4,0(a5)        //v->counter = 20
	li	a5,100
	sd	a5,-40(s0)      //j = 100
	ld	a5,-48(s0)      //w
	li	a4,200
	sd	a4,0(a5)        //w->counter = 200

	li	a5,1
	sw	a5,-84(s0)
	ld	a5,-32(s0)      //v
	sd	a5,-96(s0)      //v
	ld	a5,-96(s0)      //a5 = v
	lw	a4,-84(s0)      //a4 = 1
	ld	a3,-96(s0)      //a3 = v
 #APP
# 53 "atomic_test01.c" 1
	amoadd.w zero, a4, 0(a5)    //v->counter += 1
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)      //i
	sw	a5,-68(s0)
	ld	a5,-32(s0)      //v
	sd	a5,-80(s0)      //
	ld	a5,-80(s0)      //a5 = v
	lw	a4,-68(s0)      //a4 = i
	ld	a3,-80(s0)      //a3 = v
 #APP
# 53 "atomic_test01.c" 1
	amoadd.w zero, a4, 0(a5)    //v->counter += i
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
# 53 "atomic_test01.c" 1
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
