
#include <iostream>
#include <cmath>

using namespace std;
void main()
{
    double x, y;
    cout << "Please enter x: ";
    cin >> x;
    if (x >= 1.5)
    {
        y = sqrt(x / (x - 1));
    }
    else if (0.5 < x && x < 1.5)
    {
        y = (x * x) + 1;
    }
    else if (x <= 0.5)
    {
        y = 2 * x - 1;
    }
    cout << "Y = " << y << endl;
}
