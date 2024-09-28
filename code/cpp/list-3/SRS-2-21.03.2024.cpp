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
        i % 2 ? numbers.push_back(rand() % 100) : numbers.push_front(rand() % 100); // choose variant pushing

    // Print list
    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    int k;
    cout << "Please enter value which will be deleted: ";
    cin >> k;

    numbers.remove(k); // removing element by value

    // Print list
    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    cout << "List is empty? " << (numbers.empty() ? "Yes" : "No") << endl; // check list is empty or not

    int v, p;
    cout << "Please enter value and position: ";
    cin >> v >> p;
    auto pos = numbers.cbegin();
    for (int i = 0; i < p; i++, pos++) // move pointer
        ;
    numbers.insert(pos, v);

    // Print list
    cout << "List [" << numbers.size() << "] { ";
    for (int n : numbers)
        cout << n << " ";
    cout << "}" << endl;

    return 0;
}