#include "time.h"
//In Arbeit!
//Funktional aber time hat keinen exakten zeitwert sondern verzögert einfach
int sleep(int time)
{
   volatile int* RTT;
   volatile int* RTAR;
   volatile int* RTMR;
   RTT = ST + SR_CRTR;
   RTAR = ST + ST_RTAR;
   RTMR = ST + ST_RTMR;

   
   int current = (*RTT << 20) >> 20;
   *RTAR = 0; 
   *RTMR = 1;
   while(*RTT < current + time){;}

   return 0;
}
