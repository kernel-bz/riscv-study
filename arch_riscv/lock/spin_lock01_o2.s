	.file	"spin_lock01.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	    zero,8(sp)          //lock.lock=0
	li	    a0,1                //tmp=1
	addi	a5,sp,8             //&lock
 #APP
# 30 "spin_lock01.c" 1
    amoswap.w a0, a0, 0(a5)     //a0=[lock], [lock]=1
	fence r , rw

# 0 "" 2
 #NO_APP                        //a0=output=busy=0
	sext.w	a0,a0               //addiw rd, rs, 0  //a0=a0+0
	seqz	a0,a0               //set if zero  //!busy

	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
