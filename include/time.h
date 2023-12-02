#ifndef _TIME_H_
#define _TIME_H_

#define ST 0xFFFFFD00
#define SR_CRTR 0x0024
#define ST_RTAR 0x0020
#define ST_RTMR 0x000C

#define PMC 0xFFFFFC00
#define ST 0xFFFFFD00
#define PMC_SCER 0x00
#define PMC_IER 0x60
#define ST_PIMR 0x04
#define ST_SR 0x10
#define ST_IMR 0x1C
#define ST_IER 0x14
#define ST_IDR 0x18
#define AIC 0xFFFFF000
#define AIC_SMR1 0x04
#define AIC_IECR 0x120
#define AIC_IDCR 0x124
#define AIC_IMR 0x110
#define AIC_SVR1 0x84
#define AIC_IVR 0x100


int init_PIT();
//int sleep(int time);

#endif