#include <util.h>
#include <memory.h>
#include <usrIO.h>

///https://stackoverflow.com/questions/827691/how-do-you-implement-a-circular-buffer-in-c
///(Modified)

void cb_init(circular_buffer *cb, unsigned int capacity, unsigned int sz, void* address){
    printfn("BUFF: %x", (cb));
    cb->buffer = &address;
    cb->buffer_end = (char *)cb->buffer + capacity * sz;
    cb->capacity = capacity;
    cb->count = 0;
    cb->sz = sz;
    cb->head = cb->buffer;
    cb->tail = cb->buffer;
}

void cb_push_back(circular_buffer *cb, const void *item){
    if(cb->count == cb->capacity){
        cb->tail = cb->tail + cb->sz;
        if(cb->tail >= cb->buffer_end){
            cb->tail = cb->buffer;
        }
        cb->count --;
    }
    memcpy(cb->head, item, cb->sz);
    cb->head = (char*)cb->head + cb->sz;
    if(cb->head == cb->buffer_end)
        cb->head = cb->buffer;
    cb->count++;
}

int cb_pop_front(circular_buffer *cb, void *item){
    if(cb->count == 0){
        return -1;
    }
    memcpy(item, cb->tail, cb->sz);
    cb->tail = (char*)cb->tail + cb->sz;
    if(cb->tail == cb->buffer_end)
        cb->tail = cb->buffer;
    cb->count--;
    return 0;
}

char* uint_to_hex(int num, char* hex){
    for(int i = 0; i < 8; i++){
        int current = (15) & (num >> (4*i));
        hex[9-i] = HEX[current];
    }
    return hex;
}

char* int_to_decimal(int num, char* str){
    int count = 0;
    int r = 0;
    int v = 0;
    char str_num[11];       // maximal darstellbare größe einer Zahl

    if(num < 0){
        num = -num;
        v = 1;
    }

    if(num == 0) {
        str[0] = '0';
        str[1] = '\0';
        return str;
    }
    else {
        while(num != 0) {
            r = num % 10;
            num = num / 10;
            str_num[9-count] = r + 48;
            count++;
        }
        if(v == 1){
            str[0] = '-';
        }
        str[count+v] = '\0';
        for(int i = 0; i < count; i++){
            str[count+v-1-i] = str_num[9-i];
        }
    }
    return str;
}