#include <iostream>

using namespace std;
void main()
{
    int N, sum = 0, fk = 1;
    cout << "Please enter number: ";
    cin >> N;
    for (int i = 0; i <= N; i++)
    {
        for (int j = 1; j <= i; j++)
        {
            fk *= j;
        }
        sum += fk;
        fk = 1;
    }
    // for (int i = 0; i <= N; i++, sum += fk, fk = 1)
    //     for (int j = 1; j <= i; fk *= j++)
    //         ;
    cout << "Sum: " << sum << endl;
}
/*
Test #1:
    Please enter number: 4
    Sum: 34
Test #2:
    Please enter number: 3
    Sum: 10
*/
