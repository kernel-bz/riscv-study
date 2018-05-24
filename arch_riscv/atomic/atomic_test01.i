# 1 "atomic_test01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomic_test01.c"
# 9 "atomic_test01.c"
typedef struct {
    int counter;
} atomic_t;

typedef struct {
    long counter;
} atomic64_t;
# 52 "atomic_test01.c"
static inline __attribute__((always_inline)) void atomic_add(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_add(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "add" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_sub(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (-i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_sub(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "add" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (-i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_and(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "and" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_and(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "and" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_or(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "or" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_or(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "or" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }
static inline __attribute__((always_inline)) void atomic_xor(int i, atomic_t *v) { __asm__ __volatile__ ( "amo" "xor" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); } static inline __attribute__((always_inline)) void atomic64_xor(long i, atomic64_t *v) { __asm__ __volatile__ ( "amo" "xor" "." "d" " zero, %1, %0" : "+A" (v->counter) : "r" (i) : "memory"); }




int main(void)
{
    int i = 0;
    atomic_t *v;
    long j = 0;
    atomic64_t *w;

    atomic_add(1, v);
    atomic_add(i, v);
    atomic64_add(j, w);
# 86 "atomic_test01.c"
    return 0;
}
