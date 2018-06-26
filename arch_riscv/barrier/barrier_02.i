# 1 "barrier_02.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "barrier_02.c"
# 10 "barrier_02.c"
int A, B;

void foo(void)
{
    A = B + 1;
    __asm__ __volatile__("": : :"memory");
    B = 5;
}

int main(void)
{
    foo();


    return 0;
}
