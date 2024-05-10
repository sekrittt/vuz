#include <iostream>
#include <ctime>
#include <cmath>
#include "limits.h"

using namespace std;

void array_print(int *A, int len) // функция для вывода массива
{                                 //
    cout << "{";                  //
    for (int i = 0; i < len; i++) // цикл прохода по массиву с шагом 1
    {                             //
        cout << A[i];             //
        if (i < len - 1)          // условие
            cout << ", ";         //
    }                             //
    cout << "}" << endl;          //
}

void fill_worst(int *A, int n) // заполнение в худшем
{                              //
    // int G[9] = {55, 50, 44, 42, 39, 32, 23, 20, 15};
    // int el = rand() % 10;            // первый элемент
    // for (int i = 0; i < n; i++) // проход для заполнения массива
    // {                                //
    //     *(A + i) = el;               // присваивание элементу массива el
    //     el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    // }                                //
    *A = 10;
    *(A + 1) = 20;
    *(A + 2) = 30;
    *(A + 3) = 40;
    *(A + 4) = 50;
}

void fill_argv(int *A, int n)           // заполнение случайным образом
{                               //
    for (int i = 0; i < n; i++) // проход для заполнения массива
    {                           //
        *(A + i) = rand() % 10; // след эл + предыдущий
    }                           //
}

int *array_sort(int *A, int n)
{
    int h = sqrt(n);
    int h1 = round(sqrt((float)n));
    h1 += (h1 * h1) < n;
    cout << h << " " << h1 << endl;
    int *B = new int[h]; // Мы же можем создать переменную в которой будем сохранять минимум
    int *C = new int[n];
    int *A_indexes = new int[h];
    int B_index = -1;

    for (int k = 0; k < n; k++)
    {
        for (int i = 0; i < h; i++)
        {
            *(B + i) = *(A + (h1 * i));
            *(A_indexes + i) = h1 * i;
            for (int j = 1; j < h1 && j + h1 * i < n; j++)
            {
                if (*(A + (j + h1 * i)) < *(B + i))
                {
                    *(B + i) = *(A + (j + h1 * i));
                    *(A_indexes + i) = (j + h1 * i);
                    cout << "Array B = ";
                    array_print(B, h);
                }
            }
        }
        *(C + k) = *B;
        B_index = 0;
        for (int i = 1; i < h; i++)
        {
            if (*(C + k) > *(B + i))
            {
                *(C + k) = *(B + i);
                B_index = i;
                cout << *(B + i) << endl;
            }
        }

        *(A + *(A_indexes + B_index)) = INT_MAX;
        *(B + B_index) = INT_MAX;
        cout << "Array C = ";
        array_print(C, k);
    }
    return C;
}

int main()
{
    srand(time(0));
    int n;
    cout << "Please enter n: ";
    cin >> n;
    int *A = new int[n];
    // fill_argv(A, n);
    fill_worst(A, n);
    cout << "Array A = ";
    array_print(A, n);
    A = array_sort(A, n);
    cout << "Sorted Array A = ";
    array_print(A, n);
    return 0;
}
