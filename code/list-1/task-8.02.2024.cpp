#include <iostream>

using namespace std;

struct Node
{
    int D;
    Node *Next = NULL;
};

void list_print(Node *head)
{
    Node *el = head;
    while (el != NULL)
    {
        cout << "Address of " << (*el).D << " = " << el << "Next element address = " << (*el).Next << endl;
    }
}

int main()
{
    Node *head = new (Node);
    cout << (*head).Next << endl;
    (*head).D = 10;
    Node *el = head;
    while (*el != NULL)
    {
        cout << "Address of " << (*el).D << " = " << el << "Next element address = " << (*el).Next << endl;
    }
    return 0;
}