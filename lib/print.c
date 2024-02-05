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
void print_TCB(){
    for (int i = 0; i < TCB_size; i++) {
        print_TCB_State(&TCB_array[i]);
    }
}

int _printf(char msg[], int* argv) {
    int* ap = argv;
    int added_length = 0;
    int i = 0;
    for(; msg[i]; i++) {
        if(msg[i] != '%') {
            continue;
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    added_length++;
                    break;

                case 's':
                    added_length += strlen((char*) *ap);
                    break;

                case 'x':
                    added_length += 10;
                    break;

                case 'p':
                    added_length += 10;
                    break;

                case 'd':
                    added_length += 12;
                    break;

                case 'b':
                    added_length += 32;
                    break;

                case 'm':
                    ap++;
                    added_length += (int) *ap;
                    break;

                default:
                    print_DBGU('%');
                    ap--;
            }
            ap++;
        }
    }
    char fstr[i + added_length + 1];
    _format(msg, fstr, argv);
    print_string_DBGU(fstr, strlen(fstr));
    return 0;
}

int printf(char msg[], ...) {
    _printf(msg, (int*) &msg + 1);
    return 0;
}

int printfn(char msg[], ...) {
    _printf(msg, (int*) &msg + 1);
    print_DBGU('\n');
    return 0;
}

int print_buffer(int* buffer, int length){
    printf("[");
    for (int i = 0; i < length-1; i++) {
        printf("%x, ", buffer[i]);
    }
    printf("%x", buffer[length]);
    printfn("]");

    return 0;
}

int print_regs(int* address){
    printfn(" SP: %x  LR: %x  CPSR: %x   PC: %x", address[0], address[1], address[2], address[3]);
    printfn(" R0: %x  R1: %x    R2: %x   R3: %x", address[4], address[5], address[6], address[7]);
    printfn(" R4: %x  R5: %x    R6: %x   R7: %x", address[8], address[9], address[10], address[11]);
    printfn(" R8: %x  R9: %x   R10: %x  R11: %x", address[12], address[13], address[14], address[15]);
    printfn("R12: %x", address[16]);
    return 0;
}