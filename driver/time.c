#include <time.h>
#include <system.h>
#include <debug_unit.h>

int init_PIT(){
   volatile int* pimr = (int*) (ST + ST_PIMR);    //Period Interval Mode Register
   volatile int* iecr = (int*) (AIC + AIC_IECR);  //Interrupt Enable Command Register
   volatile int* svr1 = (int*) (AIC + AIC_SVR1);  //Source Vector Register
   volatile int* smr1 = (int*) (AIC + AIC_SMR1);
   volatile int* st_ier = (int*) (ST + ST_IER);

   *svr1 = (volatile int) s1_irq;   //SET UP THE HANDLER FUNCTION
   *iecr = (1 << 1);                    //ENABLE INTERRUPT IN AIC
   *smr1 = 0;             //SET PRIO OF SMR
   *st_ier = 1;                         //ENABLE INTERRUPT IN SR
   *pimr = 0x9000;                   //SET ST TIME
   return 0;
}

int st_handler(){
    printf("!");
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