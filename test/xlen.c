#include <stdio.h>
#include <stdlib.h>

#if __riscv_xlen == 64
#define XLEN 64
#else
#define XLEN 32
#endif

int main()
{
    printf("XLEN = %d\n", XLEN);
    return 0;
}
