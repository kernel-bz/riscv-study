/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: atomic operation test
*/

#define smp_read_barrier_depends()      do { } while (0)

int main(void)
{
    smp_read_barrier_depends();

    return 0;
}
