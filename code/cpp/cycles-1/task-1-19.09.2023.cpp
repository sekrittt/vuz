#include <iostream>

using namespace std;
void main()
{
    cout.precision(15);                           //
    float Y = 0.1, H;                             // Variable description and init Y variable
    cout.width(22);                               //
    cout << "Y  |  H" << endl;                    //
    cout.width(22);                               //
    cout << "-----------------" << endl;          //
    while (Y < 0.21)                              // Header of cycle
    {                                             //
        H = 2 * (Y * Y) + 4 * Y - 0.3;            //
        cout.width(5);                            //
        cout << fixed << Y << " | " << H << endl; //
        Y += 0.01;                                // Set new value to parameter
    }                                             //
}
// 0.100000001490116 | 0.120000019669533
