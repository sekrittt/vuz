#include <iostream>
using namespace std;

void array_print(int *M, int len) // функция для вывода массива
{                                 //
    cout << "{";                  //
    for (int i = 0; i < len; i++) // цикл прохода по массиву с шагом 1
    {                             //
        cout << M[i];             //
        if (i < len - 1)          // условие
            cout << ", ";         //
    }                             //
    cout << "}" << endl;          //
}

int *fill_best(int n)           // заполнение в лучшем случае
{                               //
    int *M = new int[n];        // создание динамического массива
    int el = rand() % 10;       // первый элемент
    for (int i = 0; i < n; i++) // проход для заполнения массива
    {                           //
        *(M + i) = el;          // присваивание элементу массива значение el
        el += rand() % 10;      // след эл + предыдущий
    }                           //
    return M;                   // возврат M
}

int *fill_argv(int n)           // заполнение случайным образом
{                               //
    int *M = new int[n];        // создание динамического массива
    for (int i = 0; i < n; i++) // проход для заполнения массива
    {                           //
        *(M + i) = rand() % 10; // след эл + предыдущий
    }                           //
    return M;                   // возврат M
}

int *fill_worst(int n)           // заполнение в худшем
{                                //
    int *M = new int[n];         // создание динамического массива
    int el = rand() % 10;        // первый элемент
    for (int i = n; i >= 0; i--) // проход для заполнения массива
    {                            //
        *(M + i) = el;           // присваивание элементу массива el
        el += rand() % 10;       // след эл + предыдущий (но шаг -1)
    }                            //
    return M;                    // возврат M
}

int array_sort_1(int *M, int n)         // фун-я сортировки
{                                       //
    int temp = 0;                       // инициализация
    int M1 = 0;                         // инициализация
    for (int i = 1; i < n; i++)         // переборный цикл
    {                                   //
        for (int j = 0; j < n - i; j++) // вложенный цикл
        {                               //
            if (M[j] > M[j + 1])        // сравнение текущего и след
            {                           //
                temp = M[j];            // присваивание во временную переменную
                M[j] = M[j + 1];        // присваивание текущему следующего
                M[j + 1] = temp;        // присваивание следующему значение переменной
                M1++;                   // счетчик пересылок
            }                           //
        }                               //
    }                                   //
    return M1;                          // возврат M1
}

int main()                                      //
{                                               //
    srand(time(0));                             //
    int n;                                      // описание
    cout << "Array length: ";                   //
    cin >> n;                                   //
    cout << "Fill best: " << endl;              //
    int *M = fill_best(n);                      // вызов функции
    array_print(M, n);                          // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;    //
    cout << "M=" << array_sort_1(M, n) << endl; // вызов функции
    array_print(M, n);                          // вызов функции
    cout << "Fill argv: " << endl;              //
    M = fill_argv(n);                           // вызов функции
    array_print(M, n);                          // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;    //
    cout << "M=" << array_sort_1(M, n) << endl; // вызов функции
    array_print(M, n);                          // вызов функции
    cout << "Fill worst: " << endl;             //
    M = fill_worst(n);                          // вызов функции
    array_print(M, n);                          // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;    //
    cout << "M=" << array_sort_1(M, n) << endl; // вызов функции
    array_print(M, n);                          // вызов функции
}
/*
Array length: 10
Fill best:
{7, 16, 22, 29, 37, 37, 44, 52, 57, 63}
C=45
M=0
{7, 16, 22, 29, 37, 37, 44, 52, 57, 63}
Fill argv:
{0, 9, 6, 1, 0, 9, 1, 9, 8, 1}
C=45
M=17
{0, 0, 1, 1, 1, 6, 8, 9, 9, 9}
Fill worst:
{45, 38, 31, 31, 31, 22, 21, 14, 10, 9}
C=45
M=42
{9, 10, 14, 21, 22, 31, 31, 31, 38, 45}
*/
