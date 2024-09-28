
#include <iostream>
#include <fstream>

using namespace std;

struct Node
{
    int key;
    int count;
    int bal;
    Node *left;
    Node *right;
};

void balanceRR(Node *&p, Node *p1)
{
    (*p).right = (*p1).left;
    (*p1).left = p;
    (*p).bal = 0;
    p = p1;
}

void balanceLR(Node *&p, Node *&p1, Node *&p2)
{
    p2 = (*p1).right;
    (*p1).right = (*p2).left;
    (*p2).left = p1;
    (*p).left = (*p2).right;
    (*p2).right = p;
    if ((*p2).bal == -1)
    {
        (*p).bal = 1;
    }
    else
    {
        (*p).bal = 0;
    }

    if ((*p2).bal == 1)
    {
        (*p1).bal = -1;
    }
    else
    {
        (*p1).bal = 0;
    }
    p = p2;
}

void print(Node *tr)
{
    if (!tr)
        return;

    cout << (*tr).key << " ";
    print((*tr).left);
    print((*tr).right);
}

void search(int x, Node *&p, bool &h)
{
    Node *p1 = NULL, *p2 = NULL;
    // ~h
    if (p == NULL)
    {
        // вставка
        p = new Node;
        (*p).key = x;
        (*p).count = 1;
        (*p).bal = 0;
        (*p).left = NULL;
        (*p).right = NULL;
        h = true;
    }
    else if ((*p).key > x)
    {
        search(x, (*p).left, h);
        if (h)
        {
            // выросла левая ветвь
            if ((*p).bal == 1)
            {
                (*p).bal = 0;
                h = false;
            }
            else if ((*p).bal == 0)
            {
                (*p).bal = -1;
            }
            else
            {
                // bal = -1, восстановить баланс
                p1 = (*p).left;
                if ((*p1).bal != -1)
                {
                    // двойная LR-ротация
                    balanceLR(p, p1, p2);
                }
                (*p).bal = 0;
                h = false;
            }
        }
    }
    else if ((*p).key < x)
    {
        search(x, (*p).right, h);
        if (h)
        {
            // выросла правая ветвь
            if ((*p).bal == -1)
            {
                (*p).bal = 0;
                h = false;
            }
            else if ((*p).bal == 0)
            {
                (*p).bal = 1;
            }
            else
            {
                // bal = +1, восстановить баланс
                p1 = (*p).right;
                if ((*p1).bal == 1)
                {
                    // одиночная RR-ротация
                    balanceRR(p, p1);
                }
                (*p).bal = 0;
                h = false;
            }
        }
    }
    else
    {
        (*p).count++;
    }
}

void readFromFile(Node *&root, string fileName)
{
    ifstream file(fileName);
    int num;
    bool h = false;
    while (file >> num)
    {
        search(num, root, h);
    }
}

Node *findElement(Node *root, int value)
{
    Node *found = root; // YD
    // Searching element
    while (found != NULL && (*found).key != value)
    {
        if ((*found).key < value)
        {
            found = (*found).right;
        }
        else if ((*found).key > value)
        {
            found = (*found).left;
        }
    }
    return found;
}

int main()
{
    Node *root = NULL;
    readFromFile(root, "f3.txt");
    cout << "AVL-tree left subtree: ";
    print((*root).left);
    cout << endl;
    cout << "AVL-tree right subtree: ";
    print((*root).right);
    cout << endl;
    cout << "AVL-tree root: " << (*root).key << endl;

    int v;
    cout << "Please enter value of element: ";
    cin >> v;
    Node *foundEl = findElement(root, v);
    if ((*foundEl).right)
    {
        cout << "Element after \"" << v << "\" = " << (*(*foundEl).right).key << endl;
    }
    else
    {
        cout << "Not found element after \"" << v << "\"" << endl;
    }

    return 0;
}
/*
Test:
AVL-tree: 17 15 12 20 19 18 21 100
*/