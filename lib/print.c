#include <usrIO.h>
#include <debug_unit.h>
#include <util.h>

/* printf:
%c => Char
%s => String
%x => Hex
%p => pointer
%d => Decimal
%b => Binary
%m => String Buffer >>*buff, len<<
*/
int printf(char msg[], ...) {
    int* ap;
    ap = (int*) &msg + 1;
    char hex[] = "0x00000000";
    char* str = "";
    int num;

    for(int i = 0; msg[i]; i++) {
        if(msg[i] != '%') {
            print_DBGU(msg[i]);
        }
        else {
            switch(msg[i+1]) {
                case 'c':
                    print_DBGU(*ap++);
                    i++;
                    break;

                case 's':
                    for(str = (char*) *ap++; *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'x':
                    for(str = uint_to_hex((int) *ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'p':
                    for(str = uint_to_hex((int) ap++, hex); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'd':
                    for(int_to_decimal((int) *ap++, str); *str; str++) {
                        print_DBGU(*str);
                    }
                    i++;
                    break;

                case 'b':              //Wahrlich optimierbar
                    num = *ap++;
                    for(int i = 0; i < 32; i++) {
                        int bits = 0x80000000 >> i;
                        int little = num & bits;
                        if(little == 0) {
                            print_DBGU('0');
                        }
                        else {
                            print_DBGU('1');
                        }
                    }
                    i++;
                    break;

                case 'm':
                    str = (char*) *ap++;
                    num = (int) *ap++;
                    for(int i = 0; i<num; i++) {
                        print_DBGU(str[i]);
                    }
                    i++;
                    break;

                default:
                    print_DBGU('%');
            }
        }
    }
    print_DBGU('\n');
    return 0;
}