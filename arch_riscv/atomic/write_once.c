/**
    linux kernel source: include/linux/compiler.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: WRITE_ONCE test
*/

typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;

# define __force        __attribute__((force))

#ifdef CONFIG_KASAN
/*
 * We can't declare function 'inline' because __no_sanitize_address confilcts
 * with inlining. Attempt to inline it may cause a build failure.
 * 	https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67368
 * '__maybe_unused' allows us to avoid defined-but-not-used warnings.
 */
# define __no_kasan_or_inline __no_sanitize_address __maybe_unused
#else
# define __no_kasan_or_inline __always_inline
#endif

#ifndef smp_read_barrier_depends
#define smp_read_barrier_depends()      do { } while (0)
#endif

///include/linux/compiler-gcc.h
#define barrier() __asm__ __volatile__("": : :"memory")
#define __always_inline inline __attribute__((always_inline))

static __always_inline void __write_once_size(volatile void *p, void *res, int size)
{
	switch (size) {
	case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
	case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
	case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
	case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
	default:
		barrier();
		__builtin_memcpy((void *)p, (const void *)res, size);
		barrier();
	}
}

#define WRITE_ONCE(x, val) \
({							\
	union { typeof(x) __val; char __c[1]; } __u =	\
		{ .__val = (__force typeof(x)) (val) }; \
	__write_once_size(&(x), __u.__c, sizeof(x));	\
	__u.__val;					\
})

int main(void)
{
    int v, w, x=0;

    w = WRITE_ONCE(v, 10);
    if (w > 0)
        x = 1;
    else
        x = -1;

    return x;
}
