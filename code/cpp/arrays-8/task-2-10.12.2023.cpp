
#include <iostream>
#include <ctime>

using namespace std;

void array_print(int **A, int N, int *sizes)
{
    cout << "{" << endl;
    for (int i = 0; i < N; i++)
    {
        cout << "    {";
        for (int j = 0; j < sizes[i]; j++)
        {
            cout << A[i][j] << (j + 1 != sizes[i] ? ", " : "");
        }
        cout << "}" << endl;
    }
    cout << "}" << endl;
}

int main()
{
    srand(time(0));
    int N = 6;
    int **A = new int *[N];
    int sizes[6] = {6, 2, 5, 3, 4, 1};
    for (int i = 0; i < N; i++)
    {
        A[i] = new int[sizes[i]];
        for (int j = 0; j < sizes[i]; j++)
        {
            A[i][j] = rand() % 10;
        }
    }

    array_print(A, N, sizes);

    return 0;
}
