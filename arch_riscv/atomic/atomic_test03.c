/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: atomic operation test
*/
//#include <stdio.h>

///include/linux/compiler-gcc.h
#define __always_inline inline __attribute__((always_inline))

///include/linux/types.h
typedef struct {
    int counter;
} atomic_t;

typedef struct {
    long counter;
} atomic64_t;

/**
static inline int atomic_fetch_add_(int i, atomic_t *v)
{
    ///amoadd.w  a, b, c
    ///a = b
    ///[c] = [c] + b
    ///return a

    __asm__ __volatile__ (
        "amo" "add" "." "w" " %1, %2, %0"
        : "+A" (v->counter), "=r" (ret)
        : "r" (i)
        : "memory");
}
*/

/*
 * Atomic ops that have ordered, relaxed, acquire, and relese variants.
 * There's two flavors of these: the arithmatic ops have both fetch and return
 * versions, while the logical ops only have fetch versions.
 */
#define ATOMIC_FETCH_OP(op, asm_op, I, asm_or, c_or, asm_type, c_type, prefix)				\
static __always_inline c_type atomic##prefix##_fetch_##op##c_or(c_type i, atomic##prefix##_t *v)	\
{													\
	register c_type ret;										\
	__asm__ __volatile__ (										\
		"amo" #asm_op "." #asm_type #asm_or " %1, %2, %0"					\
		: "+A" (v->counter), "=r" (ret)								\
		: "r" (I)										\
		: "memory");										\
	return ret;											\
}

#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, asm_type, c_type, prefix)			\
static __always_inline c_type atomic##prefix##_##op##_return##c_or(c_type i, atomic##prefix##_t *v)	\
{													\
        return atomic##prefix##_fetch_##op##c_or(i, v) c_op I;						\
}

#ifdef CONFIG_GENERIC_ATOMIC64
#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
        ATOMIC_FETCH_OP (op, asm_op,       I, asm_or, c_or, w,  int,   )	\
        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )
#else
#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
        ATOMIC_FETCH_OP (op, asm_op,       I, asm_or, c_or, w,  int,   )	\
        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
        ATOMIC_FETCH_OP (op, asm_op,       I, asm_or, c_or, d, long, 64)	\
        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, d, long, 64)
#endif

ATOMIC_OPS(add, add, +,  i,      , _relaxed)
ATOMIC_OPS(add, add, +,  i, .aq  , _acquire)
ATOMIC_OPS(add, add, +,  i, .rl  , _release)
ATOMIC_OPS(add, add, +,  i, .aqrl,         )

/**
    int atomic_fetch_add_relaxed(int i, atomic_t *v)
    int atomic_add_return_relaxed(int i, atomic_t *v)
    long atomic64_fetch_add_relaxed(long i, atomic64_t *v)
    long atomic64_add_return_relaxed(long i, atomic64_t *v)

    int atomic_fetch_add_acquire(int i, atomic_t *v)
    int atomic_add_return_acquire(int i, atomic_t *v)
    long atomic64_fetch_add_acquire(long i, atomic64_t *v)
    long atomic64_add_return_acquire(long i, atomic64_t *v)

    int atomic_fetch_add_release(int i, atomic_t *v)
    int atomic_add_return_release(int i, atomic_t *v)
    long atomic64_fetch_add_release(long i, atomic64_t *v)
    long atomic64_add_return_release(long i, atomic64_t *v)

    int atomic_fetch_add(int i, atomic_t *v)
    int atomic_add_return(int i, atomic_t *v)
    long atomic64_fetch_add(long i, atomic64_t *v)
    long atomic64_add_return(long i, atomic64_t *v)
*/

ATOMIC_OPS(sub, add, +, -i,      , _relaxed)
ATOMIC_OPS(sub, add, +, -i, .aq  , _acquire)
ATOMIC_OPS(sub, add, +, -i, .rl  , _release)
ATOMIC_OPS(sub, add, +, -i, .aqrl,         )

int main(void)
{
    int ret1, i = 10, tmp1=1, tmp2=2;
    atomic_t vt, *v=&vt;    ///int counter
    v->counter = 20;
    long ret2, j = 100, tmp3=3;
    atomic64_t wt, *w=&wt;  ///long counter
    w->counter = 200;

    ret1 = atomic_fetch_add_relaxed(i, v);      //amoadd.w
    tmp1 += ret1;                               ///ret1=20, tmp1=21
    //printf("ret1=%d, tmp1=%d\n", ret1, tmp1);
    ret1 = atomic_add_return_relaxed(i, v);     //amoadd.w
    tmp2 += ret1;                               ///ret1=40, tmp2=42
    //printf("ret1=%d, tmp2=%d\n", ret1, tmp2);

    ret2 = atomic64_fetch_add_relaxed(j, w);    //amoadd.d
    tmp3 += ret2;
    //printf("ret2=%d, tmp3=%d\n", ret2, tmp3);
    ret2 = atomic64_add_return_relaxed(j, w);   //amoadd.d
    tmp3 += ret2;
    //printf("ret2=%d, tmp3=%d\n", ret2, tmp3);

    ret1 = atomic_fetch_add_acquire(i, v);      //amoadd.w.aq
    tmp1 += ret1;                               ///ret1=40, tmp1=61
    //printf("ret1=%d, tmp1=%d\n", ret1, tmp1);
    ret1 = atomic_add_return_acquire(i, v);     //amoadd.w.aq
    tmp2 += ret1;                               ///ret1=60, tmp2=102
    //printf("ret1=%d, tmp2=%d\n", ret1, tmp2);

    ret1 = atomic_fetch_add_release(i, v);      //amoadd.w.rl
    tmp1 += ret1;                               ///ret1=60, tmp1=121
    //printf("ret1=%d, tmp1=%d\n", ret1, tmp1);
    ret1 = atomic_add_return_release(i, v);     //amoadd.w.rl
    tmp2 += ret1;                               ///ret1=80, tmp2=182
    //printf("ret1=%d, tmp2=%d\n", ret1, tmp2);

    ret1 = atomic_fetch_add(i, v);              //amoadd.w.aqrl
    tmp1 += ret1;                               ///ret1=80, tmp1=201
    //printf("ret1=%d, tmp1=%d\n", ret1, tmp1);
    ret1 = atomic_add_return(i, v);             //amoadd.w.aqrl
    tmp2 += ret1;                               ///ret1=100, tmp2=282
    //printf("ret1=%d, tmp2=%d\n", ret1, tmp2);

    tmp3 = tmp1 + tmp2 + tmp3;                  ///tmp3=486
    //printf("tmp3=%d\n", tmp3);

    return (int)tmp3;
}
