#include <iostream>
#include <clocale>

using namespace std;
void main()
{
    setlocale(LC_ALL, "Russian_Russia.65001");        //
    float d2r;                                        // Описание переменной для курса валют
    int s = 5;                                        // Описание и инициализация параметра
    cout << "Введите текущий курс рубля к доллару: "; // Вывод текста
    cin >> d2r;                                       // Чтение из потока и запись значения в переменную для курса валют
    while (s <= 120)                                  // Заголовок цикла
    {                                                 //
        cout << s << " => " << s * d2r << endl;       //
        s += 5;                                       // Изменение параметра
    }                                                 //
}
