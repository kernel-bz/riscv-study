/**
    file: mult.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: multiply operation test
*/

int main(void)
{
    long long i = 0;
    long long v = 10;           ///8Bytes(DoubleWord)
    float j = 0;
    float w = 100;              ///4Bytes(Word)
    long double k = 0;
    long double x = 1000;       ///16Bytes

    //printf("size: %d, %d, %d\n", sizeof(v), sizeof(w), sizeof(x));

    i++;
    v *= i;

    j++;
    w *= j;

    k++;
    x *= k;

    //printf("value: %d, %f, %Lf\n", v, w, x);

    return 0;
}
