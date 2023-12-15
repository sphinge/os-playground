#include <time.h>
#include <system.h>
#include <usrIO.h>

int init_PIT(){
   volatile int* pimr = (int*) (ST + ST_PIMR);    //Period Interval Mode Register
   volatile int* st_ier = (int*) (ST + ST_IER);

   *st_ier = 1;                         //ENABLE INTERRUPT IN SR
   *pimr = 0x8000;                      //SET ST TIME
   return 0;
}

int st_handler(int* regs_address){       //TODO vielleicht handler pos ändern
    printf("!");

    int x = scheduler(regs_address);

    printf("%d", x);

    return 0;
}


//In Arbeit!
//Funktional aber time hat keinen exakten zeitwert sondern verzögert einfach
// int sleep(int time)
// {
//    volatile int* RTT;
//    volatile int* RTAR;
//    volatile int* RTMR;
//    RTT = ST + SR_CRTR;
//    RTAR = ST + ST_RTAR;
//    RTMR = ST + ST_RTMR;
   
//    int current = (*RTT << 20) >> 20;
//    *RTAR = 0; 
//    *RTMR = 1;
//    while(*RTT < current + time){;}

//    return 0;
// }