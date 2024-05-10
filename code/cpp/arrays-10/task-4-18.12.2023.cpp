#include <iostream>
#include <ctime>

using namespace std;

void array_print(int *M, int N) // функция для вывода массива
{                               //
    cout << "{";                //
    for (int i = 0; i < N; i++) // цикл прохода по массиву с шагом 1
    {                           //
        cout << M[i];           //
        if (i < N - 1)          // условие
            cout << ", ";       //
    }                           //
    cout << "}" << endl;        //
}

void QSort(int *M, int LG, int PG)
{
    int i = LG, j = PG;
    i += i % 2;
    j -= j % 2;
    // Находим разделительный элемент в середине массива
    double X = *(M + (((LG + PG) / 2) + ((LG + PG) / 2) % 2));

    cout << "X = " << X << ", X index: " << (((LG + PG) / 2) + ((LG + PG) / 2) % 2) << endl;

    // Обход массив
    while (i <= j)
    {
        // Находим элемент, который больше или равен разделительному элементу от //левого индекса.
        while (*(M + i) < X)
        {
            i += 2;
        }
        // Находим элемент, который меньше или равен разделительному элементу от //правого индекса.
        while (*(M + j) > X)
        {
            j -= 2;
        }
        // Если индексы не пересекаются, меняем элементы
        if (i <= j)
        {
            int T;
            T = *(M + i);
            *(M + i) = *(M + j);
            *(M + j) = T;
            i += 2;
            j -= 2;
        } // if
    }     // while

    // Если ПРАВЫЙ индекс не достиг ЛЕВОЙ границы массива,то нужно повторить сортировку ЛЕВОЙ части.
    if (LG < j)
        QSort(M, LG, j);
    // Если ЛЕВЫЙ индекс не достиг ПРАВОЙ границы массива,то нужно повторить сортировку ПРАВОЙ части.
    if (i < PG)
        QSort(M, i, PG);
} // QSort

void fill_worst(int *M, int N)       // заполнение в худшем
{                                    //
    int el = rand() % 10;            // первый элемент
    for (int i = N - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        *(M + i) = el;               // присваивание элементу массива el
        el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    }                                //
}

void fill_best(int *M, int N)   // заполнение в худшем
{                               //
    int el = rand() % 10;       // первый элемент
    for (int i = 0; i < N; i++) // проход для заполнения массива
    {                           //
        *(M + i) = el;          // присваивание элементу массива el
        el += rand() % 10;      // след эл + предыдущий (но шаг -1)
    }                           //
}

void fill_argv(int *M, int N)    // заполнение случайным образом
{                                //
    for (int i = 0; i < N; i++)  // проход для заполнения массива
    {                            //
        *(M + i) = rand() % 100; // след эл + предыдущий
    }                            //
}

int main()
{
    srand(time(0));
    const int N = 9;
    int *M = new int[N];
    cout << "Fill Worst: " << endl;
    fill_worst(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << "Fill Argv: " << endl;
    fill_argv(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    // cout << "Fill Best: " << endl;
    // fill_best(M, N);
    // cout << "Array: ";
    // array_print(M, N);
    // QSort(M, 0, N - 1);
    // cout << "Sorted Array: ";
    // array_print(M, N);
    return 0;
}
