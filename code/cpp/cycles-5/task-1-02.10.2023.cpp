// 
#include <iostream>
#include <cmath>

using namespace std;
void main()
{
    int i = 1, n, step = 4, sign = 1;
    double el, t = 0.25, s = 0;
    cout << "Please enter n: ";
    cin >> n;
    do
    {
        cout << "1/" << step << " ";
        step *= 4;
    } while (++i <= n);
    cout << endl;
    step = 4;
    do
    {
        el = 1.0 / step;
        s += sign * el;
        sign *= -1;
        step *= 4;
    } while (t < el);
    cout << "Sum: " << s << endl;
}
