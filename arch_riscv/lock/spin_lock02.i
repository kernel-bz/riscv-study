# 1 "spin_lock02.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "spin_lock02.c"






typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

typedef __signed__ long __s64;
typedef unsigned long __u64;
# 41 "spin_lock02.c"
typedef struct {
 volatile unsigned int lock;
} arch_spinlock_t;



typedef struct {
 volatile unsigned int lock;
} arch_rwlock_t;
# 73 "spin_lock02.c"
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
# 230 "spin_lock02.c"
static inline void arch_spin_unlock(arch_spinlock_t *lock)
{

 do { do { bool __cond = !(__native_word(*&lock->lock)); extern void __compiletime_assert_233(void) ; if (__cond) __compiletime_assert_233(); do { ((void)sizeof(char[1 - 2 * __cond])); } while (0); } while (0); __asm__ __volatile__ ("fence " "rw" "," "w" : : : "memory"); ({ union { typeof(*&lock->lock) __val; char __c[1]; } __u = { .__val = (__attribute__((force)) typeof(*&lock->lock)) (0) }; __write_once_size(&(*&lock->lock), __u.__c, sizeof(*&lock->lock)); __u.__val; }); } while (0);
}

static inline int arch_spin_trylock(arch_spinlock_t *lock)
{
 int tmp = 1, busy;
# 250 "spin_lock02.c"
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

int main(void)
{
    int busy;
    arch_spinlock_t lock = (arch_spinlock_t){ 0 };

    arch_spin_lock(&lock);



    arch_spin_unlock(&lock);

    return 0;
}
