#include <iostream>
#include <ctime>

using namespace std;

void shell_sort_2(int *a, int n)
{
    int step = n / 2;
    while (step > 0)
    {
        for (int i = 0; i < n - step; i++)
        {
            int j = i;
            while (j >= 0 && *(a + j) > *(a + j + step))
            {
                int tmp = *(a + j);
                *(a + j) = *(a + j + step);
                *(a + j + step) = tmp;
                j -= step;
            }
        }
        step /= 2;
    }
}

void shellsort(int *a, int n)
{
    const int t = 4;
    int i = 0, j = 0, k = 0, s = 0;
    int x;
    int m;
    int h[t] = {9, 5, 3, 1};
    for (m = 0; m < t; m++)
    {
        k = h[m]; // 9; 5
        s = -k;   //-9; -5;
        for (i = k; i < n; i++)
        {
            x = *(a + i);
            j = i - k;//0 (9-9)
            if (s == 0)
            {
                s = -k;
                s += 1;
                *(a + s) = x;
            }
            while (x < a[j] && j >= 0)
            {
                *(a + j + k) = *(a + j);
                j = j - k; // 0-9 = -9;
            }
            *(a + j + k) = x; //
        }
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

void fill_worst(int *a, int n)   // заполнение в худшем
{                        //
    int el = rand() % 10;        // первый элемент
    for (int i = n-1; i >= 0; i--) // проход для заполнения массива
    {                            //
        *(a+i) = el; // присваивание элементу массива el
        el += rand() % 10; // след эл + предыдущий (но шаг -1)
    } //
}

int main()
{
    srand(time(0));
    int n = 10;
    int *a = new int[n];
    fill_worst(a, n);
    array_print(a, n);
    // shell_sort_2(a, n);
    shellsort(a, n);
    array_print(a, n);
    return 0;
}
