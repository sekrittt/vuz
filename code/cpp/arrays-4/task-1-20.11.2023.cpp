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
    for (int i = 0; i < n; i++)
        cout << "Address of element #" << i << ": " << &*(M + i) << ", " << &M[i] << endl;
    int s = array_sum(M, n);
    cout << "Array sum: " << s << endl;
    long long int m = array_mul(M, n);
    cout << "Array mul: " << m << endl;
    int s1 = array_sum_odd(M, n);
    cout << "Array sum of odd elements by index: " << s1 << endl;
    cout << "Array argv: " << s / (double)n << endl;
    cout << "Array (only even elements): ";
    print_even_array(M, n);
    delete[] M;
    return 0;
}
/*
Please enter array length: 10
Array: {60, 34, 52, 65, 28, 8, 20, 31, 18, 41}
Array address (by pointer): 0x55dcc05faad0, (by index): 0x55dcc05faad0
Address of element #0: 0x55dcc05faad0
Address of element #1: 0x55dcc05faad4
Address of element #2: 0x55dcc05faad8
Address of element #3: 0x55dcc05faadc
Address of element #4: 0x55dcc05faae0
Address of element #5: 0x55dcc05faae4
Address of element #6: 0x55dcc05faae8
Address of element #7: 0x55dcc05faaec
Address of element #8: 0x55dcc05faaf0
Address of element #9: 0x55dcc05faaf4
Array sum: 357
Array mul: 706712767488000
Array sum of odd elements by index: 179
Array argv: 35.7
Array (only even elements): {60, 34, 52, 28, 8, 20, 18}

Please enter array length: 10
Array: {3, 89, 75, 62, 84, 19, 2, 46, 26, 75}
Array address (by pointer): 0x5641599eead0, (by index): 0x5641599eead0
Address of element #0: 0x5641599eead0
Address of element #1: 0x5641599eead4
Address of element #2: 0x5641599eead8
Address of element #3: 0x5641599eeadc
Address of element #4: 0x5641599eeae0
Address of element #5: 0x5641599eeae4
Address of element #6: 0x5641599eeae8
Address of element #7: 0x5641599eeaec
Address of element #8: 0x5641599eeaf0
Address of element #9: 0x5641599eeaf4
Array sum: 481
Array mul: 355483575720000
Array sum of odd elements by index: 291
Array argv: 48.1
Array (only even elements): {62, 84, 2, 46, 26}
*/
