#ifndef _USRIO_H
#define _USRIO_H

#define ENTER 0x0000000D

//PRINT.C
int _printf(char msg[], int* argv);
int printf(char msg[], ...);
int printfn(char msg[], ...);
char* uint_to_hex(int num, char* hex);
char* int_to_decimal(int num, char* str);

//RECEIVE.C
int receive_line(char str[], int max_input);

#endif //_PRINT_H
