//memcpy, memcmp, memmove, memset are from https://github.com/gcc-mirror/gcc/tree/master/libgcc
#ifndef _MEMORY_H_
#define _MEMORY_H_

void *memcpy (void *dest, const void *src, unsigned int len);
//int memcmp (const void *str1, const void *str2, unsigned int count);
//void *memmove (void *dest, const void *src, unsigned int len);
//void *memmove (void *dest, const void *src, unsigned int len);

#endif