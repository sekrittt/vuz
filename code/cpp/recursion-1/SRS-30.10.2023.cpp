#include <iostream>

using namespace std;


bool isEven(int);
int toBin(int n)
{
	if (n == 0) {
		return 0;
	}
	return (n%2) + 10 * toBin(n/2);
}

int countOnes(int b)
{
	if (b == 0) {
		return 0;
	}
	return isEven(b/10) + (b%10);
}

bool isEven(int b)
{
	if (b == 0) {
		return true;
	}
	int g = countOnes(b);
	return g%2 == 1;
}

int main()
{
	int n;
	cout << "Please enter n: ";
	cin >> n;
	int b = toBin(n);
	cout << isEven(b) << endl;
	return 0;
}
