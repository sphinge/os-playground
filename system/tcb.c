#include <system.h>
#include <memory.h>
#include <usrIO.h>

int tid_counter = 0;
struct TCB* running_t = 0;
struct TCB* sleeping_t = 0;
struct TCB* waiting_t = 0;
struct TCB* empty_t = 0;

int init_tcb(void* address, int size){
    TCB_array = address;
    TCB_size = size;

    struct TCB empty = { -1, {0},TASK_TERMINATED, 0, 0, 0, 0};
    for (int i = 0; i < TCB_size; i++) {
        memcpy(&TCB_array[i], &empty, sizeof(struct TCB));
        if(i < TCB_size-1){
            TCB_array[i].next = &TCB_array[i+1];
        }
    }
    empty_t = TCB_array;

    create_idle();
    return 0;
}

int save_context(int tcb_thread, int* regs_address){   //TODO
    memcpy(TCB_array[tcb_thread].regs, regs_address, REGISTER_NUM * 4);
    return 0;
}

int tcb_insert(int start_t, int arg_num, int* args){         //Thread init  if 0 everything is good, if -1 no space for new thread
    struct TCB tcb;
    int* new_empty = empty_t->next;
    int array_pos = ((int) TCB_array - (int) empty_t) / sizeof(struct TCB);

    create_tcb(&tcb, start_t, arg_num, args, TCB_STACK_ADDRESS - (TCB_STACK_SPACE * array_pos));
    tid_counter ++;

    if(running_t == 0){
        running_t = empty_t;
        running_t->next = running_t;
    }
    else{
        tcb.next = running_t;
        tcb.prev = running_t->prev;
        tcb.prev->next = empty_t;
    }
    running_t->prev = empty_t;
    empty_t = empty_t->next;   //TODO handle if empty_t->next == 0

    memcpy(&TCB_array[array_pos], &tcb, sizeof(struct TCB));
    return 0;
}

int create_tcb(struct TCB *tcb, int start_t, int arg_num, int* args, int stack_add){
    tcb->id = tid_counter;
    tcb->status = TASK_NEW;
    tcb->waiting_state = 0;

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

int tcb_remove(){   //0: Termination complete;
    struct TCB* old_empty_t = empty_t;
    empty_t = running_t;
    empty_t-> next = old_empty_t;

    if(running_t == running_t->next){
        running_t = 0;
    }
    else{
        running_t->status = TASK_TERMINATED;
        running_t->prev->next = running_t->next;
        running_t->next->prev = running_t->prev;
        running_t = running_t->next;
    }
    return 0;
}

int run_thread(struct TCB* tcb_thread, int* regs_address){        //TODO use waiting_state in tcb struct (dont be confused :) fr)
    tcb_thread->status = TASK_RUNNING;

    memcpy(regs_address, tcb_thread->regs, REGISTER_NUM * 4);
    return 0;
}

int create_idle(){
    int stack_pointer = TCB_STACK_ADDRESS - (TCB_STACK_SPACE * TCB_size);
    struct TCB tcb = { -2, {0},TASK_TERMINATED, 0, 0, 0};

    tcb.id = -2;

    tcb.regs[0] = stack_pointer;              //set stack pointer
    //tcb.regs[1] = (int) kill_t;             //TODO
    tcb.regs[2] = 0b10000;                    //Set CPSR to USER
    tcb.regs[3] = (int) (idle + 4);           //Set PC EXPECT TO BE LOADED FROM IRQ Routine

    tcb.status = TASK_IDLE;
    memcpy(&TCB_array[TCB_size], &tcb, sizeof(struct TCB));           //TCB_array[i] = tcb;
    return 0;
}

void idle(){         //TODO use power saving mode for environment
    while (1){
        printfn("idle");
        for (int i = 0; i < 214748364; ++i) {}
    }
}