# 1 "cache_test01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "cache_test01.c"







# 1 "sbi.h" 1
# 18 "sbi.h"
typedef unsigned long __u64;
typedef unsigned long uintptr_t;
typedef __u64 uint64_t;
# 49 "sbi.h"
static inline void sbi_console_putchar(int ch)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(ch); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(1); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline int sbi_console_getchar(void)
{
 return ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(0); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(2); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_set_timer(uint64_t stime_value)
{



 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(stime_value); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(0); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });

}

static inline void sbi_shutdown(void)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(0); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(8); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_clear_ipi(void)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(0); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(3); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_send_ipi(const unsigned long *hart_mask)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(hart_mask); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(4); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_remote_fence_i(const unsigned long *hart_mask)
{
 ({
    register uintptr_t a0 asm ("a0") = (uintptr_t)(hart_mask);
    register uintptr_t a1 asm ("a1") = (uintptr_t)(0);
    register uintptr_t a2 asm ("a2") = (uintptr_t)(0);
    register uintptr_t a7 asm ("a7") = (uintptr_t)(5);
    asm volatile ("ecall"
        : "+r" (a0)
        : "r" (a1), "r" (a2), "r" (a7)
        : "memory");
    a0; });
}

static inline void sbi_remote_sfence_vma(const unsigned long *hart_mask,
      unsigned long start,
      unsigned long size)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(hart_mask); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(6); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
           unsigned long start,
           unsigned long size,
           unsigned long asid)
{
 ({ register uintptr_t a0 asm ("a0") = (uintptr_t)(hart_mask); register uintptr_t a1 asm ("a1") = (uintptr_t)(0); register uintptr_t a2 asm ("a2") = (uintptr_t)(0); register uintptr_t a7 asm ("a7") = (uintptr_t)(7); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}
# 9 "cache_test01.c" 2




static inline void local_flush_icache_all(void)
{
 asm volatile ("fence.i" ::: "memory");
}
# 32 "cache_test01.c"
int main(void)
{
    local_flush_icache_all();

    sbi_remote_fence_i(0);

    return 0;
}
