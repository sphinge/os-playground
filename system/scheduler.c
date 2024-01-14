#include <system.h>
#include <usrIO.h>

int pos = 0;        //TODO consider changing it
int current_context;
int scheduler(int* regs_address){       //Return 0 normal thread scheduled; 1 idle running
    if(running_head == 0){
        run_thread(&TCB_array[TCB_size], regs_address);   //idle saved at &TCB_array[TCB_size]  //TODO
        return 0;
    }
    running_head = running_head->next;
    run_thread(running_head, regs_address);
    return 0;
}

int pause_all(int* regs_address){
    for (int t = 0; t < TCB_size; t++) {                //save context to TCB
        if(TCB_array[t].status == TASK_RUNNING){
            pause_thread(t, regs_address);
        }
    }
    if(TCB_array[TCB_size].status == TASK_RUNNING){      //pause idle on running no context save needed
        TCB_array[TCB_size].status = TASK_IDLE;
    }
    return 0;
}

int pause_thread(int tcb_thread, int *regs_address){
    TCB_array[tcb_thread].status = TASK_WAITING;
    //save_context(tcb_thread, regs_address);
    return 0;
}