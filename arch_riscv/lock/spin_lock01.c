/**
    linux kernel source: arch/riscv/include/asm/spin_lock.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: spin_lock test
*/

///arch/riscv/include/asm/fence.h
#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"

///arch/riscv/include/asm/spinlock_types.h
typedef struct {
	volatile unsigned int lock;
} arch_spinlock_t;

static inline int arch_spin_trylock(arch_spinlock_t *lock)
{
	int tmp = 1, busy;

	///amoswap.w  rd, rs1, rs2
    ///lr.w rd, rs1             //rd = rs1
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 swap rd
                                ///rd = 0 or 1

	///amoswap.w  busy, tmp, (lock->lock)

	///amoswap.w  tmp, tmp, (lock->lock)
	///busy = tmp

	///amoswap.w  tmp, tmp, (lock->lock)
    ///1: tmp = tmp
    ///2: [lock->lock] = (lock->lock) swap tmp
    ///3: busy = tmp

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		RISCV_ACQUIRE_BARRIER
		: "=r" (busy), "+A" (lock->lock)
		: "r" (tmp)
		: "memory");

	return !busy;
}

int main(void)
{
    int busy;
    arch_spinlock_t *lock;

    busy = arch_spin_trylock(lock);

    return 0;
}
