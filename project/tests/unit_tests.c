#include <criterion/criterion.h>
#include "assembly_library.h"

Test(number_ops, sum_of_digits) {
    cr_assert_eq(sumOfDigits(123), 6);
    cr_assert_eq(sumOfDigits(-456), 15);
}

Test(number_ops, factorial) {
    cr_assert_eq(factorial(5), 120L);
    cr_assert_eq(factorial(0), 1L);
}

Test(string_ops, empty_check) {
    cr_assert(isEmpty(""));
    cr_assert_not(isEmpty("test"));
}
