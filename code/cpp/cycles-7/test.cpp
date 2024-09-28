#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    setlocale(LC_ALL, "RUSSIAN");
    double xnach, xkon, dx, eps, n, el, sum, sum_pred;
    cout << "Введите начальное значение: ";
    cin >> xnach;
    cout << "Введите конечное значение: ";
    cin >> xkon;
    cout << "Введите шаг: ";
    cin >> dx;
    cout << "Введите точность: ";
    cin >> eps;
    cout << "Таблица значений функции" << endl;
    cout << " Значение аргумента "
         << "|"
         << " Значение функции "
         << "|"
         << " Количество просуммированных членов ряда" << endl;
    for (; xnach <= xkon; xnach += dx)
    {
        sum = 1;
        sum_pred = 0;
        n = 1;
        el = 1;
        while (abs(sum - sum_pred) > 1)
        {
            el = 2 * (1 / ((2 * n + 1) * pow(xnach, (2 * n + 1))));
            sum_pred = sum;
            sum += el;
            n++;
        }
        cout << "e^" << xnach << "\t" << sum_pred << endl;
    }
    return 0;
}
