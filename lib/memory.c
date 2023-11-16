#include "memory.h"


//memcpy, memcmp, memmove, memset are from https://github.com/gcc-mirror/gcc/tree/master/libgcc

void *memcpy (void *dest, const void *src, unsigned int len){
    char *d = dest;
    const char *s = src;
    while (len--)
        *d++ = *s++;
    return dest;
}
/*
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

void *memmove (void *dest, const void *src, unsigned int len){
    char *d = dest;
    const char *s = src;
    if (d < s)
        while (len--)
            *d++ = *s++;
    else{
        char *lasts = s + (len-1);
        char *lastd = d + (len-1);
        while (len--)
            *lastd-- = *lasts--;
    }
    return dest;
}

void *memset (void *dest, int val, unsigned int len){
    unsigned char *ptr = dest;
    while (len-- > 0)
        *ptr++ = val;
    return dest;
}
*/