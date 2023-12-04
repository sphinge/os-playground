#include <util.h>
#include <memory.h>
#include <debug_unit.h>

///https://stackoverflow.com/questions/827691/how-do-you-implement-a-circular-buffer-in-c
///(Modified)

void cb_init(circular_buffer *cb, unsigned int capacity, unsigned int sz, void* address){
    printf("BUFF: %x", (cb));
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