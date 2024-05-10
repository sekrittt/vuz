#include <iostream>

using namespace std;

void array_print(int *A, int N) // функция для вывода массива
{                               //
    cout << "{";                //
    for (int i = 0; i < N; i++) // цикл прохода по массиву с шагом 1
    {                           //
        cout << A[i];           //
        if (i < N - 1)          // условие
            cout << ", ";       //
    }                           //
    cout << "}" << endl;        //
}

void fill_worst(int *A, int N) // заполнение в худшем
{                              //
    // int el = rand() % 10;            // первый элемент
    for (int i = N - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        // *(A + i) = el;               // присваивание элементу массива el
        *(A + i) = N - i;
        // el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    } //
}

void fill_best(int *A, int N)   // заполнение в худшем
{                               //
    // int el = rand() % 10;       // первый элемент
    for (int i = 0; i < N; i++) // проход для заполнения массива
    {                           //
        // *(A + i) = el;          // присваивание элементу массива el
        *(A + i) = i+1;
        // el += rand() % 10;      // след эл + предыдущий (но шаг -1)
    }                           //
}

void fill_argv(int *A, int N)   // заполнение случайным образом
{                               //
    for (int i = 0; i < N; i++) // проход для заполнения массива
    {                           //
        *(A + i) = rand() % 15 + 10;  // след эл
    }                           //
}

int array_max(int *A, int N)
{
    int max = *A;
    for (int i = 1; i < N; i++)
    {
        if (*(A + i) > max)
        {
            max = *(A + i);
        }
    }
    return max;
}

void sort_1(int *A, int N)
{
    int Max = array_max(A, N);
    cout << "Max of array: " << Max << endl;
    int *C = new int[Max];
    for (int num = 0; num < Max; num++)
    {
        C[num] = 0;
    };
    //-------------------------------------
    for (int i = 0; i < N; i++)
    {
        C[A[i]] = C[A[i]] + 1;
    };
    cout << "Array C: ";
    array_print(C, Max);
    //-------------------------------------
    int pos = 0;
    for (int i = 0; i <= Max; i++) // «перезапись» массива А
    {
        for (int j = 1; j <= C[i]; j++)
        {
            A[pos] = i;
            pos = pos + 1;
            cout << "Array (in proccess): ";
            array_print(A, N);
        }
    }
}

void sort_2(int *A, int N)
{
    int Max = array_max(A, N);
    cout << "Max of array: " << Max << endl;
    int *C = new int[Max];
    for (int num = 0; num < Max; num++)
    {
        C[num] = 0;
    };
    //-------------------------------------
    for (int i = 0; i < N; i++)
    {
        C[A[i]] = C[A[i]] + 1;
    };
    cout << "Array C: ";
    array_print(C, Max);
    //-------------------------------------
    int pos = N - 1;
    for (int i = 0; i <= Max; i++) // «перезапись» массива А
    {
        for (int j = 1; j <= C[i] && pos >= 0; j++)
        {
            A[pos] = i;
            pos = pos - 1;
            cout << "Array (in proccess): ";
            array_print(A, N);
        }
    }
}

int main()
{
    int N, v;
    cout << "Please enter N: ";
    cin >> N;
    int *A = new int[N];
    cout << "Please select variant (0 - Up, 1 - Down): ";
    cin >> v;
    if (v)
    {
        cout << "Sort DOWN: " << endl;
        fill_argv(A, N);
        cout << "Array: ";
        array_print(A, N);
        sort_2(A, N);
        cout << "Sorted Array: ";
        array_print(A, N);
    } else
    {
        cout << "Sort UP: " << endl;
        fill_argv(A, N);
        cout << "Array: ";
        array_print(A, N);
        sort_1(A, N);
        cout << "Sorted Array: ";
        array_print(A, N);
    }
    delete[] A;
    return 0;
}
