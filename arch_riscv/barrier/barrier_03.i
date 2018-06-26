# 1 "barrier_03.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "barrier_03.c"
# 35 "barrier_03.c"
int A, B;

void foo(void)
{
    A = B + 1;
    __asm__ __volatile__ ("fence " "r" "," "rw" : : : "memory");
    B = 5;
}

int main(void)
{
    foo();


    return 0;
}
