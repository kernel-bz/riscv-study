	.file	"data-const-04.c"
	.option nopic
	.text
	.align	1
	.globl	calc
	.type	calc, @function
calc:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	li	a5,10
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L2
	li	a5,10
	sw	a5,-20(s0)
	j	.L3
.L2:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,5
	bne	a4,a5,.L4
	li	a5,50
	sw	a5,-20(s0)
	j	.L3
.L4:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,10
	bne	a4,a5,.L5
	li	a5,100
	sw	a5,-20(s0)
	j	.L3
.L5:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,20
	bne	a4,a5,.L6
	li	a5,200
	sw	a5,-20(s0)
	j	.L3
.L6:
	li	a5,300
	sw	a5,-20(s0)
.L3:
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	calc, .-calc
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a0,10
	call	calc
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
