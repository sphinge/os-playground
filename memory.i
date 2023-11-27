# 1 "lib/memory.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/memory.c"
# 1 "include/memory.h" 1
# 16 "include/memory.h"
void *memcpy (void *dest, const void *src, unsigned int len);
# 2 "lib/memory.c" 2
# 1 "include/debug_unit.h" 1
# 18 "include/debug_unit.h"
int activateDBGU();
int deactivateDBGU();
int printDBGU(char msg[]);
char receiveDBGU();
int receive_line(char str[], int max_input);
int printf(char msg[],...);
char* uint_to_hex(int i, char* hex);
int printBinaryDBGU(int num);
char* int_to_decimal(int num, char* str);
# 3 "lib/memory.c" 2



void *memcpy (void *dest, const void *src, unsigned int len){
    char *d = dest;
    const char *s = src;
    while (len--){
        *d++ = *s++;
    }
    return dest;
}
