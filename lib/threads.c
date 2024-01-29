#include <syscall.h>
#include "util.h"
#include <threads.h>

void receiver(){
    char c[] = "hallo";
    while (1){
        receive(c);
        create_t(rec_print, 1, c[0]);
    }
}

void rec_print(char c){
    char s[2];
    for (int i = 0; i < 10; ++i) {
        format("%c", s, c);
        print(s, strlen(s));
        sleep(50000);
    }
    kill_t();
}