
#include <iostream>
#include <fstream>

using namespace std;

void sort(const char *f1, const char *f2, const char *f3)
{
    fstream F;
    fstream F1, F2;
    int k = 1, N = 0, a, k1, k2;
    do
    {
        F.open(f1, ios::in);
        F1.open(f2, ios::out | ios::trunc);
        F2.open(f3, ios::out | ios::trunc);
        F1.close();
        F2.close();
        F1.open(f2, ios::out);
        F2.open(f3, ios::out);
        N = 0;
        if (F.eof())
        {
            F1.close();
            F2.close();
            F.close();
            return;
        }
        while (!F.eof())
        {
            for (int i = 0; i < k && !F.eof(); i++)
            {
                F >> a;
                F1 << a;
                F1 << " ";
                N++;
            }
            for (int i = 0; i < k && !F.eof(); i++)
            {
                F >> a;
                F2 << a;
                F2 << " ";
                N++;
            }
        }

        F1.close();
        F2.close();
        F.close();
        F.open(f1, ios::out);
        F1.open(f2, ios::in);
        F2.open(f3, ios::in);
        int a1, a2;
        F1 >> a1;
        F2 >> a2;
        while (!F1.eof() && !F2.eof())
        {
            k1 = 0;
            k2 = 0;
            while (k1 < k && k2 < k && !F1.eof() && !F2.eof())
            {
                if (a1 < a2)
                {
                    F << " ";
                    F << a1;
                    k1++;
                    F1 >> a1;
                }
                else
                {
                    F << " ";
                    F << a2;
                    k2++;
                    F2 >> a2;
                }
            }
            while (k1 < k && !F1.eof())
            {
                F << " ";
                F << a1;
                F1 >> a1;
                k1++;
            }
            while (k2 < k && !F2.eof())
            {
                F << " ";
                F << a2;
                F2 >> a2;
                k2++;
            }
        }

        while (!F1.eof())
        {
            F << " ";
            F << a1;
            F1 >> a1;
        }
        while (!F2.eof())
        {
            F << " ";
            F << a2;
            F2 >> a2;
        }
        k *= 2;
        F1.close();
        F2.close();
        F.close();
        cout << k << " " << N << endl;
    } while (k < N);
}

int main()
{
    sort("file.txt", "file1.txt", "file2.txt");
    return 0;
}
