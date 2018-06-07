/**
    file: mult.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: multiply operation test
*/

int main(void)
{
    int i = 0;
    int v = 10;          ///4Bytes(Word)
    float j = 0;
    float w = 100;       ///4Bytes(Word)
    double k = 0;
    double x = 1000;     ///8Bytes(DoubleWord)

    //printf("size: %d, %d, %d\n", sizeof(v), sizeof(w), sizeof(x));

    i++;
    v *= i;

    j++;
    w *= j;

    k++;
    x *= k;

    //printf("value: %d, %f, %f\n", v, w, x);

    return 0;
}
