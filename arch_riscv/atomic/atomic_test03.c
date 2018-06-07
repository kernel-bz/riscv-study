/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: amoswap test
*/

static void swap(int a, int b, int c)
{
	c = a;
	a = b;
	b = c;
}

static void swap2(int a, int b, int c)
{
    ///amoswap.w  rd, rs1, rs2
    ///lr.w rd, rs1             //rd = rs1
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 swap rd
                                ///rd = 0 or 1

    ///amoswap.w  a, b, c

    ///amoswap.w  b, b, c
    ///1: b = b
    ///2: [c] = c swap b
    ///3: a = b

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		: "=r" (a), "+A" (c)
		: "r" (b)
		: "memory");
}

int main(void)
{
    int a=10, b=20, c=30;

    swap(a, b, c);
    swap2(a, b, c);

    return 0;
}
