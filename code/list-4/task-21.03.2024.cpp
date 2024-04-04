#include <iostream>

using namespace std;

struct Node
{
    int data;
    Node *next;
    Node *prev;
};

void list_print(Node *n)
{
    Node *tmp = n;
    cout << "List {";
    while (tmp != NULL)
    {
        cout << (*tmp).data;
        if ((*tmp).next != NULL)
        {
            cout << ", ";
        }
        tmp = (*tmp).next;
    }
    cout << "}" << endl;
}

void list_print_reverse(Node *n)
{
    Node *tmp = n;
    if (n != NULL)
    {
        while ((*tmp).next != NULL)
        {
            tmp = (*tmp).next;
        }
    }

    cout << "List Reversed {";
    while (tmp != NULL)
    {
        cout << (*tmp).data;
        if ((*tmp).prev != NULL)
        {
            cout << ", ";
        }
        tmp = (*tmp).prev;
    }
    cout << "}" << endl;
}

Node *list_random_fill(Node *n, int N)
{
    (*n).data = rand() % 100;
    list_print(n);

    for (int i = 1; i < N; i++)
    {
        Node *NN = new Node;
        (*NN).data = rand() % 100;
        (*NN).prev = NULL;
        (*NN).next = n;
        (*n).prev = NN;
        n = NN;
        list_print(n);
    }
    return n;
}

Node *list_remove_from_end(Node *n, int K)
{
    Node *tmp = n;
    while ((*tmp).next != NULL)
    {
        tmp = (*tmp).next;
    }

    for (int i = 0; i < K && tmp != NULL; i++)
    {
        tmp = (*tmp).prev;
        if (tmp != NULL)
        {
            (*tmp).next = NULL;
            delete (*tmp).next;
        }
        else
        {
            delete tmp;
            tmp = NULL;
        }
    }
    if (tmp == NULL) {
        return tmp;
    }
    return n;
}

int main()
{
    Node *list = new Node;
    (*list).data = 0;
    (*list).next = NULL;
    (*list).prev = NULL;

    int N, k;
    cout << "Please enter N: ";
    cin >> N;

    list = list_random_fill(list, N);

    cout << "After filling: " << endl;
    list_print(list);
    list_print_reverse(list);

    cout << "Please enter count of element will be delete: ";
    cin >> k;

    list = list_remove_from_end(list, k);

    cout << "After delete: " << endl;
    list_print(list);
    list_print_reverse(list);

    return 0;
}