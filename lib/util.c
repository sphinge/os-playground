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
    char str_num[11]; // maximal darstellbare größe einer Zahl

    if(num < 0){
        num = -num;
        v = 1;
    }

    if(num == 0) {
        str[0] = '0';
    }
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
    return str;
}

int strlen(const char *str) {
    const char *s;
    for (s = str; *s; ++s);
    return(s - str);
}

char* _format(char msg[], char out[], int* argv) {
    int* ap = argv;
    char* hex = "0x00000000";
    char* str;
    char numberBuffer[12];
    int num;

    int out_pointer = 0;
    for(int i = 0; msg[i]; i++) {
        if(msg[i] != '%') {
            out[out_pointer] = msg[i];
            out_pointer++;
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    out[out_pointer] = *ap++;
                    out_pointer++;
                    break;

                case 's':
                    for(str = (char*) *ap++; *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'x':
                    for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'p':
                    for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                        out[out_pointer] = *str;
                        out_pointer++;
                    }
                    break;

                case 'd':
                    int_to_decimal((int) *ap++, numberBuffer);
                    for (num = 0; num<12 && numberBuffer[num]; num++) {
                        out[out_pointer] = numberBuffer[num];
                        out_pointer++;
                    }
                    break;

                case 'b':              //Wahrlich optimierbar
                    num = *ap++;
                    for(int i = 31; i >= 0; i--) {
                        if(num & 1) {
                            out[out_pointer+i] = '1';
                        }
                        else {
                            out[out_pointer+i] = '0';
                        }
                        num >>= 1;
                    }
                    out_pointer += 32;
                    break;

                case 'm':
                    str = (char*) *ap++;
                    num = (int) *ap++;
                    for(int i = 0; i<num; i++) {
                        out[out_pointer] = str[i];
                        out_pointer++;
                    }
                    break;

                default:
                    out[out_pointer] = '%';
                    out_pointer++;
                    i--;
            }
            i++;
        }
    }
    out[out_pointer] = '\0';
    return out;
}

char* format(char* msg, char* out, ...) {
    return _format(msg, out, (int*) &out+1);
}