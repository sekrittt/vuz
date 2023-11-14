#include <iostream>

using namespace std;

template<typename T>
void print_array(T *M, int len)
{
        cout << "{";
        for (int i = 0; i < len; i++)
        {
                cout << M[i];
                if (i < len - 1) cout << ", ";
        }
        cout << "}" << endl;
}

template<typename T>
T *move_array_elements(T M[], int &len_M, int from, int len_move)
{
        T *arr = new T[len_M+len_move];
        for (int i = from; i < len_M; i++)
        {
                arr[i+len_move] = M[i];
        }
        for (int i = 0; i < from; i++)
        {
                arr[i] = M[i];
        }
	len_M += len_move;
        return arr;
}

template<typename T>
int find_index(T *M, int len, T el)
{
        for (int i = 0; i < len; i++)
        {
                if (M[i] == el) return i;
        }
        return -1;
}

template<typename T>
T array_sum(T M[], int len)
{
        T s = 0;
        for (int i = 0; i < len; i++)
        {
                s += M[i];
        }
        return s;
}

template<typename T>
double array_argv(T M[], int len)
{
        double a = 0;
        for (int i = 0; i < len; i++)
        {
                a+=M[i]/(double)len;
        }
        return a;
}

template<typename T>
bool includes(T M[], int len, T el)
{
	for (int i = 0; i < len; i++)
	{
		if (M[i] == el) return true;
	}
	return false;
}

int main()
{
	return 0;
}
