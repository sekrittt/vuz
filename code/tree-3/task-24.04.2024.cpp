#include <iostream>
#include <fstream>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};

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

// void printTree(Node *el) // указатель на корень дерева или поддерева, обход которого производится
// {
//     if (el == NULL)
//         return; // Если отсутствует ветка дерева, то выходим из функции
//     // ЕСЛИ присутствует ветка дерева, то:
//     cout << (*el).data << " "; // Вывод данных этой ветки
//     printTree((*el).left);     // поддерево слева
//     printTree((*el).right);    // поддерево  справа
//     return;
// }

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

Node *minTreeElement(Node *el)
{
    Node *cur = el;
    while ((*cur).left != NULL)
    {
        cur = (*cur).left;
    }
    return cur;
}
Node *maxTreeElement(Node *el)
{
    Node *cur = el;
    while ((*cur).right != NULL)
    {
        cur = (*cur).right;
    }
    return cur;
}

void findNextElement(Node *root, int Y)
{
    Node *current = root;
    Node *next = NULL;

    while (current != NULL)
    {
        if ((*current).data > Y)
        {
            next = current;            //
            current = (*current).left; //
        }
        else
            current = (*current).right;
    }
    if (next == NULL)
    {
        cout << "Not found next element after " << Y << endl;
    }
    else
    {
        cout << "Next element after " << Y << ": " << (*next).data << endl;
    }
}

void fillTreeFromFile(Node *&root)
{
    ifstream file("numbers.txt");
    int num;

    while (file >> num)
    {
        addNode(root, num);
    }
}

int main()
{
    Node *root = NULL;
    int Y, N = 10;
    // for (int i = 0; i < N; i++)
    //     addNode(root, rand() % 100);
    fillTreeFromFile(root);
    printTree(root);
    cout << endl;
    Node *minElement = minTreeElement(root);
    cout << "Minimal element: " << (*minElement).data << endl;
    Node *maxElement = maxTreeElement(root);
    cout << "Maximal element: " << (*maxElement).data << endl;
    cout << "Please enter Y: ";
    cin >> Y;
    findNextElement(root, Y);
    return 0;
}

/*
83 77 15 35 21 49 86 93 86 92
Minimal element: 15
Maximal element: 93
Please enter Y: 93
Not found next element after 93

83 77 15 35 21 49 86 93 86 92
Minimal element: 15
Maximal element: 93
Please enter Y: 15
Next element after 15: 21

6 7 8 9 10 11 12 100
Minimal element: 6
Maximal element: 100
Please enter Y: 100
Not found next element after 100

6 7 8 9 10 11 12 100
Minimal element: 6
Maximal element: 100
Please enter Y: 7
Next element after 7: 8

10 9 8 7 6 5 4 3 2 1
Minimal element: 1
Maximal element: 10
Please enter Y: 11
Not found next element after 11

10 9 8 7 6 5 4 3 2 1
Minimal element: 1
Maximal element: 10
Please enter Y: 4
Next element after 4: 5
*/