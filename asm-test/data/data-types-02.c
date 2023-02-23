#include <stdio.h>

char gA;
int gB;
long gC;


int main()
{
        gA = 10;
        gB = 20;
        gC = gA + gB;

        printf("%ld\n", gC);

        return 0;
}
