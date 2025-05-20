#ifndef ASSEMBLY_LIBRARY_H
#define ASSEMBLY_LIBRARY_H

#include <stdbool.h>

// Number operations
int sumOfDigits(int num);
long factorial(int num);
bool isEven(int num);

// String operations
int stringLength(const char* str);
bool isEmpty(const char* str);

// Array operations
void printArray(int arr[], int size);
void reverseArray(int arr[], int size);
void bubbleSort(int arr[], int size);

#endif
