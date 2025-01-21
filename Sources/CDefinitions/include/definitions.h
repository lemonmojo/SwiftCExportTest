#ifndef definitions_h
#define definitions_h

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// MARK: - Types
typedef void* math_instance_t;

// MARK: - Enums
typedef enum {
    MATH_OPERATION_ADDITION = 0,
    MATH_OPERATION_SUBTRACTION = 1
} MATH_OPERATION;

// MARK: - Functions
extern math_instance_t _Nonnull math_create(MATH_OPERATION operation);
extern void math_destroy(math_instance_t _Nonnull instance);

extern int64_t math_execute(math_instance_t _Nonnull instance,
                            int64_t number1,
                            int64_t number2);

extern char* _Nonnull math_operation_sign_get(MATH_OPERATION operation);

#endif /* definitions_h */
