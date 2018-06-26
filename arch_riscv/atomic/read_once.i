# 1 "read_once.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "read_once.c"
# 10 "read_once.c"
typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;
# 56 "read_once.c"
static inline __attribute__((always_inline))
void __read_once_size(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}

static inline __attribute__((always_inline))
void __read_once_size_nocheck(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}
# 87 "read_once.c"
int main(void)
{
    int v = 10, w, x=0;

    w = ({ union { typeof(v) __val; char __c[1]; } __u; if (1) __read_once_size(&(v), __u.__c, sizeof(v)); else __read_once_size_nocheck(&(v), __u.__c, sizeof(v)); do { } while (0); __u.__val; });
    if (w > 0)
        x = 1;
    else
        x = -1;

    return x;
}
