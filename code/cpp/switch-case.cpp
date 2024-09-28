#include <iostream>
#include <cmath>

using namespace std;
int main()
{
    float a, b;
    char _operator;
    cout.precision(20);
    cout << "Please enter a, operator (+, -, *, /, ^) and b: ";
    cin >> a >> _operator >> b;
    // What? This a mini calculator?
    switch (_operator)
    {
    case '+':
        cout << a << " + " << b << " = " << a + b << endl;
        break;
    case '-':
        cout << a << " - " << b << " = " << a - b << endl;
        break;
    case '*':
        cout << a << " * " << b << " = " << a * b << endl;
        break;
    case '/':
        if (b == 0)
            cout << "Division by zero!" << endl;
        else
            cout << a << " / " << b << " = " << a / b << endl;
        break;
    case '^':
        cout << a << " ^ " << b << " = " << pow(a, b) << endl;
        break;
    default:
        cout << "Unknown operator \"" << _operator << "\"";
        break;
    }
    return 0;
}
