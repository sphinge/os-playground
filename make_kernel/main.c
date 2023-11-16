#include "../debug_unit/debug_unit.c"
//#include "../time/time.c"
#include "../ISR/isr.c"

int main() {
   activateDBGU();
   isr_reset();
   char msg[] = "MoinsenOS";
   printf("String: %s, Char: %c, Hex: %x, Pointer: %p, Number Positive: %d, Number Positive: %d, end", "String", 'C', 0xABCD1234, msg, 550, -3424);
   printf("END");

   return 0;
}