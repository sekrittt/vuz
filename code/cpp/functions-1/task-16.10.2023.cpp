#include <iostream>

using namespace std;
void F1() {
	int a, F=1;
	cout << "Please enter number: ";
	cin >> a;
	for (int i = 0; i < a; F*=++i);
	cout << "F1 = " << F << endl;
}

void F2(int a) {
	int F = 1;
	for (int i = 0; i < a; F*=++i);
	cout << "F2 = " << F << endl;
}


int F3(int a) {
	int F = 1;
	for (int i = 0; i < a; F*=++i);
	return F;
}

int _tmain(int argc, _TCHAR* argv[])
{
	F1();
	// return from F1
	int a;
	cout << "Please enter number: ";
	cin >> a;
	F2(a);
	// return from F2
	cout << "Please enter number: ";
	cin >> a;
	int F = F3(a); // return from F3
	cout << "F3 = " << F << endl;
	return 0;
}

