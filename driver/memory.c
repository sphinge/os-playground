#include "memory.h"
#include "debug.h"

#define L1_TABLE_SIZE 4096

int init_mmu(){
    bkpt();
    create_l1_table((int*)0x24000000);
    enable_mmu();
    return 0;
}

int section_descriptor(int physical_address, int domain, int ap, int c, int b){
    return (physical_address << 20) | (ap << 10) | (domain << 5) | (c << 3) | (b <<2) | 0b10010;
}

int create_l1_table(int* l1_table_address){
    for(int i = 0; i < L1_TABLE_SIZE; i++){
        int domain = 0;
        int ap = 3;
        l1_table_address[i] = section_descriptor(i, domain, ap, 0, 1);       //1 MiB Space
    }
    return 0;
}