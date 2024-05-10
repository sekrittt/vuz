#include <iostream>

#include "Sort.hpp"
#include "CArray.hpp"

using namespace std;

bool filter_func(int element, int index, CArray<int> &array)
{
    return element < 100;
}

int map_func(int element, int index, CArray<int> &array)
{
    return element * 2;
}

int main()
{
    CArray<int> M;
    M.push(543);
    M.push(12);
    M.push(3);
    M.push(120);
    cout << M << endl;
    return 0;
}