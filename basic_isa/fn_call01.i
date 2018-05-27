# 1 "fn_call01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fn_call01.c"






void fn0(int a, int b)
{
    int c;
    c = a + b;
}

int fn1(int a, int b)
{
    int c;
    c = a + b;
    return c;
}

int main(void)
{
    int a = 10;
    int b = 20;
    int c;

    fn0(a, b);
    c = fn1(a, b);



    return 0;
}
