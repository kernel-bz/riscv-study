#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>

#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

struct data_ {
        char a;
        char a2;
        int b;
        long c;
        long long d;
        char e;
} __packed;

void data_init(struct data_ *dp)
{
        dp->a = 10;
        dp->b = 20;
        dp->c = 30;
        dp->d = 40;
        dp->e = 50;
}

int main()
{
        int idx;

        struct data_ *data_st;

        printf("size=%lu\n", sizeof(*data_st));

        data_st = (struct data_ *)malloc(sizeof(*data_st));

        data_init(data_st);

        //li offset
        idx = offsetof(struct data_, c);

        printf("%d\n", idx);
        printf("%ldi, %d\n", data_st->c, data_st->e);

        return 0;
}
