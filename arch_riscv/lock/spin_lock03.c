/**
    linux kernel source: arch/riscv/include/asm/spinlock.h
    reference: https://godbolt.org/g/W199ef
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: spinlock test
*/

int lock = 0;

void spinlock(void)
{
    while (*(volatile int *)&lock == 1) {};
    lock = 1;
    ///printf("lock=%d\n", lock);
}

void func2(void)
{
    while (lock == 1) {};
    lock = 1;
    ///printf("lock=%d\n", lock);
}

int main(void)
{
    spinlock();
    func2();

    return 0;
}
