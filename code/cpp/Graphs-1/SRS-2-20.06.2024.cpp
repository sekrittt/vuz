#include <iostream>

using namespace std;

const int Vmax = 6, Emax = Vmax * 2;
int head[Vmax];
int next_el[Emax];
int t[Emax];
int k = -1;

// Функция добавления ребра в список смежности
void ADD(int v, int u)
{
    k++;
    t[k] = u;
    next_el[k] = head[v - 1];
    head[v - 1] = k;
}

// Функция вывода списка смежности для каждого вершины
void print()
{
    // Вывод списка смежности для каждого вершины
    for (int i = 0; i < Vmax; i++)
    {
        cout << (i + 1) << "=>";
        bool first = true;
        for (int j = head[i]; j != -1; j = next_el[j])
        {
            if (!first)
            {
                cout << ",";
            }
            cout << t[j];
            first = false;
        }
        cout << endl;
    }
}

// Функция вывода матрицы смежности графа
void printMatrix()
{
    // Вывод матрицы смежности графа
    for (int i = 0; i < Vmax; i++)
    {
        for (int j = 0; j < Vmax; j++)
        {
            if (i == j)
            {
                cout << "0 ";
            }
            else
            {
                int found = 0;
                for (int k = head[i]; k != -1; k = next_el[k])
                {
                    if (t[k] == j + 1)
                    {
                        found = 1;
                        break;
                    }
                }
                if (found)
                {
                    cout << "1 ";
                }
                else
                {
                    cout << "0 ";
                }
            }
        }
        cout << endl;
    }
}

int main()
{
    for (int i = 0; i < Vmax; i++)
        head[i] = -1;
    for (int i = 0; i < Emax; i++)
        next_el[i] = -1;
    int V, E;
    cout << "Введите количество вершин: ";
    cin >> V;
    cout << "Введите количество ребер: ";
    cin >> E;

    // Ввод ребер
    for (int i = 0; i < E; i++)
    {
        int v, u;
        cout << "Введите ребро " << i + 1 << ": ";
        cin >> v >> u;
        ADD(v, u);
    }

    cout << "Список смежности:" << endl;
    print();
    cout << "Матрица смежности:" << endl;
    printMatrix();

    return 0;
}
