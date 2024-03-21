#include <iostream>
#include <queue>
#include <stack>
#include <locale>
using namespace std;

int main()
{
    queue<char> Q;
    cout << "Очередь пуста?";
    if (Q.empty())
        cout << "Да " << Q.empty() << endl;
    else
        cout << "Нет " << Q.empty() << endl;
    Q.push('e');
    Q.push('x');
    Q.push('a');
    Q.push('m');
    Q.push('p');
    Q.push('l');
    Q.push('e');
    cout << "Очередь пуста?";
    if (Q.empty())
        cout << "Да" << endl;
    else
        cout << "Нет" << endl;
    char &sn = Q.front(); // ссылка на первый элемент очереди;
    char &sk = Q.back();  // ссылка на последний добавленный элемент
    cout << "Первый элемент: " << sn << endl;
    cout << "Последний элемент" << sk << endl;
    int t = Q.size(); // размер очереди
    cout << "Кол-во элементов в очереди: " << t << endl;
    for (int i = 1; i <= t; i++)
    {
        sn = Q.front(); // ссылка на первый элемент очереди
        cout << sn;
        Q.pop(); // удаляем один элемент в очереди
    }
    cout << endl;
    cout << "Очередь пуста?";
    if (Q.empty())
        cout << "Да " << Q.empty() << endl;
    else
        cout << "Нет " << Q.empty() << endl;

    stack<char> S;
    cout << "Стек пуст?";
    if (S.empty())
        cout << "Да " << S.empty() << endl;
    else
        cout << "Нет " << S.empty() << endl;
    S.push('e');
    S.push('x');
    S.push('a');
    S.push('m');
    S.push('p');
    S.push('l');
    S.push('e');
    cout << "Стек пуст?";
    if (S.empty())
        cout << "Да " << S.empty() << endl;
    else
        cout << "Нет " << S.empty() << endl;
    char &st = S.top(); // ссылка на первый элемент очереди;
    cout << "Первый элемент: " << st << endl;
    t = S.size(); // размер очереди
    cout << "Кол-во элементов в очереди: " << t << endl;
    for (int i = 1; i <= t; i++)
    {
        st = S.top(); // ссылка на первый элемент очереди
        cout << st;
        S.pop(); // удаляем один элемент в очереди
    }
    cout << endl;
    cout << "Стек пуст?";
    if (S.empty())
        cout << "Да " << S.empty() << endl;
    else
        cout << "Нет " << S.empty() << endl;
}