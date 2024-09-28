#include <iostream>
#include <cmath>

using namespace std;

long int FAKT(long int A) {
    long int f = 1;

    for (int i = 0; i < A; f*=++i)
        ;
    return f;
}

int SUM() {
    long int sum = 0;
    for (int i = 0; sum < INT_MAX; sum+=FAKT(i++)) {
        cout << sum << endl;
    }
    return sum;
}

void main() {
    cout << "INT_MAX = " << INT_MAX << endl;
    cout << "Sum: " << SUM() << endl;
}
