#include <iostream>

using namespace std;

struct Node
{
    int D;
    Node *Next = NULL;
};

int main()
{
    Node *one = new (Node);

    int len;
    cout << "Please enter enter length of list: ";
    cin >> len;
    cout << "Please enter value of 1 element: ";
    cin >> (*one).D;
    Node *prev = one;
    for (int i = 1; i < len; i++)
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

    Node *el = one;
    Node *max_el = one;
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