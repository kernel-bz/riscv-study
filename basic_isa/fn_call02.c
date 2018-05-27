/**
    file: fn_call.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: function call test
*/

void swap(int *a, int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}

int main(void)
{
    int a = 10;
    int b = 20;

    swap(&a, &b);

    //printf("a=%d, b=%d\n", a, b);

    return 0;
}
