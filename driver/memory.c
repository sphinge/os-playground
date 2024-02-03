#include <memory.h>
#include <debug.h>
#include <system.h>

#define L1_TABLE_SIZE 4096
#define L1_TABLE_BASE 0x21030000 //TODO

#define KERNEL_CODE_ADDRESS 0x20000000

enum mmu_permission {
    PERM_KERNEL_READ	= 0,
    PERM_KERNEL_READ_WRITE	= 1,
    PERM_USER_READ		= 2,
    FULL_ACCESS	= 3,
};



int init_mmu(){
    create_l1_table((int *) L1_TABLE_BASE);
    set_ttb((int *) L1_TABLE_BASE);
    printfn("yay");
    bkpt();
    enable_mmu();
    printfn("yay 2");
    bkpt();
    return 0;
}

int section_descriptor(int physical_address, int domain, int ap, int c, int b){
    return (physical_address << 20) | (ap << 10) | (domain << 5) | (c << 3) | (b <<2) | 0b10010;
}

int create_l1_table(int* l1_table_address){
    for(int i = 0; i < L1_TABLE_SIZE; i++){
        l1_table_address[i] = 0;
    }
    l1_table_address[0] = section_descriptor(KERNEL_CODE_ADDRESS, 0, FULL_ACCESS, 0,0);
    return 0;
}

int memory_delay(int save){
    for (int i = 0; i < 47483647; ++i) {
        i = i;
    }
    return save;
}


/*
int domain = 0b1111;
int ap = 0b11;
l1_table_address[i] = section_descriptor(i, domain, ap, 0, 0);       //1 MiB Space
 */