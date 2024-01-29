# 1 "lib/syscall.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/syscall.c"
# 1 "include/syscall.h" 1



int create_t(void* start_t, int arg_num, ...);
void kill_t();
int sleep(int interval);
int print(char msg[], int length);
int receive(char* c);



int swi_call(int swi, int* buffer);
# 2 "lib/syscall.c" 2
# 1 "include/debug.h" 1



void bkpt();
# 3 "lib/syscall.c" 2

int create_t(void* start_t, int arg_num, ...){
    int* ap = (int*) &arg_num + 1;
    int buffer[] = {(int) start_t, arg_num, (int) ap};
    swi_call(0, buffer);
    return 0;
}

void kill_t(){
    swi_call(1, 0);
}

int sleep(int interval){
    int buffer[] = {interval};
    swi_call(2, buffer);
    return 0;
}

int print(char msg[], int length){
    int buffer[] = {(int) msg, length};
    swi_call(3, buffer);
    return 0;
}

int receive(char* c){
    int buffer[] = {(int)c};
    swi_call(4, buffer);
    return 0;
}
