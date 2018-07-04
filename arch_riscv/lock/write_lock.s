	.file	"write_lock.c"
	.option nopic
	.text
	.align	1
	.type	arch_write_lock, @function
arch_write_lock:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48
	sd	    a0,-40(s0)
	ld	    a4,-40(s0)
	ld	    a5,-40(s0)
 #APP
# 89 "../include/spinlock.h" 1
1:	lr.w	a3, 0(a4)
	bnez	a3, 1b          //if ( != 0)
	li	    a3, -1
	sc.w	a3, a3, 0(a4)   //lock = -1
	bnez	a3, 1b
	fence   r , rw

# 0 "" 2
 #NO_APP
	mv	    a5,a3
	sw	    a5,-20(s0)      //tmp
	nop
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra
	.size	arch_write_lock, .-arch_write_lock
	.align	1
	.type	arch_write_unlock, @function
arch_write_unlock:
	addi	sp,sp,-64
	sd	    ra,56(sp)
	sd	    s0,48(sp)
	addi	s0,sp,64
	sd	    a0,-56(s0)
 #APP
# 148 "../include/spinlock.h" 1
	fence   rw,w
# 0 "" 2
 #NO_APP
	sw	zero,-40(s0)
	ld	a5,-56(s0)
	sd	a5,-24(s0)
	addi	a5,s0,-40
	sd	a5,-32(s0)
	li	a5,4
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a3,a5
	li	a4,2
	beq	a3,a4,.L4
	sext.w	a3,a5
	li	a4,2
	bgt	a3,a4,.L5
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L6
	j	.L3
.L5:
	sext.w	a3,a5
	li	a4,4
	beq	a3,a4,.L7
	sext.w	a4,a5
	li	a5,8
	beq	a4,a5,.L8
	j	.L3
.L6:
	ld	a5,-32(s0)
	lbu	a4,0(a5)
	ld	a5,-24(s0)
	sb	a4,0(a5)
	j	.L9
.L4:
	ld	a5,-32(s0)
	lhu	a4,0(a5)
	ld	a5,-24(s0)
	sh	a4,0(a5)
	j	.L9
.L7:
	ld	a5,-32(s0)
	lw	a4,0(a5)
	ld	a5,-24(s0)
	sw	a4,0(a5)
	j	.L9
.L8:
	ld	a5,-32(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	j	.L9
.L3:
	lw	a5,-36(s0)
	ld	a3,-24(s0)
	ld	a4,-32(s0)
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	memcpy
.L9:
	lw	a5,-40(s0)
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	arch_write_unlock, .-arch_write_unlock
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
	call	arch_write_lock
	lui	    a5,%hi(lock)
	addi	a0,a5,%lo(lock)
	call	arch_write_unlock
	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
