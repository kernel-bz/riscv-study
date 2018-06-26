	.file	"cpu_relax.c"
	.option nopic
	.text
	.align	1
	.type	cpu_relax, @function
cpu_relax:
	addi	sp,sp,-32
	sd	    s0,24(sp)
	addi	s0,sp,32
 #APP
# 14 "cpu_relax.c" 1
	div     a5, a5, zero            //a5 /= zero
# 0 "" 2
 #NO_APP
	sw	    a5,-20(s0)
	nop
	ld	    s0,24(sp)
	addi	sp,sp,32
	jr	    ra
	.size	cpu_relax, .-cpu_relax
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	    ra,8(sp)
	sd	    s0,0(sp)
	addi	s0,sp,16

	call	cpu_relax

	li	    a5,0
	mv	    a0,a5
	ld	    ra,8(sp)
	ld	    s0,0(sp)
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
