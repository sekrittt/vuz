#include <iostream>
#include <ctime>

using namespace std;

long long int *fill_array(int len)
{
    long long int *M = new long long int[len];
    for (int i = 0; i < len; i++)
    {
        *(M + i) = rand() % 100;
    }
    return M;
}

void print_array(long long int *M, int len)
{
    cout << "{";
    for (int i = 0; i < len; i++)
    {
        cout << *(M + i);
        if (i < len - 1)
            cout << ", ";
    }
    cout << "}" << endl;
}

void print_even_array(long long int *M, int len)
{
    cout << "{";
    int c = 0;
    for (int i = 0; i < len; i++)
    {
        if (*(M + i) % 2 == 0)
        {
            if (c > 0 && i < len)
                cout << ", ";
            cout << *(M + i);
            c++;
        }
    }
    cout << "}" << endl;
}

long long int array_sum(long long int *M, int len)
{
    long long int s = 0;
    for (int i = 0; i < len; i++)
    {
        s += *(M + i);
    }
    return s;
}

long long int array_sum_odd(long long int *M, int len)
{
    long long int s = 0;
    for (int i = 0; i < len; i++)
    {
        if (i % 2 != 0)
        {
            s += *(M + i);
        }
    }
    return s;
}

long long int array_mul(long long int *M, int len)
{
    long long int m = *M;
    for (int i = 1; i < len; i++)
    {
        m *= *(M + i);
    }
    return m;
}

long long int *array_element_insert_after(long long int *M, int len, long long int el, int index)
{
    for (int i = len - 1; i > index; i--)
    {
        *(M + i + 1) = *(M + i);
    }
    *(M + index) = el;
    return M;
}

long long int *array_element_insert_before(long long int *M, int len, long long int el, int index)
{
    for (int i = len - 1; i >= index; i--)
    {
        *(M + i + 1) = *(M + i);
    }
    *(M + index) = el;
    return M;
}

int find_index(long long int *M, int len, long long int el)
{
    for (int i = 0; i < len; i++)
    {
        if (*(M + i) == el)
            return i;
    }
    return -1;
}

int main()
{
    srand(time(0));
    int len;
    cout << "Please enter array length: ";
    cin >> len;
    long long int *M = fill_array(len+2);
    cout << "Array: ";
    print_array(M, len);
    cout << "Array address (by pointer): " << M << ", (by index): " << &M[0] << endl;
    long long int s = array_sum(M, len);
    cout << "Array sum: " << s << endl;
    long long int m = array_mul(M, len);
    cout << "Array mul: " << m << endl;
    long long int s1 = array_sum_odd(M, len);
    cout << "Array sum of odd elements by index: " << s1 << endl;
    cout << "Array argv: " << s / (double)len << endl;
    cout << "Array (only even elements): ";
    print_even_array(M, len);

    int K, i1, v1;
    cout << "Please enter K: ";
    cin >> K;
    cout << "Please enter index: ";
    cin >> i1;
    cout << "Please enter element: ";
    cin >> v1;

    int i2 = find_index(M, len, v1);

    M = array_element_insert_after(M, len, K, i1);
    cout << "Array: ";
    print_array(M, len+1);
    M = array_element_insert_before(M, len+1, K, i2);
    cout << "Array: ";
    print_array(M, len+2);

    delete[] M;

    return 0;
}
