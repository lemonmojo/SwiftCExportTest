#ifndef definitions_h
#define definitions_h

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// Declare your C API surface here.
// Implementations can be added either in C itself (definitions.c) or in Swift (MathC.swift).

// MARK: - Types
// Declares an opaque pointer to use as a "handle" for our `Math` class.
typedef void* math_instance_t;

// MARK: - Enums
// Declares a C enum which matches Swift's `Math.Operation` enum.
typedef enum {
    MATH_OPERATION_ADDITION = 0,
    MATH_OPERATION_SUBTRACTION = 1
} MATH_OPERATION;

// MARK: - Functions
// Creates an instance of the `Math` "class".
extern math_instance_t _Nonnull math_create(MATH_OPERATION operation);

// Destroys an instance of the `Math` "class" that was previously allocated by calling `math_create`.
extern void math_destroy(math_instance_t _Nonnull instance);

// Executes the specified operation on the passed in instance of the `Math` "class".
extern int64_t math_execute(math_instance_t _Nonnull instance,
                            int64_t number1,
                            int64_t number2);

// Returns a string for the passed in operation. The caller is NOT responsible for freeing the memory of the returned char pointer.
extern char* _Nonnull math_operation_sign_get(MATH_OPERATION operation);

#endif /* definitions_h */
