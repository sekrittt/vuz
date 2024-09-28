#include <iostream>

using namespace std;

int G(int);
int F(int n)
{
    cout << "F(" << n << ") -> ";
    if (n > 1)
    {
        int F1;
        F1 = 10 + G(n-1);
        return F1;
    }
    else
    {
        int F1;
        F1 = 1;
        cout << "Не рекурсивная ветвь F" << endl;
        return F1;
    }
}

int G(int n)
{
    cout << "G(" << n << ") -> ";
    int G1;
    if (n > 1)
    {
        G1 = F(n - 1);
        return G1;
    }
    else
    {
        cout << "Не рекурсивная ветвь G" << endl;
        G1 = 1;
        return G1;
    }
}

int main()
{
    int R = F(3);
    cout << "R = " << R << endl;
    return 0;
}
/*
    F(3) -> G(3) -> F(2) -> G(2) -> F(1) -> Не рекурсивная ветвь F
n = 3>1  -> 3>1  -> 2>1  -> 2>1  -> 1>1  -> 1
    21      21      11      11      1
R = 21
*/
