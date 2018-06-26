# 1 "cpu_relax.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "cpu_relax.c"
# 9 "cpu_relax.c"
static inline void cpu_relax(void)
{

 int dummy;

 __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));

 __asm__ __volatile__("": : :"memory");
}

int main()
{
    cpu_relax();

    return 0;
}
