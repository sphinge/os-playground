#include <system.h>

int create_t(int* start_t, int arg_num , ...){   //TODO call tcb remove from SYS not USR MODE
    int* ap;
    ap = (int*) &start_t + 1;
    //disable_interrupts();
    tcb_insert((int) start_t, arg_num, (ap+2));
    //enable_interrupts();
    return 0;
}

void kill_t(){       //TODO
    //disable_interrupts();
    //tcb_remove();
    //enable_interrupts();
    while (1){}
}