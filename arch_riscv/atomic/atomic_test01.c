/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: atomic operation test
*/

static void atomic_add(int a, int b)
{
    ///amoadd.w  rd, rs1, rs2
    ///lr.w rd, rs1             //rd = rs1
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 add rd
                                ///rd = 0 or 1

	///amoadd.w  zero, a, b
	///lr.w rd, rs1             //x0 = a
    ///sc.w rd, rs1, rs2        //[b] = b + a
                                ///rd = 0 or 1
    __asm__ __volatile__ (
        "amo" "add" "." "w" " zero, %1, %0"
        : "+A" (b)
        : "r" (a)
        : "memory");
}

static void atomic_swap(int a, int b)
{
    ///amoswap.w  rd, rs1, rs2
    ///lr.w rd, rs1             //rd = rs1
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 swap rd
                                ///rd = 0 or 1

    ///amoswap.w  a, a, b

    ///amoswap.w  a, a, b
    ///1: a = a
    ///2: [b] = b swap a
    ///3: a = b

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		: "=r" (a), "+A" (b)
		: "r" (a)
		: "memory");
}

int main(void)
{
    int a=10, b=20;

    atomic_add(a, b);
    atomic_swap(a, b);

    return 0;
}
