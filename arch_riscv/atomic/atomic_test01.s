	.file	"atomic_test01.c"
	.option nopic
	.text
	.align	1

	.type	atomic_add, @function
atomic_add:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32

	mv	    a5,a0               //a
	mv	    a4,a1               //b
	sw	    a5,-20(s0)          //a=10
	mv	    a5,a4               //b
	sw	    a5,-24(s0)          //b=20
	lw	    a5,-20(s0)          //a
	addi	a4,s0,-24           //&b
 #APP
# 18 "atomic_test01.c" 1
	amoadd.w zero, a5, 0(a4)    //[b]=a+[b]=10+20
	//lw    a2, 0(a4)
	//addw  a3, a5, a2
	//sw    a3, 0(a4)
# 0 "" 2
 #NO_APP
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	atomic_add, .-atomic_add
	.align	1

	.type	atomic_swap, @function
atomic_swap:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32

	mv	    a5,a0               //a
	mv	    a4,a1               //b
	sw	    a5,-20(s0)          //a=10
	mv	    a5,a4               //b
	sw	    a5,-24(s0)          //b=20
	lw	    a5,-20(s0)          //a
	addi	a4,s0,-24           //&b
 #APP
# 39 "atomic_test01.c" 1
    amoswap.w a5, a5, 0(a4)     //a5=[b], [b]=a=10
# 0 "" 2
 #NO_APP
	sw	    a5,-20(s0)          //[a]=a5=[b]=20
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	atomic_swap, .-atomic_swap
	.align	1

	.type	atomic_swap2, @function
atomic_swap2:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32

	sd	    a0,-24(s0)          //&a
	sd	    a1,-32(s0)          //&b
	ld	    a5,-24(s0)          //&a
	lw	    a5,0(a5)            //a
	ld	    a3,-32(s0)          //&b
	ld	    a4,-32(s0)          //&b
 #APP
# 48 "atomic_test01.c" 1
    amoswap.w a4, a5, 0(a3)     //a4=[b], [b]=a5
# 0 "" 2
 #NO_APP
	ld	    a5,-24(s0)          //&a
	sw	    a4,0(a5)            //[a]=a4
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	atomic_swap2, .-atomic_swap2
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	    ra,24(sp)
	sd	    s0,16(sp)
	addi	s0,sp,32

	li	    a5,10
	sw	    a5,-20(s0)          //a=10
	li	    a5,20
	sw	    a5,-24(s0)          //b=20
	lw	    a5,-20(s0)          //a
	lw	    a4,-24(s0)          //b
	mv	    a1,a4               //b
	mv	    a0,a5               //a
	call	atomic_add

	lw	    a5,-20(s0)          //a
	lw	    a4,-24(s0)          //b
	mv	    a1,a4               //b
	mv	    a0,a5               //a
	call	atomic_swap

	addi	a4,s0,-24           //&b
	addi	a5,s0,-20           //&a
	mv	    a1,a4               //&b
	mv	    a0,a5               //&a
	call	atomic_swap2

	li	    a5,0
	mv	    a0,a5
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra                  //return 0
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
