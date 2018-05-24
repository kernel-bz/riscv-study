	.file	"main.c"
	.option nopic
	.globl	__addtf3
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64           //sp = sp - 64
	sd	    ra,56(sp)           //[sp+56] = ra
	sd	    s0,48(sp)           //[sp+48] = s0
	addi	s0,sp,64            //s0 = sp + 64

	li	    a5,10               //a5 = 10
	sw	    a5,-20(s0)          //[s0-20] = a5      //i = 10
	sw	    zero,-24(s0)        //[s0-24] = zero    //v = 0

	lui	    a5,%hi(.LC0)        //a5 = Upper[LC0]
	ld	    a4,%lo(.LC0)(a5)    //a4 = Lower[LC0]
	sd	    a4,-48(s0)          //[s0-48] = a4      //Lower j=100
	ld	    a5,%lo(.LC0+8)(a5)  //a5 = Lower[LC0+8]
	sd	    a5,-40(s0)          //[s0-40] = a5      //Upper j=100

	sd	    zero,-64(s0)        //[s0-64] = zero    //Lower w=0
	sd	    zero,-56(s0)        //[s0-56] = zero    //Upper w=0

	lw	    a5,-20(s0)          //a5 = [s0-20]      //i
	addiw	a5,a5,1             //a5 = a5 + 1
	sw	    a5,-20(s0)          //[s0-20] = a5      //i++

	lw	    a4,-24(s0)          //a4 = [s0-24]      //v
	lw	    a5,-20(s0)          //a5 = [s0-20]      //i
	addw	a5,a4,a5            //a5 = a4 + a5
	sw	    a5,-24(s0)          //[s0-24] = a5      //v += i

	lui	    a5,%hi(.LC1)        //a5 = Upper[LC1]
	ld	    a2,%lo(.LC1)(a5)    //a2 = Lower[LC1]   //Lower 1
	ld	    a3,%lo(.LC1+8)(a5)  //a3 = Upper[LC1+8] //Upper 1
	ld	    a0,-48(s0)          //a0 = [s0-48]      //Lower j
	ld	    a1,-40(s0)          //a1 = [s0-40]      //Upper j
	call	__addtf3                                //j++
	mv	    a5,a0               //a5 = a0           //result
	mv	    a6,a1               //a6 = a1
	sd	    a5,-48(s0)          //[s0-48] = a5      //Lower j
	sd	    a6,-40(s0)          //[s0-40] = a6      //Upper j

	ld	    a2,-48(s0)          //a2 = [s0-48]      //Lower j
	ld	    a3,-40(s0)          //a3 = [s0-40]      //Upper j
	ld	    a0,-64(s0)          //a0 = [s0-64]      //Lower w
	ld	    a1,-56(s0)          //a1 = [s0-56]      //Upper w
	call	__addtf3                                //w + j
	mv	    a5,a0               //a5 = a0           //result
	mv	    a6,a1               //a6 = a1
	sd	    a5,-64(s0)          //[s0-64] = a5      //Lower w
	sd	    a6,-56(s0)          //[s0-56] = a6      //Upper w

	li	    a5,0                //a5 = 0
	mv	    a0,a5               //a0 = a5
	ld	    ra,56(sp)           //ra = [sp+56]
	ld	    s0,48(sp)           //s0 = [sp+48]
	addi	sp,sp,64            //sp = sp + 64

	jr	    ra                  //return

	.size	main, .-main
	.section	.rodata
	.align	4
.LC0:
	.word	0
	.word	0
	.word	0
	.word	1074106368
	.align	4
.LC1:
	.word	0
	.word	0
	.word	0
	.word	1073676288
	.ident	"GCC: (GNU) 7.2.0"
