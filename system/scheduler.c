#include <system.h>
#include <usrIO.h>
#include <time.h>
int wake_up(struct TCB* context);
int check_waiting();
int print_list(struct TCB* list);

int scheduler(int* regs_address){       //Return 0 normal thread scheduled; 1 idle running
    check_waiting();
    /*
    printfn("-------------SCHEDULE-------------");
    printfn("sys_time: %d, context: %x", system_time, current_context);
    printfn("running:");
    print_list(running_head);
    printfn("sleeping: ");
    print_list(sleeping_head);
    */

    if(running_head == 0){
        current_context = &TCB_array[TCB_size];
    }
    else{
        save_context(current_context, regs_address);
        current_context->status = TASK_READY;
        running_head = running_head->next;

        if(current_context != running_head){printfn("");}

        current_context = running_head;
    }

    run_thread(current_context, regs_address);
    return 0;
}

int check_waiting(){
    if(sleeping_head != 0){
        if(sleeping_head->waiting_state <= system_time){            //TODO maybe wakeup more than one at a time
            struct TCB* context = sleeping_head;
            tcb_list_remove(context, &sleeping_head);
            context->status = TASK_READY;
            context->waiting_state = 0;
            tcb_list_insert(context,running_head, &running_head);   //TODO starve running_head->prev
        }
    }
    return 0;
}

int print_list(struct TCB* list){
    printf("[");
    if(list != 0){
        printf("[%d (%d, %d, %d)], ", list->id, list->prev->id, list->next->id, list->waiting_state);
        struct TCB *iter = list->next;
        while (iter != list) {
            printf("[%d (%d, %d, %d)], ", iter->id, iter->prev->id, iter->next->id, iter->waiting_state);
            iter = iter->next;
        }
    }
    else{
        printf("-");
    }
    printfn("]");
    return 0;
}