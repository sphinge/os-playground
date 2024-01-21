#ifndef _SYSCALL_H
#define _SYSCALL_H

int create_t(int* start_t, int arg_num, ...);
void kill_t();
int sleep(int interval);
int print(char msg[], ...);
int receive(char str[], int max_input);
//int receive_line(char str[], int max_input);
//int receive_n(char str[], int n_chars);

#endif //BS_SYSCALL_H
