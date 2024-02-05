#include <system.h>
#include <util.h>
#include <syscall.h>
#include <memconfig.h>


int tid_counter = 0;

int init_tcb(void* address, int size){
    running_head = 0;
    sleeping_head = 0;
    waiting_head = 0;
    empty_head = 0;
    current_context = 0;

    TCB_array = address;
    TCB_size = size;

    struct TCB empty = {-1, 0,  0/*TODO*/,{0},TASK_TERMINATED, 0, 0, 0, 0};

    for (int i = 1; i < TCB_size; i++) {
        memcpy(&TCB_array[i], &empty, sizeof(struct TCB));
        TCB_array[i].stack_base = USER_STACK_ADDRESS + (USER_STACK_SPACE * i);
        TCB_array[i].next = &TCB_array[i+1];
        TCB_array[i].prev = &TCB_array[i-1];
    }
    TCB_array[1].prev = &TCB_array[TCB_size-1];
    TCB_array[TCB_size-1].next = &TCB_array[1];
    empty_head = &TCB_array[1];
    create_idle();
    current_context = idle_thread;
    return 0;
}

int save_context(struct TCB* tcb_thread, int* regs_address){
    memcpy(tcb_thread->regs, regs_address, REGISTER_NUM * 4);
    return 0;
}

int run_thread(struct TCB* tcb_thread, int* regs_address){
    tcb_thread->status = TASK_RUNNING;
    memcpy(regs_address, tcb_thread->regs, REGISTER_NUM * 4);
    return 0;
}

int tcb_insert(int table_address, int start_t, int arg_num, int* args){         //Thread init  if 0 everything is good, if -1 no space for new thread

    if(empty_head == 0) {
        return 1;
    }
    struct TCB tcb;
    struct TCB* tcb_address = empty_head->prev;

    tcb_list_remove(tcb_address, &empty_head);

    create_tcb(&tcb, table_address, start_t, arg_num, args, tcb_address->stack_base);
    memcpy(tcb_address, &tcb, sizeof(struct TCB));
    tid_counter ++;

    tcb_list_insert(tcb_address, running_head->prev, &running_head);
    return 0;
}

int create_tcb(struct TCB *tcb, int table_address, int start_t, int arg_num, int* args, int stack_address){
    tcb->id = tid_counter;
    tcb->status = TASK_NEW;
    tcb->waiting_state = 0;
    tcb->stack_base = stack_address;
    tcb->table_base = table_address;

    tcb->regs[0] = stack_address;      //set stack pointer
    tcb->regs[1] = (int) kill_t;    //TODO
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
        memcpy((void *) stack_address, &args[4], arg_num * 4); //Setup Args in stack
    }
    return 0;
}

int tcb_list_remove(struct TCB* tcb, struct TCB** list_head_ptr){   //0: Termination complete;
    if(tcb->next == tcb){
        *list_head_ptr = 0;
        return 0;
    }
    if(tcb == *list_head_ptr){
        *list_head_ptr = tcb->next;
    }

    tcb->next->prev = tcb->prev;
    tcb->prev->next = tcb->next;
    return 0;
}

int tcb_list_insert(struct TCB* tcb, struct TCB* tcb_after, struct TCB** list_head_ptr){        //insert after address
    if(tcb_after == 0){
        *list_head_ptr = tcb;
        tcb->next = tcb;
        tcb->prev = tcb;
    }
    else{
        tcb_after->next->prev = tcb;
        tcb->next = tcb_after->next;
        tcb_after->next = tcb;
        tcb->prev = tcb_after;
    }
    return 0;
}

int create_idle(){
    int stack_pointer = USER_STACK_ADDRESS;
    struct TCB tcb = { -2,0, 0/*TODO*/, {0},TASK_TERMINATED, 0, 0, 0, 0};
    tcb.id = -2;

    tcb.regs[0] = stack_pointer;              //set stack pointer
    tcb.regs[1] = 0;                          //LR never reached
    tcb.regs[2] = 0b10000;                    //Set CPSR to USER
    tcb.regs[3] = (int) (idle + 4);           //Set PC EXPECT TO BE LOADED FROM IRQ Routine

    tcb.status = TASK_IDLE;
    idle_thread = (struct TCB *) TCB_ADDRESS;
    memcpy(idle_thread, &tcb, sizeof(struct TCB));           //TCB_array[i] = tcb;
    return 0;
}

void idle(){         //TODO use power saving mode for environment
    while (1){
        /*
        unsigned int cpsr;
        __asm__("mrs %0, cpsr" : "=r" (cpsr));
        printfn("idle: %b", cpsr);
        */
        //printfn("idle");
        for (int i = 0; i < 214748364; ++i) {}
    }
}