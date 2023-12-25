#include <iostream>
#include <cmath>
#include <ctime>

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

void fill_worst(int *A, int N)       // заполнение в худшем
{                                    //
    int el = rand() % 100 + 10;      // первый элемент
    for (int i = N - 1; i >= 0; i--) // проход для заполнения массива
    {                                //
        A[i] = el;                   // присваивание элементу массива el
        el += rand() % 10;           // след эл + предыдущий (но шаг -1)
    }                                //
}

void fill_best(int *A, int N)    // заполнение в худшем
{                                //
    int el = rand() % 100 + 10;  // первый элемент
    for (int i = 0; i < N; i++)  // проход для заполнения массива
    {                            //
        A[i] = el;               // присваивание элементу массива
        el += rand() % 100 + 10; // след эл + предыдущий (но шаг -1)
    }                            //
}

void fill_argv(int *A, int N)         // заполнение случайным образом
{                                     //
    for (int i = 0; i < N; i++)       // проход для заполнения массива
    {                                 //
        *(A + i) = rand() % 100 + 10; // след эл
    }                                 //
}

int get_razr(int chislo, int razr)
{
    return (chislo % (int)pow(10, razr)) / (int)pow(10, razr - 1);
}

int get_count_razrs(int N)
{
    int r = 0;
    while (N > 0)
    {
        N /= 10;
        r += 1;
    }
    return r;
}

void sort(int *A, int N)
{
    // Calculating razr variable
    int razr = 1, r = 1;
    for (int i = 0; i < N; i++)
    {
        int c_razr = get_count_razrs(A[i]);
        if (razr < c_razr)
        {
            razr = c_razr;
        }
    }
    //
    // Creating B array
    int **B = new int *[10];
    for (int i = 0; i < 10; i++)
        B[i] = new int[N];
    //
    int *sizes = new int[10];

    while (r <= razr)
    {
        for (int i = 0; i < 10; i++)
            sizes[i] = 0;

        for (int i = 0; i < 10; i++)
            for (int j = 0; j < N; j++)
                B[i][j] = 0;
        for (int i = 0; i < N; i++)
        {
            int a = get_razr(A[i], r);
            sizes[a]++;
            B[a][sizes[a] - 1] = A[i];
        }
        int tmp = 0;
        for (int i = 0; i < 10; i++)
        {
            for (int j = 0; j < sizes[i]; j++)
            {
                A[tmp] = B[i][j];
                tmp++;
            }
        }
        r++;
    }
    delete[] B;
}

int main()
{
    srand(time(0));
    int N;
    cout << "Please enter N: ";
    cin >> N;
    int *A = new int[N];
    fill_argv(A, N);
    cout << "Array: ";
    array_print(A, N);
    sort(A, N);
    cout << "Array sorted: ";
    array_print(A, N);
    delete[] A;
    return 0;
}
