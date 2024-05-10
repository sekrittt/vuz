#include <iostream>

using namespace std;
int factorial1(int N)
{
    int F = 1;
    if (N <= 1)
    {
        cout << "База рекурсии. Вычисление factorial1(" << N << "). Возврат F=" << F << endl;
        return F;
    }
    cout << "Рекурсивный вызов factorial1(" << N - 1 << ")" << endl;
    F = factorial1(N - 1) * N;
    cout << "Вычисление factorial1(" << N << "). Возврат F=" << F << endl;
    return F;
}

int F2 = 1;
int factorial2(int N)
{
    if (N <= 1)
    {
        cout << "База рекурсии. Вычисление factorial2(" << N << "). Возврат F2=" << F2 << endl;
        return F2;
    }
    F2 *= N;
    cout << "Вычисление factorial2(" << N << "). Возврат F2=" << F2 << endl;
    cout << "Рекурсивный вызов factorial2(" << N - 1 << ")" << endl;
    F2 = factorial2(N - 1);
    return F2;
}

void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");
    int N;
    cout << "Please enter N: ";
    cin >> N;
    cout << "Рекурсивный возврат" << endl;
    cout << "Вызов factorial1(" << N << ")" << endl;
    int F1 = factorial1(N);
    cout << "Вывод на экран " << N << "! = " << F1 << endl
         << endl;
    cout << "Рекурсивный спуск" << endl;
    cout << "Вызов factorial2(" << N << ")" << endl;
    int f2 = factorial2(N);
    cout << "Вывод на экран " << N << "! = " << F1 << endl;
}
