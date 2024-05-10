#include <iostream>
#include <ctime>

using namespace std;
void  slovo2(int);

void slovo1(int n)
{
	if (n > 0) {
		cout << "gav1 ";
		slovo2(n);
	}
}


void slovo2(int n)
{
	cout << "gav2" << endl;
	slovo1(n-1);
}

int main()
{
	srand(time(0));
	int t = rand()%(10-4+1) + 4;
	slovo1(t);
	return 0;
}
