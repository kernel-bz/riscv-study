	.file	"trylock.c"
	.option nopic
	.text
	.align	1
	.type	arch_read_trylock, @function
arch_read_trylock:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48
	sd	    a0,-40(s0)          //lock
	ld	    a4,-40(s0)
	ld	    a5,-40(s0)
 #APP
# 104 "../include/spinlock.h" 1
1:	lr.w	a3, 0(a4)
	bltz	a3, 1f              //if ( < 0) break
	addi	a3, a3, 1
	sc.w	a3, a3, 0(a4)       //lock += 1
	bnez	a3, 1b
	fence   r , rw
1:

# 0 "" 2
 #NO_APP
	mv	    a5,a3
	sw	    a5,-20(s0)          //busy
	lw	    a5,-20(s0)
	sext.w	a5,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	mv	    a0,a5
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra
	.size	arch_read_trylock, .-arch_read_trylock
	.align	1
	.type	arch_write_trylock, @function
arch_write_trylock:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48
	sd	    a0,-40(s0)          //lock
	ld	    a4,-40(s0)
	ld	    a5,-40(s0)
 #APP
# 122 "../include/spinlock.h" 1
1:	lr.w	a3, 0(a4)
	bnez	a3, 1f              //if ( != 0) break
	li	    a3, -1
	sc.w	a3, a3, 0(a4)       //lock = -1
	bnez	a3, 1b
	fence   r , rw
1:

# 0 "" 2
 #NO_APP
	mv	    a5,a3
	sw	    a5,-20(s0)          //busy
	lw	    a5,-20(s0)
	sext.w	a5,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	mv	    a0,a5
	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra
	.size	arch_write_trylock, .-arch_write_trylock
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
	call	arch_read_trylock
	lui	    a5,%hi(lock)
	addi	a0,a5,%lo(lock)
	call	arch_write_trylock
	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
