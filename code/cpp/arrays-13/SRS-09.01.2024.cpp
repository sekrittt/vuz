#include <iostream>
#include <fstream>

using namespace std;

void sort(const char *f, const char *f1, const char *f2)
{
    fstream F, F1, F2;
    int size_f1 = 0; // кол-во чисел записанных в первый файл
    int N = 0, a1 = 0, a2 = 0, k1, k2;
    bool flag = false, add_space = false; // flag - выбор файла, если true второй файл, иначе - первый; add_space - добавление пробела перед числом в файле, для исключения ошибок при чтении
    do
    {
        // Открытие файлов
        F.open(f, ios::in);
        // Очистка вспомогательных файлов
        F1.open(f1, ios::out | ios::trunc);
        F2.open(f2, ios::out | ios::trunc);
        F1.close();
        F2.close();
        F1.open(f1, ios::out);
        F2.open(f2, ios::out);
        // Сброс переменных
        N = 1;
        flag = false;
        add_space = false;
        size_f1 = 1;
        // Фаза разбиения
        F >> a1;
        F1 << a1;
        while (!F.eof())
        {
            F >> a2;
            flag = a1 > a2;
            (flag ? F2 : F1) << (flag && !add_space ? "" : " ") << a2; // выбирается файл для записи и пропуск добавления пробела перед числом, если запись идёт во второй файл и первый раз
            !flag ? size_f1++ : 0; // изменяется значение переменной size_f1
            a1 = a2; //
            N++;
            flag && !add_space ? add_space = true : 0; // изменение значения переменной add_space, если производилась запись во второй файл и значение было false
        }

        F1.close();
        F2.close();
        F.close();
        add_space = false; // Сброс переменной
        if (size_f1 == N) // При условии что у нас заполнится первый файл всеми значениями из исходного завершаем выполнение сортировки
        {
            return;
        }
        // Фаза слияния
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