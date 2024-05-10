//
#include <iostream>
#include <cmath>

using namespace std;
void main()
{
    int N, f_pr = 0, f_sl = 1;
    cout << "N=";
    cin >> N;
    cout << "Recurrent formula:" << endl;
    for (int i = 1; i <= N; i++)
    {
        cout << "f(" << i << ")=" << f_sl << endl;
        f_sl = f_pr + f_sl;
        f_pr = f_sl - f_pr;
    }
    cout << "Formula of element:" << endl;
    for (int i = 1; i <= N; i++) {
        cout << "f(" << i << ")=" << floor(pow((1+sqrt(5))/2, i)/sqrt(5) + 0.5) << endl;
    }
}
/*
N=8
Recurrent formula:
f(1)=1
f(2)=1
f(3)=2
f(4)=3
f(5)=5
f(6)=8
f(7)=13
f(8)=21
Formula of element:
f(1)=1
f(2)=1
f(3)=2
f(4)=3
f(5)=5
f(6)=8
f(7)=13
f(8)=21
*/
