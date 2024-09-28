// Variant 3
#include <iostream>

using namespace std;

void GL(int **m, int v, bool *visit)
{
    cout << (v + 1) << " "; // вывод одной из вершин, v
    visit[v] = true;        // если посещали вершину v

    for (int i = 0; i < 5; i++)
    { // если есть связь между вершинами графа(m[v][i]=1) и
        // если не посещали вершину(!visit[i]), то обращение к рекурсивной
        // функции
        if (m[v][i] == 1 && !visit[i])
        {
            GL(m, i, visit);
        }
    }
}

int main()
{
    int size = 5;
    int M[5][5] = {
        // 1, 2, 3, 4, 5
        {0, 1, 0, 0, 1}, // 1
        {1, 0, 1, 1, 0}, // 2
        {0, 1, 0, 0, 1}, // 3
        {0, 1, 0, 0, 1}, // 4
        {1, 0, 1, 1, 0}  // 5
    };
    int M1[5][6] = {
        // a, b, c, d, e, f
        {1, 0, 0, 0, 0, 1}, // 1
        {1, 1, 1, 0, 0, 0}, // 2
        {0, 1, 0, 1, 0, 0}, // 3
        {0, 0, 1, 0, 1, 0}, // 4
        {0, 0, 0, 1, 1, 1}  // 5
    };
    // bool visit[5] = {false, false, false, false, false};
    cout << "M: " << endl;
    cout << "  1 2 3 4 5" << endl;
    for (int i = 0; i < size; i++)
    {
        cout << (i + 1) << " ";
        for (int j = 0; j < size; j++)
        {
            cout << M[i][j];
            if (j + 1 < size)
            {
                cout << " ";
            }
        }
        cout << endl;
    }
    cout << "M1: " << endl;
    cout << "  a b c d e f" << endl;
    for (int i = 0; i < size; i++)
    {
        cout << (i + 1) << " ";
        for (int j = 0; j < size + 1; j++)
        {
            cout << M1[i][j];
            if (j + 1 < size + 1)
            {
                cout << " ";
            }
        }
        cout << endl;
    }
    return 0;
}