#include <iostream>
#include <fstream>
#include <ctime>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};

Node *Root(int value)
{
    Node *r = new Node;
    (*r).data = value;
    (*r).left = NULL;
    (*r).right = NULL;
    return r;
}

Node *searchInsert(Node *root, int x)
{
    Node *pv = root, *prev;
    bool f = 0; // Переменная отвечающая за то что нашли  элемент или нет
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
    if (f == 1)
    {
        cout << "Don't need to insert new element. Element: " << x << endl;
        return pv;
    }
    cout << "Need to insert new element. Element: " << x << endl;
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

void printTree(Node *tr) // указатель на корень дерева или поддерева, обход которого производится
{
    if (tr == NULL)
        return; // Если отсутствует ветка дерева, то выходим из функции
    // ЕСЛИ присутствует ветка дерева, то:
    cout << (*tr).data << " "; // Вывод данных этой ветки
    printTree((*tr).left);     // поддерево слева
    printTree((*tr).right);    // поддерево  справа
    return;
}

void print_tree_reversed(Node *tr) // указатель на корень дерева или поддерева, обход которого производится
{
    if (!tr)
        return; // Если отсутствует ветка дерева, то выходим из функции
    // ЕСЛИ присутствует ветка дерева, то:
    print_tree_reversed((*tr).left);  // поддерево слева
    print_tree_reversed((*tr).right); // поддерево  справа
    cout << (*tr).data << " ";        // Вывод данных этой ветки
    return;
}

void print_tree_symmetrical(Node *tr) // указатель на корень дерева или поддерева, обход которого производится
{
    if (!tr)
        return; // Если отсутствует ветка дерева, то выходим из функции
    // ЕСЛИ присутствует ветка дерева, то:
    print_tree_symmetrical((*tr).left);  // поддерево слева
    cout << (*tr).data << " ";           // Вывод данных этой ветки
    print_tree_symmetrical((*tr).right); // поддерево  справа
    return;
}

void fillTree(Node *&root, int N)
{
    root = Root(rand() % 2 + 1);
    for (int i = 1; i < N; i++)
        searchInsert(root, rand() % 2 + 1);
}

void fillTreeFromFile(Node *&root)
{
    ifstream file("numbers.txt");
    int num;
    file >> num;
    root = Root(num);

    while (file >> num)
    {
        searchInsert(root, num);
    }
}

int main()
{
    srand(time(0));
    Node *root;tree-4/tree.txt
    int N;
    cout << "Please enter N: ";
    cin >> N;
    cout << "Random fill tree: " << endl;
    fillTree(root, N);
    cout << "Forward tree print: ";
    printTree(root);
    cout << endl
         << "Reversed tree print: ";
    print_tree_reversed(root);
    cout << endl
         << "Symmetrical tree print: ";
    print_tree_symmetrical(root);
    cout << endl
         << endl
         << "Fill tree from file: " << endl;
    fillTreeFromFile(root);
    cout << "Forward tree print: ";
    printTree(root);
    cout << endl
         << "Reversed tree print: ";
    print_tree_reversed(root);
    cout << endl
         << "Symmetrical tree print: ";
    print_tree_symmetrical(root);

    return 0;
}
/*
Please enter N: 7
Random fill tree:
Need to insert new element. Element: 71
Need to insert new element. Element: 18
Need to insert new element. Element: 94
Need to insert new element. Element: 42
Need to insert new element. Element: 0
Need to insert new element. Element: 49
Forward tree print: 44 18 0 42 71 49 94
Reversed tree print: 0 42 18 49 94 71 44
Symmetrical tree print: 0 18 42 44 49 71 94

Fill tree from file:
Need to insert new element. Element: 4
Need to insert new element. Element: 3
Need to insert new element. Element: 5
Need to insert new element. Element: 8
Need to insert new element. Element: 7
Need to insert new element. Element: 9
Don't need to insert new element. Element: 3
Forward tree print: 6 4 3 5 8 7 9
Reversed tree print: 3 5 4 7 9 8 6
Symmetrical tree print: 3 4 5 6 7 8 9
*/