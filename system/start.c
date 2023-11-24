#include <isr.h>
//printf is in isr.c 
#include <memory.h>
#include <debug_unit.h>



int test_interrupt();

int main() {

   activateDBGU();
   char msg[] = "MoinsenOS";
   //char* msg2;
   printf(msg);

   //msg2 = receiveDBGU();

   //printf(msg2);

   isr_init();                  //Initializate the IVT table and handlers 

   //mode_init();               //TODO: Set up different stacks for each mode -> no overwrite

   //test_interrupt();            //Test interrupts
   printf("END");
   return 0;
}

int test_interrupt(){

   printf("SWI interupt Test:");                             //Trigger the SWI interrupt
   __asm__("SWI #0");
   printf("SWI interupt Test END");

   // printf("DA interupt Test:");                           //Trigger the DA interrupt                 
   // int* abort = 0x90000000;                               //inside undefined Memory Area
   // *abort = 0;                                            //GDB => MODE CHANGE IN CPSR: 0b10111 (ABORT)
   // printf("Abort MSG: %d", *abort);
   // printf("DA interupt Test END");

   // printf("UI interupt Test:");                           //Trigger the UDF interrupt
   // __asm__ ("UDF");                                       //GDB => MODE CHANGE IN CPSR: 0b11011 (UNDEFINED)                            
   // printf("UI interupt Test END");

   return 0;
}
