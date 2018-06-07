# 1 "atomic_test03.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomic_test03.c"






static void swap(int a, int b, int c)
{
 c = a;
 a = b;
 b = c;
}

static void swap2(int a, int b, int c)
{
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
