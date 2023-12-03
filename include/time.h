#ifndef _TIME_H_
#define _TIME_H_

#define ST 0xFFFFFD00
#define ST_PIMR 0x04
#define ST_SR 0x10
#define ST_IER 0x14
#define AIC 0xFFFFF000
#define AIC_SMR1 0x04
#define AIC_SVR1 0x84
#define AIC_IECR 0x120

int init_PIT();
int st_handler();
//int sleep(int time);

#endif