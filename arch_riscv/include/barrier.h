/**
    linux kernel source: arch/riscv/include/asm/barrier.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
*/

#ifndef _ASM_RISCV_BARRIER_H
#define _ASM_RISCV_BARRIER_H

///include/asm-generic/barrier.h
#ifndef read_barrier_depends
#define read_barrier_depends()		do { } while (0)
#endif

#ifndef __smp_read_barrier_depends
#define __smp_read_barrier_depends()	read_barrier_depends()
#endif

#ifndef smp_read_barrier_depends
#define smp_read_barrier_depends()	__smp_read_barrier_depends()
#endif

///arch/riscv/include/asm/barrier.h
#define nop()		__asm__ __volatile__ ("nop")

#define RISCV_FENCE(p, s) \
	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

/* These barriers need to enforce ordering on both devices or memory. */
#define mb()		RISCV_FENCE(iorw,iorw)
#define rmb()		RISCV_FENCE(ir,ir)
#define wmb()		RISCV_FENCE(ow,ow)

/* These barriers do not need to enforce ordering on devices, just memory. */
#define __smp_mb()	RISCV_FENCE(rw,rw)
#define __smp_rmb()	RISCV_FENCE(r,r)
#define __smp_wmb()	RISCV_FENCE(w,w)

#define __smp_store_release(p, v)					\
do {									\
	compiletime_assert_atomic_type(*p);				\
	RISCV_FENCE(rw,w);						\
	WRITE_ONCE(*p, v);						\
} while (0)

#define __smp_load_acquire(p)						\
({									\
	typeof(*p) ___p1 = READ_ONCE(*p);				\
	compiletime_assert_atomic_type(*p);				\
	RISCV_FENCE(r,rw);						\
	___p1;								\
})

#ifndef smp_store_release
#define smp_store_release(p, v) __smp_store_release(p, v)
#endif


///arch/riscv/include/asm/fence.h
#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"


#endif // _ASM_RISCV_BARRIER_H

