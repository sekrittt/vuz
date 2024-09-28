#include <iostream>


using namespace std;

void sum (int a, int b, int c, int d) {
	cout << "Sum = " << (a/(double)b)+(c/(double)d) << endl;
}

double sub (int a, int b, int c, int d) {
	return (a/(double)b)-(c/(double)d);
}
double div_mul (double a, double b, double c, double d, double &M) {
	M = (a/(double)b)*(c/(double)d);
	double D = (a/(double)b)/(c/(double)d);
	return D;
}

void div_mul2 (double a, double b, double c, double d, double &M, double &D) {
	M = (a/(double)b)*(c/(double)d);
	D = (a/(double)b)/(c/(double)d);
}

int main()
{
	int a, b, c, d;
	double M, D, M2, D2;
	cout << "Please enter a, b, c and d: ";
	cin >> a >> b >> c >> d;
	sum(a,b,c,d);
	cout << "Sub = " << sub(a,b,c,d) << endl;
	D = div_mul(a,b,c,d, M);
	cout << "Mul (from div_mul function) = " << M << endl;
	cout << "Div = " << D << endl;
	div_mul2(a,b,c,d, M2, D2);
	cout << "Mul (from div_mul2 function) = " << M2 << endl;
	cout << "Div (from div_mul2 function) = " << D2 << endl;
	return 0;
}

