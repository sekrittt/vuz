#include <iostream>
#include <cmath>

using namespace std;

float x;
float y;
float Sn(float);
float Cn(float n)
{
	if (n <= 1) return x;
	return Cn(n-1)*x - Sn(n-1)*y;
}

float Sn(float n)
{
	if (n <= 1) return y;
	return Sn(n-1)*x + Cn(n-1)*y;
}

int main()
{
	float s1, c1, s, c, n;
	cout << "Enter x(x^2 < 1) and n: ";
	cin >> x >> n;
	y = sqrt(1 - x*x);
	s1 = y;
	c1 = x;
	cout << 1 << ": s=" << s1 << " c=" << c1 << " Sn=" << Sn(1) << " Cn=" << Cn(1) << endl;
	for (int i = 2; i <= n; i++)
	{
		s = s1 * x + c1 * y;
		c = c1 * x - s1 * y;
		s1 = s;
		c1 = c;
		cout << i << ": s=" << s << " c=" << c << " Sn=" << Sn(i) << " Cn=" << Cn(i) << endl;
	}
	return 0;
}
/*
Test 1:
	Enter x(x^2 < 1) and n: 0.5 6
	1: 0.866025 0.5 0.866025 0.5
	2: 0.866025 -0.5 0.866025 -0.5
	3: 0 -1 0 -1
	4: -0.866025 -0.5 -0.866025 -0.5
	5: -0.866025 0.5 -0.866025 0.5
	6: 0 1 0 1
*/
