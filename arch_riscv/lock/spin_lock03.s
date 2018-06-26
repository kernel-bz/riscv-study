	.file	"spin_lock03.c"
	.option nopic
	.globl	lock
	.section	.sbss,"aw",@nobits
	.align	2
	.type	lock, @object
	.size	lock, 4
lock:
	.zero	4
	.text
	.align	1

	.globl	spinlock
	.type	spinlock, @function
spinlock:
	addi	sp,sp,-16
	sd	    s0,8(sp)
	addi	s0,sp,16
	nop
.L2:
	lui	    a5,%hi(lock)
	addi	a5,a5,%lo(lock)
	lw	    a5,0(a5)                //lock
	sext.w	a5,a5                   //a5=a5+0 (sign extend)
	mv	    a4,a5
	li	    a5,1
	beq	    a4,a5,.L2               //while(lock==1)
	lui	    a5,%hi(lock)
	li	    a4,1
	sw	    a4,%lo(lock)(a5)        //lock=1
	nop
	ld	    s0,8(sp)
	addi	sp,sp,16
	jr	    ra
	.size	spinlock, .-spinlock
	.align	1

	.globl	func2
	.type	func2, @function
func2:
	addi	sp,sp,-16
	sd	    s0,8(sp)
	addi	s0,sp,16
	nop
.L4:
	lui	    a5,%hi(lock)
	lw	    a5,%lo(lock)(a5)
	mv	    a4,a5
	li	    a5,1
	beq	    a4,a5,.L4               //while(lock==1)
	lui	    a5,%hi(lock)
	li	    a4,1
	sw	    a4,%lo(lock)(a5)        //lock=1
	nop
	ld	    s0,8(sp)
	addi	sp,sp,16
	jr	    ra
	.size	func2, .-func2
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	    ra,8(sp)
	sd	    s0,0(sp)
	addi	s0,sp,16
	call	spinlock
	call	func2
	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
