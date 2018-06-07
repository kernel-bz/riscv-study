	.file	"atomic_test03.c"
	.option nopic
	.text

	.align	1
	.type	swap, @function
swap:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32

	mv	    a5,a0               //a
	mv	    a3,a1               //b
	mv	    a4,a2               //c
	sw	    a5,-20(s0)          //a=10
	mv	    a5,a3
	sw	    a5,-24(s0)          //b=20
	mv	    a5,a4
	sw	    a5,-28(s0)          //c=30

	lw	    a5,-20(s0)          //a
	sw	    a5,-28(s0)          //c = a
	lw	    a5,-24(s0)          //b
	sw	    a5,-20(s0)          //a = b
	lw	    a5,-28(s0)          //c
	sw	    a5,-24(s0)          //b = c
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra                  //return
	.size	swap, .-swap

	.align	1
	.type	swap2, @function
swap2:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32

	mv	    a5,a0               //a
	mv	    a3,a1               //b
	mv	    a4,a2               //c
	sw	    a5,-20(s0)          //a=10
	mv	    a5,a3
	sw	    a5,-24(s0)          //b=20
	mv	    a5,a4
	sw	    a5,-28(s0)          //c=30

	lw	    a5,-24(s0)          //b
	addi	a4,s0,-28           //&c
 #APP
# 16 "atomic_test03.c" 1
		amoswap.w a5, a5, 0(a4)

# 0 "" 2
 #NO_APP
	sw	    a5,-20(s0)          //a=b
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	swap2, .-swap2

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
	li	    a5,30
	sw	    a5,-28(s0)          //c=30

	lw	    a3,-28(s0)          //c
	lw	    a4,-24(s0)          //b
	lw	    a5,-20(s0)          //a

	mv	    a2,a3               //c
	mv	    a1,a4               //b
	mv	    a0,a5               //a

	call	swap                //swap(a, b, c)

	lw	    a3,-28(s0)
	lw	    a4,-24(s0)
	lw	    a5,-20(s0)

	mv	    a2,a3
	mv	    a1,a4
	mv	    a0,a5

	call	swap2               //swap2(a, b, c)

	li	    a5,0
	mv	    a0,a5
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra                  //return 0

	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
