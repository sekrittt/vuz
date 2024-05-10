#include <iostream>
#include <cmath>

using namespace std;

float F(float X, int N)
{
    if (N == 0)
        return 1;
    if (N < 0)
        return 1 / F(X, abs(N));
    return X * F(X, N - 1);
}

void main()
{
    float X;
    int N;
    cout << "Please enter X and N: ";
    cin >> X >> N;
    cout << X << "^" << N << " = " << F(X, N) << endl;
}
