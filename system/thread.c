#include <system.h>
#include <debug.h>

int _create_t(int* start_t, int arg_num , int* args){   //TODO call tcb remove from SYS not USR MODE
    tcb_insert((int) start_t, arg_num, args);
    bkpt();
    return 0;
}

int _kill_t(struct TCB* context){       //TODO
    tcb_list_remove(context, &running_head);
    context->status = TASK_TERMINATED;
    tcb_list_insert(context,empty_head, empty_head);
    return 0;
}