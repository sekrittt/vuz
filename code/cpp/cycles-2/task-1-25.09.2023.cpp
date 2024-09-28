#include <iostream>
#include <clocale>

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");
    int N, fact = 1, sum = 0, i = 0; // Variable description and init
    cout << "Please enter value for N: ";
    cin >> N;
    do
    {
        sum += fact;
        cout << "Для "
             << "N = " << i << ", " << i << "! = " << fact << ", Сумма факториала = " << sum << endl;
        fact *= ++i;
    } while (i <= N);
}
/*
Test #1:
    Please enter value for N: 3
    Для N = 0, 0! = 1, Сумма факториала = 1
    Для N = 1, 1! = 1, Сумма факториала = 2
    Для N = 2, 2! = 2, Сумма факториала = 4
    Для N = 3, 3! = 6, Сумма факториала = 10

Test #2:
    Please enter value for N: 4
    Для N = 0, 0! = 1, Сумма факториала = 1
    Для N = 1, 1! = 1, Сумма факториала = 2
    Для N = 2, 2! = 2, Сумма факториала = 4
    Для N = 3, 3! = 6, Сумма факториала = 10
    Для N = 4, 4! = 24, Сумма факториала = 34

Test #3:
    Please enter value for N: 5
    Для N = 0, 0! = 1, Сумма факториала = 1
    Для N = 1, 1! = 1, Сумма факториала = 2
    Для N = 2, 2! = 2, Сумма факториала = 4
    Для N = 3, 3! = 6, Сумма факториала = 10
    Для N = 4, 4! = 24, Сумма факториала = 34
    Для N = 5, 5! = 120, Сумма факториала = 154
*/
