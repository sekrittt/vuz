#include <iostream>
#include <string>
#include <fstream>

#ifndef CARRAY_H
#define CARRAY_H

using namespace std;

template <typename T>
class CArray
{
private:
    T *els;
    int type_size = sizeof(T);

public:
    CArray();
    CArray(int);

    void read_from_file(string);

    void push(T);

    T pop(int);

    void insert(int, T);

    bool includes(T);

    void reverse();

    CArray<T> *slice(int, int);

    int index(T);

    T get(int);
    T get();

    void set(int, T);

    template <typename J>
    CArray<J> map(J (*)(T, int, CArray<T> &));

    CArray<T> filter(bool (*)(T, int, CArray<T> &));

    // Need?
    void update_length(int);

    friend ostream &operator<<(ostream &os, CArray<T> &arr)
    {
        os << "Array [" << arr.length << "] {";
        for (int i = 0; i < arr.length; i++)
        {
            os << arr[i];
            if (i < arr.length - 1)
                os << ", ";
        }
        os << "}";
        return os;
    };

    T &operator[](int index)
    {
        return *(this->els + index);
    };

    int length = 0;
};
#include "CArray.cpp"
#endif /* CARRAY_H */