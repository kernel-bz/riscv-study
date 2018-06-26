# 1 "spin_lock03.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "spin_lock03.c"







int lock = 0;

void spinlock(void)
{
    while (*(volatile int *)&lock == 1) {};
    lock = 1;

}

void func2(void)
{
    while (lock == 1) {};
    lock = 1;

}

int main(void)
{
    spinlock();
    func2();

    return 0;
}
