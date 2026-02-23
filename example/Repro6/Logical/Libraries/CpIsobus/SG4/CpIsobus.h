/* Automation Studio generated header file */
/* Do not edit ! */
/* CpIsobus 1.1.1 */

#ifndef _CPISOBUS_
#define _CPISOBUS_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _CpIsobus_VERSION
#define _CpIsobus_VERSION 1.1.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "astime.h"
		#include "ArCan.h"
		#include "AsMem.h"
#endif
#ifdef _SG4
		#include "astime.h"
		#include "ArCan.h"
		#include "AsMem.h"
#endif
#ifdef _SGC
		#include "astime.h"
		#include "ArCan.h"
		#include "AsMem.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum CpIsobusLogLevelEnum
{	cpISOBUS_LOG_LEVEL_INFO,
	cpISOBUS_LOG_LEVEL_SUCCESS,
	cpISOBUS_LOG_LEVEL_WARNING,
	cpISOBUS_LOG_LEVEL_ERROR,
	cpISOBUS_LOG_LEVEL_DEBUG
} CpIsobusLogLevelEnum;

typedef enum CpIsobusErrorEnum
{	cpISOBUS_NO_ERROR = 0,
	cpISOBUS_ERR_ASSERT = -1070582396,
	cpISOBUS_WRN_TERMINATED = -2144324220,
	cpISOBUS_WRN_SAFETY_NOTIFICATION = -2144324219,
	cpISOBUS_SUC_STARTED = 3159428,
	cpISOBUS_INF_GENERIC = 1076901252,
	cpISOBUS_INF_DEBUG = 1076901253
} CpIsobusErrorEnum;

typedef enum CpIsobusStateEnum
{	cpISOBUS_STATE_CLOSED,
	cpISOBUS_STATE_INITIALIZING,
	cpISOBUS_STATE_RUNNING,
	cpISOBUS_STATE_CLOSING
} CpIsobusStateEnum;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC signed long CpIsobusAllocateBuffers(unsigned char ControlFunction, unsigned long VtCommandBufferSize, unsigned char AuxFunctions, unsigned char AuxInputs, unsigned short PdValueEntries, unsigned short MeasurementEntries, unsigned short ActiveDtcsRecords, unsigned short PreviouslyActiveDtcsRecords);
_BUR_PUBLIC signed long CpIsobusExit(void);
_BUR_PUBLIC signed long CpIsobusExitDone(void);
_BUR_PUBLIC signed long CpIsobusInit(plcstring* DeviceName, unsigned long SafetyNotificationCallback);
_BUR_PUBLIC signed long CpIsobusInitDone(void);
_BUR_PUBLIC signed long CpIsobusLog(enum CpIsobusErrorEnum EventID, plcstring* Message);
_BUR_PUBLIC signed long CpIsobusRun(void);
_BUR_PUBLIC signed long CpIsobusSetLogLevel(enum CpIsobusLogLevelEnum LogLevel);


#ifdef __cplusplus
};
#endif
#endif /* _CPISOBUS_ */

