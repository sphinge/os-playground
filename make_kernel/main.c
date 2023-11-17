//#include "../time/time.c"
#include "../debug_unit/debug_unit.h"
//printf is in isr.c 
#include "../ISR/isr.h"

int main() {
   activateDBGU();
   char msg[] = "MoinsenOS";
   printf(msg);
   isr_init();
   activateDBGU();
   printf("END");


   return 0;
}