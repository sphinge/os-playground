# 1 "lib/memory.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/memory.c"
# 1 "include/memory.h" 1




void *memcpy (void *dest, const void *src, unsigned int len);
void *stack_memcpy (void *stack_dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memset (void *dest, int val, unsigned int len);
# 2 "lib/memory.c" 2


void *memcpy (void *dest, const void *src, unsigned int len){
    char *d = dest;
    const char *s = src;
    while (len--){
        *d++ = *s++;
    }
    return dest;
}

void *stack_memcpy (void *stack_dest, const void *src, unsigned int len){
    char *d = stack_dest;
    const char *s = src;
    while (len--){
        *d-- = *s++;
    }
    return stack_dest;
}

int memcmp (const void *str1, const void *str2, unsigned int count){
    const unsigned char *s1 = str1;
    const unsigned char *s2 = str2;

    while (count-- > 0)
    {
        if (*s1++ != *s2++)
     return s1[-1] < s2[-1] ? -1 : 1;
    }
    return 0;
}
# 50 "lib/memory.c"
void *memset (void *dest, int val, unsigned int len){
    unsigned char *ptr = dest;
    while (len-- > 0)
        *ptr++ = val;
    return dest;
}
