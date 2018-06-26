/**
    linux kernel source: arch/riscv/include/asm/atomic.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: atomic operation test
*/

static void atomic_add(int a, int b)
{
    ///amoadd.w  rd, rs1, rs2
    ///lr.w rd, rs1             //rd = rs1
    ///sc.w rd, rs1, rs2        //[rs2] = rs2 add rs1
                                ///rd = 0(OK) or 1(FAIL)
	///amoadd.w  zero, a, b
    ///[b] = [b] + a

    __asm__ __volatile__ (
        "amo" "add" "." "w" " zero, %1, %0"
        : "+A" (b)
        : "r" (a)
        : "memory");
}

static void atomic_swap(int a, int b)
{
    ///amoswap.w  a, a, b
    ///amoswap.w  rd, rs1, rs2
    ///1: rd = [rs2]
    ///2: [rs2] = rs1
    ///3: rs1 = rd

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		: "=r" (a), "+A" (b)
		: "r" (a)
		: "memory");

	///a++;
}

static void atomic_swap2(int *a, int *b)
{
    ///amoswap.w  *a, *a, *b
    ///amoswap.w  rd, rs1, rs2
    ///1: rd = [rs2]
    ///2: [rs2] = rs1
    ///3: rs1 = rd

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		: "=r" (*a), "+A" (*b)
		: "r" (*a)
		: "memory");
}

int main(void)
{
    int a=10, b=20;

    atomic_add(a, b);
    atomic_swap(a, b);
    atomic_swap2(&a, &b);

    return 0;
}
