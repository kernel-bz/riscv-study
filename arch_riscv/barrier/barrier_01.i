# 1 "barrier_01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "barrier_01.c"







int A, B;

void foo(void)
{
    A = B + 1;
    B = 5;
}

int main(void)
{
    foo();


    return 0;
}
