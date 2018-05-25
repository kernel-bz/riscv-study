	.file	"main.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48       //sp = sp - 48
	sd	    s0,40(sp)       //[sp+40] = s0
	addi	s0,sp,48        //s0 = sp + 48

	li	    a5,10           //a5 = 10
	sw	    a5,-20(s0)      //[s0-20] = a5      //i = 10    //RV32I (Store Word 4Bytes)
	sw	    zero,-24(s0)    //[s0-24] = zero    //v = 0

	li	    a5,100          //a5 = 100
	sd	    a5,-32(s0)      //[s0-32] = a5      //j = 100   ///RV64I (Strore DoubleWord 8Bytes)
	sd	    zero,-40(s0)    //[s0-40] = zero    //w = 0

	lw	    a5,-20(s0)      //a5 = [s0-20]      //i
	addiw	a5,a5,1         //a5 = a5 + 1
	sw	    a5,-20(s0)      //[s0-20] = a5      //i++

	lw	    a4,-24(s0)      //a4 = [s0-24]      //v
	lw	    a5,-20(s0)      //a5 = [s0-20]      //i
	addw	a5,a4,a5        //a5 = a4 + a5
	sw	    a5,-24(s0)      //[s0-24] = a5      //v += i

	ld	    a5,-32(s0)      //a5 = [s0-32]      //j
	addi	a5,a5,1         //a5 = a5 + 1
	sd	    a5,-32(s0)      //[s0-32] = a5      //j++

	ld	    a4,-40(s0)      //a4 = [s0-40]      //w
	ld	    a5,-32(s0)      //a5 = [s0-32]      //j
	add	    a5,a4,a5        //a5 = a4 + a5
	sd	    a5,-40(s0)      //[s0-40] = a5      //w += j

	li	    a5,0            //a5 = 0
	mv	    a0,a5           //a0 = a5
	ld	    s0,40(sp)       //s0 = [sp+40]
	addi	sp,sp,48        //sp = sp + 48

	jr	    ra              //return

	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
