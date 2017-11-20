#include "stdafx.h"
#include <iostream>
#include <sstream>
#include <utility>

using namespace std;

void merge(int * mas, int left, int mid, int right) {
	int i, j, k;
	int size_l = mid - left + 1;
	int size_r = right - mid;
	int * mas_l = new int[size_l];
	int * mas_r = new int[size_r];
	for (i = 0; i<size_l; ++i) {
		mas_l[i] = mas[left + i];
	}
	for (j = 0; j<size_r; ++j) {
		mas_r[j] = mas[mid + 1 + j];
	}
	i = 0; j = 0; k = left;
	while ((i<size_l) && (j<size_r)) {
		if (mas_l[i] <= mas_r[j]) {
			mas[k] = mas_l[i];
			i++;
		}
		else {
			mas[k] = mas_r[j];
			j++;
		}
		k++;
	}
	while (i<size_l) {
		mas[k] = mas_l[i];
		i++; k++;
	}
	while (j<size_r) {
		mas[k] = mas_r[j];
		j++; k++;
	}
}

void MergeSort(int * mas, int left, int right) {
	if (left<right) {
		int m = left + (right - left) / 2;
		MergeSort(mas, left, m);
		MergeSort(mas, m + 1, right);
		merge(mas, left, m, right);
	}
}

int main() {
	int size;
	string str_size;
	getline(cin, str_size);
	istringstream num(str_size);
	if (!(num >> size) || (size<2)) {
		cout << "An error has occured while reading input data." << endl;
		return -1;
	}
	int * mas = new int[size];
	string str_nums;
	getline(cin, str_nums);
	istringstream stream(str_nums);
	for (unsigned int i = 0; i<size; ++i) {
		if (!(stream >> mas[i])) {
			cout << "An error has occured while reading input data." << endl;
			delete[]mas;
			return -1;
		}
	}
	MergeSort(mas, 0, size - 1);
	for (unsigned int i = 0; i < size; ++i) {
		cout << mas[i] << " ";
	}
	delete[]mas;
	return 0;
}
