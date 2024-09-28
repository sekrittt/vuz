#include <iostream>
#include <ctime>

using namespace std;

struct Node
{
    Node *pred;
    Node *next;
    int data;
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
    cout << "List Reversed {";
    while (tmp != NULL)
    {
        cout << (*tmp).data;
        if ((*tmp).pred != NULL)
        {
            cout << ", ";
        }
        tmp = (*tmp).pred;
    }
    cout << "}" << endl;
}

void list_add(Node *n, int N)
{
    (*n).data = rand() % 100;
    list_print(n);
    Node *last = n;

    for (int i = 1; i < 5; i++)
    {
        Node *NN = new Node;
        (*NN).data = rand() % 100;
        (*NN).pred = NULL;
        (*NN).next = n;
        (*n).pred = NN;
        n = NN;
        list_print(n);
    }

    for (int i = 5; i < N; i++)
    {
        Node *NN = new Node;
        (*NN).next = NULL;
        (*NN).pred = last;
        (*NN).data = rand() % 100;
        (*last).next = NN;
        last = NN;
        list_print(n);
    }
}

void list_remove(Node *n, int K)
{
    for (int i = 0; i < K && n != NULL; i++)
    {
        n = (*n).next;
        if (n != NULL)
        {
            delete (*n).pred;
        }
        else
        {
            delete n;
        }
        list_print(n);
    }
}

void list_remove_from_end(Node *n, int K)
{
    for (int i = 0; i < K && n != NULL; i++)
    {
        n = (*n).pred;
        if (n != NULL)
        {
            delete (*n).next;
        }
        else
        {
            delete n;
        }
        list_print_reverse(n);
    }
}

int main()
{
    srand(time(0));
    int N, K, v;
    cout << "Please enter N (N >= 8): ";
    cin >> N;
    Node *pbeg = new Node;
    (*pbeg).next = NULL;
    (*pbeg).pred = NULL;

    list_add(pbeg, N);
    while ((*pbeg).pred != NULL)
    {
        pbeg = (*pbeg).pred;
    }

    Node *last = pbeg;
    while ((*last).next != NULL)
    {
        last = (*last).next;
    }
    list_print_reverse(last);

    cout
        << "Please enter K (K <= " << N << "): ";
    cin >> K;

    cout << "Please select deleting variant (0 - from start, 1 - from end): ";
    cin >> v;

    if (v)
    {
        list_remove_from_end(last, K);
    }
    else
    {
        list_remove(pbeg, K);
    }

    return 0;
}