#include <stdio.h>
#include <stddef.h>

#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

int main()
{
        struct data_ {
                char a;
                char a2;
                int b;
                long c;
                long long d;
                char e;
        } __packed;

        int idx;

        struct data_ data_st;
        data_st.a = 10;
        data_st.b = 20;
        data_st.c = 30;

        //li offset
        idx = offsetof(struct data_, c);

        printf("%d\n", idx);

        return 0;
}
