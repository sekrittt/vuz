// 
#include <iostream>
#include <cmath>

using namespace std;
void main()
{
    int n = 0;
    double t, el, sum = 0, alpha = 0.5;
    cout << "Please enter t: ";
    cin >> t;
    do
    {
        n++;
        el = sin(n * alpha) / (n * n);
        sum += el;
    } while (t < el);
    cout << "Sum: " << sum << ", "
         << "Count: " << n - 1 << endl;
}
