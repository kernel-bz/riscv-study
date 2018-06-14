	.file	"atomic_test03.c"
	.option nopic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-336
	sd	s0,328(sp)
	sd	s1,320(sp)
	addi	s0,sp,336
	li	a5,10
	sw	a5,-20(s0)
	li	a5,1
	sw	a5,-24(s0)
	li	a5,2
	sw	a5,-28(s0)
	addi	a5,s0,-328
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	li	a4,20
	sw	a4,0(a5)
	li	a5,100
	sd	a5,-48(s0)
	li	a5,3
	sd	a5,-56(s0)
	addi	a5,s0,-336
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	li	a4,200
	sd	a4,0(a5)
	lw	a5,-20(s0)
	sw	a5,-308(s0)
	ld	a5,-40(s0)
	sd	a5,-320(s0)
	ld	a5,-320(s0)
	lw	a4,-308(s0)
	ld	a3,-320(s0)
 #APP
# 68 "atomic_test03.c" 1
	amoadd.w a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a5,s1
	sw	a5,-68(s0)
	lw	a4,-24(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	sw	a5,-276(s0)
	ld	a5,-40(s0)
	sd	a5,-288(s0)
	lw	a5,-276(s0)
	sw	a5,-292(s0)
	ld	a5,-288(s0)
	sd	a5,-304(s0)
	ld	a5,-304(s0)
	lw	a4,-292(s0)
	ld	a3,-304(s0)
 #APP
# 68 "atomic_test03.c" 1
	amoadd.w a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a4,s1
	lw	a5,-276(s0)
	addw	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-68(s0)
	lw	a4,-28(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	ld	a5,-48(s0)
	sd	a5,-264(s0)
	ld	a5,-64(s0)
	sd	a5,-272(s0)
	ld	a5,-272(s0)
	ld	a4,-264(s0)
	ld	a3,-272(s0)
 #APP
# 68 "atomic_test03.c" 1
	amoadd.d a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	mv	s1,a4
	mv	a5,s1
	sd	a5,-80(s0)
	ld	a4,-56(s0)
	ld	a5,-80(s0)
	add	a5,a4,a5
	sd	a5,-56(s0)
	ld	a5,-48(s0)
	sd	a5,-232(s0)
	ld	a5,-64(s0)
	sd	a5,-240(s0)
	ld	a5,-232(s0)
	sd	a5,-248(s0)
	ld	a5,-240(s0)
	sd	a5,-256(s0)
	ld	a5,-256(s0)
	ld	a4,-248(s0)
	ld	a3,-256(s0)
 #APP
# 68 "atomic_test03.c" 1
	amoadd.d a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	mv	s1,a4
	mv	a4,s1
	ld	a5,-232(s0)
	add	a5,a4,a5
	sd	a5,-80(s0)
	ld	a4,-56(s0)
	ld	a5,-80(s0)
	add	a5,a4,a5
	sd	a5,-56(s0)
	lw	a5,-20(s0)
	sw	a5,-212(s0)
	ld	a5,-40(s0)
	sd	a5,-224(s0)
	ld	a5,-224(s0)
	lw	a4,-212(s0)
	ld	a3,-224(s0)
 #APP
# 69 "atomic_test03.c" 1
	amoadd.w.aq a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a5,s1
	sw	a5,-68(s0)
	lw	a4,-24(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	sw	a5,-180(s0)
	ld	a5,-40(s0)
	sd	a5,-192(s0)
	lw	a5,-180(s0)
	sw	a5,-196(s0)
	ld	a5,-192(s0)
	sd	a5,-208(s0)
	ld	a5,-208(s0)
	lw	a4,-196(s0)
	ld	a3,-208(s0)
 #APP
# 69 "atomic_test03.c" 1
	amoadd.w.aq a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a4,s1
	lw	a5,-180(s0)
	addw	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-68(s0)
	lw	a4,-28(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	sw	a5,-164(s0)
	ld	a5,-40(s0)
	sd	a5,-176(s0)
	ld	a5,-176(s0)
	lw	a4,-164(s0)
	ld	a3,-176(s0)
 #APP
# 70 "atomic_test03.c" 1
	amoadd.w.rl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a5,s1
	sw	a5,-68(s0)
	lw	a4,-24(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	sw	a5,-132(s0)
	ld	a5,-40(s0)
	sd	a5,-144(s0)
	lw	a5,-132(s0)
	sw	a5,-148(s0)
	ld	a5,-144(s0)
	sd	a5,-160(s0)
	ld	a5,-160(s0)
	lw	a4,-148(s0)
	ld	a3,-160(s0)
 #APP
# 70 "atomic_test03.c" 1
	amoadd.w.rl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a4,s1
	lw	a5,-132(s0)
	addw	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-68(s0)
	lw	a4,-28(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	sw	a5,-116(s0)
	ld	a5,-40(s0)
	sd	a5,-128(s0)
	ld	a5,-128(s0)
	lw	a4,-116(s0)
	ld	a3,-128(s0)
 #APP
# 71 "atomic_test03.c" 1
	amoadd.w.aqrl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a5,s1
	sw	a5,-68(s0)
	lw	a4,-24(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	sw	a5,-84(s0)
	ld	a5,-40(s0)
	sd	a5,-96(s0)
	lw	a5,-84(s0)
	sw	a5,-100(s0)
	ld	a5,-96(s0)
	sd	a5,-112(s0)
	ld	a5,-112(s0)
	lw	a4,-100(s0)
	ld	a3,-112(s0)
 #APP
# 71 "atomic_test03.c" 1
	amoadd.w.aqrl a4, a4, 0(a5)
# 0 "" 2
 #NO_APP
	sext.w	s1,a4
	mv	a4,s1
	lw	a5,-84(s0)
	addw	a5,a5,a4
	sext.w	a5,a5
	sw	a5,-68(s0)
	lw	a4,-28(s0)
	lw	a5,-68(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a4,a5
	ld	a5,-56(s0)
	add	a5,a5,a4
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,328(sp)
	ld	s1,320(sp)
	addi	sp,sp,336
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
