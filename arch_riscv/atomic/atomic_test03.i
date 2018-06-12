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
# 71 "atomic_test03.c"
static inline __attribute__((always_inline)) int atomic_fetch_add_relaxed(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_relaxed(int i, atomic_t *v) { return atomic_fetch_add_relaxed(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_relaxed(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_relaxed(long i, atomic64_t *v) { return atomic64_fetch_add_relaxed(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add_acquire(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_acquire(int i, atomic_t *v) { return atomic_fetch_add_acquire(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_acquire(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_acquire(long i, atomic64_t *v) { return atomic64_fetch_add_acquire(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add_release(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return_release(int i, atomic_t *v) { return atomic_fetch_add_release(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add_release(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return_release(long i, atomic64_t *v) { return atomic64_fetch_add_release(i, v) + i; }
static inline __attribute__((always_inline)) int atomic_fetch_add(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_add_return(int i, atomic_t *v) { return atomic_fetch_add(i, v) + i; } static inline __attribute__((always_inline)) long atomic64_fetch_add(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_add_return(long i, atomic64_t *v) { return atomic64_fetch_add(i, v) + i; }

static inline __attribute__((always_inline)) int atomic_fetch_sub_relaxed(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_relaxed(int i, atomic_t *v) { return atomic_fetch_sub_relaxed(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_relaxed(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" "" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_relaxed(long i, atomic64_t *v) { return atomic64_fetch_sub_relaxed(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub_acquire(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_acquire(int i, atomic_t *v) { return atomic_fetch_sub_acquire(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_acquire(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aq" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_acquire(long i, atomic64_t *v) { return atomic64_fetch_sub_acquire(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub_release(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return_release(int i, atomic_t *v) { return atomic_fetch_sub_release(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub_release(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".rl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return_release(long i, atomic64_t *v) { return atomic64_fetch_sub_release(i, v) + -i; }
static inline __attribute__((always_inline)) int atomic_fetch_sub(int i, atomic_t *v) { register int ret; __asm__ __volatile__ ( "amo" "add" "." "w" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) int atomic_sub_return(int i, atomic_t *v) { return atomic_fetch_sub(i, v) + -i; } static inline __attribute__((always_inline)) long atomic64_fetch_sub(long i, atomic64_t *v) { register long ret; __asm__ __volatile__ ( "amo" "add" "." "d" ".aqrl" " %1, %2, %0" : "+A" (v->counter), "=r" (ret) : "r" (-i) : "memory"); return ret; } static inline __attribute__((always_inline)) long atomic64_sub_return(long i, atomic64_t *v) { return atomic64_fetch_sub(i, v) + -i; }

int main(void)
{
    int i = 10;
    atomic_t vt, *v=&vt;
    v->counter = 20;
    long j = 100;
    atomic64_t wt, *w=&wt;
    w->counter = 200;

    atomic_fetch_add(i, v);
    atomic64_fetch_add(j, w);


    return 0;
}
