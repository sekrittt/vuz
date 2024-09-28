#include <iostream>
#include <cmath>

using namespace std;
void main()
{
    int n; // Description n variable
    float dx, fx = 0, el = 1; // Description and init variables: dx - step of x; fx - F(x); el - current element of sequence
    cout << "Enter dx: ";
    cin >> dx;
    cout << "Enter n: ";
    cin >> n;
    for (float x = 0.05; x <= 0.96; x += dx, fx = 0, el = 1) // Cycle by x from 0.05 to 0.95
    {
        for (float i = 0; i < n;) // Cycle by n, calculate elements and sum for current x
        {
            fx += el; // Calculate sum
            // cout << i << " element = " << el << endl;
            i++; // Modification
            el *= x / (2 * i + 1); // Calculate element
        }
        cout.precision(2);
        cout << fixed << "F(" << x << ") = ";
        cout.precision(5);
        cout << fixed << fx << endl;
    }
}
/*
Enter dx: 0.05
Enter n: 4
F(0.05) = 1.01683
F(0.10) = 1.03401
F(0.15) = 1.05153
F(0.20) = 1.06941
F(0.25) = 1.08765
F(0.30) = 1.10626
F(0.35) = 1.12524
F(0.40) = 1.14461
F(0.45) = 1.16437
F(0.50) = 1.18452
F(0.55) = 1.20508
F(0.60) = 1.22606
F(0.65) = 1.24745
F(0.70) = 1.26927
F(0.75) = 1.29152
F(0.80) = 1.31421
F(0.85) = 1.33735
F(0.90) = 1.36094
F(0.95) = 1.38500
*/
