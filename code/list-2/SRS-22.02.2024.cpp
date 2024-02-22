#include <iostream>

using namespace std;

struct Node
{
    string surname;
    int length = 1;
    int index = 0;
    Node *next = NULL;
};

void list_print(Node *head)
{
    Node *cur = (*head).next;
    cout << "Head length: " << (*head).length << " index insert: " << (*head).index << endl;
    cout << "List [" << (*head).length << "] { ";
    while (cur != NULL)
    {
        cout << (*cur).surname;
        if ((*cur).next != NULL)
        {
            cout << ", ";
        }
        cur = (*cur).next;
    }
    cout << " }" << endl;
}

void clist_print(Node *head)
{
    Node *cur = (*head).next;
    cout << "Head length: " << (*head).length << " index insert: " << (*head).index << endl;
    cout << "Cycle List [" << (*head).length << "] { ";
    do
    {
        cout << (*cur).surname;
        if ((*cur).next != head)
        {
            cout << ", ";
        }
        cur = (*cur).next;
    } while (cur != (*head).next);
    cout << " }" << endl;
}

void clist_print_even(Node *head)
{
    Node *cur = (*head).next;
    cout << "Head length: " << (*head).length << " index insert: " << (*head).index << endl;
    cout << "Cycle List Even [" << (int)((*head).length / 2) + 1 << "] { ";
    int c = 0;
    do
    {
        if (c % 2 == 0)
        {
            cout << (*cur).surname;
            if ((*cur).next != (*head).next)
            {
                cout << ", ";
            }
        }
        cur = (*cur).next;
        c++;
    } while (cur != (*head).next);
    cout << " }" << endl;
}

void clist_print_double(Node *head)
{
    Node *cur = (*head).next;
    cout << "Head length: " << (*head).length << " index insert: " << (*head).index << endl;
    cout << "Cycle List Double [" << (*head).length * 2 << "] { ";
    int c = 0;
    do
    {
        cout << (*cur).surname;
        if ((*cur).next != (*head).next)
        {
            cout << ", ";
        }
        else if (c == 0)
        {
            c++;
            cout << ", " << (*(*cur).next).surname << ", ";
            cur = (*cur).next;
        }
        cur = (*cur).next;
    } while (cur != (*head).next);
    cout << " }" << endl;
}

int main()
{
    Node head;
    int l;
    cout << "Please enter list length: ";
    cin >> l;
    Node *prev = &head;
    for (int i = 0; i < l; i++)
    {
        head.length = i + 1;
        head.index = i;
        (*prev).next = new (Node);
        cout << "Please enter surname: ";
        cin >> (*(*prev).next).surname;
        prev = (*prev).next;
        list_print(&head);
    }

    // Cycle list
    Node *last_element = &head;
    while ((*last_element).next != NULL)
    {
        last_element = (*last_element).next;
    }
    (*last_element).next = head.next;

    clist_print(&head);

    clist_print_even(&head);

    clist_print_double(&head);

    return 0;
}