
#include <iostream>
using namespace std;

void array_print(int *M, int len) // функция для вывода массива
{
    cout << "{";
    for (int i = 0; i < len; i++) // цикл прохода по массиву с шагом 1
    {
        cout << M[i];
        if (i < len - 1) // условие
            cout << ", ";
    }
    cout << "}" << endl;
}

int *fill_best(int n) // заполнение в лучшем случае
{
    int *M = new int[n];        // создание динамического массива
    int el = rand() % 10;       // первый элемент
    for (int i = 0; i < n; i++) // проход для заполнения массива
    {
        *(M + i) = el;     // hписваивание элементу массива значение el
        el += rand() % 10; // след эл + предиущий
    }
    return M; // возврат M
}

int *fill_argv(int n) // заполнение рандомом
{
    int *M = new int[n];        // создание динамического массива
    for (int i = 0; i < n; i++) // проход для заполнения массива
    {
        *(M + i) = rand() % 10; // след эл + предиущий
    }
    return M; // возврат M
}

int *fill_worst(int n) // заполнение в худшем
{
    int *M = new int[n];         // создание динамического массива
    int el = rand() % 10;        // первый элемент
    for (int i = n; i >= 0; i--) // проход для заполнения массива
    {
        *(M + i) = el;     // присваевание эллементу массива el
        el += rand() % 10; // след эл + предиущий (но шаг -1)
    }
    return M; // возврат M
}

int array_sort(int *M, int n) // фун-я сортировки
{
    int temp = 0;               // инициализация
    int M1 = 0;                 // инициализация
    for (int i = 1; i < n; i++) // переборный цикл
    {
        for (int j = 0; j < n - i; j++) // вложенный цикл
        {
            if (M[j] > M[j + 1]) // сравнение текущего и след
            {
                temp = M[j];     // присваивание во временную переменную
                M[j] = M[j + 1]; // присваивание текущему следущего
                M[j + 1] = temp; // присваивание следущему значение переменной
                M1++;            // счетчик пересылок
            }
        }
    }
    return M1; // возврат M1
}
int main()
{
    srand(time(0));
    int n; // описание
    cout << "Введите кол-во элементов массива" << endl;
    cin >> n;
    cout << "Fill best: " << endl;
    int *M = fill_best(n); // вызов функции
    array_print(M, n);          // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;
    cout << "M=" << array_sort(M, n) << endl; // вызов функции
    array_print(M, n);                        // вызов функции
    cout << "Fill argv: " << endl;
    M = fill_argv(n); // вызов функции
    array_print(M, n);     // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;
    cout << "M=" << array_sort(M, n) << endl; // вызов функции
    array_print(M, n);                        // вызов функции
    cout << "Fill worst: " << endl;
    M = fill_worst(n); // вызов функции
    array_print(M, n);       // вызов функции
    cout << "C=" << (n * n - n) / 2 << endl;
    cout << "M=" << array_sort(M, n) << endl; // вызов функции
    array_print(M, n);                        // вызов функции
}
