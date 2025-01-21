#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <definitions.h>

int main(int argc,
         char *argv[]) {
    math_instance_t math = math_create(MATH_OPERATION_ADDITION);
    
    int64_t number1 = 5;
    int64_t number2 = 10;
    
    int64_t result = math_execute(math,
                                  number1,
                                  number2);
    
    printf("%lli + %lli = %lli\n",
           number1,
           number2,
           result);
    
    math_destroy(math);
    
    return 0;
}
