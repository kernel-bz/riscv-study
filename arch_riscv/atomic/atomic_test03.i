# 1 "atomic_test03.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomic_test03.c"
# 11 "atomic_test03.c"
typedef struct {
    int counter;
} atomic_t;

typedef struct {
    long counter;
} atomic64_t;
# 68 "atomic_test03.c"
static inline __attribute__((always_inline)) int atomic_fetch_add_relaxed(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_relaxed(int i, atomic_t *v) { return atomic_fetch_add_relaxed(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_relaxed(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_relaxed(long i, atomic64_t *v) { return atomic64_fetch_add_relaxed(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add_acquire(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_acquire(int i, atomic_t *v) { return atomic_fetch_add_acquire(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_acquire(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_acquire(long i, atomic64_t *v) { return atomic64_fetch_add_acquire(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add_release(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_release(int i, atomic_t *v) { return atomic_fetch_add_release(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_release(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_release(long i, atomic64_t *v) { return atomic64_fetch_add_release(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return(int i, atomic_t *v) { return atomic_fetch_add(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return(long i, atomic64_t *v) { return atomic64_fetch_add(i, v) + i; }
# 95 "atomic_test03.c"
static inline __attribute__((always_inline)) int atomic_fetch_sub_relaxed(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_relaxed(int i, atomic_t *v) { return atomic_fetch_sub_relaxed(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_relaxed(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_relaxed(long i, atomic64_t *v) { return atomic64_fetch_sub_relaxed(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub_acquire(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_acquire(int i, atomic_t *v) { return atomic_fetch_sub_acquire(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_acquire(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_acquire(long i, atomic64_t *v) { return atomic64_fetch_sub_acquire(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub_release(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_release(int i, atomic_t *v) { return atomic_fetch_sub_release(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_release(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_release(long i, atomic64_t *v) { return atomic64_fetch_sub_release(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t *v) { return atomic_fetch_sub(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return(long i, atomic64_t *v) { return atomic64_fetch_sub(i, v) + -i; }

int main(void)
{
    int ret1, i = 10, tmp1=1, tmp2=2;
    atomic_t vt, *v=&vt;
    v->counter = 20;
    long ret2, j = 100, tmp3=3;
    atomic64_t wt, *w=&wt;
    w->counter = 200;

    ret1 = atomic_fetch_add_relaxed(i, v);
    tmp1 += ret1;
    ret1 = atomic_add_return_relaxed(i, v);
    tmp2 += ret1;

    ret2 = atomic64_fetch_add_relaxed(j, w);
    tmp3 += ret2;
    ret2 = atomic64_add_return_relaxed(j, w);
    tmp3 += ret2;

    ret1 = atomic_fetch_add_acquire(i, v);
    tmp1 += ret1;
    ret1 = atomic_add_return_acquire(i, v);
    tmp2 += ret1;

    ret1 = atomic_fetch_add_release(i, v);
    tmp1 += ret1;
    ret1 = atomic_add_return_release(i, v);
    tmp2 += ret1;

    ret1 = atomic_fetch_add(i, v);
    tmp1 += ret1;
    ret1 = atomic_add_return(i, v);
    tmp2 += ret1;

    tmp3 = tmp1 + tmp2 + tmp3;

    return (int)tmp3;
}
