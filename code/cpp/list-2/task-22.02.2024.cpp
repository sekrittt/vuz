#include <iostream>
#include <ctime>

using namespace std;

struct Node
{
    int data;
    Node *next;
};

void list_print(Node *head)
{
    Node *cur = (*head).next;
    cout << "List [" << (*head).data << "] { ";
    while (cur != NULL)
    {
        cout << (*cur).data;
        if ((*cur).next != NULL)
        {
            cout << ", ";
        }
        cur = (*cur).next;
    }
    cout << " }" << endl;
}

void list_insert(Node *head, int value, int after_value)
{
    Node *cur = (*head).next;
    while (cur != NULL && (*cur).data != after_value)
    {
        cur = (*cur).next;
    }
    if (cur == NULL)
    {
        return;
    }
    Node *tmp = new (Node);
    (*tmp).data = value;
    (*tmp).next = (*cur).next;
    (*cur).next = tmp;
}

int main()
{
    srand(time(0));
    Node *head = new (Node);
    int N;
    cout << "Please enter N: ";
    cin >> N;
    (*head).data = N;
    (*head).next = NULL;
    Node *prev = head;
    Node *first = new (Node);
    (*first).next = NULL;
    (*first).data = rand() % 100;
    (*head).next = first;

    for (int i = 1; i < N; i++)
    {
        Node *tmp = new (Node);
        (*tmp).next = NULL;
        (*tmp).data = rand() % 100;

        (*tmp).next = (*head).next;
        (*head).next = tmp;
    }
    list_print(head);
    int v;
    cout << "Please enter value after insert 1000: ";
    cin >> v;
    list_insert(head, 1000, v);
    list_print(head);
    return 0;
}