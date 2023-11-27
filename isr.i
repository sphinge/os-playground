# 1 "system/isr.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/isr.c"
# 1 "include/isr.h" 1
# 12 "include/isr.h"
void ivt_start();
void ivt_end();
int isr_init();
extern int isr_reset();
int isr_ui();
int isr_swi();
int isr_pa();
int isr_da();
int isr_irq();
int isr_fiq();
# 2 "system/isr.c" 2
# 1 "include/memory.h" 1
# 16 "include/memory.h"
void *memcpy (void *dest, const void *src, unsigned int len);
# 3 "system/isr.c" 2
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
# 4 "system/isr.c" 2


int isr_init(){
    int ivt_size = ivt_end-ivt_start;

    memcpy((void*) 0x200000, ivt_start, ivt_size);
    volatile int* rcr = (int*) 0xFFFFFF00 + 0x00;
    *rcr = 1;

    __asm__ volatile (
        "MRS r0, CPSR\n"
        "BIC r0, r0, #0xC0\n"
        "MSR CPSR_c, r0\n"
    );
    return 0;
}

int isr_reset(){
    printf(">RESET ISR<");

    return 0;
}

int isr_ui(){
    printf(">UI ISR<");
    return 0;
}

int isr_swi(){
    printf(">SWI ISR<");
    return 0;
}

int isr_pa(){
    printf(">PA ISR<");
    return 0;
}

int isr_da(){
    printf(">DA ISR<");
    return 0;
}

int isr_irq(){
    printf(">IRQ ISR<");
    return 0;
}

int isr_fiq(){
    printf(">FIQ ISR<");
    return 0;
}


int (*isr_functions[])() = {isr_reset, isr_ui, isr_swi, isr_pa, isr_da, isr_irq, isr_fiq};
