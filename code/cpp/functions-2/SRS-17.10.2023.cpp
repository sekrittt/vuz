#include <iostream>

using namespace std;

void get_count(int &count) { // Вспомогательная функция
	int a;
	do {
		cout << "Please enter number: ";
		cin >> a; // Ввод числа
		if (a != 0) count++; // Подсчёт чисел
	} while (a != 0); // Пока не 0
}
int main() {
	int count = 0; // Кол-во чисел
	get_count(count); // Вызов вспомогательной функции
	cout << "Count = " << count << endl; // Вывод кол-ва чисел
	return 0;
}
/*
Please enter number: 2
Please enter number: 23
Please enter number: 3432
Please enter number: 4534
Please enter number: 10
Please enter number: 0
Count = 5
 */
