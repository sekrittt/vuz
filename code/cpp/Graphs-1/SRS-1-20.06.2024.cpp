#include <iostream>

using namespace std;
const int __size1 = 6;
int M1[6][6] = {
    // 1 2 3 4 5 6
    {0, 0, 0, 0, 1, 0}, // 1
    {0, 0, 1, 0, 0, 1}, // 2
    {0, 1, 0, 0, 1, 0}, // 3
    {0, 0, 0, 0, 1, 0}, // 4
    {1, 0, 1, 1, 0, 1}, // 5
    {0, 1, 0, 0, 1, 0}, // 6
};

const int __size2 = 5;
int M2[5][5] = {
    // 1 2 3 4 5
    {0, 1, 0, 0, 1}, // 1
    {1, 0, 1, 1, 0}, // 2
    {0, 1, 0, 0, 1}, // 3
    {0, 1, 0, 0, 1}, // 4
    {1, 0, 1, 1, 0}  // 5
};

int pn, pk;

void width1(int v)
{
    int OCH[__size1 + 1];
    pn = 0;        // начало очереди
    pk = 0;        // конец очереди
    OCH[pk++] = v; // в очередь помещается исходная вершина
                   // OCH[pk]=v;pk=pk+1

    bool visit[__size1];
    for (int i = 0; i < __size1; i++)
        visit[i] = false;

    visit[v] = true; // вершина V посещена
    while (pn < pk)  // пока очередь не пуста
    {
        v = OCH[pn++]; // берем вершину из очереди
        cout << v + 1 << " ";
        for (int i = 0; i < __size1; i++) // перебираем все вершины, связные с V
            if (M1[v][i] && !visit[i])    // если  есть связь между
                                          // вершинами графа и вершина не пройдена
            {
                visit[i] = true; // отмечаем вершину I как пройденную
                OCH[pk++] = i;   // и добавляем в очередь
            } // if
    } // While
    cout << endl;
}

void width2(int v)
{
    int OCH[__size2 + 1];
    pn = 0;        // начало очереди
    pk = 0;        // конец очереди
    OCH[pk++] = v; // в очередь помещается исходная вершина
                   // OCH[pk]=v;pk=pk+1

    bool visit[__size2];
    for (int i = 0; i < __size2; i++)
        visit[i] = false;

    visit[v] = true; // вершина V посещена
    while (pn < pk)  // пока очередь не пуста
    {
        v = OCH[pn++]; // берем вершину из очереди
        cout << v + 1 << " ";
        for (int i = 0; i < __size2; i++) // перебираем все вершины, связные с V
            if (M2[v][i] && !visit[i])    // если  есть связь между
                                          // вершинами графа и вершина не пройдена
            {
                visit[i] = true; // отмечаем вершину I как пройденную
                OCH[pk++] = i;   // и добавляем в очередь
            } // if
    } // While
    cout << endl;
}

int main()
{
    int v;

    cout << "M1: " << endl;
    cout << "  1 2 3 4 5 6" << endl;
    for (int i = 0; i < __size1; i++)
    {
        cout << (i + 1) << " ";
        for (int j = 0; j < __size1; j++)
        {
            cout << M1[i][j];
            if (j + 1 < __size1)
            {
                cout << " ";
            }
        }
        cout << endl;
    }

    cout << "Please enter start value for first graph: ";
    cin >> v;
    width1(v - 1);

    cout << "M2: " << endl;
    cout << "  1 2 3 4 5" << endl;
    for (int i = 0; i < __size2; i++)
    {
        cout << (i + 1) << " ";
        for (int j = 0; j < __size2; j++)
        {
            cout << M1[i][j];
            if (j + 1 < __size2)
            {
                cout << " ";
            }
        }
        cout << endl;
    }

    cout << "Please enter start value for second graph: ";
    cin >> v;
    width2(v - 1);

    return 0;
}