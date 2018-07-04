	.file	"read_lock.c"
	.option nopic
	.text
	.align	1
	.type	arch_read_lock, @function
arch_read_lock:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48
	sd	    a0,-40(s0)          //lock
	ld	    a4,-40(s0)
	ld	    a5,-40(s0)
 #APP
# 74 "../include/spinlock.h" 1
1:	lr.w	a3, 0(a4)
	bltz	a3, 1b              //if( < 0)
	addi	a3, a3, 1
	sc.w	a3, a3, 0(a4)       //lock += 1
	bnez	a3, 1b
	fence   r , rw

# 0 "" 2
 #NO_APP
	mv	    a5,a3
	sw	    a5,-20(s0)          //tmp
	nop
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra
	.size	arch_read_lock, .-arch_read_lock
	.align	1
	.type	arch_read_unlock, @function
arch_read_unlock:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32
	sd	    a0,-24(s0)          //lock
	ld	    a5,-24(s0)
	li	    a4,-1
	ld	    a3,-24(s0)
 #APP
# 138 "../include/spinlock.h" 1
    fence   rw,  w
	amoadd.w x0, a4, 0(a5)      //lock -= 1

# 0 "" 2
 #NO_APP
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	arch_read_unlock, .-arch_read_unlock
	.globl	lock
	.section	.sbss,"aw",@nobits
	.align	3
	.type	lock, @object
	.size	lock, 4
lock:
	.zero	4
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	    ra,8(sp)
	sd	    s0,0(sp)
	addi	s0,sp,16
	lui	    a5,%hi(lock)
	addi	a0,a5,%lo(lock)
	call	arch_read_lock
	lui	    a5,%hi(lock)
	addi	a0,a5,%lo(lock)
	call	arch_read_unlock
	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
