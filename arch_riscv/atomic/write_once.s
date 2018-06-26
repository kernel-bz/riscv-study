	.file	"write_once.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sw	zero,-20(s0)
	li	a5,10
	sw	a5,-56(s0)
	addi	a5,s0,-48
	sd	a5,-32(s0)
	addi	a5,s0,-56
	sd	a5,-40(s0)
	li	a5,4
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	sext.w	a3,a5
	li	a4,2
	beq	a3,a4,.L3
	sext.w	a3,a5
	li	a4,2
	bgt	a3,a4,.L4
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L5
	j	.L2
.L4:
	sext.w	a3,a5
	li	a4,4
	beq	a3,a4,.L6
	sext.w	a4,a5
	li	a5,8
	beq	a4,a5,.L7
	j	.L2
.L5:
	ld	a5,-40(s0)
	lbu	a4,0(a5)
	ld	a5,-32(s0)
	sb	a4,0(a5)
	j	.L8
.L3:
	ld	a5,-40(s0)
	lhu	a4,0(a5)
	ld	a5,-32(s0)
	sh	a4,0(a5)
	j	.L8
.L6:
	ld	a5,-40(s0)
	lw	a4,0(a5)
	ld	a5,-32(s0)
	sw	a4,0(a5)
	j	.L8
.L7:
	ld	a5,-40(s0)
	ld	a4,0(a5)
	ld	a5,-32(s0)
	sd	a4,0(a5)
	j	.L8
.L2:
	lw	a5,-44(s0)
	ld	a3,-32(s0)
	ld	a4,-40(s0)
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	memcpy
.L8:
	lw	a5,-56(s0)
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	sext.w	a5,a5
	blez	a5,.L9
	li	a5,1
	sw	a5,-20(s0)
	j	.L10
.L9:
	li	a5,-1
	sw	a5,-20(s0)
.L10:
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
