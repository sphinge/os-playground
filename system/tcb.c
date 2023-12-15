#include <system.h>
#include <memory.h>
#include <usrIO.h>

int tid_counter = 0;

int init_tcb(void* address, int size){
    TCB_array = address;
    TCB_size = size;

    struct TCB empty = { 0, {0}, 0, 0, TASK_TERMINATED};
    for (int i = 0; i < TCB_size; i++) {
        TCB_array[i] = empty;
    }
    return 0;
}

int create_t(int* start_t){
    disable_interrupts();
    tcb_insert((int) start_t);   //TODO option for arguments
    enable_interrupts();
    return 0;
}

int kill_t(){
    disable_interrupts();
    tcb_remove();
    enable_interrupts();
    return 0;
}

//TODO LOGICAL SCHEDULE OR INSERT ERROR
int tcb_insert(int start_t){         //Thread init  if 0 everything is good, if -1 no space for new thread
    struct TCB tcb;
    tcb.id = tid_counter;
    for (int i = 1; i < REGISTER_NUM; i++) {
        tcb.regs[i] = 0;
    }
    tcb.regs[0] = 0b10000;    //Set CPSR to USER
    tcb.regs[3] = start_t;    //Set PC

    tcb.status = TASK_NEW;

    for (int i = 0; i < TCB_size; i++) {
        if(TCB_array[i].status == TASK_TERMINATED)
        {
            tcb.regs[2] = TCB_STACK_ADDRESS - (TCB_STACK_SPACE * i);              //set stack pointer
            memcpy(&TCB_array[i], &tcb, sizeof(struct TCB));           //TCB_array[i] = tcb;
            tid_counter ++;
            return 0;
        }
    }
    return -1;
}

int tcb_remove(){   //0: Termination complete; -1: There is no Running Thread
    for (int i = 0; i < TCB_size; i++) {
        if(TCB_array[i].status == TASK_RUNNING){
            TCB_array[i].status = TASK_TERMINATED;
            return 0;
        }
    }
    return -1;
}

int run_thread(int tcb_thread, int* regs_address){
    memcpy(regs_address, TCB_array[tcb_thread].regs, REGISTER_NUM);
    return 0;
}