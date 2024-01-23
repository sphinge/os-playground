#ifndef _USRIO_H
#define _USRIO_H

#define ENTER 0x0000000D
#include <system.h>

//PRINT.C
int _printf(char msg[], int* argv);
int printf(char msg[], ...);
int printfn(char msg[], ...);
int print_buffer(int* buffer, int length);
void print_TCB_State(struct TCB *tcb);
void print_TCB();

//RECEIVE.C
int receive_line(char str[], int max_input);
char receive_char();

#endif //_PRINT_H