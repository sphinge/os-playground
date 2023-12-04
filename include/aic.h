#ifndef _AIC_H
#define _AIC_H

#define AIC 0xFFFFF000  //Advanced Interrupt Controller
#define AIC_SMR1 0x04
#define AIC_SVR1 0x84
#define AIC_IECR 0x120  //Interrupt Enable Command Register
#define AIC_EOICR 0x130

int init_AIC();

#endif //_AIC_H
