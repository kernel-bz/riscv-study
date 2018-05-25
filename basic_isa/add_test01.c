/**
    file: add_func.c
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    riscv isa: add function test
*/

int main(void)
{
    int i = 10;
    int v = 0;      ///32bit(4Bytes):  Word
    long j = 100;
    long w = 0;     ///64bits(8Bytes): DoubleWord

    i++;
    v += i;

    j++;
    w += j;

    return 0;
}
