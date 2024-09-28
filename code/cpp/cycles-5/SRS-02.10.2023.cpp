#include <iostream>
#include <cmath>
// формула общего члена (-1)^(i+1) * ((X ^ (2*i-1)) / (2 * i - 1))
using namespace std;
void main()
{
    int n, i = 1;                                                    // i - параметр цикла, sign - знак числа, n - кол-во элементов ряда
    double X, sum = 0;                                               // sum - сумма
    cout << "Please enter n and x (|x| < 1): ";                      //
    cin >> n >> X;                                                   //
    do                                                               //
    {                                                                //
        sum += pow(-1, i + 1) * (pow(X, (2 * i - 1)) / (2 * i - 1)); // промежуточная сумма
        i++;                                                         // шаг
    } while (i <= n);                                                //
    cout << "Sum1: " << sum << endl;                                 //
    i = 1;                                                           //
    sum = 0;      //
    while (i <= n)                                                   //
    {                                                                //
        sum += pow(-1, i + 1) * (pow(X, (2 * i - 1)) / (2 * i - 1)); // промежуточная сумма
        i++;                                                         // шаг
    }                                                                //
    cout << "Sum2: " << sum << endl;                                 //
}
/*
Please enter n and x (|x| < 1): 5 0.5
Sum: 0.463684

Please enter n and x (|x| < 1): 7 0.2
Sum: 0.197396
*/
