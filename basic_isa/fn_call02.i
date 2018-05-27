# 1 "fn_call02.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fn_call02.c"






void swap(int *a, int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}

int main(void)
{
    int a = 10;
    int b = 20;

    swap(&a, &b);



    return 0;
}
