#include <iostream>

using namespace std;

struct Node
{
    int D;
    Node *Next = NULL;
};

int main()
{
    Node *head = new (Node);

    int len;
    cout << "Please enter enter length of list: ";
    cin >> len;
    cout << "Please enter value of 1 element: ";
    cin >> (*head).D;
    Node *prev = head;
    for (int i = 1; i < len; i++)
    {
        Node *t = new (Node);
        cout << "Please enter value of " << i + 1 << " element: ";
        cin >> (*t).D;
        (*prev).Next = t;
        prev = t;
        // Print elements
        Node *el = head;
        while (el != NULL)
        {
            cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
            el = (*el).Next;
        }
    }

    Node *el = head;
    Node *max_el = head;
    while (el != NULL)
    {
        // cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
        if ((*max_el).D < (*el).D)
        {
            max_el = el;
        }
        el = (*el).Next;
    }

    cout << "Max element: " << (*max_el).D << endl;

    return 0;
}