	.file	"spin_lock02.c"
	.option nopic
	.text
	.align	1
	.type	arch_spin_unlock, @function
arch_spin_unlock:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
 #APP
# 233 "spin_lock02.c" 1
	fence rw,w
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
	beq	a3,a4,.L3
	sext.w	a3,a5
	li	a4,2
	bgt	a3,a4,.L4
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L5
	j	.L2
.L4:
	sext.w	a3,a5
	li	a4,4
	beq	a3,a4,.L6
	sext.w	a4,a5
	li	a5,8
	beq	a4,a5,.L7
	j	.L2
.L5:
	ld	a5,-32(s0)
	lbu	a4,0(a5)
	ld	a5,-24(s0)
	sb	a4,0(a5)
	j	.L8
.L3:
	ld	a5,-32(s0)
	lhu	a4,0(a5)
	ld	a5,-24(s0)
	sh	a4,0(a5)
	j	.L8
.L6:
	ld	a5,-32(s0)
	lw	a4,0(a5)
	ld	a5,-24(s0)
	sw	a4,0(a5)
	j	.L8
.L7:
	ld	a5,-32(s0)
	ld	a4,0(a5)
	ld	a5,-24(s0)
	sd	a4,0(a5)
	j	.L8
.L2:
	lw	a5,-36(s0)
	ld	a3,-24(s0)
	ld	a4,-32(s0)
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	memcpy
.L8:
	lw	a5,-40(s0)
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	arch_spin_unlock, .-arch_spin_unlock
	.align	1
	.type	arch_spin_trylock, @function
arch_spin_trylock:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	li	a5,1
	sw	a5,-20(s0)
	ld	a3,-40(s0)
	lw	a5,-20(s0)
	ld	a4,-40(s0)
 #APP
# 250 "spin_lock02.c" 1
		amoswap.w a5, a5, 0(a3)
	fence r , rw

# 0 "" 2
 #NO_APP
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	sext.w	a5,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	arch_spin_trylock, .-arch_spin_trylock
	.align	1
	.type	arch_spin_lock, @function
arch_spin_lock:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
.L22:
	ld	a5,-56(s0)
	sd	a5,-24(s0)
	addi	a5,s0,-40
	sd	a5,-32(s0)
	li	a5,4
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sext.w	a3,a5
	li	a4,2
	beq	a3,a4,.L13
	sext.w	a3,a5
	li	a4,2
	bgt	a3,a4,.L14
	sext.w	a4,a5
	li	a5,1
	beq	a4,a5,.L15
	j	.L12
.L14:
	sext.w	a3,a5
	li	a4,4
	beq	a3,a4,.L16
	sext.w	a4,a5
	li	a5,8
	beq	a4,a5,.L17
	j	.L12
.L15:
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	andi	a4,a5,0xff
	ld	a5,-32(s0)
	sb	a4,0(a5)
	j	.L23
.L13:
	ld	a5,-24(s0)
	lhu	a5,0(a5)
	slli	a4,a5,48
	srli	a4,a4,48
	ld	a5,-32(s0)
	sh	a4,0(a5)
	j	.L23
.L16:
	ld	a5,-24(s0)
	lw	a5,0(a5)
	sext.w	a4,a5
	ld	a5,-32(s0)
	sw	a4,0(a5)
	j	.L23
.L17:
	ld	a5,-24(s0)
	ld	a4,0(a5)
	ld	a5,-32(s0)
	sd	a4,0(a5)
	j	.L23
.L12:
	lw	a5,-36(s0)
	ld	a3,-32(s0)
	ld	a4,-24(s0)
	mv	a2,a5
	mv	a1,a4
	mv	a0,a3
	call	memcpy
.L23:
	lw	a5,-40(s0)
	sext.w	a5,a5
	bnez	a5,.L25
	ld	a0,-56(s0)
	call	arch_spin_trylock
	mv	a5,a0
	bnez	a5,.L26
	j	.L22
.L25:
	nop
	j	.L22
.L26:
	nop
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	arch_spin_lock, .-arch_spin_lock
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sw	zero,-24(s0)
	addi	a5,s0,-24
	mv	a0,a5
	call	arch_spin_lock
	addi	a5,s0,-24
	mv	a0,a5
	call	arch_spin_unlock
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
