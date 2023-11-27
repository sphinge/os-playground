#include <isr.h>
#include <memory.h>
#include <debug_unit.h>
#include <stack.h>
#include <debug.h>

int test_interrupt();

int main() {

   stack_init();
   activateDBGU();
   char msg1[] = "MoinsenOS";
   printf(msg1);

   // char msg2[20];
   // receive_line(msg2, 20); 
   // printf(msg2);

   isr_init();                  //Initializate the IVT table and handlers    

   test_interrupt();            //Test interrupts
   printf("END");
   return 0;
}

int test_interrupt(){

   printf("SWI interupt Test:");      //Trigger the SWI interrupt
   __asm__("SWI #0");
   printf("SWI interupt Test END");

   printf("DA interupt Test:");       //Trigger the DA interrupt                 
   *(int *)0xa0000000 = 0;        
   printf("DA interupt Test END");

   printf("UI interupt Test:");       //Trigger the UDF interrupt
   __asm__ ("UDF");  
   printf("UI interupt Test END");          

   return 0;
}
