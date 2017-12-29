#include "myClass.h"

void PrintToFile(){
    printf("PrintToFile function\n");
    FILE *f = fopen("output.txt","a");
    fprintf(f,program);

}
