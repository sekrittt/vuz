#include <iostream>
#include <ctime>

using namespace std;

struct Node
{
    int D;
    Node *Next = NULL;
};

void list_print(Node *one)
{
    Node *el = one;
    while (el != NULL)
    {
        cout << "Address of " << (*el).D << " = " << el << " Next element address = " << (*el).Next << endl;
        el = (*el).Next;
    }
}

int main()
{
    srand(time(0));
    Node *one = new (Node);

    int len;
    cout << "Please enter enter length of list: ";
    cin >> len;
    (*one).D = rand() % 100;
    cout << "Address of " << (*one).D << " = " << one << " Next element address = " << (*one).Next << endl;
    Node *prev = one;
    for (int i = 1; i < len; i++)
    {
        Node *t = new (Node);
        (*t).D = rand() % 100;
        (*prev).Next = t;
        prev = t;
    }

    list_print(one);

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

    // Remove 3 elements after max
    Node *target_el = max_el;
    for (int i = 0; i < 4 && target_el != NULL; i++)
    {
        target_el = (*target_el).Next;
    }
    (*max_el).Next = target_el;

    list_print(one);

    return 0;
}