#include <system.h>
#include <memconfig.h>

int init_mmu(){
    init_l1_table((int *) L1_TABLE_BASE);
    set_domain_access(0xFFFFFFFF);
    set_ttb((int *) L1_TABLE_BASE);
    enable_mmu(1, 1, 0, 0, 0, 0);
    return 0;
}

void enable_mmu(int enable_mmu_bit, int align_fault_bit, int DCache_bit, int ICache_bit, int sys_protect_bit, int rom_protect_bit){
    int control = 0b1111000;

    control = control
              | (enable_mmu_bit)
              | (align_fault_bit << 1)
              | (DCache_bit << 2)
              | (sys_protect_bit << 8)
              | (rom_protect_bit << 9)
              | (ICache_bit << 12);
    __asm__("MCR p15, 0, %0, c1, c0" : : "r" (control));
}

int section_descriptor(int physical_address, int domain,enum mmu_access access, int c, int b){
    return (physical_address) | (access << 10) | (domain << 5) | (c << 3) | (b <<2) | 0b10010;
}

int set_entry(int* table, int virtual_address, int physical_address, enum mmu_access access){
    table[virtual_address>>20] = section_descriptor(physical_address, 0, access, 0,0);
    return 0;
}

int set_USR_entry(int* table, int physical_address){
    set_entry(table, physical_address, physical_address, FULL_ACCESS);
    return 0;
}

int init_l1_table(int* l1_table_address){
    for(int i = 0; i < L1_TABLE_SIZE; i++){
        l1_table_address[i] = 0;
    }
    //1:1 Mapping of Kernel/User Space -> not really splitted :( TODO
    l1_table_address[0] = section_descriptor(0, 0, KERNEL_READ, 0,0);
    l1_table_address[TCB_ADDRESS >> 20] = section_descriptor(TCB_ADDRESS, 0, KERNEL_FULL_ACCESS, 0,0);
    l1_table_address[SRAM_ADDRESS >> 20] = section_descriptor(SRAM_ADDRESS, 0, KERNEL_FULL_ACCESS, 0,0);
    l1_table_address[STACK_BASE >> 20] = section_descriptor(STACK_BASE, 0, KERNEL_FULL_ACCESS, 0,0);
    l1_table_address[DRIVER_ADDRESS >> 20] = section_descriptor(DRIVER_ADDRESS, 0, KERNEL_FULL_ACCESS, 0,0);

    //Not separated Kernel from User
    l1_table_address[KERNEL_CODE_ADDRESS >> 20] = section_descriptor(KERNEL_CODE_ADDRESS, 0, USER_READ, 0,0);

    //TODO USER Stacks still in same page entry
    l1_table_address[USER_STACK_ADDRESS >> 20] = section_descriptor(USER_STACK_ADDRESS, 0, FULL_ACCESS, 0,0);
    /*
    for (int i = 0; i < TCB_size; i++) {
        l1_table_address[(USER_STACK_ADDRESS+ USER_STACK_SPACE*i) >> 20] = section_descriptor(USER_STACK_ADDRESS + USER_STACK_SPACE*i, 0, FULL_ACCESS, 0,0);
    }
     */
    return 0;
}

/*
int domain = 0b1111;
int ap = 0b11;
l1_table_address[i] = section_descriptor(i, domain, ap, 0, 0);       //1 MiB Space
 */