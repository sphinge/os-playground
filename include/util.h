#ifndef H_UTIL_H
#define H_UTIL_H

#define HEX "0123456789ABCDEF"

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

char* uint_to_hex(int num, char* hex);
char* int_to_decimal(int num, char* str);
int strlen(const char *str);
char* _format(char msg[], char out[], int* argv);
char* format(char* msg, char* out, ...);


//-----------------memops-----------------
void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);


#endif //_UTIL_H
