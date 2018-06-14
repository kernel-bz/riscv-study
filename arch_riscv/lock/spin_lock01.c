/**
    linux kernel source: arch/riscv/include/asm/spinlock.h
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
    ///1: rd = [rs2]
    ///2: [rs2] = rs1
    ///3: rs1 = rd

    ///amoswap.w  busy, tmp, lock
    ///busy = [lock]
    ///[lock] = tmp
    ///tmp = busy

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
    int busy, ok;
    arch_spinlock_t lock;
    lock.lock = 0;

    busy = arch_spin_trylock(&lock);

    ok = (busy) ? 1 : 0;

    return ok;
}
