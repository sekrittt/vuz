#include "Sort.hpp"
#include "CArray.hpp"

#include <cmath>
#include <climits>

template <typename T>
bool base_compare(T a, T b)
{
    return a > b;
}

template <typename T>
CArray<T> &Sort::sort_bubble(CArray<T> &arr, bool (*compare)(T, T))
{
    T tmp;
    for (int i = 0; i < arr.length; i++)
    {
        for (int j = 0; j < arr.length - i - 1; j++)
        {
            if (compare(arr[j], arr[j + 1]))
            {
                tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_select(CArray<T> &arr, bool (*compare)(T, T))
{
    for (int i = 0; i < arr.length - 1; i++)
    {
        T mm = arr[i];
        int i_mm = i;
        for (int j = i + 1; j < arr.length; j++)
        {
            if (compare(mm, arr[j]))
            {
                mm = arr[j];
                i_mm = j;
            }
        }
        arr[i_mm] = arr[i];
        arr[i] = mm;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_insert(CArray<T> &arr, bool (*compare)(T, T))
{
    int i;
    T wr;
    for (int j = 1; j < arr.length; j++)
    {
        i = j - 1;
        wr = arr[j];
        while ((i >= 0) && compare(arr[i], wr))
        {
            arr[i + 1] = arr[i];
            i = i - 1;
        }
        arr[i + 1] = wr;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_shell(CArray<T> &arr, bool (*compare)(T, T))
{
    int h = 1;
    while (h < arr.length / 3)
    {
        h = 3 * h + 1;
    }
    while (h >= 1)
    {
        for (int i = h; i < arr.length; i++)
        {
            for (int j = i; j >= h && compare(arr[j - h], arr[j]); j -= h)
            {
                T tmp = arr[j];
                arr[j] = arr[j - h];
                arr[j - h] = tmp;
            }
        }
        h /= 3;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_square(CArray<T> &arr, bool (*compare)(T, T), T fictitious)
{
    int h = sqrt(arr.length);
    int h1 = round(sqrt((float)arr.length));
    h1 += (h1 * h1) < arr.length;
    CArray<T> B{arr.length};
    CArray<T> C{arr.length};
    int *A_indexes = new int[h];
    int B_index = -1;

    for (int k = 0; k < arr.length; k++)
    {
        for (int i = 0; i < h; i++)
        {
            B[i] = arr[h1 * i];
            *(A_indexes + i) = h1 * i;
            for (int j = 1; j < h1 && j + h1 * i < arr.length; j++)
            {
                if (compare(B[i], arr[j + h1 * i]))
                {
                    B[i] = arr[j + h1 * i];
                    *(A_indexes + i) = (j + h1 * i);
                }
            }
        }
        C[k] = B[0];
        B_index = 0;
        for (int i = 1; i < h; i++)
        {
            if (compare(C[k], B[i]))
            {
                C[k] = B[i];
                B_index = i;
            }
        }

        arr[*(A_indexes + B_index)] = fictitious;
        B[B_index] = fictitious;
    }
    return *C;
}

template <typename T>
CArray<T> &Sort::sort_advanced_bubble(CArray<T> &arr, bool (*compare)(T, T))
{
    int left = 0;
    int right = arr.length - 1;
    int j, k = arr.length;
    T t;
    do
    {
        for (j = left; j < right; j++)
        {
            if (compare(arr[j], arr[j + 1]))
            {
                t = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = t;
                k = j;
            }
        }
        right = k;
        for (j = right; j > left; j--)
        {
            if (compare(arr[j - 1], arr[j]))
            {
                t = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = t;
                k = j;
            }
        }
        left = k;
    } while (left < right);
    return arr;
}

template <typename T>
CArray<T> &Sort::quick_sort(CArray<T> &arr, bool (*compare)(T, T), int LG, int PG)
{
    PG = PG == -1 ? arr.length - 1 : PG;
    int i = LG, j = PG;
    T X = arr[((LG + PG) / 2)];

    while (i <= j)
    {
        while (compare(X, arr[i]))
            ++i;
        while (compare(arr[j], X))
            --j;
        if (i <= j)
        {
            T t;
            t = arr[i];
            arr[i] = arr[j];
            arr[j] = t;
            ++i;
            --j;
        }
    }

    if (LG < j)
        arr = Sort::quick_sort(arr, compare, LG, j);
    if (i < PG)
        arr = Sort::quick_sort(arr, compare, i, PG);
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_bubble(CArray<T> &arr)
{
    T tmp;
    for (int i = 0; i < arr.length; i++)
    {
        for (int j = 0; j < arr.length - i - 1; j++)
        {
            if (base_compare(arr[j], arr[j + 1]))
            {
                tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_select(CArray<T> &arr)
{
    for (int i = 0; i < arr.length - 1; i++)
    {
        T mm = arr[i];
        int i_mm = i;
        for (int j = i + 1; j < arr.length; j++)
        {
            if (base_compare(mm, arr[j]))
            {
                mm = arr[j];
                i_mm = j;
            }
        }
        arr[i_mm] = arr[i];
        arr[i] = mm;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_insert(CArray<T> &arr)
{
    int i;
    T wr;
    for (int j = 1; j < arr.length; j++)
    {
        i = j - 1;
        wr = arr[j];
        while ((i >= 0) && base_compare(arr[i], wr))
        {
            arr[i + 1] = arr[i];
            i = i - 1;
        }
        arr[i + 1] = wr;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_shell(CArray<T> &arr)
{
    int h = 1;
    while (h < arr.length / 3)
    {
        h = 3 * h + 1;
    }
    while (h >= 1)
    {
        for (int i = h; i < arr.length; i++)
        {
            for (int j = i; j >= h && base_compare(arr[j - h], arr[j]); j -= h)
            {
                T tmp = arr[j];
                arr[j] = arr[j - h];
                arr[j - h] = tmp;
            }
        }
        h /= 3;
    }
    return arr;
}

template <typename T>
CArray<T> &Sort::sort_square(CArray<T> &arr, bool (*compare)(T, T))
{
    int h = sqrt(arr.length);
    int h1 = round(sqrt((float)arr.length));
    h1 += (h1 * h1) < arr.length;
    CArray<T> B{arr.length};
    CArray<T> C{arr.length};
    int *A_indexes = new int[h];
    int B_index = -1;

    for (int k = 0; k < arr.length; k++)
    {
        for (int i = 0; i < h; i++)
        {
            B[i] = arr[h1 * i];
            *(A_indexes + i) = h1 * i;
            for (int j = 1; j < h1 && j + h1 * i < arr.length; j++)
            {
                if (compare(B[i], arr[j + h1 * i]))
                {
                    B[i] = arr[j + h1 * i];
                    *(A_indexes + i) = (j + h1 * i);
                }
            }
        }
        C[k] = B[0];
        B_index = 0;
        for (int i = 1; i < h; i++)
        {
            if (compare(C[k], B[i]))
            {
                C[k] = B[i];
                B_index = i;
            }
        }

        arr[*(A_indexes + B_index)] = INT_MAX;
        B[B_index] = INT_MAX;
    }
    return *C;
}

template <typename T>
CArray<T> &Sort::sort_square(CArray<T> &arr)
{
    int h = sqrt(arr.length);
    int h1 = round(sqrt((float)arr.length));
    h1 += (h1 * h1) < arr.length;
    CArray<T> B{arr.length};
    CArray<T> C{arr.length};
    int *A_indexes = new int[h];
    int B_index = -1;

    for (int k = 0; k < arr.length; k++)
    {
        for (int i = 0; i < h; i++)
        {
            B[i] = arr[h1 * i];
            *(A_indexes + i) = h1 * i;
            for (int j = 1; j < h1 && j + h1 * i < arr.length; j++)
            {
                if (base_compare(B[i], arr[j + h1 * i]))
                {
                    B[i] = arr[j + h1 * i];
                    *(A_indexes + i) = (j + h1 * i);
                }
            }
        }
        C[k] = B[0];
        B_index = 0;
        for (int i = 1; i < h; i++)
        {
            if (base_compare(C[k], B[i]))
            {
                C[k] = B[i];
                B_index = i;
            }
        }

        arr[*(A_indexes + B_index)] = INT_MAX;
        B[B_index] = INT_MAX;
    }
    return *C;
}

template <typename T>
CArray<T> &Sort::sort_advanced_bubble(CArray<T> &arr)
{
    int left = 0;
    int right = arr.length - 1;
    int j = 0, k = arr.length;
    T t;
    do
    {
        for (j = left; j < right; j++)
        {
            if (base_compare(arr[j], arr[j + 1]))
            {
                t = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = t;
                k = j;
            }
        }
        right = k;
        for (j = right; j > left; j--)
        {
            if (base_compare(arr[j - 1], arr[j]))
            {
                t = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = t;
                k = j;
            }
        }
        left = k;
    } while (left < right);
    return arr;
}

template <typename T>
CArray<T> &Sort::quick_sort(CArray<T> &arr, bool (*compare)(T, T))
{
    int PG = arr.length - 1;
    int LG = 0;
    int i = LG, j = PG;
    T X = arr[((LG + PG) / 2)];

    while (i <= j)
    {
        while (compare(X, arr[i]))
            ++i;
        while (compare(arr[j], X))
            --j;
        if (i <= j)
        {
            T t;
            t = arr[i];
            arr[i] = arr[j];
            arr[j] = t;
            ++i;
            --j;
        }
    }

    if (LG < j)
        arr = Sort::quick_sort(arr, compare, LG, j);
    if (i < PG)
        arr = Sort::quick_sort(arr, compare, i, PG);
    return arr;
}

template <typename T>
CArray<T> &Sort::quick_sort(CArray<T> &arr)
{
    int PG = arr.length - 1;
    int LG = 0;
    int i = LG, j = PG;
    T X = arr[((LG + PG) / 2)];

    while (i <= j)
    {
        while (base_compare(X, arr[i]))
            ++i;
        while (base_compare(arr[j], X))
            --j;
        if (i <= j)
        {
            T t;
            t = arr[i];
            arr[i] = arr[j];
            arr[j] = t;
            ++i;
            --j;
        }
    }

    if (LG < j)
        arr = Sort::quick_sort(arr, base_compare, LG, j);
    if (i < PG)
        arr = Sort::quick_sort(arr, base_compare, i, PG);
    return arr;
}