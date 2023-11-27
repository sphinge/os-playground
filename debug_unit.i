# 1 "driver/debug_unit.c"
# 1 "/home/mi/martis61/Dokumente/Bs/moinsenos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "driver/debug_unit.c"
# 1 "include/debug_unit.h" 1
# 18 "include/debug_unit.h"
int activateDBGU();
int deactivateDBGU();
int printDBGU(char msg[]);
char receiveDBGU();
int receive_line(char str[], int max_input);
int printf(char msg[],...);
char* uint_to_hex(int i, char* hex);
int printBinaryDBGU(int num);
char* int_to_decimal(int num, char* str);
# 2 "driver/debug_unit.c" 2
# 1 "include/memory.h" 1
# 16 "include/memory.h"
void *memcpy (void *dest, const void *src, unsigned int len);
# 3 "driver/debug_unit.c" 2

int activateDBGU(){
   volatile int* cr = (int*) (0xFFFFF200 + 0x0000);
   *cr = (1 << 6) | (1 << 4);
   return 0;
}

int deactivateDBGU(){
   volatile int* cr = (int*) (0xFFFFF200 + 0x0000);
   *cr = 0;
   return 0;
}


int printDBGU(char msg[]){
   volatile int* thr = (int*) (0xFFFFF200 + 0x001c);
   for(int i = 0; msg[i]; i++) {
      *thr = msg[i];
   }
   return 0;
}

char receiveDBGU()
{
   return 'c';
}


int receive_line(char str[], int max_input) {
   volatile char* rhr = (char*) (0xFFFFF200 + 0x0018);
   int* check = (int*) (0xFFFFF200 + 0x0014);
   char input[max_input];
   char act[] = {'x'};
   int len;

   for(len = 0; act[0] != 0x0000000D && len< max_input; len++) {
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
# 59 "driver/debug_unit.c"
int printf(char msg[], ...) {
   volatile int* thr = (int*) (0xFFFFF200 + 0x001c);
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

            case 'b':
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
      hex[9-i] = "0123456789ABCDEF"[current];
   }
   return hex;
}

char* int_to_decimal(int num, char* str){
   int count = 0;
   int r = 0;
   int v = 0;
   char str_num[11];

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
