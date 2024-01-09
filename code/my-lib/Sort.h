#pragma once
#ifndef SORT_H
#define SORT_H

#include <climits>

#include "CArray.h"

template <typename T>
bool base_compare(T a, T b);

class Sort
{
public:
    template <typename T>
    static CArray<T> &sort_bubble(CArray<T> &, bool (*)(T, T) = base_compare);

    template <typename T>
    static CArray<T> &sort_select(CArray<T> &arr, bool (*)(T, T) = base_compare);

    template <typename T>
    static CArray<T> &sort_insert(CArray<T> &, bool (*)(T, T) = base_compare);

    template <typename T>
    static CArray<T> &sort_shell(CArray<T> &, bool (*)(T, T) = base_compare);

    template <typename T>
    static CArray<T> &sort_square(CArray<T> &, bool (*)(T, T) = base_compare, T = INT_MAX);

    template <typename T>
    static CArray<T> &sort_advanced_bubble(CArray<T> &, bool (*)(T, T) = base_compare);

    template <typename T>
    static CArray<T> &quick_sort(CArray<T> &, bool (*)(T, T) = base_compare, int = 0, int  = -1);
};

#endif /* SORT_H */