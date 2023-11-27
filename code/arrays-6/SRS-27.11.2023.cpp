// Жабо Дмитрий БАС-1 Вариант 5

#include <iostream>
#include <fstream>

using namespace std;

void array_print(int *M, int n)
{
    cout << "{";
    for (int i = 0; i < n; i++)
    {
        cout << *(M + i);
        if (i < n - 1)
            cout << ", ";
    }
    cout << "}" << endl;
}

int *read_array1(int n)
{
    ifstream file("file1.txt");
    int *M = new int[n];
    for (int i = 0; i < n; ++i)
    {
        file >> *(M + i);
    }
    file.close();
    return M;
}

int *read_array2(int n)
{
    ifstream file("file2.txt");
    int *M = new int[n];
    for (int i = 0; i < n; ++i)
    {
        file >> *(M + i);
    }
    file.close();
    return M;
}

void array_sort_1(int *M, int n) // фун-я сортировки
{
    int temp = *M;              // инициализация
    for (int i = 1; i < n; i++) // переборный цикл
    {
        for (int j = 0; j < n - i; j++) // вложенный цикл
        {
            if (M[j] > M[j + 1]) // сравнение текущего и след
            {
                temp = M[j];     // присваивание во временную переменную
                M[j] = M[j + 1]; // присваивание текущему следущего
                M[j + 1] = temp; // присваивание следущему значение переменной
            }
        }
    }
}

void array_sort_2(int *M, int n) // фун-я сортировки
{                                //
    // Просмотр массива для поиска  минимума
    int i, wr;
    for (int j = 1; j < n; j++)
    {
        i = j - 1;                      // индекс для элементов массива
        wr = M[j];                      // Запоминаем текущий элемент во временной переменной
        while ((i >= 0) && (M[i] < wr)) // поиск нового места вставки
        {
            M[i + 1] = M[i]; // сдвиг вправо на 1 элемент
            i = i - 1;
        }
        M[i + 1] = wr; // вставка элемента на освободившееся место
    }
}

void find_negative_first_and_last(int *M, int n, int &first, int &last)
{
    first = -1;
    last = -1;
    for (int i = 0; i < n && first == -1; i++)
    {
        if (*(M + i) < 0)
        {
            first = i;
        }
    }
    for (int i = n; i >= 0 && last == -1; i--)
    {
        if (*(M + i) < 0)
        {
            last = i;
        }
    }
}

int *slice(int *M, int n, int start, int end)
{
    int *a = new int[end - start];
    for (int i = start; i < end; i++)
    {
        *(a + i - start) = *(M + i);
    }
    return a;
}

void insert_elements(int *M, int n, int start, int *Els, int els_n)
{
    for (int i = start; i < start + els_n; i++)
    {
        *(M + i) = *(Els + i - start);
    }
}

void write_array(int *M, int n)
{
    ofstream F;
    F.open("file3.txt");
    for (int i = 0; i < n; i++)
    {
        F << *(M + i) << " ";
    }
    F.close();
}

int main()
{
    int n;
    cout << "Пожалуйста введите кол-во элементов массива (<=20): ";
    cin >> n;
    int *Y1 = read_array1(n);
    int *Y2 = read_array2(n);
    int *Y3 = new int[n * 2];

    cout << "Исходный массив Y1: ";
    array_print(Y1, n);

    int first, last;
    find_negative_first_and_last(Y1, n, first, last);

    int *Y1_sliced = slice(Y1, n, first+1, last);
    array_sort_1(Y1_sliced, last - first - 1);
    insert_elements(Y1, n, first + 1, Y1_sliced, last - first - 1);
    cout << "Изменённый массив Y1: ";
    array_print(Y1, n);

    cout << "Исходный массив Y2: ";
    array_print(Y2, n);
    array_sort_2(Y2, n);
    cout << "Изменённый массив Y2: ";
    array_print(Y2, n);

    insert_elements(Y3, n * 2, 0, Y1, n);
    insert_elements(Y3, n * 2, n, Y2, n);

    cout << "Массив Y3: ";
    array_print(Y3, n * 2);

    write_array(Y3, n * 2);

    delete[] Y1;
    delete[] Y2;
    delete[] Y3;

    return 0;
}
