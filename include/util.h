#ifndef H_UTIL_H
#define H_UTIL_H

typedef struct circular_buffer
{
    void *buffer;     // data buffer
    void *buffer_end; // end of data buffer
    unsigned int capacity;  // maximum number of items in the buffer
    unsigned int count;     // number of items in the buffer
    unsigned int sz;        // size of each item in the buffer
    void *head;       // pointer to head
    void *tail;       // pointer to tail
} circular_buffer;

void cb_init(circular_buffer *cb, unsigned int capacity, unsigned int sz, void* address);
void cb_push_back(circular_buffer *cb, const void *item);
int cb_pop_front(circular_buffer *cb, void *item);

#endif //BS_UTIL_H
