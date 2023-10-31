#include <iostream>
#include <cmath>

using namespace std;

int x;
int y;
int Sn(int);
int Cn(int n)
{
	if (n <= 1) return x;
	return Cn(n-1)*x - Sn(n-1)*y;
}

int Sn(int n)
{
	if (n <= 1) return y;
	return Sn(n-1)*x + Cn(n-1)*y;
}

int main()
{
	int n;
	cout << "Enter x(x^2 < 1) and n: ";
	cin >> x >> n;
	y = sqrt(1 - x*x);
	cout << Cn(n) << endl << Sn(n) << endl;;
	return 0;
}
