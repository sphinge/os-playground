#include <usrIO.h>
#include <debug_unit.h>
#include <util.h>
#include <system.h>

void print_TCB_State(struct TCB *tcb){

    State s = (*tcb).status;
    int id = (*tcb).id;
    char* msg = "T_ID: %d; Status: %s";
    if(s == TASK_TERMINATED){
        printfn(msg, id, "TASK_TERMINATED");
    }
    else if(s == TASK_NEW){
        printfn(msg, id, "TASK_NEW");
    }
    else if(s == TASK_RUNNING){
        printfn(msg, id, "TASK_RUNNING");
    }
    else if(s == TASK_WAITING){
        printfn(msg, id, "TASK_WAITING");
    }
    else if(s == TASK_READY){
        printfn(msg, id, "TASK_READY");
    }
    else if(s == TASK_IDLE){
        printfn(msg, id, "TASK_IDLE");
    }
    else{
        printfn(msg, id, "ERROR");
    }
}
void print_TCB(struct TCB *tcb){}      //TODO


/* printfn:
%c => Char
%s => String
%x => Hex
%p => pointer
%d => Decimal
%b => Binary
%m => String Buffer >>*buff, len<<       //TODO X
*/
int printf(char msg[], ...) {        //TODO WTF multiple issues with more than 8 args or to long, we dont know
    int* ap;
    ap = (int*) &msg + 1;
    char* hex = "0x00000000";
    char* str = "";
    int num;
    char numberBuffer[12]; // Enough for a 32-bit integer, includes sign and null terminator.

    for(int i = 0; msg[i]; i++) {
        if(msg[i] != '%') {
            print_DBGU(msg[i]);
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    print_DBGU(*ap++);
                    i++;
                    break;

                case 's':
                    for(str = (char*) *ap++; *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'x':
                    for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'p':
                    for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'd':

                    int_to_decimal((int) *ap++, numberBuffer);
                    for (char *numStr = numberBuffer; *numStr; numStr++) {
                        print_DBGU(*numStr);
                    }
                    i++;
                    break;

                case 'b':              //Wahrlich optimierbar
                    num = *ap++;
                    for(int i = 0; i < 32; i++) {
                        int bits = 0x80000000 >> i;
                        int little = num & bits;
                        if(little == 0) {
                            print_DBGU('0');
                        }
                        else {
                            print_DBGU('1');
                        }
                    }
                    i++;
                    break;

                case 'm':
                    str = (char*) *ap++;
                    num = (int) *ap++;
                    for(int i = 0; i<num; i++) {
                        print_DBGU(str[i]);
                    }
                    i++;
                    break;

                default:
                    print_DBGU('%');
            }
        }
        str = "";
        hex = "0x00000000";
        num = 0;
    }
    return 0;
}

int printfn(char msg[], ...) {        //TODO WTF multiple issues with more than 8 args or to long, we dont know
    int* ap;
    ap = (int*) &msg + 1;
    char* hex = "0x00000000";
    char* str = "";
    int num;
    char numberBuffer[12]; // Enough for a 32-bit integer, includes sign and null terminator.

    for(int i = 0; msg[i]; i++) {
        if(msg[i] != '%') {
            print_DBGU(msg[i]);
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    print_DBGU(*ap++);
                    i++;
                    break;

                case 's':
                    for(str = (char*) *ap++; *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'x':
                    for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'p':
                    for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'd':

                    int_to_decimal((int) *ap++, numberBuffer);
                    for (char *numStr = numberBuffer; *numStr; numStr++) {
                        print_DBGU(*numStr);
                    }
                    i++;
                    break;

                case 'b':              //Wahrlich optimierbar
                    num = *ap++;
                    for(int i = 0; i < 32; i++) {
                        int bits = 0x80000000 >> i;
                        int little = num & bits;
                        if(little == 0) {
                            print_DBGU('0');
                        }
                        else {
                            print_DBGU('1');
                        }
                    }
                    i++;
                    break;

                case 'm':
                    str = (char*) *ap++;
                    num = (int) *ap++;
                    for(int i = 0; i<num; i++) {
                        print_DBGU(str[i]);
                    }
                    i++;
                    break;

                default:
                    print_DBGU('%');
            }
        }
        str = "";
        hex = "0x00000000";
        num = 0;
    }
    print_DBGU('\n');
    return 0;
}