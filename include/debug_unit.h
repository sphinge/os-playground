#ifndef _DEBUG_UNIT_H_
#define _DEBUG_UNIT_H_
#define DBGU 0xFFFFF200
#define DBGU_CR   0x0000
#define DBGU_MR   0x0004
#define DBGU_IER  0x0008
#define DBGU_IDR  0x000c
#define DBGU_IMR  0x0010
#define DBGU_SR   0x0014
#define DBGU_RHR  0x0018
#define DBGU_THR  0x001c
#define DBGU_BRGR 0x0020
#define DBGU_CIDR 0x0040
#define DBGU_EXID 0x0044

#define BUFFER_SIZE 20         //Ring Buffer

int init_DBGU_Interrupt();
int dbgu_handler();
int enable_DBGU();
int disable_DBGU();
void print_DBGU(char c);
void print_pointer_DBGU(int* x);
int print_string_DBGU(char* s, int length);
char receive_DBGU();
void reset_Buffer_DBGU();

#endif