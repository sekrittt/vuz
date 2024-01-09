// Жабо Дмитрий БАС-1
#include <iostream>
#include <fstream>

using namespace std;

void sort(const char *f, const char *f1, const char *f2)
{
    fstream F, F1, F2;
    int size_f1 = 0;
    int N = 0, a1 = 0, a2 = 0, k1, k2;
    bool flag = false, add_space = false;
    do
    {
        F.open(f, ios::in);
        F1.open(f1, ios::out | ios::trunc);
        F2.open(f2, ios::out | ios::trunc);
        F1.close();
        F2.close();
        F1.open(f1, ios::out);
        F2.open(f2, ios::out);
        N = 1;
        flag = false;
        add_space = false;
        size_f1 = 1;
        F >> a1;
        F1 << a1;
        while (!F.eof())
        {
            F >> a2;
            flag = a1 > a2;
            (flag ? F2 : F1) << (flag && !add_space ? "" : " ") << a2;
            !flag ? size_f1++ : 0;
            a1 = a2;
            N++;
            flag && !add_space ? add_space = true : 0;
        }

        F1.close();
        F2.close();
        F.close();
        add_space = false;
        if (size_f1 == N)
        {
            return;
        }

        F.open(f, ios::out | ios::trunc);
        F1.open(f1, ios::in);
        F2.open(f2, ios::in);
        while (!F1.eof())
        {
            F1 >> k1;
            if (!F2.eof())
            {
                F2 >> k2;
                if (k2 < k1) {
                    F << (add_space ? " " : "") << k2 << " " << k1;
                } else {
                    F << (add_space ? " " : "") << k1 << " " << k2;
                }
            } else {
                F << (add_space ? " " : "") << k1;
            }
            !add_space ? add_space = true : 0;
        }

        while (!F2.eof()) {
            F2 >> k2;
            F << (add_space ? " " : "") << k2;
            !add_space ? add_space = true : 0;
        }

        F1.close();
        F2.close();
        F.close();
    } while (size_f1 < N);
}

int main()
{
    sort("file-srs.txt", "file1-srs.txt", "file2-srs.txt");
    return 0;
}