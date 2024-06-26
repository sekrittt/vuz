#include <iostream>

using namespace std;

const int SIZE = 6;
int main()
{
    int a[SIZE][SIZE] = {
        {0, 7, 9, 0, 0, 14},
        {7, 0, 10, 15, 0, 0},
        {9, 10, 0, 11, 0, 2},
        {0, 15, 11, 0, 6, 0},
        {0, 0, 0, 6, 0, 0},
        {14, 0, 2, 0, 9, 0}}; // матрица связей ? "  1  3  6  5" почему этот путь считается кротчайшим - этот путь считается кратчайшим, поскольку таким путем мы набираем минимальный вес, равный 20; матрицу связей задать в явном виде +;
    int d[SIZE];              // минимальное расстояние
    int v[SIZE];              // посещенные вершины
    //  назначение массивов d, v
    int temp, minindex, min;
    int begin_index = 0;

    // Инициализация матрицы связей
    // for (int i = 0; i < SIZE; i++)
    // {
    //     a[i][i] = 0;
    //     for (int j = i + 1; j < SIZE; j++)
    //     {
    //         cout << "Введите расстояние " << i + 1 << " - " << j + 1 << ": ";
    //         cin >> temp;
    //         a[i][j] = temp;
    //         a[j][i] = temp;
    //     }
    // }
    // Вывод матрицы связей
    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            cout.width(5);   // ? - для форматированного вывода
            cout << a[i][j]; // ? - элемент матрицы связей
        }
        cout << endl;
    }
    // Инициализация вершин и расстояний
    for (int i = 0; i < SIZE; i++)
    {
        d[i] = 10000; // ? - недостижимо большое число (в идеале - бесконечность). Это отражает то, что расстояния от вершины 1 до других вершин пока неизвестны.
        v[i] = 1;     // 1 - исходное состояние
    }
    d[begin_index] = 0;
    // Шаг алгоритма
    do
    {
        minindex = 10000; // ? - недостижимо большое число (в идеале - бесконечность)
        min = 10000;
        for (int i = 0; i < SIZE; i++)
        {                                    // Если вершину ещё не обошли и вес меньше min
            if ((v[i] == 1) && (d[i] < min)) // v[i] == 1 ? 1 - исходное состояние
            {                                // Переприсваиваем значения
                min = d[i];
                minindex = i;
            }
        }
        // Добавляем найденный минимальный вес
        // к текущему весу вершины
        // и сравниваем с текущим минимальным весом вершины
        if (minindex != 10000)
        {
            for (int i = 0; i < SIZE; i++)
            {
                if (a[minindex][i] > 0)
                {
                    temp = min + a[minindex][i]; // temp ? - сумма найденного минимального веса и текущего
                    if (temp < d[i])
                    {
                        d[i] = temp; // зачем ? - если значение суммы найденного минимального веса и текущего меньше текущего устанавливаем найденный минимальны вес
                    }
                    cout << endl
                         << "Текущеи кратчайшие расстояния до вершин: " << endl;
                    for (int i = 0; i < SIZE; i++)
                    {
                        cout.width(6);
                        cout << d[i];
                    }
                }
            }
            v[minindex] = 0;
        }
    } while (minindex < 10000);
    // Вывод кратчайших расстояний до вершин
    cout << endl
         << "Кратчайшие расстояния до вершин: " << endl;
    for (int i = 0; i < SIZE; i++)
    {
        cout.width(6);
        cout << d[i];
    }

    // Восстановление пути
    int ver[SIZE];       // массив посещенных вершин
    int end = 4;         // индекс конечной вершины = 5 - 1
    ver[0] = end + 1;    // начальный элемент - конечная вершина
    int k = 1;           // индекс предыдущей вершины
    int weight = d[end]; // вес конечной вершины

    while (end != begin_index) // пока не дошли до начальной вершины
    {
        for (int i = 0; i < SIZE; i++) // просматриваем все вершины
            if (a[i][end] != 0)        // если связь есть
            {
                int temp = weight - a[i][end]; // определяем вес пути из предыдущей вершины
                if (temp == d[i])              // если вес совпал с рассчитанным
                {                              // значит из этой вершины и был переход
                    weight = temp;             // сохраняем новый вес
                    end = i;                   // сохраняем предыдущую вершину
                    ver[k] = i + 1;            // и записываем ее в массив
                    k++;
                }
            }
    }
    // Вывод пути (начальная вершина оказалась в конце массива из k элементов)
    cout << endl
         << "Вывод кратчайшего пути" << endl;
    for (int i = k - 1; i >= 0; i--)
    {
        cout.width(3);
        cout << ver[i];
    }
    cout << endl;
    return 0;
}