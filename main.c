#include "printf.h"

int main() {
   volatile int* cr = (int*) (DBGU + DBGU_CR);
   *cr = (1 << 6) + (1 << 4);

   char msg[] = "MoinsenOS";
   printDBGU(msg);
   printf("String: %s Char: %c Hex: %x Pointer: %p end", "String", 'C', 0xABCD1234, msg);
   printDBGU("Ende");
   return 0;
}

int printDBGU(char msg[]){
   volatile int* thr = (int*) (DBGU + DBGU_THR);

   *thr = '>';
   for(int i = 0; msg[i]; i++) {
      *thr = msg[i];
   }
   *thr = '\n';
   return 0;
}

//Vielleicht funktional können es nicht prüfen, weil wir ni cht wissen wie man inputs sendet
char receiveCharDBGU() {                         
   volatile char* rhr = (char*) (DBGU + DBGU_RHR);
   int* check = (int*) (DBGU + DBGU_SR);
   if(*check & (1)) {
      return *rhr;
   }
   return 0;
}


int printf(char msg[], ...) {
   volatile int* thr = (int*) (DBGU + DBGU_THR);
   int* ap; 
   ap = (int*) &msg + 1;
   char hex[] = "0x00000000";
   char* str;

   for(int i = 0; msg[i]; i++) {
      if(msg[i] != '%') {
         *thr = msg[i];
      }
      else {
         switch(msg[i+1]) {
            case 'c':
               *thr = *ap++;  
               i++;  
               break;

            case 's':
               for(str = (char*) *ap++; *str; str++) {
                  *thr = *str;
               }  
               i++;
               break;

            case 'x':
               for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                  *thr = *str;
               }  
               i++;
               break;

            case 'p':
               for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                  *thr = *str;
               }  
               i++;
               break;

            default: 
               *thr = '%';
         }
      }
   }
   *thr = '\n';
   return 0;
}

char* uint_to_hex(int num, char* hex){
   for(int i = 0; i < 8; i++){
      int current = (15) & (num >> (4*i));
      hex[9-i] = HEX[current];
   }  
   return hex;
}
