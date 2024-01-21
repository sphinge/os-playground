#include <system.h>
#include <usrIO.h>
#include <time.h>
int wake_up(struct TCB* context);
int check_waiting();

int scheduler(int* regs_address){       //Return 0 normal thread scheduled; 1 idle running
    check_waiting();

    if(running_head == 0){
        run_thread(&TCB_array[TCB_size], regs_address);   //idle saved at &TCB_array[TCB_size]  //TODO
        return 0;
    }
    save_context(current_context, regs_address);
    running_head = running_head->next;

    if(current_context != running_head){printfn("");}

    current_context = running_head;

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

int check_waiting(){
    if(sleeping_head != 0){
        if(sleeping_head == sleeping_head->next){
                wake_up(sleeping_head);
        }
        else if(sleeping_head != 0){
            struct TCB* iter = sleeping_head->next;

            while (iter != sleeping_head){
                wake_up(iter);
                iter = iter->next;
            }
        }
    }
    return 0;
}

int wake_up(struct TCB* context){
    if(context->waiting_state <= system_time){
        tcb_list_remove(context, &sleeping_head);
        context->status = TASK_RUNNING;
        context->waiting_state = 0;
        tcb_list_insert(context,running_head, &running_head);
    }
    return 0;
}