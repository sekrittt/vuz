
#include <iostream>
#include <fstream>

using namespace std;

struct Node
{
    int data;
    Node *left;
    Node *right;
};


Node *insertRecursive(Node *node, int value)
{
    if (node == NULL)
    {
        Node *nn = new Node;
        (*nn).data = value;
        (*nn).left = NULL;
        (*nn).right = NULL;
        return nn;
    }

    if (value < (*node).data)
    {
        (*node).left = insertRecursive((*node).left, value);
    }
    else
    {
        (*node).right = insertRecursive((*node).right, value);
    }

    return node;
}

void insertElement(Node *&root, int value)
{
    root = insertRecursive(root, value);
}


int countNodesOnLevel(Node *node, int level)
{
    if (node == NULL)
    {
        return 0;
    }
    if (level == 1)
    {
        return 1;
    }
    return countNodesOnLevel((*node).left, level - 1) + countNodesOnLevel((*node).right, level - 1);
}

int numNodesOnLevel(Node *root, int level)
{
    return countNodesOnLevel(root, level);
}

int countNodesInSubtree(Node *node)
{
    if (node == NULL)
    {
        return 0;
    }
    int c1 = countNodesInSubtree((*node).left);
    int c2 = countNodesInSubtree((*node).right);
    cout << "c1: " << c1 << " c2: " << c2 << endl;
    return c1 + c2 + 1;
}

int numNodesInSubtree(Node *node)
{
    if (node == NULL)
    {
        return 0;
    }
    return countNodesInSubtree(node) - 1;
}

int main()
{
    Node* root = new Node;
    (*root).left = NULL;
    (*root).right = NULL;
    ifstream file("numbers.txt");
    int num;
    file >> num;
    (*root).data = num;

    while (file >> num)
    {
        insertElement(root, num);
    }

    file.close();

    cout << "Number of nodes on level 2: " << numNodesOnLevel(root, 2) << endl;
    cout << "Number of nodes in left subtree: " << numNodesInSubtree((*root).left) << endl;
    cout << "Number of nodes in right subtree: " << numNodesInSubtree((*root).right) << endl;

    return 0;
}