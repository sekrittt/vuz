#include <iostream>
#include <fstream>

#include "Sort.hpp"
#include "CArray.hpp"

using namespace std;

template <typename T>
CArray<T>::CArray()
{
	this->els = (T *)malloc(0 * this->type_size);
	this->length = 0;
};
template <typename T>
CArray<T>::CArray(int length)
{
	this->els = (T *)malloc(length * this->type_size);
	this->length = length;
};
template <typename T>
void CArray<T>::read_from_file(string filename)
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
template <typename T>
void CArray<T>::push(T el)
{
	this->length++;
	this->els = (T *)realloc(this->els, this->length * this->type_size);
	*(this->els + this->length - 1) = el;
}
template <typename T>
T CArray<T>::pop(int index)
{
	if (index >= this->length)
	{
		return;
	}
	if (index < 0)
	{
		return;
	}

	T el = *(this->els + index);
	for (; index < this->length - 1; index++)
	{
		*(this->els + index) = *(this->els + index + 1);
	}
	this->length--;
	this->els = (T *)realloc(this->els, this->length * this->type_size);
	return el;
}
template <typename T>
void CArray<T>::insert(int index, T el)
{
	if (index >= this->length)
	{
		return;
	}
	if (index < 0)
	{
		return;
	}

	this->length++;
	this->els = (T *)realloc(this->els, this->length * this->type_size);
	for (int i = this->length - 2; index < i; i--)
	{
		*(this->els + i + 1) = *(this->els + i);
	}
	*(this->els + index) = el;
}
template <typename T>
bool CArray<T>::includes(T el)
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
template <typename T>
void CArray<T>::reverse()
{
	T tmp;
	for (int i = 0; i < this->length / 2; i++)
	{
		tmp = *(this->els + i);
		*(this->els + i) = *(this->els + this->length - 1 - i);
		*(this->els + this->length - 1 - i) = tmp;
	}
}
template <typename T>
CArray<T> *CArray<T>::slice(int start, int end)
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
template <typename T>
int CArray<T>::index(T el)
{
	for (int i = 0; i < this->length; i++)
	{
		if (*(this->els + i) == el)
			return i;
	}
	return -1;
}
template <typename T>
T CArray<T>::get(int index)
{
	return *(this->els + index);
}
template <typename T>
T CArray<T>::get()
{
	return *(this->els);
}
template <typename T>
void CArray<T>::set(int index, T value)
{
	*(this->els + index) = value;
}
template <typename T>
void CArray<T>::update_length(int new_length)
{
	this->length = new_length;
	this->els = (T *)realloc(this->els, this->length * this->type_size);
}
template <typename T>
template <typename J>
CArray<J> CArray<T>::map(J (*callback)(T element, int index, CArray<T> &array))
{
	CArray<J> new_arr;
	for (int i = 0; i < this->length; i++)
	{
		new_arr.push(callback(*(this->els + i), i, *this));
	}
	return new_arr;
}
template <typename T>
CArray<T> CArray<T>::filter(bool (*callback)(T element, int index, CArray<T> &array))
{
	CArray<T> new_arr;
	for (int i = 0; i < this->length; i++)
	{
		bool result = callback(*(this->els + i), i, *this);
		if (result)
		{
			new_arr.push(*(this->els + i));
		}
	}
	return new_arr;
}