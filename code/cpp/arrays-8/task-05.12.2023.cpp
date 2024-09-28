#include <iostream>
#include <ctime>

using namespace std;

void array_print(int **A, int N, int M)
{
    cout << "{" << endl;
    for (int i = 0; i < N; i++)
    {
        cout << "    {";
        for (int j = 0; j < M; j++)
        {
            cout << A[i][j] << (j + 1 != M ? ", " : "");
        }
        cout << "}" << endl;
    }
    cout << "}" << endl;
}

void array_fill(int **A, int N, int M)
{
    for (int i = 0; i < N; i++)
    {
        A[i] = new int[M];
        for (int j = 0; j < M; j++)
        {
            A[i][j] = (rand() % 10) * (rand() % 2 ? -1 : 1);
        }
    }
}

int find_index(int **A, int N, int M)
{
    int _index = -1;
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < M; j++)
        {
            if (A[i][j] == 0 && _index == -1)
            {
                _index = j;
            }
        }
    }
    return _index;
}

int sum(int **A, int N, int M)
{
    int summa = 0;
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < M; j++)
        {
            if (A[i][j] < 0)
            {
                summa += A[i][j];
            }
        }
    }
    return summa;
}

int main()
{
    srand(time(0));
    int N, M;
    cout << "Please enter N and M: ";
    cin >> N >> M;
    int **A = new int *[N];
    array_fill(A, N, M);
    array_print(A, N, M);
    int ind = find_index(A, N, M);
    cout << "Index of column: " << ind << endl;
    int s = sum(A, N, M);
    cout << "Sum of all negative elements: " << s << endl;
    return 0;
}
