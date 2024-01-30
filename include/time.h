#ifndef _TIME_H_
#define _TIME_H_

#define ST 0xFFFFFD00
#define ST_PIMR 0x04
#define ST_SR 0x10
#define ST_IER 0x14
#define PIT_TIME_START 0x8000
int system_time;
int pit_time;

int init_PIT();
int st_handler(int* regs_address);
//int sleep(int time);

#endif