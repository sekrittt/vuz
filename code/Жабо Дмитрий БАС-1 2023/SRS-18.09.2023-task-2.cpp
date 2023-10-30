// Жабо Дмитрий БАС-1 Вариант 5
#include <iostream> // Include "iostream" lib
#include <clocale>  // Include "clocale" lib

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");                         // Set locale for UTF-8
    int a, tmp;                                                        // Variable description
    cout << "Введите долю выполненных учеником заданий в процентах: "; // Write text to stream
    cin >> a;                                                          // Read data from stream and set to a variable
    if (0 < a & a < 41)                                                //
    {                                                                  //
        tmp = 1;                                                       // Set value to tmp variable
    }                                                                  //
    else if (41 <= a & a < 61)                                         //
    {                                                                  //
        tmp = 2;                                                       // Set value to tmp variable
    }                                                                  //
    else if (61 <= a & a < 81)                                         //
    {                                                                  //
        tmp = 3;                                                       // Set value to tmp variable
    }                                                                  //
    else if (81 <= a)                                                  //
    {                                                                  //
        tmp = 4;                                                       // Set value to tmp variable
    }                                                                  //
    switch (tmp)                                                       //
    {                                                                  //
    case 1:                                                            //
        cout << "Оценка: 2" << endl;                                   // Write text to stream
        break;                                                         //
    case 2:                                                            //
        cout << "Оценка: 3" << endl;                                   // Write text to stream
        break;                                                         //
    case 3:                                                            //
        cout << "Оценка: 4" << endl;                                   // Write text to stream
        break;                                                         //
    case 4:                                                            //
        cout << "Оценка: 5" << endl;                                   // Write text to stream
        break;                                                         //
    default:                                                           //
        cout << "Нет такой оценки!" << endl;                           // Write text to stream
        break;
    }
}
