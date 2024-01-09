#include <cmath>
#include <climits>

#include "CArray.h"

template <typename T>
bool base_compare(T a, T b)
{
    return a > b;
}

class Sort
{
public:
    template <typename T>
    static CArray<T> &sort_bubble(CArray<T> &arr, bool (*compare)(T, T) = base_compare)
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
    static CArray<T> &sort_select(CArray<T> &arr, bool (*compare)(T, T) = base_compare)
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
    static CArray<T> &sort_insert(CArray<T> &arr, bool (*compare)(T, T) = base_compare)
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
    static CArray<T> &sort_shell(CArray<T> &arr, bool (*compare)(T, T) = base_compare)
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
    static CArray<T> &sort_square(CArray<T> &arr, bool (*compare)(T, T) = base_compare, T fictitious = INT_MAX)
    {
        int h = sqrt(arr.length);
        int h1 = round(sqrt((float)arr.length));
        h1 += (h1 * h1) < arr.length;
        CArray<T> *B = new CArray<T>(arr.length);
        CArray<T> *C = new CArray<T>(arr.length);
        int *A_indexes = new int[h];
        int B_index = -1;

        for (int k = 0; k < arr.length; k++)
        {
            for (int i = 0; i < h; i++)
            {
                B->set(i, arr[h1 * i]);
                *(A_indexes + i) = h1 * i;
                for (int j = 1; j < h1 && j + h1 * i < arr.length; j++)
                {
                    if (compare(B->get(i), arr[j + h1 * i]))
                    {
                        B->set(i, arr[j + h1 * i]);
                        *(A_indexes + i) = (j + h1 * i);
                    }
                }
            }
            C->set(k, B->get());
            B_index = 0;
            for (int i = 1; i < h; i++)
            {
                if (compare(C->get(k), B->get(i)))
                {
                    C->set(k, B->get(i));
                    B_index = i;
                }
            }

            arr[*(A_indexes + B_index)] = fictitious;
            B->set(B_index, fictitious);
        }
        return *C;
    }

    template <typename T>
    static CArray<T> &sort_advanced_bubble(CArray<T> &arr, bool (*compare)(T, T) = base_compare)
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
    static CArray<T> &quick_sort(CArray<T> &arr, bool (*compare)(T, T) = base_compare, int LG = 0, int PG = -1)
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
};