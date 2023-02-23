#include <stdio.h>

//kernel/sched/sched.h
struct sched_class {
        char a;
        int b;
        long c;
} __attribute__((__packed__));

#define DEFINE_SCHED_CLASS(name) \
const struct sched_class name##_sched_class 

DEFINE_SCHED_CLASS(fair) = {
        .a = 10,
        .b = 20,
        .c = 30
};

int main()
{
        int a, size;
        a = __alignof__(struct sched_class);
        size = sizeof(struct sched_class);

        printf("%d, %d\n", a, size);

        return 0;
}

