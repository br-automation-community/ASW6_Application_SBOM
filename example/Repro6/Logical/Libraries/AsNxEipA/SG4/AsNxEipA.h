/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXEIPA_
#define _ASNXEIPA_
#ifndef __cplusplus

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define eipaMODE_FIXED 3U
 #define eipaMODE_BOOTP 2U
 #define eipaMODE_DHCP 1U
 #define eipaMODE_STORED_CONFIG 0U
 #define eipaERR_DATA_SIZE 37843U
 #define eipaERR_NO_MORE_ENTRIES 37842U
 #define eipaERR_SUBSCRIBE_LISTENER 37841U
 #define eipaERR_MEMORY 37840U
 #define eipaERR_PARAMETER 37839U
 #define eipaERR_EIP_STACK 37838U
 #define eipaERR_TIMEOUT 37837U
 #define eipaERR_SEND_MESSAGE 37836U
 #define eipaERR_INVALID_DEVICE 37835U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned long eipaMODE_FIXED;
 _GLOBAL_CONST unsigned long eipaMODE_BOOTP;
 _GLOBAL_CONST unsigned long eipaMODE_DHCP;
 _GLOBAL_CONST unsigned long eipaMODE_STORED_CONFIG;
 _GLOBAL_CONST unsigned short eipaERR_DATA_SIZE;
 _GLOBAL_CONST unsigned short eipaERR_NO_MORE_ENTRIES;
 _GLOBAL_CONST unsigned short eipaERR_SUBSCRIBE_LISTENER;
 _GLOBAL_CONST unsigned short eipaERR_MEMORY;
 _GLOBAL_CONST unsigned short eipaERR_PARAMETER;
 _GLOBAL_CONST unsigned short eipaERR_EIP_STACK;
 _GLOBAL_CONST unsigned short eipaERR_TIMEOUT;
 _GLOBAL_CONST unsigned short eipaERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short eipaERR_INVALID_DEVICE;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct nxeipaIpAddr_t
{	plcstring ipAddress[17];
	plcstring netMask[17];
} nxeipaIpAddr_t;

typedef struct eipaSubscribe
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaSubscribe_typ;

typedef struct eipaUnsubscribe
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaUnsubscribe_typ;

typedef struct eipaObjMrRegister
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long class;
	unsigned long accessType;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaObjMrRegister_typ;

typedef struct eipaObjRegisterService
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long service;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaObjRegisterService_typ;

typedef struct eipaObjCl3ServiceInd
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long maxDataCount;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	unsigned long source;
	unsigned long sourceId;
	unsigned long connectionId;
	unsigned long service;
	unsigned long class;
	unsigned long instance;
	unsigned long attribute;
	unsigned long dataCount;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaObjCl3ServiceInd_typ;

typedef struct eipaObjCl3ServiceRes
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long source;
	unsigned long sourceId;
	unsigned long connectionId;
	unsigned long service;
	unsigned long class;
	unsigned long instance;
	unsigned long attribute;
	unsigned long generalError;
	unsigned long extendedError;
	unsigned long dataCount;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaObjCl3ServiceRes_typ;

typedef struct eipaObjUnconnectMessage
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pIpAddress;
	unsigned long service;
	unsigned long class;
	unsigned long instance;
	unsigned long attribute;
	unsigned long dataCount;
	unsigned long pData;
	unsigned long maxResDataCount;
	unsigned long pResData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	unsigned long resService;
	unsigned long resClass;
	unsigned long resInstance;
	unsigned long resAttribute;
	unsigned long resDataCount;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaObjUnconnectMessage_typ;

typedef struct eipaSetIpConfig
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	struct nxeipaIpAddr_t ipAddress;
	plcstring gateway[17];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit activateDhcp;
	plcbit activateBootp;
	plcbit setIpAddress;
	plcbit setGateway;
} eipaSetIpConfig_typ;

typedef struct eipaSetIpParameter
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long mode;
	plcstring ipAddress[17];
	plcstring netMask[17];
	plcstring gateway[17];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaSetIpParameter_typ;

typedef struct eipaStartBusComm
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipaStartBusComm_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void eipaSubscribe(struct eipaSubscribe* inst);
_BUR_PUBLIC void eipaUnsubscribe(struct eipaUnsubscribe* inst);
_BUR_PUBLIC void eipaObjMrRegister(struct eipaObjMrRegister* inst);
_BUR_PUBLIC void eipaObjRegisterService(struct eipaObjRegisterService* inst);
_BUR_PUBLIC void eipaObjCl3ServiceInd(struct eipaObjCl3ServiceInd* inst);
_BUR_PUBLIC void eipaObjCl3ServiceRes(struct eipaObjCl3ServiceRes* inst);
_BUR_PUBLIC void eipaObjUnconnectMessage(struct eipaObjUnconnectMessage* inst);
_BUR_PUBLIC void eipaSetIpConfig(struct eipaSetIpConfig* inst);
_BUR_PUBLIC void eipaSetIpParameter(struct eipaSetIpParameter* inst);
_BUR_PUBLIC void eipaStartBusComm(struct eipaStartBusComm* inst);


#endif /* __cplusplus */
#endif /* _ASNXEIPA_ */

