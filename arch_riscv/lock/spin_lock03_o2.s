	.file	"spin_lock03.c"
	.option nopic
	.text
	.align	1

	.globl	spinlock
	.type	spinlock, @function
spinlock:
	lui	    a4,%hi(lock)
	li	    a3,1
.L2:
	lw	    a5,%lo(lock)(a4)
	beq	    a3,a5,.L2               //while(lock==1)
	sw	    a3,%lo(lock)(a4)        //lock=1
	ret
	.size	spinlock, .-spinlock
	.align	1

	.globl	func2
	.type	func2, @function
func2:
	lui	    a3,%hi(lock)
	lw	    a4,%lo(lock)(a3)
	li	    a5,1
.L6:
	beq	    a4,a5,.L6               //while(lock==1)
	sw	    a5,%lo(lock)(a3)        //lock=1
	ret
	.size	func2, .-func2
	.section	.text.startup,"ax",@progbits
	.align	1

	.globl	main
	.type	main, @function
main:
	lui	    a5,%hi(lock)
	li	    a4,1
.L9:
	lw	    a3,%lo(lock)(a5)
	beq	    a4,a3,.L9
	sw	    a4,%lo(lock)(a5)
.L10:
	j	    .L10
	.size	main, .-main
	.globl	lock
	.section	.sbss,"aw",@nobits
	.align	2
	.type	lock, @object
	.size	lock, 4
lock:
	.zero	4
	.ident	"GCC: (GNU) 7.2.0"
