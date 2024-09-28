#include <iostream>
#include <ctime>
#include "LIB.h"

using namespace std;
void array_print(int *m, int n)
{
    cout << "Array [" << n << "] {";
    for (int i = 0; i < n; i++)
    {
        cout << *(m + i);
        if (i < n - 1)
            cout << ", ";
    }
    cout << "}";
}

void array_fill_random(int *m, int n)
{
    srand(time(0));
    int el = rand() % 100;
    for (int i = 0; i < n; i++)
    {
        *(m + i) = el;
        el = rand() % 100;
    }
}

void array_sort_bubble(int *m, int n)
{
    int tmp;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            if (*(m + j) > m[j + 1])
            {
                tmp = *(m + j);
                *(m + j) = *(m + j + 1);
                *(m + j + 1) = tmp;
            }
        }
    }
}
void array_sort_bubble_advanced(int *m, int n) {
    int left = 0;
    int right = n - 1;
    int j = 0, k = n;
    int t;
    do
    {
        for (j = left; j < right; j++)
        {
            if (*(m + j) > *(m + j + 1))
            {
                t = *(m + j);
                *(m + j) = *(m + j + 1);
                *(m + j + 1) = t;
                k = j;
            }
        }
        right = k;
        for (j = right; j > left; j--)
        {
            if (*(m + j - 1) > *(m + j))
            {
                t = *(m + j);
                *(m + j) = *(m + j - 1);
                *(m + j - 1) = t;
                k = j;
            }
        }
        left = k;
    } while (left < right);
}
void array_quick_sort(int *m, int n, int LG, int PG)
{
    int i = LG, j = PG;
    int X = *(m + ((LG + PG) / 2));

    while (i <= j)
    {
        while (X > *(m + i))
            ++i;
        while (*(m + j) > X)
            --j;
        if (i <= j)
        {
            int t;
            t = *(m + i);
            *(m + i) = *(m + j);
            *(m + j) = t;
            ++i;
            --j;
        }
    }

    if (LG < j)
        array_quick_sort(m, n, LG, j);
    if (i < PG)
        array_quick_sort(m, n, i, PG);
}