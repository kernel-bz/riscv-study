/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
*/

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
static inline void atomic_add(int i, atomic_t *v)
{
    ///amoadd.w  rd, rs1, rs2

	///amoadd.w  zero, i, v
	///lr.w rd, rs1             //x0 = i
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 + rd = v + i
                                ///rd = 0 or 1
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

ATOMIC_OPS(sub, add, +, -i,      , _relaxed)
ATOMIC_OPS(sub, add, +, -i, .aq  , _acquire)
ATOMIC_OPS(sub, add, +, -i, .rl  , _release)
ATOMIC_OPS(sub, add, +, -i, .aqrl,         )

int main(void)
{
    int i = 10;
    atomic_t *v;    ///int counter
    v->counter = 20;
    long j = 100;
    atomic64_t *w;  ///long counter
    w->counter = 200;

    atomic_fetch_add(i, v);
    atomic64_fetch_add(j, w);


    return 0;
}
