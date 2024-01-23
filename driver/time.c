#include <time.h>
#include <system.h>
#include <usrIO.h>

int init_PIT(){
    system_time = 0;
    pit_time = PIT_TIME_START;
    volatile int* pimr = (int*) (ST + ST_PIMR);    //Period Interval Mode Register
    volatile int* st_ier = (int*) (ST + ST_IER);

    *st_ier = 1;                         //ENABLE INTERRUPT IN SR
    *pimr = pit_time;                      //SET ST TIME
    return 0;
}

int st_handler(int* regs_address){
    printfn("!");                     //TODO
    system_time += pit_time;
    scheduler(regs_address);
    return 0;
}