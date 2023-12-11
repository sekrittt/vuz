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
    int el = rand() % 10;            // первый элемент
    for (int i = n - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        *(A + i) = el;               // присваивание элементу массива el
        el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    }                                //
}

int *array_sort(int *A, int n)
{
    int h = round(sqrt((float)n));
    h += (h * h) < n;
    int h1 = round(n / (float)h);
    // return;
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
            for (int j = 1; j < h; j++)
            {
                if (j + h1 * i >= n)
                {
                    continue;
                }
                if (*(A + (j + h1 * i)) < *(B + i))
                {
                    *(B + i) = *(A + (j + h1 * i));
                    *(A_indexes + i) = (j + h1 * i);
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
            }
        }

        *(A + *(A_indexes + B_index)) = INT_MAX;
        *(B + B_index) = INT_MAX;
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
    fill_worst(A, n);
    cout << "Array A = ";
    array_print(A, n);
    A = array_sort(A, n);
    cout << "Sorted Array A = ";
    array_print(A, n);
    return 0;
}
