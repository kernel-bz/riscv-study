/**
    linux kernel source: arch/riscv/include/asm/spinlock.h
    editted by: Jung-JaeJoon <rgbi3307@nate.com> on the www.kernel.bz
    function: spin_lock test
*/

typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;

///include/linux/compiler_types.h
# define __user		__attribute__((noderef, address_space(1)))
# define __kernel	__attribute__((address_space(0)))
# define __safe		__attribute__((safe))
# define __force	__attribute__((force))
# define __nocast	__attribute__((nocast))
# define __iomem	__attribute__((noderef, address_space(2)))
# define __must_hold(x)	__attribute__((context(x,1,1)))
# define __acquires(x)	__attribute__((context(x,0,1)))
# define __releases(x)	__attribute__((context(x,1,0)))
# define __acquire(x)	__context__(x,1)
# define __release(x)	__context__(x,-1)
# define __cond_lock(x,c)	((c) ? ({ __acquire(x); 1; }) : 0)
# define __percpu	__attribute__((noderef, address_space(3)))
# define __rcu		__attribute__((noderef, address_space(4)))
# define __private	__attribute__((noderef))

///arch/riscv/include/asm/fence.h
#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"

///arch/riscv/include/asm/spinlock_types.h
typedef struct {
	volatile unsigned int lock;
} arch_spinlock_t;

#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }

typedef struct {
	volatile unsigned int lock;
} arch_rwlock_t;

#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }


///include/linux/compiler-gcc.h
#define barrier() __asm__ __volatile__("": : :"memory")
#define __always_inline inline __attribute__((always_inline))

///include/linux/compiler.h
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

# define __no_kasan_or_inline __always_inline
static __no_kasan_or_inline
void __read_once_size_nocheck(const volatile void *p, void *res, int size)
{
	__READ_ONCE_SIZE;
}

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


/* Compile time object size, -1 for unknown */
#ifndef __compiletime_object_size
# define __compiletime_object_size(obj) -1
#endif
#ifndef __compiletime_warning
# define __compiletime_warning(message)
#endif
#ifndef __compiletime_error
# define __compiletime_error(message)
/*
 * Sparse complains of variable sized arrays due to the temporary variable in
 * __compiletime_assert. Unfortunately we can't just expand it out to make
 * sparse see a constant array size without breaking compiletime_assert on old
 * versions of GCC (e.g. 4.2.4), so hide the array from sparse altogether.
 */
# ifndef __CHECKER__
#  define __compiletime_error_fallback(condition) \
	do { ((void)sizeof(char[1 - 2 * condition])); } while (0)
# endif
#endif
#ifndef __compiletime_error_fallback
# define __compiletime_error_fallback(condition) do { } while (0)
#endif

#ifdef __OPTIMIZE__
# define __compiletime_assert(condition, msg, prefix, suffix)		\
	do {								\
		bool __cond = !(condition);				\
		extern void prefix ## suffix(void) __compiletime_error(msg); \
		if (__cond)						\
			prefix ## suffix();				\
		__compiletime_error_fallback(__cond);			\
	} while (0)
#else
# define __compiletime_assert(condition, msg, prefix, suffix) do { } while (0)
#endif

#define _compiletime_assert(condition, msg, prefix, suffix) \
	__compiletime_assert(condition, msg, prefix, suffix)

/**
 * compiletime_assert - break build and emit msg if condition is false
 * @condition: a compile-time constant condition to check
 * @msg:       a message to emit if condition is false
 *
 * In tradition of POSIX assert, this macro will break the build if the
 * supplied condition is *false*, emitting the supplied error message if the
 * compiler has support to do so.
 */
#define compiletime_assert(condition, msg) \
	_compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)

#define compiletime_assert_atomic_type(t)				\
	compiletime_assert(__native_word(t),				\
		"Need native word sized stores/loads for atomicity.")


///include/asm-generic/barrier.h
#ifndef read_barrier_depends
#define read_barrier_depends()		do { } while (0)
#endif

#ifndef __smp_read_barrier_depends
#define __smp_read_barrier_depends()	read_barrier_depends()
#endif

#ifndef smp_read_barrier_depends
#define smp_read_barrier_depends()	__smp_read_barrier_depends()
#endif

#define __READ_ONCE(x, check)						        \
({									                        \
	union { typeof(x) __val; char __c[1]; } __u;	        \
	if (check)							                    \
		__read_once_size(&(x), __u.__c, sizeof(x));		    \
	else								                    \
		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	\
	smp_read_barrier_depends(); /* Enforce dependency ordering from x */ \
	__u.__val;							                    \
})
#define READ_ONCE(x) __READ_ONCE(x, 1)


///arch/riscv/include/asm/barrier.h
#define nop()		__asm__ __volatile__ ("nop")

#define RISCV_FENCE(p, s) \
	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

/* These barriers need to enforce ordering on both devices or memory. */
#define mb()		RISCV_FENCE(iorw,iorw)
#define rmb()		RISCV_FENCE(ir,ir)
#define wmb()		RISCV_FENCE(ow,ow)

/* These barriers do not need to enforce ordering on devices, just memory. */
#define __smp_mb()	RISCV_FENCE(rw,rw)
#define __smp_rmb()	RISCV_FENCE(r,r)
#define __smp_wmb()	RISCV_FENCE(w,w)

#define __smp_store_release(p, v)					\
do {									\
	compiletime_assert_atomic_type(*p);				\
	RISCV_FENCE(rw,w);						\
	WRITE_ONCE(*p, v);						\
} while (0)

#define __smp_load_acquire(p)						\
({									\
	typeof(*p) ___p1 = READ_ONCE(*p);				\
	compiletime_assert_atomic_type(*p);				\
	RISCV_FENCE(r,rw);						\
	___p1;								\
})

#ifndef smp_store_release
#define smp_store_release(p, v) __smp_store_release(p, v)
#endif


#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)

static inline void arch_spin_unlock(arch_spinlock_t *lock)
{
    ///amoswap.w  x0, x0, lock->lock
	smp_store_release(&lock->lock, 0);
}

static inline int arch_spin_trylock(arch_spinlock_t *lock)
{
	int tmp = 1, busy;

	///amoswap.w  rd, rs1, rs2
    ///1: rd = [rs2]
    ///2: [rs2] = rs1
    ///3: rs1 = rd

    ///amoswap.w  busy, tmp, lock
    ///busy = [lock]
    ///[lock] = tmp
    ///tmp = busy

	__asm__ __volatile__ (
		"	amoswap.w %0, %2, %1\n"
		RISCV_ACQUIRE_BARRIER
		: "=r" (busy), "+A" (lock->lock)
		: "r" (tmp)
		: "memory");

	return !busy;
}

static inline void arch_spin_lock(arch_spinlock_t *lock)
{
	while (1) {
		if (arch_spin_is_locked(lock))      ///if(lock->lock)
			continue;

		if (arch_spin_trylock(lock))        ///if(!busy) //(!lock)
			break;
	}
}

int main(void)
{
    int busy;
    arch_spinlock_t lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;

    arch_spin_lock(&lock);

    ///Critical Section

    arch_spin_unlock(&lock);

    return 0;
}
