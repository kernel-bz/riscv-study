/**
    linux kernel source: arch/riscv/include/asm/spinlock.h
    reference: https://godbolt.org/g/W199ef
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: write lock test
*/

#include "../include/spinlock.h"

arch_rwlock_t lock = (arch_rwlock_t)__ARCH_RW_LOCK_UNLOCKED;

int main(void)
{
    arch_write_lock(&lock);

    ///do something...

    arch_write_unlock(&lock);

    return 0;
}
