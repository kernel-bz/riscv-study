# 1 "spin_lock04.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "spin_lock04.c"







# 1 "../include/spinlock.h" 1
# 24 "../include/spinlock.h"
# 1 "../include/compiler_types.h" 1
# 9 "../include/compiler_types.h"
typedef _Bool bool;

typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;
# 62 "../include/compiler_types.h"
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
# 25 "../include/spinlock.h" 2
# 1 "../include/barrier.h" 1
# 26 "../include/spinlock.h" 2


# 1 "../include/spinlock_types.h" 1
# 21 "../include/spinlock_types.h"
typedef struct {
 volatile unsigned int lock;
} arch_spinlock_t;



typedef struct {
 volatile unsigned int lock;
} arch_rwlock_t;
# 29 "../include/spinlock.h" 2
# 38 "../include/spinlock.h"
static inline void arch_spin_unlock(arch_spinlock_t *lock)
{
 do { do { } while (0); __asm__ __volatile__ ("fence " "rw" "," "w" : : : "memory"); ({ union { typeof(*&lock->lock) __val; char __c[1]; } __u = { .__val = (__attribute__((force)) typeof(*&lock->lock)) (0) }; __write_once_size(&(*&lock->lock), __u.__c, sizeof(*&lock->lock)); __u.__val; }); } while (0);
}

static inline int arch_spin_trylock(arch_spinlock_t *lock)
{
 int tmp = 1, busy;

 __asm__ __volatile__ (
  "	amoswap.w %0, %2, %1\n"
  "\tfence r , rw\n"
  : "=r" (busy), "+A" (lock->lock)
  : "r" (tmp)
  : "memory");

 return !busy;
}

static inline void arch_spin_lock(arch_spinlock_t *lock)
{
 while (1) {
  if ((({ union { typeof((lock)->lock) __val; char __c[1]; } __u; if (1) __read_once_size(&((lock)->lock), __u.__c, sizeof((lock)->lock)); else __read_once_size_nocheck(&((lock)->lock), __u.__c, sizeof((lock)->lock)); do { } while (0); __u.__val; }) != 0))
   continue;

  if (arch_spin_trylock(lock))
   break;
 }
}



static inline void arch_read_lock(arch_rwlock_t *lock)
{
 int tmp;

 __asm__ __volatile__(
  "1:	lr.w	%1, %0\n"
  "	bltz	%1, 1b\n"
  "	addi	%1, %1, 1\n"
  "	sc.w	%1, %1, %0\n"
  "	bnez	%1, 1b\n"
  "\tfence r , rw\n"
  : "+A" (lock->lock), "=&r" (tmp)
  :: "memory");
}

static inline void arch_write_lock(arch_rwlock_t *lock)
{
 int tmp;

 __asm__ __volatile__(
  "1:	lr.w	%1, %0\n"
  "	bnez	%1, 1b\n"
  "	li	%1, -1\n"
  "	sc.w	%1, %1, %0\n"
  "	bnez	%1, 1b\n"
  "\tfence r , rw\n"
  : "+A" (lock->lock), "=&r" (tmp)
  :: "memory");
}

static inline int arch_read_trylock(arch_rwlock_t *lock)
{
 int busy;

 __asm__ __volatile__(
  "1:	lr.w	%1, %0\n"
  "	bltz	%1, 1f\n"
  "	addi	%1, %1, 1\n"
  "	sc.w	%1, %1, %0\n"
  "	bnez	%1, 1b\n"
  "\tfence r , rw\n"
  "1:\n"
  : "+A" (lock->lock), "=&r" (busy)
  :: "memory");

 return !busy;
}

static inline int arch_write_trylock(arch_rwlock_t *lock)
{
 int busy;

 __asm__ __volatile__(
  "1:	lr.w	%1, %0\n"
  "	bnez	%1, 1f\n"
  "	li	%1, -1\n"
  "	sc.w	%1, %1, %0\n"
  "	bnez	%1, 1b\n"
  "\tfence r , rw\n"
  "1:\n"
  : "+A" (lock->lock), "=&r" (busy)
  :: "memory");

 return !busy;
}

static inline void arch_read_unlock(arch_rwlock_t *lock)
{
 __asm__ __volatile__(
  "\tfence rw,  w\n"
  "	amoadd.w x0, %1, %0\n"
  : "+A" (lock->lock)
  : "r" (-1)
  : "memory");
}

static inline void arch_write_unlock(arch_rwlock_t *lock)
{
 do { do { } while (0); __asm__ __volatile__ ("fence " "rw" "," "w" : : : "memory"); ({ union { typeof(*&lock->lock) __val; char __c[1]; } __u = { .__val = (__attribute__((force)) typeof(*&lock->lock)) (0) }; __write_once_size(&(*&lock->lock), __u.__c, sizeof(*&lock->lock)); __u.__val; }); } while (0);
}
# 9 "spin_lock04.c" 2

arch_rwlock_t lock = (arch_rwlock_t){ 0 };

int main(void)
{
    arch_read_lock(&lock);



    arch_read_unlock(&lock);

    return 0;
}
