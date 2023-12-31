//
#include <iostream>
#include <ctime>
#include <cmath>

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

void array_sort_1(int *M, int n, int &C, int &G) // фун-я сортировки
{
    // Просмотр массива для поиска  минимума
    C = 0;
    G = 0;
    for (int i = 0; i < n - 1; i++)     //
    {                                   //
        int min = *(M + i);             // начальное значение минимума в рассматриваемой части массива
        int i_min = i;                  // начальное значение номера минимума в рассматриваемой части массива
        C++;
        G++;            //  поиск  минимального элемента среди неупорядоченных элементов
        for (int j = i + 1; j < n; j++) //
        {
            // если найден элемент меньший чем минимум, запоминаем его номер
            if (*(M + j) < min) //
            {                   //
                min = *(M + j); // найден элемент, меньший, чем минимум
                i_min = j;      // фиксируется индекс минимума
                C++;
                G++;
            } //
        }
        // Обмен местами: найденного минимального элемента c первым "по очереди" из
        // не отсортированных элементов
        *(M + i_min) = *(M + i);
        *(M + i) = min;
        C++;
        G++;

    }
}

void array_sort_2(int *M, int n, int &C, int &G) // фун-я сортировки
{                                               //
    // Просмотр массива для поиска  минимума
    C = 0;
    G = 0;
    int i, wr;
    for (int j = 1; j < n; j++)
    {
        i = j - 1;                      // индекс для элементов массива
        wr = M[j];
        G++;
        C++;                   // Запоминаем текущий элемент во временной переменной
        while ((i >= 0) && (M[i] > wr)) // поиск нового места вставки
        {
            M[i + 1] = M[i]; // сдвиг вправо на 1 элемент
            i = i - 1;
            C++;
            G++;
        }
        M[i + 1] = wr; // вставка элемента на освободившееся место
        G++;
        C++;
    }
}
void sort_by_select(int n)
{
    int C = 0, G = 0;                      //
    cout << "Лучшее заполнение: " << endl; //
    int *M = fill_best(n);                 // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                   // вызов функции
    cout << "Кол-во сравнений (по формуле):" << (n-1) << endl;
    cout << "Кол-во перестановок (по формуле): " << 2*(n-1) << endl;
    array_sort_1(M, n, C, G);                                            // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n);                        // вызов функции
    cout << "Хаотичное заполнение: " << endl;
    M = fill_argv(n);                         // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                               // вызов функции
    cout << "Кол-во сравнений (по формуле):" << (n * n - n) / 2 << endl;
    cout << "Кол-во перестановок (по формуле): " << n * (log(n) + 0.577216) << endl;
    array_sort_1(M, n, C, G);                                                        // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n);                     // вызов функции
    cout << "Худшие заполнение: " << endl;
    M = fill_worst(n);                     // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                                   // вызов функции
    cout << "Кол-во сравнений (по формуле):" << (n * n - n) / 2 << endl;
    cout << "Кол-во перестановок (по формуле): " << ((n * n) / 4) + 3 * (n - 1) << endl;
    array_sort_1(M, n, C, G);                                                            // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n); // вызов функции
    // delete[] M;
}
void sort_by_insert(int n)
{
    int C = 0, G = 0;                      //
    cout << "Лучшее заполнение: " << endl; //
    int *M = fill_best(n);                 // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                   // вызов функции
    cout << "Кол-во сравнений (по формуле):" << n - 1 << endl;           //
    cout << "Кол-во перестановок (по формуле): " << 2 * (n - 1) << endl; //
    array_sort_2(M, n, C, G);                                            // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n);                        // вызов функции
    cout << "Хаотичное заполнение: " << endl; //
    M = fill_argv(n);                         // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                                // вызов функции
    cout << "Кол-во сравнений (по формуле):" << (n * n + n - 2) / 4 << endl;          //
    cout << "Кол-во перестановок (по формуле): " << (n * n + 9 * n - 10) / 4 << endl; //
    array_sort_2(M, n, C, G);                                                         // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n);                     // вызов функции
    cout << "Худшие заполнение: " << endl; //
    M = fill_worst(n);                     // вызов функции
    cout << "Исходный массив: ";
    array_print(M, n);                                                               // вызов функции
    cout << "Кол-во сравнений (по формуле):" << (n * n + n) / 2 - 1 << endl;         //
    cout << "Кол-во перестановок (по формуле): " << (n * n + 3 * n - 4) / 2 << endl; //
    array_sort_2(M, n, C, G);                                                        // вызов функции
    cout << "Кол-во перестановок (рассчитано программой): " << G << endl;
    cout << "Кол-во сравнений (рассчитано программой): " << C << endl;
    cout << "Отсортированный массив: ";
    array_print(M, n); // вызов функции
    // delete[] M;
}

int main()                             //
{                                      //
    srand(time(0));                    //
    int n;                             // описание
    cout << "Введите длину массива: "; //
    cin >> n;                          //
    cout << "Сортировка простым выбором: " << endl;
    sort_by_select(n);
    cout << endl<< "Сортировка простыми вставками: " << endl;
    sort_by_insert(n);
}
