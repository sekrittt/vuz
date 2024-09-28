#include <iostream>
#include <queue>
#include <stack>

using namespace std;

int main()
{
    char example[] = "Hello, world!";
    queue<char> Q;

    cout << "Queue is empty? ";
    if (Q.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;

    for (int i = 0; example[i] != '\0'; i++)
        Q.push(example[i]);

    cout << "Queue is empty? ";
    if (Q.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;

    char &sn = Q.front(); // ссылка на первый элемент очереди;
    char &sk = Q.back();  // ссылка на последний добавленный элемент
    cout << "First element of queue: " << sn << endl;
    cout << "Last element of queue: " << sk << endl;
    int t = Q.size(); // размер очереди
    cout << "Size of queue: " << t << endl;

    for (int i = 1; i <= t; i++)
    {
        sn = Q.front(); // ссылка на первый элемент очереди
        cout << sn;
        Q.pop(); // удаляем один элемент в очереди
    }
    cout << endl;

    cout << "Queue is empty? ";
    if (Q.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;

    stack<char> S;
    cout << "Stack is empty? ";
    if (S.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;

    for (int i = 0; example[i] != '\0'; i++)
        S.push(example[i]);

    cout << "Stack is empty? ";
    if (S.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;

    char &st = S.top(); // ссылка на первый элемент очереди;
    cout << "First element of stack: " << st << endl;
    t = S.size(); // размер очереди
    cout << "Size of stack: " << t << endl;

    for (int i = 1; i <= t; i++)
    {
        st = S.top(); // ссылка на первый элемент очереди
        cout << st;
        S.pop(); // удаляем один элемент в очереди
    }
    cout << endl;

    cout << "Stack is empty? ";
    if (S.empty())
        cout << "Yes" << endl;
    else
        cout << "No" << endl;
}