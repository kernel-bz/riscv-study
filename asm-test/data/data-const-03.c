
int main()
{
        const int a = 10;
        int c;

        if (a == 1)
                c = 1;
        else if (a == 5)
                c = 5;
        else if (a == 10)
                c = 10;
        else if (a == 20)
                c = 20;
        else 
                c = 30;

        c += a;

        return c;
}
