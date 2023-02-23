#include <stdio.h>

int calc(const int a)
{
        int c = 10;

        if (a == 1)
                c = 10;
        else if (a == 5)
                c = 50;
        else if (a == 10)
                c = 100;
        else if (a == 20)
                c = 200;
        else 
                c = 300;

        c += a;

        return c;
}

int main()
{
        int c;

        c = calc(10);
        printf("%d\n", c);

        return 0;
}

