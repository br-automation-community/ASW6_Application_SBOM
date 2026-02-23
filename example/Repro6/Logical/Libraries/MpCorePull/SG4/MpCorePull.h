/* Automation Studio generated header file */
/* Do not edit ! */
/* MpCorePull 6.4.0 */

#ifndef _MPCOREPULL_
#define _MPCOREPULL_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpCorePull_VERSION
#define _MpCorePull_VERSION 6.4.0
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
typedef enum MpCorePullMoveModeEnum
{	mpCOREPULL_MOVE_MODE_LIMITSWITCH = 1,
	mpCOREPULL_MOVE_MODE_TIME = 2,
	mpCOREPULL_MOVE_MODE_PULSES = 4
} MpCorePullMoveModeEnum;

typedef enum MpCorePullMoveTypeEnum
{	mpCOREPULL_MOVE_TYPE_SETUP = 0,
	mpCOREPULL_MOVE_TYPE_NORMAL = 1
} MpCorePullMoveTypeEnum;

typedef enum MpCorePullStateEnum
{	mpCOREPULL_STATE_UNDEFINED = 0,
	mpCOREPULL_STATE_OUT_END_POS = 1,
	mpCOREPULL_STATE_OUT_STOP_POS = 2,
	mpCOREPULL_STATE_OUT_MOVEMENT = 3,
	mpCOREPULL_STATE_IN_END_POS = 4,
	mpCOREPULL_STATE_IN_STOP_POS = 5,
	mpCOREPULL_STATE_IN_MOVEMENT = 6
} MpCorePullStateEnum;

typedef enum MpCorePullValveTypeEnum
{	mpCOREPULL_VALVE_TYPE_DIRECT = 0,
	mpCOREPULL_VALVE_TYPE_SERVO = 1,
	mpCOREPULL_VALVE_TYPE_PROP = 2
} MpCorePullValveTypeEnum;

typedef enum MpCorePullErrorEnum
{	mpCOREPULL_NO_ERROR = 0,
	mpCOREPULL_ERR_ACTIVATION = -1064239103,
	mpCOREPULL_ERR_MPLINK_NULL = -1064239102,
	mpCOREPULL_ERR_MPLINK_INVALID = -1064239101,
	mpCOREPULL_ERR_MPLINK_CHANGED = -1064239100,
	mpCOREPULL_ERR_MPLINK_CORRUPT = -1064239099,
	mpCOREPULL_ERR_MPLINK_IN_USE = -1064239098,
	mpCOREPULL_ERR_PAR_NULL = -1064239097,
	mpCOREPULL_ERR_CONFIG_NULL = -1064239096,
	mpCOREPULL_ERR_CONFIG_NO_PV = -1064239095,
	mpCOREPULL_ERR_CONFIG_LOAD = -1064239094,
	mpCOREPULL_WRN_CONFIG_LOAD = -2137980917,
	mpCOREPULL_ERR_CONFIG_SAVE = -1064239092,
	mpCOREPULL_ERR_CONFIG_INVALID = -1064239091,
	mpCOREPULL_WRN_PAR_LIMITED = -2137771520,
	mpCOREPULL_ERR_IN_TIMEOUT = -1064029695,
	mpCOREPULL_ERR_OUT_TIMEOUT = -1064029694,
	mpCOREPULL_WRN_CONFIG_WAIT_IDLE = -2137771517,
	mpCOREPULL_WRN_PAR_WAIT_IDLE = -2137771516
} MpCorePullErrorEnum;

typedef enum MpCorePullBasicAlarmEnum
{	mpCOREPULL_ALM_PARAMETER_LIMITED = 0,
	mpCOREPULL_ALM_CORE_TIMEOUT = 1
} MpCorePullBasicAlarmEnum;

typedef struct MpCorePullInputSignalsType
{	plcstring InEnd[256];
	plcstring OutEnd[256];
	plcstring PulseCount[256];
} MpCorePullInputSignalsType;

typedef struct MpCorePullOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring InValve[256];
	plcstring OutValve[256];
	plcstring ServoPumpParameterSet[256];
	plcstring ValveSignal[256];
} MpCorePullOutputSignalsType;

typedef struct MpCorePullVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
} MpCorePullVelocityType;

typedef struct MpCorePullForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpCorePullForceType;

typedef struct MpCorePullDelayType
{	float ValveOn;
	float Velocity;
	float Force;
	float ValveOff;
	float AfterMove;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpCorePullDelayType;

typedef struct MpCorePullConfigDirectionType
{	struct MpCorePullVelocityType VelocityProfileLimits;
	struct MpCorePullForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpCorePullDelayType Delay;
} MpCorePullConfigDirectionType;

typedef struct MpCorePullValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpCorePullValveLinearizationType;

typedef struct MpCorePullValveSettingsType
{	enum MpCorePullValveTypeEnum ValveType;
	struct MpCorePullValveLinearizationType ValveLinearization;
} MpCorePullValveSettingsType;

typedef struct MpCorePullBasicHConfigType
{	plcbit EnableAccelerationOverride;
	struct MpCorePullInputSignalsType InputSignals;
	struct MpCorePullOutputSignalsType OutputSignals;
	struct MpCorePullConfigDirectionType In;
	struct MpCorePullConfigDirectionType Out;
	struct MpCorePullValveSettingsType ValveSettings;
} MpCorePullBasicHConfigType;

typedef struct MpCorePullDirectionType
{	float Velocity;
	float Force;
	float AccelerationOverride;
	unsigned long Pulses;
	float Time;
	float Timeout;
	plcbit ValveStayOn;
	enum MpCorePullMoveModeEnum MoveMode;
} MpCorePullDirectionType;

typedef struct MpCorePullDirectionSetupType
{	float Velocity;
	float Force;
} MpCorePullDirectionSetupType;

typedef struct MpCorePullSetupModeType
{	struct MpCorePullDirectionSetupType In;
	struct MpCorePullDirectionSetupType Out;
} MpCorePullSetupModeType;

typedef struct MpCorePullBasicParType
{	struct MpCorePullDirectionType In[5];
	struct MpCorePullDirectionType Out[5];
	struct MpCorePullSetupModeType SetupMode;
} MpCorePullBasicParType;

typedef struct MpCorePullStatusIDType
{	enum MpCorePullErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpCorePullStatusIDType;

typedef struct MpCorePullDiagType
{	struct MpCorePullStatusIDType StatusID;
} MpCorePullDiagType;

typedef struct MpCorePullBasicInfoType
{	enum MpCorePullStateEnum State;
	struct MpCorePullDiagType Diag;
} MpCorePullBasicInfoType;

typedef struct MpCorePullInfoType
{	struct MpCorePullDiagType Diag;
} MpCorePullInfoType;

typedef struct MpCorePullBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpCorePullBasicParType* Parameters;
	enum MpCorePullMoveTypeEnum MoveType;
	unsigned char ParameterSet;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpCorePullBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit In;
	plcbit Out;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpCorePullBasic_typ;

typedef struct MpCorePullBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpCorePullBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpCorePullInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpCorePullBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpCorePullBasic(struct MpCorePullBasic* inst);
_BUR_PUBLIC void MpCorePullBasicHConfig(struct MpCorePullBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPCOREPULL_ */

