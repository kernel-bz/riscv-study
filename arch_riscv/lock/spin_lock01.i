# 1 "spin_lock01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "spin_lock01.c"
# 12 "spin_lock01.c"
typedef struct {
 volatile unsigned int lock;
} arch_spinlock_t;

static inline int arch_spin_trylock(arch_spinlock_t *lock)
{
 int tmp = 1, busy;
# 30 "spin_lock01.c"
 __asm__ __volatile__ (
  "	amoswap.w %0, %2, %1\n"
  "\tfence r , rw\n"
  : "=r" (busy), "+A" (lock->lock)
  : "r" (tmp)
  : "memory");

 return !busy;
}

int main(void)
{
    int busy, ok;
    arch_spinlock_t lock;
    lock.lock = 0;

    busy = arch_spin_trylock(&lock);

    ok = (busy) ? 1 : 0;

    return ok;
}
