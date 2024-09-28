#include <iostream>
#include <fstream>
#include <cmath>

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

int sum(int M[], int len)
{
        int s = 0;
	bool flag = false;
        for (int i = 0; i < len; i++)
        {
		if (flag) s += abs(M[i]);
                if (M[i] < 0) flag = true;
        }
        return s;
}

long long mul(int M[], int len)
{
        long long m = 1;
        for (int i = 0; i < len; i++)
        {
                if (M[i] > 5) m *= M[i];
        }
        return m;
}



int main()
{
	fstream f;
	f.open("file.txt", ios::in);
	const int N5 = 10;
	int MASSIV_5[N5];
	for (int i = 0; i < N5; i++)
	{
		f >> MASSIV_5[i];
	}
	print_array(MASSIV_5, N5);
	int S5 = sum(MASSIV_5, N5);
	long long P5 = mul(MASSIV_5, N5);
	cout << "S5 = " << S5 << endl;
	cout << "P5 = " << P5 << endl;
	f.close();
	return 0;
}

/*
Test:
{676, -524, 482, 59, -300, 53, 62, -3, -343, 674}
S5 = 1976
P5 = 42576818035232

*/
