//
#include <iostream>

using namespace std;
void main()
{
    float X_start, X_end, dx, eps, count = 1;
    float el1, el, sum = 0;
    cout << "Please enter X_start (X_start > 0.5), X_end (X_end > 0.5), dx and eps: ";
    cin >> X_start >> X_end >> dx >> eps;
    cout << "x |   ln x   | count" << endl;
    while (X_start < X_end)
    {
        el = ((X_start - 1) * count) / ((count + 1) * X_start);
        el1 = X_start;
        while (abs(el - el1) > eps)
        {
            count++;
            sum += el;
            el1 = el;
            el *= ((X_start - 1) * count) / ((count + 1) * X_start);
        }
        if (count > 2)
        {
            cout << X_start;
            cout << " | ";
            cout.precision(6);
            cout << fixed << el;
            cout.precision(0);
            cout << " | ";
            cout << count << endl;
        }
        else
        {
            cout << "Unreal for X = " << X_start << endl;
        }
        X_start += dx;
        count = 1;
    }
}
