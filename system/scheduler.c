#include <system.h>
#include <usrIO.h>

int pos = 0;

int scheduler(int* regs_address){
    for (int t = 0; t < TCB_size; t++) {               //save context to TCB
        if(TCB_array[t].status == TASK_RUNNING){
            pause_thread(t, regs_address);
        }
    }

    int x = 0;                                                                           //Round Robin Algorithm
    while(TCB_array[pos].status != TASK_NEW || TCB_array[pos].status != TASK_WAITING){
        pos ++;
        x++;
        if(pos == TCB_size){pos = 0;}

        if(x == TCB_size){  break;}
    }

    if(x == TCB_size){ return -1;}

    run_thread(pos, regs_address);
    return 0;
}

void pause_thread(int tcb_thread, int *regs_address){
    TCB_array[tcb_thread].status = TASK_WAITING;
    for (int i = 0; i < REGISTER_NUM; i++) {
        TCB_array[tcb_thread].regs[i] = regs_address[i];
    }
}