#include "../time/time.c"
#include "../debug_unit/debug_unit.h"
//printf is in isr.c 
#include "../ISR/isr.h"

int test_interrupt();

int main() {
   activateDBGU();
   char msg[] = "MoinsenOS";
   printf(msg);
   isr_init();

   unsigned long pc;
   __asm__("mov %0, pc" : "=r" (pc));
   printf("%x", pc);
   test_interrupt();

   printf("END");
   return 0;
}

int test_interrupt(){
   unsigned long lr;
   __asm__("mov %0, lr" : "=r" (lr));
   printf("%x", lr);

   printf("SWI interupt Test:");
   __asm__("SWI #0");
   printf("SWI interupt Test END");

   __asm__("mov %0, lr" : "=r" (lr));
   printf("%x", lr);
   __asm__("mov %0, lr" : "=r" (lr));  // Link-Register-Wert in lr_value laden
   __asm__("mov lr, %0" : : "r" (lr));
   //__asm__("BX lr");
   
   printf("DA interupt Test:");
   int* abort = 0xA0000000;          //inside undefined Memory Area
   *abort = 6;
   printf("DA interupt Test END");
   //printf("UI Test:");
   //__asm__ volatile (".word 0xFFFFFFFF");
   //printf("UI Test END");

   return 0;
}


//Somehow this leads to ui:
/*
unsigned long *sp;
   __asm__("mov %0, lr" : "=r" (*sp));

   unsigned long pc;
   printf("SWI interupt Test:");
   __asm__("mov %0, pc" : "=r" (pc));
   __asm__("SWI #0");
   printf("SWI interupt Test END");
   printf("%x", sp);
   printf("%x", pc);
   __asm__("mov %0, lr" : "=r" (*sp));
   printf("%x", sp);
   return 0;
*/