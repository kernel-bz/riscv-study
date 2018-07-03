	.file	"cache_test01.c"
	.option nopic
	.text
	.align	1
	.type	sbi_remote_fence_i, @function
sbi_remote_fence_i:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32
	sd	    a0,-24(s0)          //a0 = 0
	ld	    a5,-24(s0)
	mv	    a0,a5               //0
	li	    a1,0                //arg1
	li	    a2,0                //arg2
	li	    a7,5                //which
 #APP
# 85 "sbi.h" 1
	ecall
# 0 "" 2
 #NO_APP
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	sbi_remote_fence_i, .-sbi_remote_fence_i
	.align	1
	.type	local_flush_icache_all, @function

local_flush_icache_all:
	addi	sp,sp,-16
	sd	    s0,8(sp)
	addi	s0,sp,16
 #APP
# 15 "cache_test01.c" 1
	fence.i
# 0 "" 2
 #NO_APP
	nop
	ld	    s0,8(sp)
	addi	sp,sp,16
	jr	    ra
	.size	local_flush_icache_all, .-local_flush_icache_all
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	    ra,8(sp)
	sd	    s0,0(sp)
	addi	s0,sp,16

	call	local_flush_icache_all

	li	    a0,0
	call	sbi_remote_fence_i

	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
