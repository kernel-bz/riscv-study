/**
    linux kernel source: include/linux/compiler.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: barrier, fence test
*/
///#include <stdio.h>

#define barrier() __asm__ __volatile__("": : :"memory")

///arch/riscv/include/asm/fence.h
#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"

///arch/riscv/include/asm/barrier.h
#define nop()		__asm__ __volatile__ ("nop")

#define RISCV_FENCE(p, s) \
	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

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

int A, B;

void foo(void)
{
    A = B + 1;
    RISCV_FENCE(r,rw);
    B = 5;
}

int main(void)
{
    foo();
    ///printf("A=%d, B=%d\n", A, B);   ///A==1. B==5  or A==6, B==5

    return 0;
}
