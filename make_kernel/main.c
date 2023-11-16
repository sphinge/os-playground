#include "../debug_unit/debug_unit.c"
//#include "../time/time.c"
#include "../ISR/isr.c"

int main() {
   activateDBGU();
   char msg[] = "MoinsenOS";
   printf(msg);

   isr_init();
   
   printf("END");
   

   return 0;
}