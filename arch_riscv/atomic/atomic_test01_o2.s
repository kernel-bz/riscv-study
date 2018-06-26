	.file	"atomic_test01.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	    a5,20
	sw	    a5,4(sp)            //b=20
	sw	    a5,12(sp)           //b=20
	addi	a4,sp,12            //&b
	li	    a5,10               //10
 #APP
# 16 "atomic_test01.c" 1
	amoadd.w zero, a5, 0(a4)    //[b]=b+a
# 0 "" 2
 #NO_APP
	lw	    a4,4(sp)            //b
	sw	    a4,8(sp)            //b=20
	addi	a4,sp,8             //&b
 #APP
# 31 "atomic_test01.c" 1
    amoswap.w a4, a5, 0(a4)     //a4=[b]=20, [b]=a5=10=a
# 0 "" 2
 #NO_APP
	addi	a4,sp,4             //&b
 #APP
# 46 "atomic_test01.c" 1
    amoswap.w a5, a5, 0(a4)     //a5=[b], [b]=10

# 0 "" 2
 #NO_APP
	li	    a0,0
	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
