	.file	"atomic_test02.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-112
	sd	    s0,104(sp)
	addi	s0,sp,112
	li	    a5,10
	sw	    a5,-20(s0)          //i=10
	addi	a5,s0,-104
	sd	    a5,-32(s0)          //v=&vt
	ld	    a5,-32(s0)          //v
	li	    a4,20
	sw	    a4,0(a5)            //v->counter=20
	li	    a5,100
	sd	    a5,-40(s0)          //j=100
	addi	a5,s0,-112
	sd	    a5,-48(s0)          //w=&wt
	ld	    a5,-48(s0)          //w
	li	    a4,200
	sd	    a4,0(a5)            //w->counter=200
	li	    a5,1
	sw	    a5,-84(s0)          //1
	ld	    a5,-32(s0)          //v
	sd	    a5,-96(s0)          //v
	ld	    a5,-96(s0)          //v
	lw	    a4,-84(s0)          //1
	ld	    a3,-96(s0)          //*v
 #APP
# 60 "atomic_test02.c" 1
	amoadd.w zero, a4, 0(a5)    //[v]=[v]+1
# 0 "" 2
 #NO_APP
	lw	    a5,-20(s0)          //i=10
	sw	    a5,-68(s0)          //i
	ld	    a5,-32(s0)          //v
	sd	    a5,-80(s0)          //v
	ld	    a5,-80(s0)          //v
	lw	    a4,-68(s0)          //i
	ld	    a3,-80(s0)          //*v
 #APP
# 60 "atomic_test02.c" 1
	amoadd.w zero, a4, 0(a5)    //[v]=[v]+i
# 0 "" 2
 #NO_APP
	ld	    a5,-40(s0)          //j=100
	sd	    a5,-56(s0)          //j
	ld	    a5,-48(s0)          //w
	sd	    a5,-64(s0)          //w
	ld	    a5,-64(s0)          //w
	ld	    a4,-56(s0)          //j
	ld	    a3,-64(s0)          //*w
 #APP
# 60 "atomic_test02.c" 1
	amoadd.d zero, a4, 0(a5)    //[w]=[w]+j
# 0 "" 2
 #NO_APP
	li	    a5,0
	mv	    a0,a5
	ld	    s0,104(sp)
	addi	sp,sp,112
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
