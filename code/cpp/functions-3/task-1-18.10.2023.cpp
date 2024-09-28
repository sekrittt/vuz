#include <iostream>
#include <cmath>

using namespace std;
double ch(int n)
{
    double ch = n + sqrt(n);
    return ch;
}

void main() {
    double X;
    X = (ch(25) / 11.2) + (ch(19) / 41.12) + (ch(48) / 12.5) + (ch(18) / 29.1);
    cout << "X = " << X << endl;
}
