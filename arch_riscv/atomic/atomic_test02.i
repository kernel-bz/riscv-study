# 1 "atomic_test02.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomic_test02.c"
# 11 "atomic_test02.c"
typedef struct {
    int counter;
} atomic_t;

typedef struct {
    long counter;
} atomic64_t;
# 60 "atomic_test02.c"
static inline __attribute__((always_inline)) void atomic_add(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_add(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "add" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (-i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_sub(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "add" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (-i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_and(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "and" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_and(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "and" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_or(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "or" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_or(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "or" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_xor(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "xor" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_xor(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "xor" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }




int main(void)
{
    int i = 10;
    atomic_t vt, *v=&vt;
    v->counter = 20;
    long j = 100;
    atomic64_t wt, *w=&wt;
    w->counter = 200;

    atomic_add(1, v);
    atomic_add(i, v);
    atomic64_add(j, w);
# 96 "atomic_test02.c"
    return 0;
}
