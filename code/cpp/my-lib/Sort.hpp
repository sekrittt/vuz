#include "CArray.hpp"

#ifndef SORT_H
#define SORT_H

template <typename T>
bool base_compare(T a, T b);

class Sort
{
public:
    template <typename T>
    static CArray<T> &sort_bubble(CArray<T> &, bool (*)(T, T));

    template <typename T>
    static CArray<T> &sort_select(CArray<T> &, bool (*)(T, T));

    template <typename T>
    static CArray<T> &sort_insert(CArray<T> &, bool (*)(T, T));

    template <typename T>
    static CArray<T> &sort_shell(CArray<T> &, bool (*)(T, T));

    template <typename T>
    static CArray<T> &sort_square(CArray<T> &, bool (*)(T, T), T);

    template <typename T>
    static CArray<T> &sort_advanced_bubble(CArray<T> &, bool (*)(T, T));

    template <typename T>
    static CArray<T> &quick_sort(CArray<T> &, bool (*)(T, T), int, int);

    template <typename T>
    static CArray<T> &sort_bubble(CArray<T> &);

    template <typename T>
    static CArray<T> &sort_select(CArray<T> &);

    template <typename T>
    static CArray<T> &sort_insert(CArray<T> &);

    template <typename T>
    static CArray<T> &sort_shell(CArray<T> &);

    template <typename T>
    static CArray<T> &sort_square(CArray<T> &, bool (*)(T, T));
    template <typename T>
    static CArray<T> &sort_square(CArray<T> &);

    template <typename T>
    static CArray<T> &sort_advanced_bubble(CArray<T> &);

    template <typename T>
    static CArray<T> &quick_sort(CArray<T> &, bool (*)(T, T));
    template <typename T>
    static CArray<T> &quick_sort(CArray<T> &);
};
#include "Sort.cpp"
#endif /* SORT_H */