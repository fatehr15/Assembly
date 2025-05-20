#include <stdio.h>
#include "assembly_library.h"

int main() {
    // Number operations demo
    printf("Sum of 12345 digits: %d\n", sumOfDigits(12345));
    printf("Factorial of 5: %ld\n", factorial(5));
    printf("Is 42 even? %s\n", isEven(42) ? "Yes" : "No");

    // String operations demo
    const char* testStr = "Hello";
    printf("'%s' length: %d\n", testStr, stringLength(testStr));
    printf("Empty string? %s\n", isEmpty("") ? "Yes" : "No");

    // Array operations demo
    int arr[] = {5, 3, 9, 1, 7};
    const int size = sizeof(arr)/sizeof(arr[0]);
    
    printf("Original array: ");
    c_printArray(arr, size);
    
    c_reverseArray(arr, size);
    printf("Reversed array: ");
    c_printArray(arr, size);
    
    c_bubbleSort(arr, size);
    printf("Sorted array: ");
    c_printArray(arr, size);

    return 0;
}
