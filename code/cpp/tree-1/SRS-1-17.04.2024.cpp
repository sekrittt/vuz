#include <iostream>
#include <cmath>
#include <climits>
using namespace std;

struct Node
{
    int data;    // Поле данных
    Node *left;  // УКАЗАТЕЛЬ на левую ветку
    Node *right; // УКАЗАТЕЛЬ на правую ветку
};

int depth = 1; // кол-во уровней дерева
int cur_depth = 0;
int width = 0;

void add(int N, Node *&Root) // функция добавления в дерево
{
    int x;
    Node *el1, *el;             // указатели
    for (int i = 1; i < N; i++) // нерекурсивное заполнение
    {
        cout << "Enter value: ";
        cin >> x;

        el1 = new Node; // выделение памяти
        (*el1).data = x;
        (*el1).right = NULL;
        (*el1).left = NULL;

        el = Root;
        cur_depth++;

        for (int j = 0; j < i; j++)
        {
            while (((*el).left != NULL) && ((*el).data > (*el1).data))
            { //
                el = (*el).left;
                cur_depth++;
            }
            while (((*el).right != NULL) && ((*el).data <= (*el1).data))
            { //
                el = (*el).right;
                cur_depth++;
            }
        }

        if ((*el).data > (*el1).data) // добавление влево
            (*el).left = el1;
        else // добавление вправо
            (*el).right = el1;
        cur_depth++;

        if (cur_depth > depth)
        {
            depth = cur_depth;
        }
        cur_depth = 0;
    }
}

// Прямой обход дерева
void printTree(Node *tr)
{
    if (tr)
    {
        cout << (*tr).data << " ";
        printTree((*tr).left);
        printTree((*tr).right);
    }
}
// Обратный обход дерева
void print_tree_reversed(Node *tr)
{
    if (tr)
    {
        print_tree_reversed((*tr).left);
        print_tree_reversed((*tr).right);
        cout << (*tr).data << " ";
    }
}

// Симметричный обход дерева
void print_tree_symmetrical(Node *tr)
{
    if (tr)
    {
        print_tree_symmetrical((*tr).left); // вызов функции
        cout << (*tr).data << " ";
        print_tree_symmetrical((*tr).right); // вызов функции
    }
}

// Рекурсивно заполняется массив
void fill_arr(int *M, Node *tr, int cur_depth = 0, int cell = 0)
{
    if (tr == NULL)
        return;
    *(M + cur_depth * width + cell) = (*tr).data;
    fill_arr(M, (*tr).left, cur_depth + 1, cell - 1);
    fill_arr(M, (*tr).right, cur_depth + 1, cell + 1);
}

void print_tree_as_tree(Node *tr)
{
    if (tr == NULL)
        return;
    width = pow(2, depth - 1) + 1;   // Ширина = максимальное количество элементов на последнем уровне
    int *M = new int[width * depth]; // Вспомогательный массив на основе которого будет работать вывод
    for (int i = 0; i < depth; i++)
    {
        for (int j = 0; j < width; j++)
        {
            *(M + i * width + j) = INT_MAX; // Инициализируем массив, INT_MAX - указывает на отсутствие элемента для отображения и заменяется на пробел
        }
    }
    fill_arr(M, tr, 0, width / 2);
    for (int i = 0; i < depth; i++)
    {
        for (int j = 0; j < width; j++)
        {
            cout << " ";
            if (*(M + i * width + j) != INT_MAX)
            {
                cout << *(M + i * width + j); // i * width + j номер элемента массива для вывода, i * width смещение на возможное количество элементов уровня
            }
            else
            {
                cout << " "; // Пустой элемент вместо INT_MAX
            }
        }
        cout << endl;
    }
}

int main()
{
    Node *Root = new Node; // память под корень
    (*Root).left = NULL;
    (*Root).right = NULL;
    int x, N;

    cout << "Please enter N: ";
    cin >> N;

    cout << "Enter value: ";
    cin >> x;
    (*Root).data = x;

    add(N, Root); // вызыв заполнения
    cout << "Forward tree print: ";
    printTree(Root);
    cout << endl;
    cout << "Reversed tree print: ";
    print_tree_reversed(Root);
    cout << endl;
    cout << "Symmetrical tree print: ";
    print_tree_symmetrical(Root);
    cout << endl
         << "Print tree as tree: " << endl;
    print_tree_as_tree(Root);
}
/*
Please enter N: 7
Enter value: 6
Enter value: 4
Enter value: 3
Enter value: 5
Enter value: 8
Enter value: 7
Enter value: 9
Forward tree print: 6 4 3 5 8 7 9
Reversed tree print: 3 5 4 7 9 8 6
Symmetrical tree print: 3 4 5 6 7 8 9
Print tree as tree:
    6
  4  8
 3 5 7 9
*/