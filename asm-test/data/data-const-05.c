#include <stdio.h>

int calc(const int a)
{
        int c = 10;

        switch (a) {
                case 1:
                        c = 10;
                        break;
                case 5:
                        c = 50;
                        break;
                case 10:
                        c = 100;
                        break;
                case 20:
                        c = 200;
                        break;
                default:
                        c = 300;
        }

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

