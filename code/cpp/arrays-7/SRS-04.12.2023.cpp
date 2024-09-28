#include <iostream>

using namespace std;

void shellSort(int *a, int n)
{
    int h = 1;
    while (h < n / 3)
    {
        h = 3 * h + 1;
    }
    while (h >= 1)
    {
        for (int i = h; i < n; i++)
        {
            for (int j = i; j >= h && *(a + j) < *(a + j - h); j -= h)
            {
                int temp = *(a + j);
                *(a + j) = *(a + j - h);
                *(a + j - h) = temp;
            }
        }
        h /= 3;
    }
}

void array_print(int *a, int n) // функция для вывода массива
{                               //
    cout << "{";                //
    for (int i = 0; i < n; i++) // цикл прохода по массиву с шагом 1
    {                           //
        cout << *(a + i);       //
        if (i < n - 1)          // условие
            cout << ", ";       //
    }                           //
    cout << "}" << endl;        //
}

void fill_worst(int *a, int n)       // заполнение в худшем
{                                    //
    int el = rand() % 10;            // первый элемент
    for (int i = n - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        *(a + i) = el;               // присваивание элементу массива el
        el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    }                                //
}

int main()
{
    int n = 10;
    int *a = new int[n];
    fill_worst(a, n);
    array_print(a, n);
    shellSort(a, n);
    cout << "Sorted array: ";
    array_print(a, n);
    return 0;
}
