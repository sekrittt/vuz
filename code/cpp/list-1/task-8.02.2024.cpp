#include <iostream>

using namespace std;

struct Node
{
    int D;
    Node *Next = NULL;
};

int main()
{
    Node *one = new (Node); // first node of list
    cout << "Address of pointer: " << &one << " Value: " << one << endl;
    int len;
    cout << "Please enter enter length of list: ";
    cin >> len;
    cout << "Please enter value of 1 element: ";
    cin >> (*one).D;
    Node *el = one;
    while (el != NULL)
    {
        cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
        el = (*el).Next;
    }
    Node *prev = one;
    for (int i = 1; i < len; i++) // filling list
    {
        Node *t = new (Node);
        cout << "Please enter value of " << i + 1 << " element: ";
        cin >> (*t).D;
        (*prev).Next = t;
        prev = t;
        // Print elements
        Node *el = one;
        while (el != NULL)
        {
            cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
            el = (*el).Next;
        }
    }

    // Print elements
    cout << "List: " << endl;
    el = one;
    while (el != NULL)
    {
        cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
        el = (*el).Next;
    }

    // Average
    int sum = 0;
    el = one;
    while (el != NULL)
    {
        sum += (*el).D;
        el = (*el).Next;
    }
    cout << "Average: " << sum / len << endl;

    // Remove 2 first elements
    if (len > 2)
    {
        for (int i = 0; i < 2; i++)
        {
            Node *temp = one;  // Создаём временную переменную для хранения ссылки на начало списка
            one = (*one).Next; // Устанавливаем в переменную one адрес на следующий элемент
            delete temp;       // Освобождаем память
        }
        // Print elements
        cout << "List after delete 2 first elements: " << endl;
        Node *el = one;
        while (el != NULL)
        {
            cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
            el = (*el).Next;
        }
    }
    return 0;
}
/*
Please enter enter length of list: 5
Please enter value of 1 element: 1
Address of 1 = 0x55555556aeb0 Next element address = 0
Please enter value of 2 element: 2
Address of 1 = 0x55555556aeb0 Next element address = 0x55555556b6f0
Address of 2 = 0x55555556b6f0 Next element address = 0
Please enter value of 3 element: 3
Address of 1 = 0x55555556aeb0 Next element address = 0x55555556b6f0
Address of 2 = 0x55555556b6f0 Next element address = 0x55555556b710
Address of 3 = 0x55555556b710 Next element address = 0
Please enter value of 4 element: 4
Address of 1 = 0x55555556aeb0 Next element address = 0x55555556b6f0
Address of 2 = 0x55555556b6f0 Next element address = 0x55555556b710
Address of 3 = 0x55555556b710 Next element address = 0x55555556b730
Address of 4 = 0x55555556b730 Next element address = 0
Please enter value of 5 element: 5
Address of 1 = 0x55555556aeb0 Next element address = 0x55555556b6f0
Address of 2 = 0x55555556b6f0 Next element address = 0x55555556b710
Address of 3 = 0x55555556b710 Next element address = 0x55555556b730
Address of 4 = 0x55555556b730 Next element address = 0x55555556b750
Address of 5 = 0x55555556b750 Next element address = 0
List:
Address of 1 = 0x55555556aeb0 Next element address = 0x55555556b6f0
Address of 2 = 0x55555556b6f0 Next element address = 0x55555556b710
Address of 3 = 0x55555556b710 Next element address = 0x55555556b730
Address of 4 = 0x55555556b730 Next element address = 0x55555556b750
Address of 5 = 0x55555556b750 Next element address = 0
Average: 3
List after delete 2 first elements:
Address of 3 = 0x55555556b710 Next element address = 0x55555556b730
Address of 4 = 0x55555556b730 Next element address = 0x55555556b750
Address of 5 = 0x55555556b750 Next element address = 0
*/