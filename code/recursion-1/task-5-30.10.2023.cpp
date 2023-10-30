#include <iostream>
#include <cmath>

using namespace std;
int F1(int);
int F2(int);

int F1(int number)
{
    cout << "F1(" << number << ") -> ";
    if (number == 0)
        return 2;
    else
    {
        int R_F1 = F2(abs(number) - 1);
        return R_F1;
    }
}
int F2(int number)
{
    cout << "F2(" << number << ") -> ";
    if (number == 0)
        return 1;
    else
    {
        int R_F2 = F1(abs(number) - 1);
        return R_F2;
    }
}

int main()
{
    int n;
    cout << "Please enter n: ";
    cin >> n;
    cout << F1(n) << endl << endl << F2(n) << endl;
    return 0;
}
