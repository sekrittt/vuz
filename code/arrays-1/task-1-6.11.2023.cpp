#include <iostream>
#include <ctime>

using namespace std;

void print_array(int *M, int len)
{
	cout << "{";
	for (int i = 0; i < len; i++)
	{
		cout << M[i];
		if (i < len - 1) cout << ", ";
	}
	cout << "}" << endl;
}

void print_even_array(int *M, int len)
{
	cout << "{";
	int c = 0;
	for (int i = 0; i < len; i++)
	{
		if (M[i]%2 == 0)
		{
			if (c > 0 && i < len) cout << ", ";
			cout << M[i];
			c++;
		}
	}
	cout << "}" << endl;
}
int sum(int M[], int len)
{
	int s = 0;
	for (int i = 0; i < len; i++)
	{
		s += M[i];
	}
	return s;
}

int sum_odd(int M[], int len)
{
	int s = 0;
	for (int i = 1; i < len; i+=2)
	{
		s += M[i];
	}
	return s;
}

int mul(int M[], int len)
{
	int m = 1;
	for (int i = 0; i < len; i++)
	{
		m *= M[i];
	}
	return m;
}

double argv(int M[], int len)
{
	double a = 0;
	for (int i = 0; i < len; i++)
	{
		a+=M[i]/(double)len;
	}
	return a;
}

int main()
{
	srand(time(0));
	const int len = 5;
	int M[len];
	for (int i = 0; i < len; i++) M[i] = rand()%4 + 1;
	cout << "Elements of array: ";
	print_array(M, len);
	cout << "Even elements of array: ";
	print_even_array(M, len);
	cout << "Sum: " << sum(M, len) << endl;
	cout << "Sum odd elements: " << sum_odd(M, len) << endl;
	cout << "Mul: " << mul(M, len) << endl;
	cout << "Argv: " << argv(M, len) << endl;
	return 0;
}

/*

Test #1:
Elements of array: {4, 8, 8, 8, 1}
Even elements of array: {4, 8, 8, 8}
Sum: 29
Sum odd elements: 16
Mul: 2048
Argv: 5.8

Test #2:
Elements of array: {4, 2, 0, 8, 7}
Even elements of array: {4, 2, 0, 8}
Sum: 21
Sum odd elements: 10
Mul: 0
Argv: 4.2

*/
