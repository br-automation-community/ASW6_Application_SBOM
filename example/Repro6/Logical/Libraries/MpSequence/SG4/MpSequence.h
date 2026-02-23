/* Automation Studio generated header file */
/* Do not edit ! */
/* MpSequence 6.5.1 */

#ifndef _MPSEQUENCE_
#define _MPSEQUENCE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpSequence_VERSION
#define _MpSequence_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpSequenceModeEnum
{	mpSEQUENCE_MODE_AUTOMATIC = 0,
	mpSEQUENCE_MODE_SINGLE_CYCLE = 1,
	mpSEQUENCE_MODE_SINGLE_STEP = 2,
	mpSEQUENCE_MODE_SINGLE_COMMAND = 3,
	mpSEQUENCE_MODE_MANUAL = 5
} MpSequenceModeEnum;

typedef enum MpSequenceStartModeEnum
{	mpSEQUENCE_START_NORMAL = 0,
	mpSEQUENCE_START_SELECT_STEP = 1,
	mpSEQUENCE_START_AUTO_STEP = 2,
	mpSEQUENCE_RESUME_EXECUTION = 3
} MpSequenceStartModeEnum;

typedef enum MpSequenceStopModeEnum
{	mpSEQUENCE_STOP_IMMEDIATE = 0,
	mpSEQUENCE_STOP_END_OF_STEP = 1,
	mpSEQUENCE_STOP_END_OF_CYCLE = 2
} MpSequenceStopModeEnum;

typedef enum MpSequenceSuspendModeEnum
{	mpSEQUENCE_SUSPEND_IMMEDIATE = 0,
	mpSEQUENCE_SUSPEND_END_OF_STEP = 1
} MpSequenceSuspendModeEnum;

typedef enum MpSequenceMovementStateEnum
{	mpSEQUENCE_MOVEMENT_IDLE = 0,
	mpSEQUENCE_MOVEMENT_ACTIVE = 1,
	mpSEQUENCE_MOVEMENT_DONE = 2,
	mpSEQUENCE_MOVEMENT_ERROR = 99
} MpSequenceMovementStateEnum;

typedef enum MpSequenceErrorEnum
{	mpSEQUENCE_NO_ERROR = 0,
	mpSEQUENCE_ERR_ACTIVATION = -1064239103,
	mpSEQUENCE_ERR_MPLINK_NULL = -1064239102,
	mpSEQUENCE_ERR_MPLINK_INVALID = -1064239101,
	mpSEQUENCE_ERR_MPLINK_CHANGED = -1064239100,
	mpSEQUENCE_ERR_MPLINK_CORRUPT = -1064239099,
	mpSEQUENCE_ERR_MPLINK_IN_USE = -1064239098,
	mpSEQUENCE_ERR_PAR_NULL = -1064239097,
	mpSEQUENCE_ERR_CONFIG_NULL = -1064239096,
	mpSEQUENCE_ERR_CONFIG_NO_PV = -1064239095,
	mpSEQUENCE_ERR_CONFIG_LOAD = -1064239094,
	mpSEQUENCE_WRN_CONFIG_LOAD = -2137980917,
	mpSEQUENCE_ERR_CONFIG_SAVE = -1064239092,
	mpSEQUENCE_ERR_CONFIG_INVALID = -1064239091,
	mpSEQUENCE_ERR_NAME_EMPTY = -1064004608,
	mpSEQUENCE_ERR_IMPORT = -1064004607,
	mpSEQUENCE_ERR_EXPORT = -1064004606,
	mpSEQUENCE_ERR_NO_SEQUENCE_DEF = -1064004605,
	mpSEQUENCE_ERR_PV_NOT_FOUND = -1064004604,
	mpSEQUENCE_ERR_INTERLOCK = -1064004603,
	mpSEQUENCE_ERR_STEP_TIMEOUT = -1064004602,
	mpSEQUENCE_ERR_CONDITION_INVALID = -1064004601,
	mpSEQUENCE_ERR_NAME_NOT_FOUND = -1064004600,
	mpSEQUENCE_ERR_ARRAY_NULL = -1064004599,
	mpSEQUENCE_ERR_NAME_NULL = -1064004598,
	mpSEQUENCE_WRN_ARRAY_SHORT = -2137746421,
	mpSEQUENCE_ERR_ACTUATOR_MISSING = -1064004596,
	mpSEQUENCE_ERR_ACTUATOR_COUNT = -1064004595,
	mpSEQUENCE_ERR_PAR_MISSING = -1064004594,
	mpSEQUENCE_ERR_STEP_NOT_FOUND = -1064004593,
	mpSEQUENCE_ERR_NO_SEQ_IMPORTED = -1064004592,
	mpSEQUENCE_ERR_AXIS_MISSING = -1064004591,
	mpSEQUENCE_ERR_COMMAND_NOT_FOUND = -1064004590,
	mpSEQUENCE_ERR_NO_STEPS_PREVIOUS = -1064004589,
	mpSEQUENCE_ERR_NO_STEPS_DEFINED = -1064004588,
	mpSEQUENCE_ERR_COMMAND_STATE_ERR = -1064004587,
	mpSEQUENCE_ERR_SEQUENCE_INVALID = -1064004586,
	mpSEQUENCE_ERR_TYPE_EMPTY = -1064004585,
	mpSEQUENCE_WRN_PAR_MISSING = -2137746408
} MpSequenceErrorEnum;

typedef enum MpSequenceAlarmEnum
{	mpSEQUENCE_ALM_IMPORT_SEQUENCE = 0,
	mpSEQUENCE_ALM_EXPORT_SEQUENCE = 1,
	mpSEQUENCE_ALM_TIMEOUT = 2,
	mpSEQUENCE_ALM_INTERLOCK = 3,
	mpSEQUENCE_ALM_ACTUATOR_BLOCKED = 4
} MpSequenceAlarmEnum;

typedef struct MpSequenceCoreStartType
{	enum MpSequenceStartModeEnum Mode;
	plcstring Step[256];
} MpSequenceCoreStartType;

typedef struct MpSequenceCoreStopType
{	enum MpSequenceStopModeEnum Mode;
} MpSequenceCoreStopType;

typedef struct MpSequenceSuspendType
{	enum MpSequenceSuspendModeEnum Mode;
} MpSequenceSuspendType;

typedef struct MpSequenceManualType
{	plcstring Command[256];
} MpSequenceManualType;

typedef struct MpSequenceSingleCommandType
{	plcstring Command[256];
	unsigned long ParametersArraySize;
	unsigned long Parameters;
} MpSequenceSingleCommandType;

typedef struct MpSequenceCoreParType
{	plcstring Sequence[256];
	plcstring InitSequence[256];
	plcstring ExitSequence[256];
	struct MpSequenceCoreStartType Start;
	struct MpSequenceCoreStopType Stop;
	struct MpSequenceSuspendType Suspend;
	struct MpSequenceManualType Manual;
	struct MpSequenceSingleCommandType SingleCommand;
} MpSequenceCoreParType;

typedef struct MpSequenceManualParType
{	plcstring Name[256];
	double Value;
} MpSequenceManualParType;

typedef struct MpSequenceCycleType
{	unsigned long Count;
	float CurrentDuration;
	float LastDuration;
} MpSequenceCycleType;

typedef struct MpSequenceStatusIDType
{	enum MpSequenceErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpSequenceStatusIDType;

typedef struct MpSequenceDiagType
{	struct MpSequenceStatusIDType StatusID;
} MpSequenceDiagType;

typedef struct MpSequenceCoreInfoType
{	plcbit ReadyToStart;
	plcbit ReadyToResume;
	enum MpSequenceModeEnum ActiveMode;
	plcstring ActiveSteps[10][256];
	plcstring ActiveCommands[10][256];
	float ElapsedTime[10];
	struct MpSequenceCycleType Cycle;
	struct MpSequenceDiagType Diag;
} MpSequenceCoreInfoType;

typedef struct MpSequencerCommandType
{	plcbit Start;
	plcbit Stop;
	plcstring Actuator[256];
	enum MpSequenceModeEnum CurrentMode;
	enum MpSequenceMovementStateEnum MovementState;
	float CurrentRunTime;
	float LastRunTime;
} MpSequencerCommandType;

typedef struct MpSequenceCore
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpSequenceCoreParType* Parameters;
	enum MpSequenceModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpSequenceCoreInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[27];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Start;
	plcbit StopImmediate;
	plcbit Stop;
	plcbit Suspend;
	plcbit Resume;
	plcbit Import;
	plcbit Export;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandDone;
	plcbit Running;
	plcbit Suspended;
	plcbit Stopped;
} MpSequenceCore_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpSequenceCore(struct MpSequenceCore* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPSEQUENCE_ */

