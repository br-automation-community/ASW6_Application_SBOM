/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXECM_
#define _ASNXECM_
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
typedef struct nxecmSdoRead
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short SlaveAdr;
	unsigned short Index;
	unsigned char SubIndex;
	plctime Timeout;
	unsigned long Data;
	unsigned long DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long EcAddStatusInfo;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit CompleteAccess;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} nxecmSdoRead_typ;

typedef struct nxecmSdoWrite
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short SlaveAdr;
	unsigned short Index;
	unsigned char SubIndex;
	plctime Timeout;
	unsigned long Data;
	unsigned long DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long EcAddStatusInfo;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit CompleteAccess;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} nxecmSdoWrite_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void nxecmSdoRead(struct nxecmSdoRead* inst);
_BUR_PUBLIC void nxecmSdoWrite(struct nxecmSdoWrite* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define nxecmERR_INTERNAL (-1070582447)
 #define nxecmERR_ACCESS_GENERAL (-1070582448)
 #define nxecmERR_VALUE_OUT_OF_RANGE (-1070582449)
 #define nxecmERR_INVALID_LENGTH (-1070582450)
 #define nxecmERR_OBJECT_IS_READ_ONLY (-1070582451)
 #define nxecmERR_OBJECT_IS_WRITE_ONLY (-1070582452)
 #define nxecmERR_OBJECT_DOES_NOT_EXIST (-1070582453)
 #define nxecmERR_OBJECT_COMPLETE_ACCESS (-1070582454)
 #define nxecmERR_TIMEOUT (-1070582455)
 #define nxecmERR_SLAVE_HW_ERROR (-1070582456)
 #define nxecmERR_SLAVE_ADDRESS_INVALID (-1070582457)
 #define nxecmERR_SLAVE_STATE_WRONG (-1070582458)
 #define nxecmERR_DATA_BUFFER (-1070582459)
 #define nxecmERR_INVALID_DEVICE (-1070582460)
#else
 _GLOBAL_CONST signed long nxecmERR_INTERNAL;
 _GLOBAL_CONST signed long nxecmERR_ACCESS_GENERAL;
 _GLOBAL_CONST signed long nxecmERR_VALUE_OUT_OF_RANGE;
 _GLOBAL_CONST signed long nxecmERR_INVALID_LENGTH;
 _GLOBAL_CONST signed long nxecmERR_OBJECT_IS_READ_ONLY;
 _GLOBAL_CONST signed long nxecmERR_OBJECT_IS_WRITE_ONLY;
 _GLOBAL_CONST signed long nxecmERR_OBJECT_DOES_NOT_EXIST;
 _GLOBAL_CONST signed long nxecmERR_OBJECT_COMPLETE_ACCESS;
 _GLOBAL_CONST signed long nxecmERR_TIMEOUT;
 _GLOBAL_CONST signed long nxecmERR_SLAVE_HW_ERROR;
 _GLOBAL_CONST signed long nxecmERR_SLAVE_ADDRESS_INVALID;
 _GLOBAL_CONST signed long nxecmERR_SLAVE_STATE_WRONG;
 _GLOBAL_CONST signed long nxecmERR_DATA_BUFFER;
 _GLOBAL_CONST signed long nxecmERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASNXECM_ */

