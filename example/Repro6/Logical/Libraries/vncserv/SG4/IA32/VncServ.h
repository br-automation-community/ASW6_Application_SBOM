/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VNCSERV_H_
#define VNCSERV_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plc.h>



/* Constants */
_WEAK const unsigned char HIGH = 3;
_WEAK const unsigned char IMMEDIATE = 2;
_WEAK const unsigned char IPCXXXX = 0;
_WEAK const unsigned char LOW = 1;
_WEAK const unsigned char PPXXX = 1;
_WEAK const unsigned char RES1024x768 = 4;
_WEAK const unsigned char RES320x240 = 2;
_WEAK const unsigned char RES640x480 = 1;
_WEAK const unsigned char RES800x600 = 3;
_WEAK const unsigned char VERYHIGH = 4;


/* Datatypes */


/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned short VNC_Quit();
unsigned short VNC_Stop();
unsigned short VNC_Start(unsigned char Resolution, unsigned short Port, unsigned char RefreshTime, plcstring* Interpreter, unsigned char TargetHW);



#endif /* VNCSERV_H_ */
