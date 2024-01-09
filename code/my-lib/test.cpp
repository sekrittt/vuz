#include <iostream>

#include "Sort.h"
#include "CArray.h"

using namespace std;

int main()
{
    CArray<int> M;
    M.push(543);
    M.push(12);
    M.push(3);
    M.push(120);
    cout << M << endl;
    M = Sort::sort_bubble(M);
    cout << M << endl;
    return 0;
}