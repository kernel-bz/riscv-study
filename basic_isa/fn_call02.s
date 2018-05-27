	.file	"fn_call02.c"
	.option nopic
	.text

	.align	1
	.globl	swap
	.type	swap, @function
swap:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48

	sd	    a0,-40(s0)      //[s0-40] = a0      //&a
	sd	    a1,-48(s0)      //[s0-48] = a1      //&b
	ld	    a5,-40(s0)      //a5 = [s0-40]      //&a
	lw	    a5,0(a5)        //a5 = [a5+0]       //*a
	sw	    a5,-20(s0)      //[s0-20] = a5      //temp = *a
	ld	    a5,-48(s0)      //a5 = [s0-48]      //&b
	lw	    a4,0(a5)        //a4 = [a5+0]       //*b
	ld	    a5,-40(s0)      //a5 = [s0-40]      //&a
	sw	    a4,0(a5)        //[a5+0] = a4       //*a = *b
	ld	    a5,-48(s0)      //a5 = [s0-48]      //&b
	lw	    a4,-20(s0)      //a4 = [s0-20]      //temp
	sw	    a4,0(a5)        //[a5+0] = a4       //*b = temp

	nop
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra

	.size	swap, .-swap

	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	    ra,24(sp)
	sd	    s0,16(sp)
	addi	s0,sp,32

	li	    a5,10
	sw	    a5,-20(s0)      //[s0-20] = a5      //a = 10
	li	    a5,20
	sw	    a5,-24(s0)      //[s0-24] = a5      //b = 20
	addi	a4,s0,-24       //a4 = s0 - 24      //&b
	addi	a5,s0,-20       //a5 = s0 - 20      //&a
	mv	    a1,a4           //a1 = a4           //*b = &b
	mv	    a0,a5           //a0 = a5           //*a = &a
	call	swap

	li	    a5,0
	mv	    a0,a5
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra              //return 0

	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
