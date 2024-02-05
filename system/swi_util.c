#include <system.h>
#include <time.h>

int _create_t(void* start_t, int arg_num , int* args){
    int table_address = 0;
    tcb_insert((int) table_address, (int)start_t, arg_num, args);
    return 0;
}

int _kill_t(struct TCB* context){
    tcb_list_remove(context, &running_head);
    context->status = TASK_TERMINATED;
    tcb_list_insert(context, empty_head, &empty_head);
    return 0;
}

int _sleep(struct TCB* context, int interval){
    context->status = TASK_WAITING;
    context->waiting_state = system_time + interval;

    tcb_list_remove(context, &running_head);

    if(sleeping_head == 0){
        tcb_list_insert(context,sleeping_head, &sleeping_head);
    }
    else if(sleeping_head->waiting_state > context->waiting_state){
        tcb_list_insert(context,sleeping_head->prev, &sleeping_head);
        sleeping_head = context;
    }
    else{
        struct TCB* iter = sleeping_head->next;
        while (iter != sleeping_head){
            if(context->waiting_state < iter->next->waiting_state){
                break;
            }
            iter = iter->next;
        }
        tcb_list_insert(context,iter->prev, &sleeping_head);
    }
    return 0;
}

int _receive(struct TCB *context, char* c){
    //printfn("recaive");
    context->status = TASK_WAITING;
    context->waiting_state = (int) c;

    tcb_list_remove(context, &running_head);

    if(waiting_head == 0){
        tcb_list_insert(context,waiting_head, &waiting_head);
    }
    else if(waiting_head->waiting_state > context->waiting_state){
        tcb_list_insert(context,waiting_head->prev, &waiting_head);
        waiting_head = context;
    }
    else{
        struct TCB* iter = waiting_head->next;
        while (iter != waiting_head){
            if(context->waiting_state < iter->next->waiting_state){
                break;
            }
            iter = iter->next;
        }
        tcb_list_insert(context,iter->prev, &waiting_head);
    }
    return 0;
}