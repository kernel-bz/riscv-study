/**
    linux kernel source: include/linux/compiler.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: barrier, fence test
*/
///#include <stdio.h>

int A, B;

void foo(void)
{
    A = B + 1;
    B = 5;
}

int main(void)
{
    foo();
    ///printf("A=%d, B=%d\n", A, B);   ///A==1. B==5  or A==6, B==5

    return 0;
}
