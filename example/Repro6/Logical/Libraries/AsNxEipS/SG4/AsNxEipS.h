/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXEIPS_
#define _ASNXEIPS_
#ifndef __cplusplus

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define eipsERR_DATA_SIZE 37818U
 #define eipsERR_NO_MORE_ENTRIES 37817U
 #define eipsERR_SUBSCRIBE_LISTENER 37816U
 #define eipsERR_MEMORY 37815U
 #define eipsERR_PARAMETER 37814U
 #define eipsERR_EIP_STACK 37813U
 #define eipsERR_TIMEOUT 37812U
 #define eipsERR_SEND_MESSAGE 37811U
 #define eipsERR_INVALID_DEVICE 37810U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned short eipsERR_DATA_SIZE;
 _GLOBAL_CONST unsigned short eipsERR_NO_MORE_ENTRIES;
 _GLOBAL_CONST unsigned short eipsERR_SUBSCRIBE_LISTENER;
 _GLOBAL_CONST unsigned short eipsERR_MEMORY;
 _GLOBAL_CONST unsigned short eipsERR_PARAMETER;
 _GLOBAL_CONST unsigned short eipsERR_EIP_STACK;
 _GLOBAL_CONST unsigned short eipsERR_TIMEOUT;
 _GLOBAL_CONST unsigned short eipsERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short eipsERR_INVALID_DEVICE;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct eipsSubscribe
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
} eipsSubscribe_typ;

typedef struct eipsUnsubscribe
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
} eipsUnsubscribe_typ;

typedef struct eipsObjMrRegister
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
} eipsObjMrRegister_typ;

typedef struct eipsObjCl3ServiceInd
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
} eipsObjCl3ServiceInd_typ;

typedef struct eipsObjCl3ServiceRes
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
} eipsObjCl3ServiceRes_typ;

typedef struct eipsObjOpenCl3
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pIpAddress;
	unsigned long time;
	unsigned long timeoutMult;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	unsigned long connectionId;
	unsigned long generalError;
	unsigned long extendedError;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipsObjOpenCl3_typ;

typedef struct eipsObjCloseCl3
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionId;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long eipStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} eipsObjCloseCl3_typ;

typedef struct eipsObjConnectMessage
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionId;
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
} eipsObjConnectMessage_typ;

typedef struct eipsObjUnconnectMessage
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
} eipsObjUnconnectMessage_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void eipsSubscribe(struct eipsSubscribe* inst);
_BUR_PUBLIC void eipsUnsubscribe(struct eipsUnsubscribe* inst);
_BUR_PUBLIC void eipsObjMrRegister(struct eipsObjMrRegister* inst);
_BUR_PUBLIC void eipsObjCl3ServiceInd(struct eipsObjCl3ServiceInd* inst);
_BUR_PUBLIC void eipsObjCl3ServiceRes(struct eipsObjCl3ServiceRes* inst);
_BUR_PUBLIC void eipsObjOpenCl3(struct eipsObjOpenCl3* inst);
_BUR_PUBLIC void eipsObjCloseCl3(struct eipsObjCloseCl3* inst);
_BUR_PUBLIC void eipsObjConnectMessage(struct eipsObjConnectMessage* inst);
_BUR_PUBLIC void eipsObjUnconnectMessage(struct eipsObjUnconnectMessage* inst);


#endif /* __cplusplus */
#endif /* _ASNXEIPS_ */

