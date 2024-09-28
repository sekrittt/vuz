//
#include <iostream>
#include <fstream>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};

void findElement(Node *root, int value, Node *&parent, Node *&found, bool &isRight)
{
    found = root;  // YD
    parent = root; // R
    // Searching element
    while (found != NULL && (*found).data != value)
    {
        parent = found;
        if ((*found).data < value)
        {
            found = (*found).right;
            isRight = true;
        }
        else if ((*found).data > value)
        {
            found = (*found).left;
            isRight = false;
        }
    }
}

Node *searchInsert(Node *root, int x)
{
    Node *pv = root, *prev;
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

void printTree(Node *el) // указатель на корень дерева или поддерева, обход которого производится
{
    if (el == NULL)
        return; // Если отсутствует ветка дерева, то выходим из функции
    // ЕСЛИ присутствует ветка дерева, то:
    printTree((*el).left);     // поддерево слева
    cout << (*el).data << " "; // Вывод данных этой ветки
    printTree((*el).right);    // поддерево  справа
    return;
}

void fillTreeFromFile(Node *&root, string fileName)
{
    ifstream file(fileName);
    int num;
    root = new Node;
    file >> (*root).data;
    (*root).left = NULL;
    (*root).right = NULL;
    while (file >> num)
    {
        searchInsert(root, num);
    }
}

Node *minTree(Node *el)
{
    Node *cur = el;
    while ((*cur).left != NULL)
        cur = (*cur).left;
    return cur;
}

int main()
{
    Node *root = NULL;
    Node *parentOfFound = new Node;
    Node *found = new Node;
    bool isRight = false;
    bool isRemoveRoot = false;
    fillTreeFromFile(root, "tree-2.txt");
    printTree(root);
    cout << endl;
    int v;
    cout << "Please enter value of node: ";
    cin >> v;
    findElement(root, v, parentOfFound, found, isRight);
    if (parentOfFound == found)
    {
        isRemoveRoot = true;
    }
    if (isRemoveRoot) // If removing root of tree
    {
        if ((*found).left == NULL && (*found).right == NULL) // no Nodes
        {
            root = NULL;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right == NULL) // only left Node
        {
            root = (*found).left;
            delete found;
        }
        else if ((*found).left == NULL && (*found).right != NULL) // only right Node
        {
            root = (*found).right;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right != NULL) // right and left Node
        {
            root = (*found).right;
            Node *minEl = minTree((*found).right); // found minimal element
            (*minEl).left = (*found).left;         // set left subtree to minimal element
            delete found;
        }
    }
    else if (isRight) // If Node in right subtree
    {
        if ((*found).left == NULL && (*found).right == NULL) // no Nodes
        {
            (*parentOfFound).right = NULL;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right == NULL) // only left Node
        {
            (*parentOfFound).right = (*found).left;
            delete found;
        }
        else if ((*found).left == NULL && (*found).right != NULL) // only right Node
        {
            (*parentOfFound).right = (*found).right;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right != NULL) // right and left Node
        {
            (*parentOfFound).right = (*found).right;
            Node *minEl = minTree((*found).right); // found minimal element
            (*minEl).left = (*found).left;         // set left subtree to minimal element
            delete found;
        }
    }
    else // If Node in left subtree
    {
        if ((*found).left == NULL && (*found).right == NULL) // no Nodes
        {
            (*parentOfFound).left = NULL;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right == NULL) // only left Node
        {
            (*parentOfFound).left = (*found).left;
            delete found;
        }
        else if ((*found).left == NULL && (*found).right != NULL) // only right Node
        {
            (*parentOfFound).left = (*found).right;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right != NULL) // right and left Node
        {
            (*parentOfFound).left = (*found).right;
            Node *minEl = minTree((*found).right); // found minimal element
            (*minEl).left = (*found).left;         // set left subtree to minimal element
            delete found;
        }
    }
    cout << "Tree after deleting: ";
    printTree(root);
    cout << endl;
    return 0;
}

/*
Test #1
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 12
Tree after deleting: 10 11 13 15 16 18 19 20 23 24 25

Test #2
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 20
Tree after deleting: 10 11 12 13 15 16 18 19 23 24 25

Test #3
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 25
Tree after deleting: 10 11 12 13 15 16 18 19 20 23 24

Test #4
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 13
Tree after deleting: 10 11 12 15 16 18 19 20 23 24 25

Test #5
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 11
Tree after deleting: 10 12 13 15 16 18 19 20 23 24 25

Test #6
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 20
Tree after deleting: 10 11 12 13 15 16 18 19 23 24 25

Test #7
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 18
Tree after deleting: 10 11 12 13 15 16 19 20 23 24 25

Test #8
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 16
Tree after deleting: 10 11 12 13 15 18 19 20 23 24 25

Test #9
10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 10
Tree after deleting: 11 12 13 15 16 18 19 20 23 24 25

Test #10
9 10 11 12 13 15 16 18 19 20 23 24 25
Please enter value of node: 10
Tree after deleting: 9 11 12 13 15 16 18 19 20 23 24 25
*/