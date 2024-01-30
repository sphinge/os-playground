#ifndef _MEMORY_H_
#define _MEMORY_H_

int init_mmu();
void enable_mmu();
int create_l1_table(int* address);

#endif