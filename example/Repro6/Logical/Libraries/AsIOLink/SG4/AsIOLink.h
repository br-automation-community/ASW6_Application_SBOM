/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASIOLINK_
#define _ASIOLINK_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <AsIOAcc.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum ioLinkState_t
{	READY,
	WORK,
	DONE
} ioLinkState_t;

typedef struct ioLinkInternalAccess_t
{	enum ioLinkState_t state;
	unsigned long idCount;
	unsigned long drvInstHandle;
	unsigned short error;
	unsigned long done;
	unsigned long serviceResponse;
	unsigned char datatype;
	unsigned long buffer;
	unsigned long bufferSize;
	unsigned char bufferFeatures[16];
} ioLinkInternalAccess_t;

typedef struct ioLinkInternalEvent_t
{	enum ioLinkState_t state;
	unsigned long drvInstHandle;
	unsigned char eventQualifier;
	unsigned short eventData;
	plcbit eventLost;
	plcbit eventPending;
	unsigned short error;
	unsigned char bufferFeatures[8];
} ioLinkInternalEvent_t;

typedef struct ioLinkInternalSetMode_t
{	enum ioLinkState_t state;
	unsigned short error;
	plcstring deviceName[129];
	plcstring channelName[33];
	struct AsIOAccWrite accWrite;
	unsigned char bufferFeatures[8];
} ioLinkInternalSetMode_t;

typedef struct ioLinkInternalParDownload_t
{	enum ioLinkState_t state;
	unsigned long drvInstHandle;
	unsigned short error;
	unsigned char bufferFeatures[8];
} ioLinkInternalParDownload_t;

typedef struct ioLinkWrite
{
	/* VAR_INPUT (analog) */
	unsigned long pDeviceName;
	unsigned short index;
	unsigned char subIndex;
	unsigned char datatype;
	unsigned long pData;
	unsigned long dataLen;
	/* VAR_OUTPUT (analog) */
	unsigned short errorCode;
	unsigned short status;
	/* VAR (analog) */
	struct ioLinkInternalAccess_t _internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ioLinkWrite_typ;

typedef struct ioLinkRead
{
	/* VAR_INPUT (analog) */
	unsigned long pDeviceName;
	unsigned short index;
	unsigned char subIndex;
	unsigned char datatype;
	unsigned long pData;
	unsigned long dataLen;
	/* VAR_OUTPUT (analog) */
	unsigned short errorCode;
	unsigned long readLen;
	unsigned short status;
	/* VAR (analog) */
	struct ioLinkInternalAccess_t _internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ioLinkRead_typ;

typedef struct ioLinkGetEvent
{
	/* VAR_INPUT (analog) */
	unsigned long pDeviceName;
	/* VAR_OUTPUT (analog) */
	unsigned char eventQualifier;
	unsigned short eventData;
	unsigned short status;
	/* VAR (analog) */
	struct ioLinkInternalEvent_t _internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit eventLost;
	plcbit eventPending;
} ioLinkGetEvent_typ;

typedef struct ioLinkSetMode
{
	/* VAR_INPUT (analog) */
	unsigned long pDeviceName;
	unsigned char mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct ioLinkInternalSetMode_t _internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ioLinkSetMode_typ;

typedef struct ioLinkParameterDownload
{
	/* VAR_INPUT (analog) */
	unsigned long pDeviceName;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct ioLinkInternalParDownload_t _internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ioLinkParameterDownload_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ioLinkWrite(struct ioLinkWrite* inst);
_BUR_PUBLIC void ioLinkRead(struct ioLinkRead* inst);
_BUR_PUBLIC void ioLinkGetEvent(struct ioLinkGetEvent* inst);
_BUR_PUBLIC void ioLinkSetMode(struct ioLinkSetMode* inst);
_BUR_PUBLIC void ioLinkParameterDownload(struct ioLinkParameterDownload* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ioLinkMODE_OPERATE 10U
 #define ioLinkMODE_DIGOUTPUT 2U
 #define ioLinkMODE_DIGINPUT 1U
 #define ioLinkMODE_INACTIVE 0U
 #define ioLinkTYPE_RECORD 254U
 #define ioLinkTYPE_STRING 9U
 #define ioLinkTYPE_LREAL 14U
 #define ioLinkTYPE_REAL 8U
 #define ioLinkTYPE_ULINT 10U
 #define ioLinkTYPE_UDINT 7U
 #define ioLinkTYPE_UINT 6U
 #define ioLinkTYPE_USINT 5U
 #define ioLinkTYPE_LINT 23U
 #define ioLinkTYPE_DINT 4U
 #define ioLinkTYPE_INT 3U
 #define ioLinkTYPE_SINT 2U
 #define ioLinkERR_DEVICE_ERROR 37971U
 #define ioLinkERR_NO_EVENT 37970U
 #define ioLinkERR_EVENT_RECEIVED 37969U
 #define ioLinkERR_DATATYPE_MISMATCH 37968U
 #define ioLinkERR_DEVICE_DRIVER 37967U
 #define ioLinkERR_BUFFER_TO_SMALL 37966U
 #define ioLinkERR_REQUEST_TO_LONG 37965U
 #define ioLinkERR_REQUESTQUEUE_FULL 37964U
 #define ioLinkERR_MAX_OPEN_COUNT 37963U
 #define ioLinkERR_COMMUNICATION_DEVICE 37962U
 #define ioLinkERR_INVALID_MASTER 37961U
 #define ioLinkERR_INVALID_PARAMETER 37960U
#else
 _GLOBAL_CONST unsigned char ioLinkMODE_OPERATE;
 _GLOBAL_CONST unsigned char ioLinkMODE_DIGOUTPUT;
 _GLOBAL_CONST unsigned char ioLinkMODE_DIGINPUT;
 _GLOBAL_CONST unsigned char ioLinkMODE_INACTIVE;
 _GLOBAL_CONST unsigned char ioLinkTYPE_RECORD;
 _GLOBAL_CONST unsigned char ioLinkTYPE_STRING;
 _GLOBAL_CONST unsigned char ioLinkTYPE_LREAL;
 _GLOBAL_CONST unsigned char ioLinkTYPE_REAL;
 _GLOBAL_CONST unsigned char ioLinkTYPE_ULINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_UDINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_UINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_USINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_LINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_DINT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_INT;
 _GLOBAL_CONST unsigned char ioLinkTYPE_SINT;
 _GLOBAL_CONST unsigned short ioLinkERR_DEVICE_ERROR;
 _GLOBAL_CONST unsigned short ioLinkERR_NO_EVENT;
 _GLOBAL_CONST unsigned short ioLinkERR_EVENT_RECEIVED;
 _GLOBAL_CONST unsigned short ioLinkERR_DATATYPE_MISMATCH;
 _GLOBAL_CONST unsigned short ioLinkERR_DEVICE_DRIVER;
 _GLOBAL_CONST unsigned short ioLinkERR_BUFFER_TO_SMALL;
 _GLOBAL_CONST unsigned short ioLinkERR_REQUEST_TO_LONG;
 _GLOBAL_CONST unsigned short ioLinkERR_REQUESTQUEUE_FULL;
 _GLOBAL_CONST unsigned short ioLinkERR_MAX_OPEN_COUNT;
 _GLOBAL_CONST unsigned short ioLinkERR_COMMUNICATION_DEVICE;
 _GLOBAL_CONST unsigned short ioLinkERR_INVALID_MASTER;
 _GLOBAL_CONST unsigned short ioLinkERR_INVALID_PARAMETER;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASIOLINK_ */

