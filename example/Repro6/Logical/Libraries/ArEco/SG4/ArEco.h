/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARECO_
#define _ARECO_
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
typedef enum ArEcoWakeupModeEnum
{	arECO_WAKEUPMODE_DISABLED = 0,
	arECO_WAKEUPMODE_VISIBLE = 1,
	arECO_WAKEUPMODE_SILENT = 2
} ArEcoWakeupModeEnum;

typedef struct ArEcoWakeupTriggerType
{	plcstring Name[81];
	enum ArEcoWakeupModeEnum Mode;
} ArEcoWakeupTriggerType;

typedef struct ArEcoWakeupTimeType
{	plctime Time;
	enum ArEcoWakeupModeEnum Mode;
} ArEcoWakeupTimeType;

typedef struct ArEcoPlcShutdown
{
	/* VAR_INPUT (analog) */
	struct ArEcoWakeupTriggerType* WakeupTriggers;
	unsigned short NrOfWakeupTriggers;
	struct ArEcoWakeupTimeType WakeupTime;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring InvalidWakeupTrigger[81];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArEcoPlcShutdown_typ;

typedef struct ArEcoPlcWakeupInfo
{
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
	plcbit TriggeredWakeup;
	plcbit TimedWakeup;
	plcbit SilentWakeup;
} ArEcoPlcWakeupInfo_typ;

typedef struct ArEcoPlcWakeupTriggerState
{
	/* VAR_INPUT (analog) */
	plcstring Name[81];
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
	plcbit Triggered;
} ArEcoPlcWakeupTriggerState_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArEcoPlcShutdown(struct ArEcoPlcShutdown* inst);
_BUR_PUBLIC void ArEcoPlcWakeupInfo(struct ArEcoPlcWakeupInfo* inst);
_BUR_PUBLIC void ArEcoPlcWakeupTriggerState(struct ArEcoPlcWakeupTriggerState* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arECO_ERR_NO_WAKEUP_PAR (-1070584441)
 #define arECO_ERR_INVALID_WAKEUPMODE (-1070584442)
 #define arECO_ERR_INVALID_WAKEUPTRIGGER (-1070584443)
 #define arECO_ERR_INTERNAL (-1070584444)
 #define arECO_ERR_INVALID_PARAMETER (-1070584445)
 #define arECO_ERR_FB_NOT_SUPPORTED (-1070584446)
#else
 _GLOBAL_CONST signed long arECO_ERR_NO_WAKEUP_PAR;
 _GLOBAL_CONST signed long arECO_ERR_INVALID_WAKEUPMODE;
 _GLOBAL_CONST signed long arECO_ERR_INVALID_WAKEUPTRIGGER;
 _GLOBAL_CONST signed long arECO_ERR_INTERNAL;
 _GLOBAL_CONST signed long arECO_ERR_INVALID_PARAMETER;
 _GLOBAL_CONST signed long arECO_ERR_FB_NOT_SUPPORTED;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARECO_ */

