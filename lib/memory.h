//memcpy, memcmp, memmove, memset are from https://github.com/gcc-mirror/gcc/tree/master/libgcc
#define IVT_SIZE  0x1C
#define ISR_SIZE  0x000FFFFF

#define RESET_ADD 0x1D      //Reset
#define UI_ADD    0x24924  //Undefined Instruction
#define SWI_ADD   0x49248  //Software Interrupt
#define PA_ADD    0x6DB6C  //Prefetch Abort
#define DA_ADD    0x92490  //Data Abort
#define IRQ_ADD   0xB6DB4  //Normal Interrupt
#define FIQ_ADD   0xDB6D8  //Fast Interrupt


void *memcpy (void *dest, const void *src, unsigned int len);
int memcmp (const void *str1, const void *str2, unsigned int count);
void *memmove (void *dest, const void *src, unsigned int len);
void *memmove (void *dest, const void *src, unsigned int len);