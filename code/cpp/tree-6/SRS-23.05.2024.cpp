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
    (*pnew).left = NULL;
    (*pnew).right = NULL;
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

void balanceRL(Node *&root)
{
    Node *p = root, *p1 = NULL, *p2 = NULL;
    p1 = (*p).right;

    p2 = (*p1).left;
    (*p1).left = (*p2).right;
    (*p2).right = p1;
    (*p).right = (*p2).left;

    (*p2).left = p;

    p = p2;
    root = p;
}

void balanceLR(Node *&root)
{
    Node *p, *p1 = NULL, *p2 = NULL;
    p = root;
    p1 = (*p).left;

    p2 = (*p1).right;
    (*p1).right = (*p2).left;
    (*p2).left = p1;
    (*p).left = (*p2).right;

    (*p2).right = p;

    p = p2;
    root = p;
}

void readFromFile(Node *&root, string fileName)
{
    ifstream file(fileName);
    int num;
    root = new Node;
    file >> (*root).data;
    (*root).left = NULL;
    (*root).right = NULL;
    while (file >> num)
    {
        search_insert(root, num);
    }
}

Node *findElement(Node *root, int value, Node *&parent)
{
    Node *found = root;
    parent = root;
    while (found != NULL && (*found).data != value)
    {
        parent = found;
        if ((*found).data < value)
        {
            found = (*found).right;
        }
        else if ((*found).data > value)
        {
            found = (*found).left;
        }
    }
    return found;
}

int main()
{
    Node *root = NULL;
    readFromFile(root, "file-3.txt");
    cout << "Filled tree: ";
    print(root);
    cout << endl;
    Node *parentOfFound = NULL;
    Node *found17 = findElement(root, 17, parentOfFound);
    balanceRL(found17);
    (*parentOfFound).right = found17;
    cout << "Tree after R-L balance: ";
    print(root);
    cout << endl;
}