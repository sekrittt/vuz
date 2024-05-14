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

// remove Node From Right SubTree
// void RNFRST(Node *root, int value)
// {
//     Node *tmp = NULL;    // YD
//     Node *parent = NULL; // R
//     bool isRight = false;
//     findElement(root, value, parent, tmp, isRight);
//     auto del = [](Node *&p, Node *t)
//     {
//         if ((*t).right != NULL && (*t).left == NULL)
//         { // If only right child
//             p = (*t).right;
//         }
//         else if ((*t).right == NULL && (*t).left != NULL)
//         { // If only left child
//             p = (*t).left;
//         }
//         else if ((*t).right != NULL && (*t).left != NULL)
//         {
//             // TODO: Universal algorithm
//         }
//         else
//         {
//             p = NULL;
//         }
//     };
//     if (isRight)
//     {
//         del((*parent).right, tmp);
//     }
//     else
//     {
//         del((*parent).left, tmp);
//     }
//     delete tmp;
// }

void addNode(Node *&el, int v)
{
    if (el == NULL)
    {
        el = new Node;
        (*el).right = NULL;
        (*el).left = NULL;
        (*el).data = v;
    }
    else if ((*el).data <= v)
    {
        addNode((*el).right, v);
    }
    else if ((*el).data > v)
    {
        addNode((*el).left, v);
    }
}

void printTree(Node *el) // указатель на корень дерева или поддерева, обход которого производится
{
    if (el == NULL)
        return; // Если отсутствует ветка дерева, то выходим из функции
    // ЕСЛИ присутствует ветка дерева, то:
    cout << (*el).data << " "; // Вывод данных этой ветки
    printTree((*el).left);     // поддерево слева
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
        addNode(root, num);
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
    fillTreeFromFile(root, "tree-2.txt");
    printTree(root);
    cout << endl;
    int v;
    cout << "Please enter value of node: ";
    cin >> v;
    findElement(root, v, parentOfFound, found, isRight);
    cout << "Parent of found: " << (*parentOfFound).data << " Found: " << (*found).data << " isRight: " << isRight << endl;
    if (isRight)
    {
        if ((*found).left == NULL && (*found).right == NULL)
        {
            (*parentOfFound).right = NULL;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right == NULL)
        {
            (*parentOfFound).right = (*found).left;
            delete found;
        }
        else if ((*found).left == NULL && (*found).right != NULL)
        {
            (*parentOfFound).right = (*found).right;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right != NULL)
        {
            (*parentOfFound).right = (*found).right;
            Node *minEl = minTree((*found).right);
            (*minEl).left = (*found).left;
            delete found;
        }
    }
    else
    {
        if ((*found).left == NULL && (*found).right == NULL)
        {
            (*parentOfFound).left = NULL;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right == NULL)
        {
            (*parentOfFound).left = (*found).left;
            delete found;
        }
        else if ((*found).left == NULL && (*found).right != NULL)
        {
            (*parentOfFound).left = (*found).right;
            delete found;
        }
        else if ((*found).left != NULL && (*found).right != NULL)
        {
            (*parentOfFound).left = (*found).right;
            Node *minEl = minTree((*found).right);
            (*minEl).left = (*found).left;
            delete found;
        }
    }
    cout << "Tree after deleting: ";
    printTree(root);
    cout << endl;
    return 0;
}