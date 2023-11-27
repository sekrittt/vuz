#include <iostream>

using namespace std;

namespace Array
{
        template <typename T, int N>
        int length(T (&M)[N])
        {
                return N;
        }

        template <typename T>
        void print(T *M)
        {
                cout << "{";
                int len = Array::length(M);
                for (int i = 0; i < len; i++)
                {
                        cout << M[i];
                        if (i < len - 1)
                                cout << ", ";
                }
                cout << "}" << endl;
        }

        template <typename T>
        T *move_elements(T *M, int from, int len_move)
        {
                int len_M = Array::length(M);
                T *arr = new T[len_M + len_move];
                for (int i = from; i < len_M; i++)
                {
                        arr[i + len_move] = *(M+i);
                }
                for (int i = 0; i < from; i++)
                {
                        arr[i] = *(M + i);
                }
                del[] M;
                return arr;
        }

        template <typename T>
        int index(T *M, T el)
        {
                int len = Array::length(M);
                for (int i = 0; i < len; i++)
                {
                        if (M[i] == el)
                                return i;
                }
                return -1;
        }

        template <typename T>
        T sum(T M[])
        {
                int len = Array::length(M);
                T s = 0;
                for (int i = 0; i < len; i++)
                {
                        s += M[i];
                }
                return s;
        }

        template <typename T>
        double argv(T M[])
        {
                int len = Array::length(M);
                double a = 0;
                for (int i = 0; i < len; i++)
                {
                        a += M[i] / (double)len;
                }
                return a;
        }

        template <typename T>
        bool includes(T M[], T el)
        {
                int len = Array::length(M);
                for (int i = 0; i < len; i++)
                {
                        if (M[i] == el)
                                return true;
                }
                return false;
        }

        template <typename T>
        void reverse(T *M)
        {
                int len = Array::length(M);
                T tmp = 0;
                for (int i = 0; i < len / 2; i++)
                {
                        tmp = *(M + i);
                        *(M + i) = *(M + len - 1 - i);
                        *(M + len -1 - i) = tmp;
                }
        }

        template <typename T>
        void read_from_file()
        {

        }

        template <typename T>
        T *slice(T *M, int start, int end)
        {
                int n = Array::length(M);
                T *a = new T[end - start];
                for (int i = start; i < end; i++)
                {
                        *(a + i - start) = *(M + i);
                }
                return a;
        }
}

int main()
{
        double M[] = {1, 2, 3, 5};
        cout << Array::length(M) << endl;
        return 0;
}
