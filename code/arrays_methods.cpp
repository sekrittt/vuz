#include <iostream>
#include <string>
#include <fstream>

using namespace std;



template <typename T>
class CArray
{
private:
	T *els;
	int type_size = sizeof(T);

public:
	CArray()
	{
		this->els = (T *)malloc(0 * this->type_size);
	};

	CArray(int length)
	{
		this->els = (T *)malloc(length * this->type_size);
		this->length = length;
	};

	void read_from_file(string filename)
	{
		ifstream F;
		F.open(filename);
		this->els = (T *)malloc(0 * this->type_size);
		while (!F.eof())
		{
			this->length++;
			this->els = (T *)realloc(this->els, this->length * this->type_size);
			F >> *(this->els + this->length - 1);
		}
	}

	void push(T el)
	{
		this->length++;
		this->els = (T *)realloc(this->els, this->length * this->type_size);
		*(this->els + this->length - 1) = el;
	}

	T pop(int index)
	{
		T el = *(this->els + index);
		for (; index < this->length - 1; index++)
		{
			*(this->els + index) = *(this->els + index + 1);
		}
		this->length--;
		this->els = (T *)realloc(this->els, this->length * this->type_size);
		return el;
	}

	bool includes(T el)
	{
		for (int i = 0; i < this->length; i++)
		{
			if (*(this->els + i) == el)
			{
				return true;
			}
		}
		return false;
	}

	void reverse()
	{
		T tmp = 0;
		for (int i = 0; i < this->length / 2; i++)
		{
			tmp = *(this->els + i);
			*(this->els + i) = *(this->els + this->length - 1 - i);
			*(this->els + this->length - 1 - i) = tmp;
		}
	}

	CArray<T> *slice(int start, int end)
	{
		if (start < 0)
		{
			start = 0;
		}
		if (end > this->length)
		{
			end = this->length;
		}
		CArray<T> *a = new CArray<T>();
		for (int i = start; i < end; i++)
		{
			a->push(*(this->els + i));
		}
		return a;
	}

	int index(T el)
	{
		for (int i = 0; i < this->length; i++)
		{
			if (*(this->els + i) == el)
				return i;
		}
		return -1;
	}

	T get(int index)
	{
		return *(this->els + index);
	}

	void set(int index, T value)
	{
		*(this->els + index) = value;
	}

	friend ostream &operator<<(ostream &os, CArray<T> &arr)
	{
		os << "Array [" << arr.length << "] {";
		for (int i = 0; i < arr.length; i++)
		{
			os << arr.get(i);
			if (i < arr.length - 1)
				os << ", ";
		}
		os << "}" << endl;
		return os;
	};

	int &operator[](int index)
	{
		return this->els[index];
	}

	int length = 0;
};

class Sort
{
private:
	/* data */
public:
	Sort(/* args */) {};
	~Sort() {};

	template <typename T>
	static CArray<T> sort(CArray<T> arr) {

	}
};


int main()
{
	// int *M = Array::read_from_file<int>("arrays-6/file1.txt");
	// Array::print(M);
	CArray<int> *M = new CArray<int>();
	M->push(12);
	M->push(44);
	cout << *M;
	M->pop(0);
	cout << *M;
	return 0;
}
