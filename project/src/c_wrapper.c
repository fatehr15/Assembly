#include "assembly_library.h"

// Wrappers for assembly functions with C calling convention
void c_printArray(int arr[], int size) {
    printArray(arr, size);
}

void c_reverseArray(int arr[], int size) {
    reverseArray(arr, size);
}

void c_bubbleSort(int arr[], int size) {
    bubbleSort(arr, size);
}
