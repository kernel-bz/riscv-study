	.file	"atomic_test03.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,20
	sw	a5,0(sp)        //v->counter=20
	li	a5,200
	sd	a5,8(sp)        //w->counter=200
	li	a5,10           //i=10
 #APP
# 68 "atomic_test03.c" 1    //ret1 = atomic_fetch_add_relaxed(i, v);
	amoadd.w a4, a5, 0(sp)  //a4=[v], [v]=[v]+i=20+10
# 0 "" 2
 #NO_APP
	addiw	a3,a4,1         //ret1=20, tmp1=1  //a3=20+1 == tmp1
 #APP
# 68 "atomic_test03.c" 1    //ret1 = atomic_add_return_relaxed(i, v);
	amoadd.w a2, a5, 0(sp)  //a2=[v], [v]=[v]+i = 30+10
# 0 "" 2
 #NO_APP
	li	    a4,100          //j=100
	addiw	a2,a2,12        //ret1=40, tmp2=2  //a2=30+12 == tmp2
	addi	a1,sp,8         //&w
 #APP
# 68 "atomic_test03.c" 1    //ret2 = atomic64_fetch_add_relaxed(j, w);
	amoadd.d a0, a4, 0(a1)  //a0=[w], [w]=[w]+j = 200+100
# 0 "" 2
 #NO_APP
	addi	a1,a0,3         //ret2=200, tmp3=3  //a1=200+3 == tmp3
	addi	a0,sp,8         //&w
 #APP
# 68 "atomic_test03.c"      //ret2 = atomic64_add_return_relaxed(j, w);
	amoadd.d a0, a4, 0(a0)  //a0=[w], [w]=[w]+j = 300+100
# 0 "" 2
 #NO_APP
	addi	a0,a0,100       //a0=300  //ret2=300+100
	add	    a0,a0,a1        //a0=ret2+tmp3 = 400+203 == tmp3
 #APP
# 69 "atomic_test03.c" 1    //ret1 = atomic_fetch_add_acquire(i, v);
	amoadd.w.aq a4, a5, 0(sp) //a4=[v], [v]=[v]+i = 40+10
# 0 "" 2
 #NO_APP
	addw	a4,a3,a4        //a4=ret1=40, a3=tmp1  //a4=21+40 == tmp1
 #APP
# 69 "atomic_test03.c" 1    //ret1 = atomic_add_return_acquire(i, v);
	amoadd.w.aq a3, a5, 0(sp) //a3=[v], [v]=[v]+i = 50+10
# 0 "" 2
 #NO_APP
	addiw	a3,a3,10        //a3=50, a3=a3+10 = 50+10 == ret1
	addw	a2,a3,a2        //a2=tmp2=42, a3=60  //a2=60+42 == tmp2
 #APP
# 70 "atomic_test03.c" 1    //ret1 = atomic_fetch_add_release(i, v);
	amoadd.w.rl a3, a5, 0(sp) //a3=[v], [v]=[v]+i = 60+10
# 0 "" 2
 #NO_APP
	addw	a4,a4,a3        //a3=60, a4=tmp1=61  //a4=61+60 == tmp1
 #APP
# 70 "atomic_test03.c" 1    //ret1 = atomic_add_return_release(i, v);
	amoadd.w.rl a3, a5, 0(sp) //a3=[v], [v]=[v]+i = 70+10
# 0 "" 2
 #NO_APP
	addiw	a3,a3,10        //a3=70, a3=a3+10 = 70+10 == ret1
	addw	a3,a3,a2        //a2=tmp2=102, a3=80  //a3=80+102 == tmp2
 #APP
# 71 "atomic_test03.c" 1    //ret1 = atomic_fetch_add(i, v);
	amoadd.w.aqrl a2, a5, 0(sp) //a2=[v], [v]=[v]+i = 80 + 10
# 0 "" 2
# 71 "atomic_test03.c" 1    //ret1 = atomic_add_return(i, v);
	amoadd.w.aqrl a5, a5, 0(sp) //a5=[v], [v]=[v]+i = 90 + 10;
# 0 "" 2
 #NO_APP
	addiw	a5,a5,10        //a5=90, a5=a5+10 = 90+10 == ret1
	addw	a5,a5,a3        //a3=tmp2=182, a5=100  //a5=100+182 == tmp2

	addw	a4,a4,a2        //a4=tmp1=121, a2=ret1=80  //a4=121+80 == tmp1

	addw	a5,a5,a4        //a5=tmp2+tmp1 = 282+201 = 483
	addw	a0,a5,a0        //a0=a5+tmp3 = 483+3 = 486

	addi	sp,sp,16
	jr	    ra
	.size	main, .-main
	.ident	"GCC: (GNU) 7.2.0"
