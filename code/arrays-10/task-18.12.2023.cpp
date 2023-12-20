#include <iostream>
#include <ctime>

using namespace std;

int SR = 0, OB = 0;

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

void array_print_from_to(int *M, int from, int to)
{
    cout << "{";                //
    for (int i = from; i < to; i++) // цикл прохода по массиву с шагом 1
    {                           //
        cout << M[i];           //
        if (i < to - 1)          // условие
            cout << ", ";       //
    }                           //
    cout << "}" << endl;        //
}

void QSort(int *M, int LG, int PG)
{
    int i = LG, j = PG;
    // Находим разделительный элемент в середине массива
    double X = *(M + ((LG + PG) / 2));

    cout << "   Array fragment: ";
    array_print_from_to(M, LG, PG+1);
    cout << "   X = " << X << endl;


    // Обход массив
    while (i <= j)
    {
        // Находим элемент, который больше или равен разделительному элементу от //левого индекса.
        while (*(M + i) < X)
            ++i;
        // Находим элемент, который меньше или равен разделительному элементу от //правого индекса.
        while (*(M + j) > X)
            --j;
        // Если индексы не пересекаются, меняем элементы
        if (i <= j)
        {
            int T;
            T = *(M + i);
            *(M + i) = *(M + j);
            *(M + j) = T;
            ++i;
            --j;
        } // if
    }     // while

    // Если ПРАВЫЙ индекс не достиг ЛЕВОЙ границы массива,то нужно повторить сортировку ЛЕВОЙ части.
    if (LG < j)
        QSort(M, LG, j);
    // Если ЛЕВЫЙ индекс не достиг ПРАВОЙ границы массива,то нужно повторить сортировку ПРАВОЙ части.
    if (i < PG)
        QSort(M, i, PG);
} // QSort

void QSort_counters(int *M, int LG, int PG)
{
    int i = LG, j = PG;
    // Находим разделительный элемент в середине массива
    double X = *(M + ((LG + PG) / 2));

    cout << "   Array fragment: ";
    array_print_from_to(M, LG, PG+1);
    cout << "   X = " << X << endl;
    // Обход массив
    while (i <= j)
    {
        // Находим элемент, который больше или равен разделительному элементу от //левого индекса.
        while (*(M + i) < X)
        {
            SR++;
            ++i;
        }
        SR++;
        // Находим элемент, который меньше или равен разделительному элементу от //правого индекса.
        while (*(M + j) > X)
        {
            SR++;
            --j;
        }
        SR++;
        // Если индексы не пересекаются, меняем элементы
        if (i <= j)
        {
            int T;
            T = *(M + i);
            *(M + i) = *(M + j);
            *(M + j) = T;
            ++i;
            --j;
            OB += 1;
        } // if
    }     // while

    // Если ПРАВЫЙ индекс не достиг ЛЕВОЙ границы массива,то нужно повторить сортировку ЛЕВОЙ части.
    if (LG < j)
        QSort_counters(M, LG, j);
    // Если ЛЕВЫЙ индекс не достиг ПРАВОЙ границы массива,то нужно повторить сортировку ПРАВОЙ части.
    if (i < PG)
        QSort_counters(M, i, PG);
} // QSort_counters

void QSort_even(int *M, int LG, int PG)
{
    int i = LG, j = PG;
    i += i % 2;
    j -= j % 2;
    // Находим разделительный элемент в середине массива
    double X = *(M + (((LG + PG) / 2) + ((LG + PG) / 2) % 2));

    cout << "   Array fragment: ";
    array_print_from_to(M, LG, PG+1);
    cout << "   X = " << X << endl;
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
        QSort_even(M, LG, j);
    // Если ЛЕВЫЙ индекс не достиг ПРАВОЙ границы массива,то нужно повторить сортировку ПРАВОЙ части.
    if (i < PG)
        QSort_even(M, i, PG);
} // QSort_even

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
    int N = 11;
    int *M = new int[N];
    cout << "QSort: "<<endl;
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
    cout << "Fill Best: " << endl;
    fill_best(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << endl
         << "QSort even: " << endl;
    cout << "Fill Worst: " << endl;
    fill_worst(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort_even(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << "Fill Argv: " << endl;
    fill_argv(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort_even(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << endl
         << "QSort (with counters): " << endl;
    N = 10;
    M = new int[N];
    cout << "Fill Worst: " << endl;
    fill_worst(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort_counters(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << "SR = " << SR << ", OB = " << OB << endl;
    SR = 0;
    OB = 0;
    cout << "Fill Argv: " << endl;
    fill_argv(M, N);
    cout << "Array: ";
    array_print(M, N);
    QSort_counters(M, 0, N - 1);
    cout << "Sorted Array: ";
    array_print(M, N);
    cout << "SR = " << SR << ", OB = " << OB << endl;
    delete[] M;
    return 0;
}
