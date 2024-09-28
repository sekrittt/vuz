#include <iostream>

using namespace std;
void main()
{
    int r = 5, c = 5;
    float s = 4.1, step = 0.2;
    // cout << "Please enter rows and columns count: ";
    // cin >> r >> c;
    for (/*Init*/ int i = 0; /*Condition*/ i < r; /*Modification*/ i++) // Outer cycle header
    {
        for (/*Init*/ int j = 0; /*Condition*/ j < c; /*Modification*/ j++) // Inner cycle header
        {
            cout << s << " ";
        }
        cout << endl;
        s += step;
    }
}
/*
Please enter rows and columns count: 5 5
4.1 4.1 4.1 4.1 4.1
4.3 4.3 4.3 4.3 4.3
4.5 4.5 4.5 4.5 4.5
4.7 4.7 4.7 4.7 4.7
4.9 4.9 4.9 4.9 4.9
*/
