#include <iostream>
#include <cmath>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};

int depth = 0;
int cur_depth = 0;

Node *create_root(int value)
{
    Node *root = new Node;
    (*root).left = NULL;
    (*root).right = NULL;
    (*root).data = value;
    return root;
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

void add_node(int X, Node *&tr) //
{
    cur_depth += 1;
    if (!tr) // при первом запуске определяется корень дерева
    {
        tr = new Node; // запрос под выделение памяти под узел
        (*tr).left = NULL;
        (*tr).right = NULL;
        (*tr).data = X;
        if (cur_depth > depth)
        {
            depth = cur_depth;
        }
        cur_depth = 0;
    }
    else if ((*tr).data > X)
        add_node(X, (*tr).left); // построение левого поддерева
    else
        add_node(X, (*tr).right); // построение правого поддерева
}

void remove_tree(Node *tr)
{
    if (!tr)
        return;               // Вершины нет
    remove_tree((*tr).left);  // обход потомка - левое поддерево
    remove_tree((*tr).right); // обход потомка - правое поддерево
    delete tr;
    return;
}

int main()
{
    Node *root = NULL;
    int N, X;
    cout << "Please enter N: ";
    cin >> N;
    int root_value;
    cout << "Please enter value of root: ";
    cin >> root_value;
    root = create_root(root_value);
    for (int i = 1; i < N; i++)
    {
        cout << "Please enter value of new node: ";
        cin >> X;
        add_node(X, root);
    }
    cout << "Forward tree print: ";
    printTree(root);
    cout << endl;

    cout << "Reversed tree print: ";
    print_tree_reversed(root);
    cout << endl;

    cout << "Symmetrical tree print: ";
    print_tree_symmetrical(root);
    cout << endl;

    // remove_tree(root);

    // print_tree_as_tree(root, depth, false, false);
    // cout << depth << endl;

    return 0;
}
/*
Please enter N: 7
Please enter value of root: 9
Please enter value of new node: 4
Please enter value of new node: 78
Please enter value of new node: 1
Please enter value of new node: 11
Please enter value of new node: 15
Please enter value of new node: 14
Forward tree print: 9 4 1 78 11 15 14
Reversed tree print: 4 1 78 11 15 14 9
Symmetrical tree print: 4 1 9 78 11 15 14

Please enter N: 6
Please enter value of root: 14
Please enter value of new node: 5
Please enter value of new node: 21
Please enter value of new node: 8
Please enter value of new node: 54
Please enter value of new node: 3
Forward tree print: 14 5 3 8 21 54
Reversed tree print: 5 3 8 21 54 14
Symmetrical tree print: 5 3 8 14 21 54

Please enter N: 7
Please enter value of root: 10
Please enter value of new node: 65
Please enter value of new node: 37
Please enter value of new node: 12
Please enter value of new node: 9
Please enter value of new node: 34
Please enter value of new node: 102
Forward tree print: 10 9 65 37 12 34 102
Reversed tree print: 9 65 37 12 34 102 10
Symmetrical tree print: 9 10 65 37 12 34 102
*/