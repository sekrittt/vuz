#include <iostream>
#include <fstream>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};

Node *searchInsert(Node *root, int x)
{
    Node *pv = root, *prev;
    bool f = 0; // Переменная отвечающая за то что нашли элемент или нет
    while (pv && (f == 0))
    {
        prev = pv; // получаем адрес элемента от которого строим дерево
        if (x == (*pv).data)
        {
            f = 1; // совпадение выходим из цикла
        }
        else
        {
            if (x < (*pv).data)
                pv = (*pv).left;
            else
                pv = (*pv).right;
        }
        // Выход из цикла осуществляется, тогда когда нашли свободный адрес : ссылку для вставки нового узла
    }

    /*Если совпало значение элемента со значением элемента который хотим вставить то выходим из функции, возвращая адрес элемента с которым совпало значение */
    // if (f == 1)
    // {
    //     cout << "Don't need to insert new element. Element: " << x << endl;
    //     return pv;
    // }
    // cout << "Need to insert new element. Element: " << x << endl;
    // Создание нового узла
    Node *pnew = new Node;
    (*pnew).data = x;
    (*pnew).left = NULL;
    (*pnew).right = NULL;
    if (x < (*prev).data)
        // Присоединение к левому поддереву предка
        (*prev).left = pnew;
    else
        // присоединяем к правому поддереву предка
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

void fillTreeFromFile(Node *&root)
{
    ifstream file("tree-2.txt");
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

int minTree(Node *el)
{
    Node *cur = el;
    while ((*cur).left != NULL)
        cur = (*cur).left;
    return (*cur).data;
}

// remove Node From Right SubTree
void RNFRST(Node *root, int value)
{
    Node *tmp = NULL;    // YD
    Node *parent = NULL; // R
    bool isRight = false;
    findElement(root, value, parent, tmp, isRight);
    auto del = [](Node *&p, Node *t)
    {
        if ((*t).right != NULL && (*t).left == NULL)
        { // If only right child
            p = (*t).right;
        }
        else if ((*t).right == NULL && (*t).left != NULL)
        { // If only left child
            p = (*t).left;
        }
        else if ((*t).right != NULL && (*t).left != NULL)
        {
            // TODO: Universal algorithm
        } else {
            p = NULL;
        }
    };
    if (isRight)
    {
        del((*parent).right, tmp);
    }
    else
    {
        del((*parent).left, tmp);
    }
    delete tmp;
}

int main()
{
    Node *root = NULL;
    int Y, N = 10;
    fillTreeFromFile(root);
    printTree(root);
    cout << endl;
    RNFRST(root, 10);
    printTree(root);
    cout << endl;
    return 0;
}

/*

*/