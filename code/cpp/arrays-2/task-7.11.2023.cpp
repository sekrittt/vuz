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

int find_index(int *M, int len, int el)
{
	for (int i = 0; i < len; i++)
	{
		if (M[i] == el) return i;
	}
	return 0;
}

int main()
{
	srand(time(0));
	int n = (rand()%10 + 5) + 4;
	int *Arr;
	Arr = new int[n];
	for (int i = 0; i < n - 4; i++)
	{
		Arr[i] = rand()%100;
	}
	print_array(Arr, n-4);
	int K, i1, i2, v1, v2, tmp1 = 0, tmp2 = 0;
	cout << "Please enter K: ";
	cin >> K;
	cout << "1. Please enter the index (0-"<< n-5 << ") after which the item (K) will be exposed: ";
	cin >> i1;
	tmp1 = Arr[i1];
	for (int i = i1+1; i < n; i++)
	{
		tmp2 = Arr[i];
		Arr[i] = tmp1;
		tmp1 = tmp2;
	}
	Arr[i1+1] = K;
	cout << "Array address in memory: " << &Arr[0] << endl;
	print_array(Arr, n-3);
	cout << "2. Please enter the index (0-"<< n-4 << ") before which the item (K) will be exposed: ";
        cin >> i2;
	tmp1 = Arr[i2];
	for (int i = i2+1; i < n; i++)
	{
		tmp2 = Arr[i];
		Arr[i] = tmp1;
		tmp1 = tmp2;
	}
	Arr[i2] = K;
	print_array(Arr, n-2);
	cout << "3. Please enter the element (0-"<< n-3 << ") after which the item (K) will be exposed: ";
        cin >> v1;
	int i3 = find_index(Arr, n, v1);
        tmp1 = Arr[i3+1];
        for (int i = i3+1; i < n; i++)
        {
                tmp2 = Arr[i];
                Arr[i] = tmp1;
                tmp1 = tmp2;
        }
        Arr[i3+1] = K;
        print_array(Arr, n-1);
	cout << "4. Please enter the index (0-"<< n-2 << ") before which the item (K) will be exposed: ";
        cin >> v2;
	int i4 = find_index(Arr, n, v2);
        tmp1 = Arr[i4];
        for (int i = i4+1; i < n; i++)
        {
                tmp2 = Arr[i];
                Arr[i] = tmp1;
                tmp1 = tmp2;
        }
        Arr[i4] = K;
        print_array(Arr, n);
	delete []Arr;
	return 0;
}
