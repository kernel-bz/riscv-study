/**
    linux kernel source: arch/riscv/include/asm/cacheflush.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: cache test
*/

///arch/riscv/include/asm/sbi.h
#include "sbi.h"

#define CONFIG_SMP

///arch/riscv/include/asm/cacheflush.h
static inline void local_flush_icache_all(void)
{
	asm volatile ("fence.i" ::: "memory");
}

#ifndef CONFIG_SMP

#define flush_icache_all() local_flush_icache_all()
#define flush_icache_mm(mm, local) flush_icache_all()

#else /* CONFIG_SMP */

#define flush_icache_all() sbi_remote_fence_i(0)
///arch/riscv/kernel/smp.c
///void flush_icache_mm(struct mm_struct *mm, bool local);

#endif /* CONFIG_SMP */


int main(void)
{
    local_flush_icache_all();   ///fence.i

    flush_icache_all();         ///SBI_CALL_1(SBI_REMOTE_FENCE_I, hart_mask); ///(5, 0)

    return 0;
}
