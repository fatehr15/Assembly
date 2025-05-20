# Assembly Library Documentation

## Function Overview

### Number Operations
- `sumOfDigits(int num)`: Calculates sum of digits (handles negatives)
- `factorial(int num)`: Computes n! (max input 20)
- `isEven(int num)`: Checks even/odd status

### String Operations
- `stringLength(const char*)`: Fast strlen implementation
- `isEmpty(const char*)`: Checks empty string

### Array Operations
- `printArray(int[], int)`: Formatted array printing
- `reverseArray(int[], int)`: In-place reversal
- `bubbleSort(int[], int)`: Classic bubble sort

## Building
```bash
make && make test
