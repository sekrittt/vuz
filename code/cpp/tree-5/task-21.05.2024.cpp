#include <iostream>
#include <iostream>
#include <fstream>
using namespace std;

struct Node
{
    int data;
    Node *right;
    Node *left;
};

Node *search_insert(Node *Root, int x)
{
    Node *pv = Root, *prev;
    bool f = 0;
    while (pv && (f == 0))
    {
        prev = pv;
        if (x == (*pv).data)
        {
            f = 1;
        }
        else
        {
            if (x < (*pv).data)
                pv = (*pv).left;
            else
                pv = (*pv).right;
        }
    }

    if (f == 1)
        return pv;

    Node *pnew = new Node;
    (*pnew).data = x;
    (*pnew).left = 0;
    (*pnew).right = 0;
    if (x < (*prev).data)

        (*prev).left = pnew;
    else

        (*prev).right = pnew;
    return pnew;
}
void print(Node *tr)
{
    if (!tr)
        return;

    cout << (*tr).data << " ";
    print((*tr).left);
    print((*tr).right);
}
Node *balanceL(Node *tr)
{
    Node *L;
    L = (*tr).left;
    (*tr).left = NULL;
    (*L).right = tr;
    return L;
}
Node *balanceR(Node *tr)
{
    Node *R;
    R = (*tr).right;
    (*tr).right = NULL;
    (*R).left = tr;
    return R;
}
int main()
{
    ifstream f;
    f.open("file.txt");
    int n = 0;
    Node *tr = new (Node);
    (*tr).left = NULL;
    (*tr).right = NULL;
    f >> (*tr).data;
    while (f >> n)
        search_insert(tr, n);
    cout << "Filled tree: ";
    print(tr);
    (*tr).left = balanceL((*tr).left);
    cout << "\nTree after LL balance: ";
    print(tr);
    (*tr).right = balanceR((*tr).right);
    cout << "\nTree after RR balance: ";
    print(tr);
    cout << endl;
}