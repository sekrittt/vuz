// Жабо Дмитрий БАС-1

#include <iostream>
#include <ctime>

using namespace std;

void array_sort(int *M, int n)
{
    int left = 0;      // левая граница
    int right = n - 1; // правая граница
    int j, t, k = n;   // k-фиксирование индекса посл-его обмена
    do
    { // Прямой проход «Пузырьком» от левой границы до правой
        for (j = left; j < right; j++)
        {
            if (*(M + j) > *(M + j + 1))
            {
                t = *(M + j);
                *(M + j) = *(M + j + 1);
                *(M + j + 1) = t;
                k = j;
            }
        }
        right = k; // правая  граница
                   // Обратный проход «Пузырьком» от правой границы до левой
        for (j = right; j > left; j--)
        {
            if (*(M + j - 1) > *(M + j))
            {
                t = *(M + j);
                *(M + j) = *(M + j - 1);
                *(M + j - 1) = t;
                k = j;
            }
        }
        left = k;           // Левая граница
    } while (left < right); // До тех пор, пока левая граница не станет больше правой границы
}

void array_print(int *M, int n) // функция для вывода массива
{                               //
    cout << "{";                //
    for (int i = 0; i < n; i++) // цикл прохода по массиву с шагом 1
    {                           //
        cout << M[i];           //
        if (i < n - 1)          // условие
            cout << ", ";       //
    }                           //
    cout << "}" << endl;        //
}

void fill_worst(int *M, int n)       // заполнение в худшем
{                                    //
    int el = rand() % 10;            // первый элемент
    for (int i = n - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        *(M + i) = el;               // присваивание элементу массива el
        el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    }                                //
}

int main()
{
    srand(time(0));
    int n = 10;
    int *M = new int[n];
    fill_worst(M, n);
    cout << "Array M = ";
    array_print(M, n);
    array_sort(M, n);
    cout << "Sorted Array M = ";
    array_print(M, n);
    return 0;
}
