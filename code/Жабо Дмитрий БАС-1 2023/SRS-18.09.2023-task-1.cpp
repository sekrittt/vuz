// Жабо Дмитрий БАС-1 Вариант 5
#include <iostream> // Include "iostream" lib

using namespace std;
void main()
{
    double x, y;                                              // Variable description
    cout << "Please enter coords (x, y) of point: ";          // Write text to stream
    cin >> x >> y;                                            // Read from stream and set values of x and y
    bool t = (x * x + y * y <= 1) & !(x < 0);                 // Check that point with coords (x, y) in zone
    if (t)                                                    //
        cout << "t = " << t << "; Point in zone" << endl;     // If point in zone text output
    else                                                      //
        cout << "t = " << t << "; Point not in zone" << endl; // If point not in zone text output
}
