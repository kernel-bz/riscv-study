# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"






static void atomic_add(int a, int b)
{
# 18 "test.c"
    __asm__ __volatile__ (
        "amo" "add" "." "w" " zero, %1, %0"
        : "+A" (b)
        : "r" (a)
        : "memory");
}

static void atomic_swap(int a, int b)
{
# 39 "test.c"
 __asm__ __volatile__ (
  "	amoswap.w %0, %2, %1\n"
  : "=r" (a), "+A" (b)
  : "r" (a)
  : "memory");
}

static void atomic_swap2(int *a, int *b)
{
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
