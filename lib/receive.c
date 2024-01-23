#include <usrIO.h>
#include <debug_unit.h>
#include <memory.h>

//receive String until press Enter
int receive_line(char str[], int max_input){   //TODO invalid
    reset_Buffer_DBGU();
    volatile char* rhr = (char*) (DBGU + DBGU_RHR);
    int* check = (int*) (DBGU + DBGU_SR);
    char input[max_input];
    char act = 'x';
    int len;

    for(len = 0; act != ENTER && len< max_input; len++) {
        while(!(*check & (1))) {}     //TODO wait for character and give it to a var
        input[len] = *rhr;
        act = input[len];
        print_DBGU(act);
    }
    act = '\n';

    print_DBGU(act);
    memcpy (str, input, len);
    return 0;
}

char receive_n() {  //TODO
    return 0;
}