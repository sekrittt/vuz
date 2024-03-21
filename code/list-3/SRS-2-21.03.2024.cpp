#include <iostream>
#include <list>

using namespace std;

int main()
{
    list<int> numbers;
    int N;
    cout << "Please enter N: ";
    cin >> N;
    for (int i = 0; i < N; i++)
        i % 2 ? numbers.push_back(rand() % 100) : numbers.push_front(rand() % 100);

    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    int k;
    cout << "Please enter value which will be deleted: ";
    cin >> k;

    numbers.remove(k);

    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    cout << "List is empty? " << (numbers.empty() ? "Yes" : "No") << endl;

    int v, p;
    cout << "Please enter value and position: ";
    cin >> v >> p;
    auto pos = numbers.cbegin();
    for (int i = 0; i < p; i++, pos++)
        ;
    numbers.emplace(pos, v);

    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    return 0;
}