#include <stdio.h>
#include <time.h>
#include "assembly_library.h"

#define ITERATIONS 1000000

void benchmark_sum_of_digits() {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);
    
    for (int i = 0; i < ITERATIONS; i++) {
        sumOfDigits(123456789);
    }
    
    clock_gettime(CLOCK_MONOTONIC, &end);
    long duration = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    printf("sumOfDigits: %ld ns/op\n", duration/ITERATIONS);
}

// Similar benchmark functions for other operations

int main() {
    benchmark_sum_of_digits();
    // Add other benchmarks
    return 0;
}
