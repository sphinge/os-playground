#include <debug_unit.h>
#include <memory.h>

int activateDBGU(){
   volatile int* cr = (int*) (DBGU + DBGU_CR);
   *cr = (1 << 6) | (1 << 4);
   return 0;
}

int deactivateDBGU(){
   volatile int* cr = (int*) (DBGU + DBGU_CR);
   *cr = 0;
   return 0;
}

//simple output of String
int printDBGU(char msg[]){
   volatile int* thr = (int*) (DBGU + DBGU_THR);
   for(int i = 0; msg[i]; i++) {
      *thr = msg[i];
   }
   return 0;
}

char receiveDBGU() //TODO
{
   return 'c';
}

//receive String until press Enter
int receive_line(char str[], int max_input) {                        
   volatile char* rhr = (char*) (DBGU + DBGU_RHR);
   int* check = (int*) (DBGU + DBGU_SR); 
   char input[max_input];
   char act[] = {'x'};
   int len;

   for(len = 0; act[0] != ENTER && len< max_input; len++) {
      while(!(*check & (1))) {}
      input[len] = *rhr;
      act[0] = input[len];
      printDBGU(act);
   }
   act[0] = '\n';

   printDBGU(act);
   memcpy (str, input, len);
   return 0;
}

/* printf:
%c => Char
%s => String
%x => Hex
%p => pointer
%d => Decimal
%b => Binary 
*/
int printf(char msg[], ...) {
   volatile int* thr = (int*) (DBGU + DBGU_THR);
   int* ap; 
   ap = (int*) &msg + 1;
   char hex[] = "0x00000000";
   char* str = "";
   int num;

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
            
            case 'd':
               for(int_to_decimal((int) *ap++, str); *str; str++) {
                  *thr = *str;
               }  
               i++;
               break;

            case 'b':              //Wahrlich optimierbar
               num = *ap++;
               for(int i = 0; i < 32; i++) {
                  int bits = 0x80000000 >> i;
                  int little = num & bits;
                  if(little == 0) {
                     *thr = '0';
                  }
                  else {
                     *thr = '1';
                  }
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

char* int_to_decimal(int num, char* str){
   int count = 0; 
   int r = 0;
   int v = 0;
   char str_num[11];       // maximal darstellbare größe einer Zahl 

   if(num < 0){
      num = -num;
      v = 1;
   }

   if(num == 0) {
      str[0] = '0';
      str[1] = '\0';
      return str;
   }
   else {
      while(num != 0) {
         r = num % 10;
         num = num / 10;
         str_num[9-count] = r + 48;
         count++;
      }
      if(v == 1){
         str[0] = '-';
      }
      str[count+v] = '\0';
      for(int i = 0; i < count; i++){
         str[count+v-1-i] = str_num[9-i];
      } 
   }
   return str;
}