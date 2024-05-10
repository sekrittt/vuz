#ifndef LIST_H
#define LIST_H

template <typename T>
struct Node
{
    T value;
    Node *next = NULL;
};

template <typename T>
class List
{
private:
    Node<T> head;

public:
    void List() {}
    void push(T el);
    void push(Node<T> node);
};

#endif /*LIST_H*/