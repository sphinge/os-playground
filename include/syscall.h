#ifndef _SYSCALL_H
#define _SYSCALL_H

int create_t(void* start_t, int arg_num, ...);
void kill_t();
int sleep(int interval);
int print(char msg[], int length);
int receive(char* c);
//int receive_line(char str[], int max_input);
//int receive_n(char str[], int n_chars);

int swi_call(int swi, int* buffer);

#endif //BS_SYSCALL_H
