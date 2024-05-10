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
    cout << "Finding next element..." << endl;
    while (current != NULL)
    {
        if ((*current).data > Y)
        {
            next = current;            //
            current = (*current).left; //
        }
        else
        {
            current = (*current).right;
        }
        if (current != NULL)
        {
            cout << (*current).data << endl;
        }
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

void findPreviousElement(Node *root, int Y)
{
    Node *current = root;
    Node *previous = NULL;

    cout << "Finding previous element..." << endl;
    while (current != NULL)
    {
        if ((*current).data < Y)
        {
            previous = current;         //
            current = (*current).right; //
        }
        else
        {
            current = (*current).left;
        }
        if (current != NULL) {
            cout << (*current).data << endl;
        }
    }
    if (previous == NULL)
    {
        cout << "Not found previous element before " << Y << endl;
    }
    else
    {
        cout << "Pervious element before " << Y << ": " << (*previous).data << endl;
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
    for (int i = 0; i < N; i++)
        addNode(root, rand() % 100);
    // fillTreeFromFile(root);
    printTree(root);
    cout << endl;
    Node *minElement = minTreeElement(root);
    cout << "Minimal element: " << (*minElement).data << endl;
    Node *maxElement = maxTreeElement(root);
    cout << "Maximal element: " << (*maxElement).data << endl;
    cout << "Please enter Y: ";
    cin >> Y;
    findNextElement(root, Y);
    findPreviousElement(root, Y);
    return 0;
}

/*

*/