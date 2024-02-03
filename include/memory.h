#ifndef _MEMORY_H_
#define _MEMORY_H_

int init_mmu();
void enable_mmu();
int create_l1_table(int* address);
void set_ttb(int* l1_table);
void* read_ttb();
int memory_delay(int save);
#endif