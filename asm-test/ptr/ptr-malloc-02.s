	.file	"ptr-malloc-02.c"
	.option nopic
	.text
	.comm	__packed,32,8
	.align	1
	.globl	data_init
	.type	data_init, @function
data_init:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	li	a4,10
	sb	a4,0(a5)
	ld	a5,-24(s0)
	li	a4,20
	sw	a4,4(a5)
	ld	a5,-24(s0)
	li	a4,30
	sd	a4,8(a5)
	ld	a5,-24(s0)
	li	a4,40
	sd	a4,16(a5)
	ld	a5,-24(s0)
	li	a4,50
	sb	a4,24(a5)
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	data_init, .-data_init
	.section	.rodata
	.align	3
.LC0:
	.string	"size=%lu\n"
	.align	3
.LC1:
	.string	"%d\n"
	.align	3
.LC2:
	.string	"%ldi, %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a1,32
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a0,32
	call	malloc
	mv	a5,a0
	sd	a5,-24(s0)
	ld	a0,-24(s0)
	call	data_init
	li	a5,8
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	ld	a5,-24(s0)
	ld	a4,8(a5)
	ld	a5,-24(s0)
	lbu	a5,24(a5)
	sext.w	a5,a5
	mv	a2,a5
	mv	a1,a4
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
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
