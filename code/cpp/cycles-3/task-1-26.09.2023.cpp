#include <iostream>

using namespace std;
void main()
{
    int fk = 1, N, i; // Variables Description and 'fk' init
    cout << "Enter number: ";
    cin >> N;
    // Variant 1
    for (/*Init*/ i = 1; /*Conditions*/ i <= N; /*Modifications*/ i++)
        fk *= i;
    cout << "V1 Factorial: " << fk << endl;
    // Variant 2
    for (int i = 1, fk = 1; i <= N; fk *= i++)
        ;
    cout << "V2 Factorial: " << fk << endl;
}
/*
Test #1:
    Enter number: 3
    V1 Factorial: 6
    V2 Factorial: 6
Test #2:
    Enter number: 4
    V1 Factorial: 24
    V2 Factorial: 24
Test #3:
    Enter number: 5
    V1 Factorial: 120
    V2 Factorial: 120
*/
