#include <system.h>
#include <usrIO.h>

int pos = 0;
int current_context;
int scheduler(int* regs_address){
    for (int t = 0; t < TCB_size; t++) {                //save context to TCB
        if(TCB_array[t].status == TASK_RUNNING){
            pause_thread(t, regs_address);
        }
    }
    if(TCB_array[TCB_size].status == TASK_RUNNING){      //pause idle on running no context save needed
        TCB_array[TCB_size].status = TASK_IDLE;
    }

    int x = 0;                               //Round Robin Algorithm
    while(TCB_array[pos].status == TASK_TERMINATED){
        pos++;
        x++;
        if(pos == TCB_size){pos = 0;}
        if(x == TCB_size){break;}
    }

    if(x == TCB_size){
        if (current_context != TCB_size){printf("\n");}      //TODO indicates context switch
        run_thread(TCB_size, regs_address);
        current_context = TCB_size;
        return 1;
    }
    if (current_context != pos){printf("\n");}      //TODO indicates context switch

    run_thread(pos, regs_address);
    current_context = pos;
    pos++;
    if(pos == TCB_size){pos = 0;}
    return 0;
}

int pause_thread(int tcb_thread, int *regs_address){
    TCB_array[tcb_thread].status = TASK_WAITING;
    save_context(tcb_thread, regs_address);
    return 0;
}