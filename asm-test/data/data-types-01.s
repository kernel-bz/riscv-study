	.file	"data-types-01.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	li	a5,10
	sb	a5,-17(s0)
	li	a5,20
	sw	a5,-24(s0)
	li	a5,30
	sd	a5,-32(s0)
	lbu	a5,-17(s0)
	sext.w	a5,a5
	lw	a4,-24(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	sd	a5,-32(s0)
	li	a5,0
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
