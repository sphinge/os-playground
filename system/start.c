#include <isr.h>
#include <memory.h>
#include <debug_unit.h>
#include <stack.h>
#include <debug.h>
#include <time.h>

int test_interrupt();

int main() {

   stack_init();
   activateDBGU();
   char msg1[] = "MoinsenOS";
   printf(msg1);

   isr_init();                  //Initializate the IVT table and handlers    

   test_interrupt();            //Test interrupts
   printf("END");
   return 0;
}

