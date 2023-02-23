	.file	"align-test-07.c"
	.option nopic
	.text
	.globl	fair_sched_class
	.section	.rodata
	.align	3
	.type	fair_sched_class, @object
	.size	fair_sched_class, 16
fair_sched_class:
	.byte	100
	.zero	3
	.word	200
	.dword	300
	.globl	rt_sched_class
	.align	3
	.type	rt_sched_class, @object
	.size	rt_sched_class, 16
rt_sched_class:
	.byte	10
	.zero	3
	.word	20
	.zero	8
	.globl	dl_sched_class
	.align	3
	.type	dl_sched_class, @object
	.size	dl_sched_class, 16
dl_sched_class:
	.byte	1
	.zero	7
	.dword	3
	.align	3
.LC0:
	.string	"%d, %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,8
	sw	a5,-20(s0)
	li	a5,16
	sw	a5,-24(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	mv	a2,a4
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
