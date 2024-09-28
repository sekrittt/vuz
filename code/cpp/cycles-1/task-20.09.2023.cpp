/*
Переведите введенное с клавиатуры двузначное десятичное число в шестнадцатеричную систему счисления, с учетом таблицы соответствия десятичного и шестнадцатеричного представления чисел (1010 = А16  и т.д.).
*/
#include <iostream>
#include <clocale>
#include <string>

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");
    int i = 0, x, N = 16, s = 0, step = 1; // Описание переменных и инициализация
    string res;
    cout << "Введите число в десятичной системе счисления: ";
    cin >> x;

    while (x > 1)
    {
        s = (x % N);
        x /= N;
        switch (s)
        {
        case 15:
            res = "F" + res;
            break;
        case 14:
            res = "E" + res;
            break;
        case 13:
            res = "D" + res;
            break;
        case 12:
            res = "C" + res;
            break;
        case 11:
            res = "B" + res;
            break;
        case 10:
            res = "A" + res;
            break;

        default:
            res = to_string(s) + res;
            break;
        }
    }
    s = (x % N);
    switch (s)
    {
    case 15:
        res = "F" + res;
        break;
    case 14:
        res = "E" + res;
        break;
    case 13:
        res = "D" + res;
        break;
    case 12:
        res = "C" + res;
        break;
    case 11:
        res = "B" + res;
        break;
    case 10:
        res = "A" + res;
        break;
    case 0:
        break;
    default:
        res = to_string(s) + res;
        break;
    }
    cout << res << endl;
}

// while (i < x.length())
// {
//     char v = x.at(x.length() - i - 1);
//     switch (v)
//     {
//     case 'f':
//         s += 15 * step;
//         break;
//     case 'e':
//         s += 14 * step;
//         break;
//     case 'd':
//         s += 13 * step;
//         break;
//     case 'c':
//         s += 12 * step;
//         break;
//     case 'b':
//         s += 11 * step;
//         break;
//     case 'a':
//         s += 10 * step;
//         break;

//     default:
//         s += ((int)v - 48) * step;
//         break;
//     }
//     step *= N;
//     i++;
// }
// cout << s << endl;
