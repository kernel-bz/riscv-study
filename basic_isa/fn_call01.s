	.file	"fn_call01.c"
	.option nopic

	.text
	.align	1

	.globl	fn0
	.type	fn0, @function
fn0:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48

	mv	    a5,a0           //a5 = a0           //b
	mv	    a4,a1           //a4 = a1           //a
	sw	    a5,-36(s0)      //[s0-36] = a5      //b
	mv	    a5,a4           //a5 = a4           //a
	sw	    a5,-40(s0)      //[s0-40] = a5      //a
	lw	    a4,-36(s0)      //a4 = [s0-36]      //b
	lw	    a5,-40(s0)      //a5 = [s0-40]      //a

	addw	a5,a4,a5        //a5 = a4 + a5      //a + b
	sw	    a5,-20(s0)      //[s0-20] = a5      //c
	nop

	ld	    s0,40(sp)       //s0 = [sp+40]
	addi	sp,sp,48        //sp = sp + 48
	jr	    ra              //return

	.size	fn0, .-fn0
	.align	1

	.globl	fn1
	.type	fn1, @function
fn1:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48

	mv	    a5,a0
	mv	    a4,a1
	sw	    a5,-36(s0)
	mv	    a5,a4
	sw	    a5,-40(s0)
	lw	    a4,-36(s0)
	lw	    a5,-40(s0)

	addw	a5,a4,a5        //a5 = a4 + a5      //a + b
	sw	    a5,-20(s0)      //[s0-20] = a5      //c
	lw	    a5,-20(s0)      //a5 = [s0-20]
	mv	    a0,a5           //a0 = a5

	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra              //return

	.size	fn1, .-fn1
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32       //sp = sp - 32
	sd	    ra,24(sp)       //[sp+24] = ra
	sd	    s0,16(sp)       //[sp+16] = s0
	addi	s0,sp,32        //s0 = sp + 32

	li	    a5,10           //a5 = 10
	sw	    a5,-20(s0)      //[s0-20] = a5      //a = 10
	li	    a5,20           //a5 = 20
	sw	    a5,-24(s0)      //[s0-24] = a5      //b = 20

	lw	    a4,-24(s0)      //a4 = [s0-24]      //a4 = 10
	lw	    a5,-20(s0)      //a5 = [s0-20]      //a5 = 20
	mv	    a1,a4           //a1 = a4           //a
	mv	    a0,a5           //a0 = a5           //b
	call	fn0

	lw	    a4,-24(s0)
	lw	    a5,-20(s0)
	mv	    a1,a4
	mv	    a0,a5
	call	fn1

	mv	    a5,a0           //a5 = a0           //c
	sw	    a5,-28(s0)      //[s0-28] = a5

	li	    a5,0
	mv	    a0,a5
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra              //return 0

	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
