# 1 "write_once.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "write_once.c"






typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;
# 41 "write_once.c"
static inline __attribute__((always_inline)) void __write_once_size(volatile void *p, void *res, int size)
{
 switch (size) {
 case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
 case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
 case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
 case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
 default:
  __asm__ __volatile__("": : :"memory");
  __builtin_memcpy((void *)p, (const void *)res, size);
  __asm__ __volatile__("": : :"memory");
 }
}
# 63 "write_once.c"
int main(void)
{
    int v, w, x=0;

    w = ({ union { typeof(v) __val; char __c[1]; } __u = { .__val = (__attribute__((force)) typeof(v)) (10) }; __write_once_size(&(v), __u.__c, sizeof(v)); __u.__val; });
    if (w > 0)
        x = 1;
    else
        x = -1;

    return x;
}
