/**
    file: arch/riscv/include/asm/atomic.h
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
    __asm__ __volatile__ (
        "amo" "add" "." "w" " zero, %1, %0"
        : "+A" (v->counter)
        : "r" (i)
        : "memory");
}
*/

/*
 * First, the atomic ops that have no ordering constraints and therefor don't
 * have the AQ or RL bits set.  These don't return anything, so there's only
 * one version to worry about.
 */
#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)                              \
static __always_inline void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)      \
{                                                                                       \
        __asm__ __volatile__ (                                                          \
                "amo" #asm_op "." #asm_type " zero, %1, %0"                             \
                : "+A" (v->counter)                                                     \
                : "r" (I)                                                               \
                : "memory");                                                            \
}

#ifdef CONFIG_GENERIC_ATOMIC64
#define ATOMIC_OPS(op, asm_op, I)                   \
        ATOMIC_OP (op, asm_op, I, w,  int,   )
#else
#define ATOMIC_OPS(op, asm_op, I)                   \
        ATOMIC_OP (op, asm_op, I, w,  int,   )      \
        ATOMIC_OP (op, asm_op, I, d, long, 64)
#endif

ATOMIC_OPS(add, add,  i)
ATOMIC_OPS(sub, add, -i)
ATOMIC_OPS(and, and,  i)
ATOMIC_OPS( or,  or,  i)
ATOMIC_OPS(xor, xor,  i)

#define atomic_inc(v)   atomic_add(1, v)
#define atomic_dec(v)   atomic_sub(1, v)

int main(void)
{
    int i = 0;
    atomic_t *v;
    long j = 0;
    atomic64_t *w;

    atomic_inc(v);
    atomic_add(i, v);
    atomic64_add(j, w);

    /**
    atomic_add(i, v);
    atomic_sub(i, v);
    atomic_and(i, v);
    atomic_or(i, v);
    atomic_xor(i, v);

    atomic64_add(j, w);
    atomic64_sub(j, w);
    atomic64_and(j, w);
    atomic64_or(j, w);
    atomic64_xor(j, w);
    */

    return 0;
}
