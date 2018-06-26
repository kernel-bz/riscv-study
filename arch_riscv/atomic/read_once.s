	.file	"read_once.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	    ra,56(sp)
	sd	    s0,48(sp)
	addi	s0,sp,64
	li	    a5,10
	sw	    a5,-48(s0)      //v=10
	sw	    zero,-20(s0)    //x=0
	addi	a5,s0,-48       //&v
	sd	    a5,-32(s0)      //&v
	addi	a5,s0,-56       //&w
	sd	    a5,-40(s0)      //&w
	li	    a5,4
	sw	    a5,-44(s0)
	lw	    a5,-44(s0)
	sext.w	a3,a5           //a3 += 4, a3=4
	li	    a4,2
	beq	    a3,a4,.L3       //if(a3==2)
	sext.w	a3,a5           //a3 += 4, a3=8
	li	    a4,2
	bgt	    a3,a4,.L4       //if(a3>2)
	sext.w	a4,a5           //a4 += 4, a4=6
	li	    a5,1
	beq	    a4,a5,.L5       //if(a4==1)
	j	    .L2
.L4:                        //case 4 or 8:
	sext.w	a3,a5           //a3==8, a5==4
	li	    a4,4
	beq	    a3,a4,.L6       //if(a3==4)
	sext.w	a4,a5           //a4=4+4
	li	    a5,8
	beq	    a4,a5,.L7       //if(a4==8)
	j	    .L2

.L5:                        //case 1:
	ld	    a5,-32(s0)      //&v
	lbu	    a5,0(a5)        //v
	andi	a4,a5,0xff      //v
	ld	    a5,-40(s0)      //&w
	sb	    a4,0(a5)        //w=v (byte)
	j	.   L12
.L3:                        //case 2:
	ld	    a5,-32(s0)
	lhu	    a5,0(a5)
	slli	a4,a5,48
	srli	a4,a4,48
	ld	    a5,-40(s0)
	sh	    a4,0(a5)        //w=v (half word)
	j	    .L12
.L6:                        //case 4:
	ld	    a5,-32(s0)
	lw	    a5,0(a5)
	sext.w	a4,a5
	ld	    a5,-40(s0)
	sw	    a4,0(a5)        //w=v (word)
	j	    .L12
.L7:                        //case 8:
	ld	    a5,-32(s0)
	ld	    a4,0(a5)
	ld	    a5,-40(s0)
	sd	    a4,0(a5)        //w=v (double word)
	j	    .L12
.L2:                        //default:
	lw	    a5,-44(s0)
	ld	    a3,-40(s0)
	ld	    a4,-32(s0)
	mv	    a2,a5
	mv	    a1,a4
	mv	    a0,a3
	call	memcpy
.L12:
	lw	    a5,-56(s0)
	sw	    a5,-24(s0)
	lw	    a5,-24(s0)
	sext.w	a5,a5
	blez	a5,.L9
	li	    a5,1
	sw	    a5,-20(s0)
	j	    .L10
.L9:
	li	    a5,-1
	sw	    a5,-20(s0)
.L10:
	lw	    a5,-20(s0)
	mv	    a0,a5
	ld	    ra,56(sp)
	ld	    s0,48(sp)
	addi	sp,sp,64
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
