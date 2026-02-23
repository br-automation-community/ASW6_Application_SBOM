/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASRFBEXT_
#define _ASRFBEXT_
#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct AsRfbExtType
{	unsigned long pClient;
	unsigned long pHeader;
	unsigned long uiTimeOut;
	unsigned long uiTimeOutValue;
	unsigned short status;
} AsRfbExtType;

typedef struct AsRfbExt_typ
{	unsigned long pClient;
	unsigned long pHeader;
	unsigned long uiTimeOut;
	unsigned long uiTimeOutValue;
	unsigned short status;
} AsRfbExt_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC unsigned short RfbExtInit(unsigned long pLib, unsigned long uiTimeOut);
_BUR_PUBLIC unsigned short RfbExtConnect(unsigned long pLib, unsigned long pName);
_BUR_PUBLIC unsigned short RfbExtSetClientCaption(struct AsRfbExt_typ* pLib, unsigned long pClientCaption);
_BUR_PUBLIC unsigned short RfbExtSetPassword(struct AsRfbExt_typ* pLib, unsigned char mode, unsigned long pPassword);
_BUR_PUBLIC unsigned short RfbExtKeyState(struct AsRfbExt_typ* pLib, unsigned char index, unsigned long pValue);
_BUR_PUBLIC unsigned short RfbExtReconnect(struct AsRfbExt_typ* pLib, unsigned long pTargetIp);
_BUR_PUBLIC unsigned short RfbExtStartProcess(struct AsRfbExt_typ* pLib, unsigned long pcmdLine);
_BUR_PUBLIC unsigned short RfbExtProcessState(struct AsRfbExt_typ* pLib, unsigned long piProcessState);
_BUR_PUBLIC unsigned short RfbExtNrClientsConnected(struct AsRfbExt_typ* pLib);
_BUR_PUBLIC unsigned short RfbExtServerTimeout(struct AsRfbExt_typ* pLib, unsigned long timeout);
_BUR_PUBLIC unsigned short RfbExtDisableClientLogin(struct AsRfbExt_typ* pLib);
_BUR_PUBLIC unsigned short RfbExtDisconnectAllClients(struct AsRfbExt_typ* pLib);
_BUR_PUBLIC unsigned short RfbExtEnableClientLogin(struct AsRfbExt_typ* pLib);
_BUR_PUBLIC unsigned short RfbExtSetMaxClients(struct AsRfbExt_typ* pLib, unsigned char maxClients);
_BUR_PUBLIC unsigned short RfbExtDataAge(struct AsRfbExt_typ* pLib, unsigned long pAge);
_BUR_PUBLIC unsigned short RfbExtJoystickValue(struct AsRfbExt_typ* pLib, unsigned char index, unsigned long pValueX, unsigned long pValueY, unsigned long pValueZ);
_BUR_PUBLIC unsigned short RfbExtResetHandwheelValue(struct AsRfbExt_typ* pLib, unsigned char index, signed long value);
_BUR_PUBLIC unsigned short RfbExtHandwheelValue(struct AsRfbExt_typ* pLib, unsigned char index, unsigned long pValue);
_BUR_PUBLIC unsigned short RfbExtPotiValue(struct AsRfbExt_typ* pLib, unsigned char index, unsigned long pValue);
_BUR_PUBLIC unsigned short RfbExtTemperatureValue(struct AsRfbExt_typ* pLib, unsigned char index, unsigned long pValue);


#ifdef __cplusplus
};
#endif
#endif /* _ASRFBEXT_ */

