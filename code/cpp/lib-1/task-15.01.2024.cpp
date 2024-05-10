#include "LIB.h"
#include <iostream>

using namespace std;

int main()
{
    int n;
    cout << "Please enter n: ";
    cin >> n;
    int *m = new int[n];

    array_fill_random(m, n);
    array_print(m, n);
    cout << endl;

    int v;
    cout << "Please select sort (1 - bubble, 2 - advanced bubble, 3 - quick sort): ";
    cin >> v;

    switch (v)
    {
    case 1:
    default:
        array_sort_bubble(m, n);
        break;
    case 2:
        array_sort_bubble_advanced(m, n);
        break;
    case 3:
        array_quick_sort(m, n, 0, n);
        break;
    }

    array_print(m, n);
    cout << endl;

    return 0;
}