#include <definitions.h>

char* math_operation_sign_get(MATH_OPERATION operation) {
    switch (operation) {
        case MATH_OPERATION_ADDITION:
            return "+";
        case MATH_OPERATION_SUBTRACTION:
            return "-";
        default:
            return "";
    }
}
