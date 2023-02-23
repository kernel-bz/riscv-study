#include <stdio.h>

int main()
{
        long timeout = 0;

        //bnez
        timeout = timeout ?: 1;

        printf("%ld", timeout);

        return 0;
}
