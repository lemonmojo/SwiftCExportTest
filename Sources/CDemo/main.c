#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <definitions.h>

int main(int argc,
         char *argv[]) {
    MATH_OPERATION operation = MATH_OPERATION_ADDITION;
    math_instance_t math = math_create(operation);
    
    char* operationSign = math_operation_sign_get(operation);
    
    int64_t number1 = 5;
    int64_t number2 = 10;
    
    int64_t result = math_execute(math,
                                  number1,
                                  number2);
    
    printf("%lli %s %lli = %lli\n",
           number1,
           operationSign,
           number2,
           result);
    
    math_destroy(math);
    
    return 0;
}
