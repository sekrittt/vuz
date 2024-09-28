#include <iostream>

using namespace std;
void main()
{
    float N, success_shots_count = 0, R = 4;
    cout << "Enter count of shots: ";
    cin >> N;
    for (/*Parameter description and init*/int i = 0; /*Condition*/i < N; /*Modifications*/i++) // Cycle Header
    {
        float X, Y;
        cout << "Enter shot coords: ";
        cin >> X >> Y;
        if ((((X <= 0) && (Y <= 0)) && (X * X + Y * Y <= R*R)) || ((Y <= R - X) && (X >= 0) && (Y >= 0))) // Check shot in zone?
        {
            cout << "Successful shot!" << endl; // Text output
            success_shots_count++; // increment
        }
        else
        {
            cout << "Missed!" << endl; // Text output if shot out of zone
        }
    }
    cout << "Count of success shots: " << success_shots_count << ", from: " << N << endl;
    cout.precision(1);
    cout << fixed << "Percent: " << success_shots_count / N * 100 << "%" << endl;
}
/*
Test #1:
    Enter count of shots: 4
    Enter shot coords: 1 1
    Missed!
    Enter shot coords: 0.5 0.5
    Successful shot!
    Enter shot coords: -0.5 -0.5
    Successful shot!
    Enter shot coords: 0 0
    Successful shot!
    Count of success shots: 3, from: 4
    Percent: 75.0%
Test #2:
    Enter count of shots: 5
    Enter shot coords: 2 1
    Missed!
    Enter shot coords: -0.5 0.5
    Missed!
    Enter shot coords: 1 -1
    Missed!
    Enter shot coords: 0 0
    Successful shot!
    Enter shot coords: -0.5 -0.5
    Successful shot!
    Count of success shots: 2, from: 5
    Percent: 40.0%
*/
