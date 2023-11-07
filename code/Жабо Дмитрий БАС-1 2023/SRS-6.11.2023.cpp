//Жабо Дмитрий БАС-1 Вариант 5
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

int sum(int M[], int len) // Function for calculate sum of elements after first negative by value element
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

long long prod(int M[], int len) // Function for calculate product
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
	fstream f; // File stream variable description
	f.open("file.txt", ios::in); // Open file
	const int N5 = 10; // Array size
	int MASSIV_5[N5]; // Array description
	for (int i = 0; i < N5; i++)
	{
		f >> MASSIV_5[i]; // Read from file and write to i-element of array
	}
	print_array(MASSIV_5, N5); // Output array
	int S5 = sum(MASSIV_5, N5); // Calculate elements sum of array
	long long P5 = prod(MASSIV_5, N5); // Calculate elements product of array
	cout << "S5 = " << S5 << endl;
	cout << "P5 = " << P5 << endl;
	f.close(); // Close file
	return 0;
}

/*
Test:
{676, -524, 482, 59, -300, 53, 62, -3, -343, 674}
S5 = 1976
P5 = 42576818035232

*/
