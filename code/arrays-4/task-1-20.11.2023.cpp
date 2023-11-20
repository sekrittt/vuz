#include <iostream>
#include <ctime>

using namespace std;

int *fill_array(int n)
{
    int *M = new int[n];
    for (int i = 0; i < n; i++)
    {
        *(M + i) = rand() % 100;
    }
    return M;
}

void print_array(int *M, int n)
{
    cout << "{";
    for (int i = 0; i < n; i++)
    {
        cout << *(M+i);
        if (i < n - 1)
            cout << ", ";
    }
    cout << "}" << endl;
}

void print_even_array(int *M, int n)
{
    cout << "{";
    int c = 0;
    for (int i = 0; i < n; i++)
    {
        if (*(M+i) % 2 == 0)
        {
            if (c > 0 && i < n)
                cout << ", ";
            cout << *(M+i);
            c++;
        }
    }
    cout << "}" << endl;
}

int array_sum(int *M, int n)
{
    int s = 0;
    for (int i = 0; i < n; i++)
    {
        s += *(M+i);
    }
    return s;
}

int array_sum_odd(int *M, int n)
{
    int s = 0;
    for (int i = 0; i < n; i++)
    {
        if (i%2 != 0)
        {
            s += *(M + i);
        }
    }
    return s;
}

long long int array_mul(int *M, int n)
{
    long long int m = *M;
    for (int i = 1; i < n; i++)
    {
        m *= *(M + i);
    }
    return m;
}

double array_argv(int *M, int n)
{
    double a = 0;
    for (int i = 0; i < n; i++)
    {
        a += *(M+i) / (double)n;
    }
    return a;
}

int main()
{
    srand(time(0));
    int n;
    cout << "Please enter array length: ";
    cin >> n;
    int *M = fill_array(n);
    cout << "Array: ";
    print_array(M, n);
    cout << "Array address (by pointer): " << M << ", (by index): " << &M[0] << endl;
    int s = array_sum(M, n);
    cout << "Array sum: " << s << endl;
    long long int m = array_mul(M, n);
    cout << "Array mul: " << m << endl;
    int s1 = array_sum_odd(M, n);
    cout << "Array sum of odd elements by index: " << s1 << endl;
    double a = array_argv(M, n);
    cout << "Array argv: " << a << endl;
    cout << "Array (only even elements): ";
    print_even_array(M, n);

    return 0;
}
