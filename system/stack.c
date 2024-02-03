#include <system.h>
#include <memconfig.h>


void init_stacks(){
    set_stack(FIQ_MODE, FIQ_ADDRESS);
    set_stack(IRQ_MODE, IRQ_ADDRESS);
    set_stack(ABORT_MODE, ABORT_ADDRESS);
    set_stack(UNDEFINED_MODE, UNDEFINED_ADDRESS);
    set_stack(SYSTEM_MODE, SYSTEM_ADDRESS);
}