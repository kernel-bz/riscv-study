/**
    file: add.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: add operation test
*/

int main(void)
{
    int i = 10;
    int v = 0;              ///4bytes
    long double j = 100;
    long double w = 0;      ///16bytes

    ///printf("size: %d, %d\n", sizeof(v), sizeof(w));

    i++;
    v += i;

    j++;
    w += j;

    return 0;
}
