#include <locale>
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");
    for (int i = 0; i < 4; i++)
    {
        for (int j = i; j >= 0; j--)
        {
            cout << 4 - j << " " << 4 - i << " ";
        }
        cout << endl;
    }
}
