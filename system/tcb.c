#include <system.h>
#include <memory.h>
#include <usrIO.h>

int tid_counter = 0;

int init_tcb(void* address, int size){
    TCB_array = address;
    TCB_size = size;

    struct TCB empty = { -1, {0},TASK_TERMINATED};
    for (int i = 0; i < TCB_size; i++) {
        memcpy(&TCB_array[i], &empty, sizeof(struct TCB));
    }
    memcpy(&TCB_array[TCB_size], &empty, sizeof(struct TCB));
    create_idle();
    return 0;
}

int save_context(int tcb_thread, int* regs_address){
    memcpy(TCB_array[tcb_thread].regs, regs_address, REGISTER_NUM * 4);
    return 0;
}

int tcb_insert(int start_t, int arg_num, int* args){         //Thread init  if 0 everything is good, if -1 no space for new thread
    struct TCB tcb;

    for (int i = 0; i < TCB_size; i++) {
        if(TCB_array[i].status == TASK_TERMINATED)
        {
           // int stack_pointer = TCB_STACK_ADDRESS - (TCB_STACK_SPACE * i);

            create_tcb(&tcb, start_t, arg_num, args, TCB_STACK_ADDRESS - (TCB_STACK_SPACE * i));

            memcpy(&TCB_array[i], &tcb, sizeof(struct TCB));           //TCB_array[i] = tcb;
            tid_counter ++;
            return 0;
        }
    }
    return -1;
}

int create_tcb(struct TCB *tcb, int start_t, int arg_num, int* args, int stack_add){
    tcb->id = tid_counter;
    tcb->status = TASK_NEW;

    tcb->regs[0] = stack_add;      //set stack pointer
    //tcb->regs[1] = (int) kill_t; //TODO
    tcb->regs[2] = 0b10000;        //Set CPSR to USER
    tcb->regs[3] = start_t + 4;    //Set PC  EXPECT TO BE LOADED FROM IRQ Routine

    for (int i = 4; i < REGISTER_NUM; i++) {
        tcb->regs[i] = 0;
    }

    for (int i = 0; (i < 4) && (i < arg_num); ++i) {                //Setup Registers with args
        tcb->regs[4+i] = args[i];
    }
    arg_num -= 4;

    if(arg_num > 0){
        memcpy((void *) stack_add, &args[4], arg_num * 4); //Setup Args in stack
    }
    return 0;
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
    TCB_array[tcb_thread].status = TASK_RUNNING;
    memcpy(regs_address, TCB_array[tcb_thread].regs, REGISTER_NUM * 4);
    return 0;
}

int create_idle(){
    int stack_pointer = TCB_STACK_ADDRESS - (TCB_STACK_SPACE * TCB_size);
    struct TCB tcb;

    tcb.id = -2;

    for (int i = 0; i < REGISTER_NUM; i++) {
        tcb.regs[i] = 0;
    }
    tcb.regs[0] = stack_pointer;              //set stack pointer
    //tcb.regs[1] = (int) kill_t;             //TODO
    tcb.regs[2] = 0b10000;                    //Set CPSR to USER
    tcb.regs[3] = (int) (idle + 4);           //Set PC EXPECT TO BE LOADED FROM IRQ Routine

    tcb.status = TASK_IDLE;

    memcpy(&TCB_array[TCB_size], &tcb, sizeof(struct TCB));           //TCB_array[i] = tcb;
    return 0;
}

void idle(){
    while (1){
        printfn("idle");
        for (int i = 0; i < 214748364; ++i) {}
    }
}



