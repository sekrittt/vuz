
#include <iostream>
#include <cmath>
#include <clocale>

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");
    int m;
    cout << "Введите m: ";
    cin >> m;
    switch (m)
    {
    case 1:
        cout << "пики" << endl; // вывод масти
        break;
    case 2:
        cout << "трефы" << endl; // вывод масти
        break;
    case 3:
        cout << "бубны" << endl; // вывод масти
        break;
    case 4:
        cout << "черви" << endl; // вывод масти
        break;
    default:
        cout << "Нет такой масти" << endl;
        break;
    }
}
