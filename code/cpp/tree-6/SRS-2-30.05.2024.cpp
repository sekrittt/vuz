
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

void balanceL(Node *&p, Node *p1)
{
    (*p).left = (*p1).right;
    (*p1).right = p;
    (*p).bal = 0;
    p = p1;
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
                if ((*p1).bal == -1)
                {
                    // одиночная LL-ротация
                    balanceL(p, p1);
                }
                else
                {
                    // двойная LR-ротация
                    cout << "LR-rotation +10" << endl;
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
                    (*p).right = (*p1).left;
                    (*p1).left = p;
                    (*p).bal = 0;
                    p = p1;
                }
                else
                {
                    // двойная RL-ротация
                    p2 = (*p1).left;
                    (*p1).left = (*p2).right;
                    (*p2).right = p1;
                    (*p).right = (*p2).left;
                    (*p2).left = p;
                    if ((*p2).bal == 1)
                    {
                        (*p).bal = -1;
                    }
                    else
                    {
                        (*p).bal = 0;
                    }
                    if ((*p2).bal == -1)
                    {
                        (*p1).bal = 1;
                    }
                    else
                    {
                        (*p1).bal = 0;
                    }
                    p = p2;
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

void print(Node *tr)
{
    if (!tr)
        return;

    cout << (*tr).key << " ";
    print((*tr).left);
    print((*tr).right);
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

int main()
{
    Node *root = NULL;
    readFromFile(root, "file-3.txt");
    cout << "AVL-tree: ";
    print(root);
    cout << endl;
    return 0;
}
/*
Test:
AVL-tree: 17 15 12 20 19 18 21 100
*/