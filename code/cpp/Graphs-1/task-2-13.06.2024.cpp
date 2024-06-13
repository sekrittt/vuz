// Variant 3
#include <iostream>

using namespace std;

const int sizeM = 5;
int M[5][5] = {
    // 1, 2, 3, 4, 5
    {0, 1, 0, 0, 1}, // 1
    {1, 0, 1, 1, 0}, // 2
    {0, 1, 0, 0, 1}, // 3
    {0, 1, 0, 0, 1}, // 4
    {1, 0, 1, 1, 0}  // 5
};

void GL(int v, bool *visit)
{
    cout << (v + 1) << " "; // вывод одной из вершин, v
    visit[v] = true;        // если посещали вершину v

    for (int i = 0; i < sizeM; i++)
    { // если есть связь между вершинами графа(m[v][i]=1) и
        // если не посещали вершину(!visit[i]), то обращение к рекурсивной
        // функции
        if (M[v][i] == 1 && !visit[i])
        {
            GL(i, visit);
        }
    }
}

int main()
{
    bool visit[5] = {false, false, false, false, false};
    cout << "M: " << endl;
    cout << "  1 2 3 4 5" << endl;
    for (int i = 0; i < sizeM; i++)
    {
        cout << (i + 1) << " ";
        for (int j = 0; j < sizeM; j++)
        {
            cout << M[i][j];
            if (j + 1 < sizeM)
            {
                cout << " ";
            }
        }
        cout << endl;
    }
    int input;
    cout << "Please enter value for start (1 - " << sizeM << "): ";
    cin >> input;
    GL(input - 1, visit);
    return 0;
}