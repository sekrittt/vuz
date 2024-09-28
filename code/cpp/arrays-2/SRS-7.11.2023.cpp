#include <iostream>
#include <ctime>

using namespace std;

void print_array(double *M, int len)
{
        cout << "{";
        for (int i = 0; i < len; i++)
        {
                cout << M[i];
                if (i < len - 1) cout << ", ";
        }
        cout << "}" << endl;
}

int sum(double M[], int len, double argv)
{
        int s = 0;
        for (int i = 0; i < len; i++)
        {
                if (M[i] > argv) s += M[i];
        }
        return s;
}

double argv(double M[], int len)
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
	int n, tmp1 = 0, tmp2 = 0;
	double *arr;
	cout << "Please enter n: ";
	cin >> n;
	arr = new double[n+2];
	for (int i = 0; i < n; i++) arr[i] = rand()%100;
	print_array(arr, n);
	double a = argv(arr, n);
	int s = sum(arr, n, a);
	//tmp1 = arr[0];
	//for (int i = 0; i < n+2; i++)
	//{
	//	tmp2 = arr[i];
	//	arr[i] = tmp1;
	//	tmp1 = tmp2;
	//}
	//tmp1 = arr[1];
	//for (int i = 1; i < n+2; i++)
	//{
	//	tmp2 = arr[i];
	//	arr[i] = tmp1;
	//	tmp1 = tmp2;
	//}
        for (int i = n-1; i > -1; i--)  arr[i+1]=arr[i];
	arr[0] = a;
	arr[1] = s;
	print_array(arr, n+2);
	return 0;
}

/*
Test #1:
Please enter n: 9
{4, 63, 4, 66, 92, 77, 76, 77, 13}
{52.4444, 451, 4, 63, 4, 66, 92, 77, 76, 77, 13}

Test #2:
Please enter n: 10
{10, 94, 10, 64, 68, 21, 10, 96, 66, 2}
{44.1, 388, 10, 94, 10, 64, 68, 21, 10, 96, 66, 2}

Test #3:
Please enter n: 4
{77, 59, 72, 80}
{72, 157, 77, 59, 72, 80}

Test #4:
Please enter n: 5
{50, 23, 74, 25, 40}
{42.4, 124, 50, 23, 74, 25, 40}

*/
