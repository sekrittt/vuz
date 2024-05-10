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

void fill_best(int *A, int N) // заполнение в худшем
{                             //
    // int el = rand() % 10;       // первый элемент
    for (int i = 0; i < N; i++) // проход для заполнения массива
    {                           //
        // *(A + i) = el;          // присваивание элементу массива el
        *(A + i) = i + 1;
        // el += rand() % 10;      // след эл + предыдущий (но шаг -1)
    } //
}

void fill_argv(int *A, int N)        // заполнение случайным образом
{                                    //
    for (int i = 0; i < N; i++)      // проход для заполнения массива
    {                                //
        *(A + i) = rand() % 15 + 10; // след эл
    }                                //
}

void sort(int *A, int *B, int k, int N)
{
    int *C = new int[k+1];
    for (int i = 0; i < k; i++)
    {
        C[i] = 0;
    }
    for (int j = 0; j < N; j++) {
        C[A[j]] = C[A[j]] + 1;
    }
    for (int i = 1; i < k; i++){
        C[i] = C[i] + C[i - 1];
    }
    for (int j = N-1; j >= 0; j--)
    {
        B[C[A[j]]] = A[j];
        C[A[j]] = C[A[j]] - 1;
    }
    //
    for (int i = 0; i < N; i++)
        A[i] = B[i];
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

int main()
{
    int N, k;
    cout << "Please enter N: ";
    cin >> N;
    int *A = new int[N];
    int *B = new int[N];
    fill_argv(A, N);
    k = array_max(A, N);
    cout << "Array: ";
    array_print(A, N);
    sort(A, B, k, N);
    cout << "Sorted Array: ";
    array_print(A, N);
    return 0;
}
