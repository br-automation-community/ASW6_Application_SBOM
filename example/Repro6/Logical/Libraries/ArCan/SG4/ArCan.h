/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARCAN_
#define _ARCAN_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct ArCanFrameType
{	plcbyte Data[64];
	unsigned long DataLength;
	unsigned long ID;
	unsigned long Format;
} ArCanFrameType;

typedef struct ArCanTimestampType
{	unsigned long UTCSeconds;
	unsigned long UTCNanoSeconds;
	signed long LocalTime;
} ArCanTimestampType;

typedef struct ArCanSend
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	struct ArCanFrameType Frame;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long NumberOfFreeBuffers;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit SendFrame;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} ArCanSend_typ;

typedef struct ArCanSendAcknowledged
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	struct ArCanFrameType Frame;
	unsigned long Timeout;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCanSendAcknowledged_typ;

typedef struct ArCanReceive
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned long ID;
	unsigned long IDMask;
	unsigned long Format;
	unsigned long QueueSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArCanFrameType ReceivedFrame;
	struct ArCanTimestampType Timestamp;
	unsigned long NumberOfLostFrames;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit NewDataValid;
} ArCanReceive_typ;

typedef struct ArCanGetRtrData
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned long ID;
	unsigned long Format;
	unsigned long ResponseDataLength;
	unsigned long Timeout;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArCanFrameType RtrFrame;
	struct ArCanTimestampType Timestamp;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCanGetRtrData_typ;

typedef struct ArCanRtr
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned long ID;
	unsigned long Format;
	unsigned long DataLength;
	plcbyte Data[64];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit SetData;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit ResponseSent;
} ArCanRtr_typ;

typedef struct ArCanSetBaudrate
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned long Baudrate;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCanSetBaudrate_typ;

typedef struct ArCanSetBitTimingRegisters
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	plcbyte Register0;
	plcbyte Register1;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCanSetBitTimingRegisters_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArCanSend(struct ArCanSend* inst);
_BUR_PUBLIC void ArCanSendAcknowledged(struct ArCanSendAcknowledged* inst);
_BUR_PUBLIC void ArCanReceive(struct ArCanReceive* inst);
_BUR_PUBLIC void ArCanGetRtrData(struct ArCanGetRtrData* inst);
_BUR_PUBLIC void ArCanRtr(struct ArCanRtr* inst);
_BUR_PUBLIC void ArCanSetBaudrate(struct ArCanSetBaudrate* inst);
_BUR_PUBLIC void ArCanSetBitTimingRegisters(struct ArCanSetBitTimingRegisters* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arCAN_ERR_INVALID_DATALENGTH (-1070584150)
 #define arCAN_ERR_TIMEOUT (-1070584149)
 #define arCAN_ERR_DEVICE_NAME (-1070584148)
 #define arCAN_ERR_INVALID_PARAMETER (-1070584147)
 #define arCAN_ERR_BUFFER_FULL (-1070584146)
 #define arCAN_ERR_INVALID_ID (-1070584145)
 #define arCAN_RECEIVE_SINGLE_ID 4294967295U
 #define arCAN_RECEIVE_ALL 0U
 #define arCAN_29BIT 2U
 #define arCAN_11BIT 1U
#else
 _GLOBAL_CONST signed long arCAN_ERR_INVALID_DATALENGTH;
 _GLOBAL_CONST signed long arCAN_ERR_TIMEOUT;
 _GLOBAL_CONST signed long arCAN_ERR_DEVICE_NAME;
 _GLOBAL_CONST signed long arCAN_ERR_INVALID_PARAMETER;
 _GLOBAL_CONST signed long arCAN_ERR_BUFFER_FULL;
 _GLOBAL_CONST signed long arCAN_ERR_INVALID_ID;
 _GLOBAL_CONST unsigned long arCAN_RECEIVE_SINGLE_ID;
 _GLOBAL_CONST unsigned long arCAN_RECEIVE_ALL;
 _GLOBAL_CONST unsigned long arCAN_29BIT;
 _GLOBAL_CONST unsigned long arCAN_11BIT;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARCAN_ */

