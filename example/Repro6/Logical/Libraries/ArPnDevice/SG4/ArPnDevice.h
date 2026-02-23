/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARPNDEVICE_
#define _ARPNDEVICE_
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
typedef enum ArPnDeviceRecordAccessEnum
{	arPNDEVICE_RECORD_ACCESS_RW = 0,
	arPNDEVICE_RECORD_ACCESS_RO = 1,
	arPNDEVICE_RECORD_ACCESS_WO = 2
} ArPnDeviceRecordAccessEnum;

typedef unsigned short ArPnDeviceSlotType;	 /* IEC bounds for this type: 0..16#7FFF*/

typedef unsigned short ArPnDeviceSubslotType;	 /* IEC bounds for this type: 0..16#7FFF*/

typedef unsigned short ArPnDeviceIndexType;	 /* IEC bounds for this type: 0..16#7FFF*/

typedef struct ArPnDeviceRecord
{
	/* VAR_INPUT (analog) */
	plcstring Device[128];
	unsigned long Api;
	ArPnDeviceSlotType Slot;
	ArPnDeviceSubslotType Subslot;
	ArPnDeviceIndexType Index;
	enum ArPnDeviceRecordAccessEnum AccessRights;
	unsigned char* Data;
	unsigned long DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Get;
	plcbit Set;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit NewDataAvailable;
	plcbit GetDone;
	plcbit SetDone;
} ArPnDeviceRecord_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArPnDeviceRecord(struct ArPnDeviceRecord* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arPNDEVICE_DEFAULT_API 0U
 #define arPNDEVICE_ERR_ACCESS_RIGHTS (-1070582739)
 #define arPNDEVICE_ERR_DATA_LENGTH (-1070582740)
 #define arPNDEVICE_ERR_RECORD_EXISTS (-1070582741)
 #define arPNDEVICE_ERR_RECORD_INDEX (-1070582742)
 #define arPNDEVICE_ERR_RECORD_SUBSLOT (-1070582743)
 #define arPNDEVICE_ERR_RECORD_SLOT (-1070582744)
 #define arPNDEVICE_ERR_DEVICE_NOT_SUP (-1070582745)
 #define arPNDEVICE_ERR_DEVICE_NAME (-1070582746)
#else
 _GLOBAL_CONST unsigned long arPNDEVICE_DEFAULT_API;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_ACCESS_RIGHTS;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_DATA_LENGTH;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_RECORD_EXISTS;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_RECORD_INDEX;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_RECORD_SUBSLOT;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_RECORD_SLOT;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_DEVICE_NOT_SUP;
 _GLOBAL_CONST signed long arPNDEVICE_ERR_DEVICE_NAME;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARPNDEVICE_ */

