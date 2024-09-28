#include <iostream>

using namespace std;
void main()
{
    int N, i = 0, sum = 0, fact = 1; // Variable description and init i variable
    cout << "Enter value for N: ";   //
    cin >> N;
    while (i <= N)
    {
        sum += fact;
        fact *= ++i;
    }
    cout << "Sum: " << sum;
}
