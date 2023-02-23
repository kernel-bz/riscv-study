	.file	"data-cond-02.c"
	.option nopic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%ld"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	zero,-24(s0)
	ld	a5,-24(s0)
	snez	a5,a5
	andi	a5,a5,0xff
	sd	a5,-24(s0)
	ld	a1,-24(s0)
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
