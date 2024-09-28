#include <iostream>

using namespace std;
int main()
{
    float x, y, point;
    int kol = 0;
    cout << "Please enter coords of the shot: ";
    cin >> x >> y;
    point = x * x + y * y;
    if (point < 1)
        kol = 2;
    else if (point < 4)
        kol = 1;
    else
        kol = 0;
    cout << "Score: " << kol;
    return 0;
}
