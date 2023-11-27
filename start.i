# 1 "system/start.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "system/start.c"
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
# 2 "system/start.c" 2
# 1 "include/memory.h" 1
# 16 "include/memory.h"
void *memcpy (void *dest, const void *src, unsigned int len);
# 3 "system/start.c" 2
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
# 4 "system/start.c" 2
# 1 "include/stack.h" 1



void stack_init();
# 5 "system/start.c" 2
# 1 "include/debug.h" 1



void breakpoint();
# 6 "system/start.c" 2

int test_interrupt();

int main() {

   stack_init();
   activateDBGU();
   char msg1[] = "MoinsenOS";
   printf(msg1);





   isr_init();

   test_interrupt();
   printf("END");
   return 0;
}

int test_interrupt(){

   printf("SWI interupt Test:");
   __asm__("SWI #0");
   printf("SWI interupt Test END");

   printf("DA interupt Test:");
   *(int *)0xa0000000 = 0;
   printf("DA interupt Test END");

   printf("UI interupt Test:");
   __asm__ ("UDF");
   printf("UI interupt Test END");

   return 0;
}
