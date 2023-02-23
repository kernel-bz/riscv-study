	.file	"data-types-02.c"
	.option nopic
	.text
	.comm	gA,1,1
	.comm	gB,4,4
	.comm	gC,8,8
	.section	.rodata
	.align	3
.LC0:
	.string	"%ld\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	lui	a5,%hi(gA)
	li	a4,10
	sb	a4,%lo(gA)(a5)
	lui	a5,%hi(gB)
	li	a4,20
	sw	a4,%lo(gB)(a5)
	lui	a5,%hi(gA)
	lbu	a5,%lo(gA)(a5)
	sext.w	a4,a5
	lui	a5,%hi(gB)
	lw	a5,%lo(gB)(a5)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	lui	a5,%hi(gC)
	sd	a4,%lo(gC)(a5)
	lui	a5,%hi(gC)
	ld	a5,%lo(gC)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,8(sp)
	ld	s0,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
