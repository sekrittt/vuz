#include <iostream>
#include <clocale>
#include <cmath>

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");     //
    float X_start,                                 // Variable description (parameter)
        X_end,                                     // Variable description (border)
        dx = 0.5,                                  // Variable description and int
        Y;                                         // Variable description (Result)
    cout << "Введите Xнач, Xкон: ";                //
    cin >> X_start >> X_end;                       //
    cout << "Таблица значений функции" << endl;    //
    cout.width(10);                                //
    cout << "X | Y" << endl;                       //
    do                                             // Cycle start
    {                                              // Cycle body start
        if (-4 <= X_start && X_start < -2)         //
        {                                          //
            Y = X_start + 3;                       //
        }                                          //
        else if (-2 <= X_start && X_start < 4)     //
        {                                          //
            Y = X_start * -.5;                     //
        }                                          //
        else if (4 <= X_start && X_start <= 6)     //
        {                                          //
            Y = -2;                                //
        }                                          //
        else if (6 < X_start && X_start <= 10)     //
        {                                          //
            Y = sqrt(4 - pow(X_start - 8, 2)) - 2; //
        }                                          //
        cout.width(6);                             //
        cout.precision(3);                         //
        cout << fixed                              //
             << X_start << " | " << Y << endl;     //
        X_start += dx;                             //
    }                                              // Cycle body end
    while (X_start <= X_end);                      // Cycle condition
}

/*
Test #1:
    Введите Xнач, Xкон: -4 10
    Таблица значений функции
         X | Y
    -4.000 | -1.000
    -3.500 | -0.500
    -3.000 | 0.000
    -2.500 | 0.500
    -2.000 | 1.000
    -1.500 | 0.750
    -1.000 | 0.500
    -0.500 | 0.250
     0.000 | -0.000
     0.500 | -0.250
     1.000 | -0.500
     1.500 | -0.750
     2.000 | -1.000
     2.500 | -1.250
     3.000 | -1.500
     3.500 | -1.750
     4.000 | -2.000
     4.500 | -2.000
     5.000 | -2.000
     5.500 | -2.000
     6.000 | -2.000
     6.500 | -0.677
     7.000 | -0.268
     7.500 | -0.064
     8.000 | 0.000
     8.500 | -0.064
     9.000 | -0.268
     9.500 | -0.677
    10.000 | -2.000
*/
