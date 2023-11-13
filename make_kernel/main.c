#include "../debug_unit/debug_unit.c"

int main() {
   activateDBGU();
   
   char msg[] = "MoinsenOS";
   printDBGU(msg);
   sleep(10000);
   printDBGU(msg);
   printf("String: %c %c Char", 'A', 'C');
   sleep(10000);
   printf("String: %s, Char: %c, Hex: %x, Pointer: %p, Number Positive: %d, Number Positive: %d, end", "String", 'C', 0xABCD1234, msg, 550, -3424);
   printDBGU("Ende");
   printDBGU("lol");
   return 0;
}