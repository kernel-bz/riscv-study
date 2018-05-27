/**
    file: fn_call.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: function call test
*/

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

    //printf("c=%d\n", c);

    return 0;
}
