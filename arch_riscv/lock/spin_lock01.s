	.file	"spin_lock01.c"
	.option nopic

	.text
	.align	1
	.type	arch_spin_trylock, @function
arch_spin_trylock:
	addi	sp,sp,-48
	sd	    s0,40(sp)
	addi	s0,sp,48

	sd	    a0,-40(s0)          //&lock
	li	    a5,1
	sw	    a5,-20(s0)          //tmp=1
	ld	    a3,-40(s0)          //&lock
	lw	    a5,-20(s0)          //tmp
	ld	    a4,-40(s0)          //&lock
 #APP
# 30 "spin_lock01.c" 1          //amoswap.w output, input, lock
    amoswap.w a5, a5, 0(a3)     //a5=[lock], [lock]=1, busy=0
	fence r , rw

# 0 "" 2
 #NO_APP
	sw	    a5,-24(s0)          //busy=0
	lw	    a5,-24(s0)          //busy
	sext.w	a5,a5               //addiw rd, rs, 0  //a5=a5+0
	seqz	a5,a5               //set if zero  //!busy
	andi	a5,a5,0xff          //a5 = a5 & 0xFF
	sext.w	a5,a5               //a5=a5+0
	mv	    a0,a5               //!busy

	ld	    s0,40(sp)
	addi	sp,sp,48
	jr	    ra
	.size	arch_spin_trylock, .-arch_spin_trylock

	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	    ra,24(sp)
	sd	    s0,16(sp)
	addi	s0,sp,32

	sw	    zero,-32(s0)        //lock.lock=0
	addi	a5,s0,-32           //&lock
	mv	    a0,a5
	call	arch_spin_trylock

	mv	    a5,a0               //!busy
	sw	    a5,-20(s0)          //busy=1
	lw	    a5,-20(s0)
	sext.w	a5,a5               //a5=a5+0
	snez	a5,a5               //set if not zero
	andi	a5,a5,0xff
	sw	    a5,-24(s0)          //ok=1
	lw	    a5,-24(s0)
	mv	    a0,a5               //ok=1
	ld	    ra,24(sp)
	ld	    s0,16(sp)
	addi	sp,sp,32
	jr	    ra                  //return ok
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
