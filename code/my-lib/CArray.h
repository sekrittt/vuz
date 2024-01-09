#pragma once
#ifndef CARRAY_H
#define CARRAY_H

#include <iostream>
#include <string>

using namespace std;

template <typename T>
class CArray
{
private:
    T *els;
    int type_size;

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


    T &operator[](int);

    int length;
};

#endif /* CARRAY_H */