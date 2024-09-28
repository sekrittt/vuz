#include <iostream>
#include <cmath>

using namespace std;
void main() {
    float sum = 0, el = 1; // el - start element
    int k;
    cout << "Please enter count of elements: ";
    cin >> k;
    for (float n = 0; n < k;) {
        sum += el;
        cout << n << " element = " << el << endl;
        n++;
        el *= ((2 * n - 1) * -1) / (4 * (2 * n + 1));
    }
    cout << "Sum: " << sum << endl;
}
/*
Please enter count of elements: 4
0 element = 1
1 element = -0.0833333
2 element = 0.0125
3 element = -0.00223214
Sum: 0.926935

Please enter count of elements: 6
0 element = 1
1 element = -0.0833333
2 element = 0.0125
3 element = -0.00223214
4 element = 0.000434028
5 element = -8.87784e-05
Sum: 0.92728
*/
