/**
    linux kernel source: arch/riscv/include/asm/cacheflush.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: cache test
              objdump -d -t -r a.out

    Refer:
    https://patchwork.kernel.org/patch/10067051/
    Signed-off-by: Andrew Waterman <andrew@sifive.com>
    Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
    ---
     arch/riscv/include/asm/cacheflush.h    |  6 ++++++
     arch/riscv/include/asm/vdso-syscalls.h | 28 ++++++++++++++++++++++++++++
     arch/riscv/include/asm/vdso.h          |  4 ++++
     arch/riscv/kernel/sys_riscv.c          | 32 ++++++++++++++++++++++++++++++++
     arch/riscv/kernel/syscall_table.c      |  2 ++
     arch/riscv/kernel/vdso/Makefile        |  1 +
     arch/riscv/kernel/vdso/flush_icache.S  | 31 +++++++++++++++++++++++++++++++
     arch/riscv/kernel/vdso/vdso.lds.S      |  1 +
     8 files changed, 105 insertions(+)
     create mode 100644 arch/riscv/include/asm/vdso-syscalls.h
     create mode 100644 arch/riscv/kernel/vdso/flush_icache.S
*/

///arch/riscv/include/asm/sbi.h
#include "../include/sbi.h"

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
