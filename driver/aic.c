#include <system.h>
#include <aic.h>
int init_AIC(){
    volatile int* iecr = (int*) (AIC + AIC_IECR);  //Interrupt Enable Command Register
    volatile int* svr1 = (int*) (AIC + AIC_SVR1);  //Source Vector Register
    volatile int* smr1 = (int*) (AIC + AIC_SMR1);

    *svr1 = (volatile int) s1_irq;   //SET UP THE HANDLER FUNCTION      //TODO: change pos of AIC init
    *iecr = (1 << 1);                    //ENABLE INTERRUPT IN AIC
    *smr1 = 0;                       //SET PRIO OF SMR Level Sensitive
}