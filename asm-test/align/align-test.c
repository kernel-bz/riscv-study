
#include <stdio.h>

int main()
{
        int a, size;

        a = __alignof__(long long);
        size = sizeof(long long);

        printf("a=%d, size=%d\n", a, size);

        a = __alignof__(int);
        size = sizeof(int);

        printf("a=%d, size=%d\n", a, size);

        a = __alignof__(short);
        size = sizeof(short);

        printf("a=%d, size=%d\n", a, size);

        return 0;
}
