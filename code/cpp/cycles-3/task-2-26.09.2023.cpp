#include <iostream>

using namespace std;
void main()
{
    int N, i = 0; // Variable Description and init cycle parameter
    cout << "Enter numbers count: ";
    cin >> N;
    for (; /*Condition*/ i < N;) // Cycle Header
    {
        int x;
        cout << "Enter number: ";
        cin >> x;
        if ((x % 3 == 0) || (x % 5 == 0))
        {
            cout << x << endl;
        }
        else
        {
            cout << "The value doesn't fit" << endl;
        }
        i++; // Modifications
    }
}
/*
Enter numbers count: 4
Enter number: 1
The value doesn't fit
Enter number: 3
3
Enter number: 5
5
Enter number: 15
15
*/
