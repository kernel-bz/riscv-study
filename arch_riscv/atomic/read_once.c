/**
    linux kernel source: include/linux/compiler.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: READ_ONCE test
*/

///linux kernel v3.7
///#define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))

typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;

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

#define __READ_ONCE_SIZE						                \
({									                            \
	switch (size) {							                    \
	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;		    \
	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;		\
	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;		\
	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;		\
	default:							                        \
		barrier();						                        \
		__builtin_memcpy((void *)res, (const void *)p, size);	\
		barrier();						                        \
	}								                            \
})

static __always_inline
void __read_once_size(const volatile void *p, void *res, int size)
{
	__READ_ONCE_SIZE;
}

static __no_kasan_or_inline
void __read_once_size_nocheck(const volatile void *p, void *res, int size)
{
	__READ_ONCE_SIZE;
}

#define __READ_ONCE(x, check)						                        \
({									                                        \
	union { typeof(x) __val; char __c[1]; } __u;	                        \
	if (check)							                                    \
		__read_once_size(&(x), __u.__c, sizeof(x));	                        \
	else								                                    \
		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	                \
	smp_read_barrier_depends(); /* Enforce dependency ordering from x */    \
	__u.__val;							                                    \
})
#define READ_ONCE(x) __READ_ONCE(x, 1)

/*
 * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need
 * to hide memory access from KASAN.
 */
#define READ_ONCE_NOCHECK(x) __READ_ONCE(x, 0)


int main(void)
{
    int v = 10, w, x=0;

    w = READ_ONCE(v);
    if (w > 0)
        x = 1;
    else
        x = -1;

    return x;
}
