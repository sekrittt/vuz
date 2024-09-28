#include <iostream>
#include <cmath>

using namespace std;

void RectPS(float x1, float y1, float x2, float y2, float &P, float &S) {
    float a = abs(x1 - x2);
    float b = abs(y1 - y2);
    P = 2 * (a + b);
    S = a * b;
}

void main () {
    float x1, x2, y1, y2, S, P;
    cout << "Please enter x1, y1, x2 and y2: ";
    cin >> x1 >> y1 >> x2 >> y2;
    RectPS(x1, y1, x2, y2, P, S);
    cout << "P = " << P << ", S = " << S << endl;
}
/*
Please enter x1, y1, x2 and y2: 1 1 4 4
P = 12, S = 9
*/
