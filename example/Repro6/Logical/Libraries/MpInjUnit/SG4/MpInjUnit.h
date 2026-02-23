/* Automation Studio generated header file */
/* Do not edit ! */
/* MpInjUnit 6.4.0 */

#ifndef _MPINJUNIT_
#define _MPINJUNIT_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpInjUnit_VERSION
#define _MpInjUnit_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
		#include "MTBasics.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
		#include "MTBasics.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
		#include "MTBasics.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpInjUnitProfileGenerationEnum
{	mpINJUNIT_POSITION_BASED = 0,
	mpINJUNIT_TIME_BASED = 1
} MpInjUnitProfileGenerationEnum;

typedef enum MpInjUnitMoveTypeEnum
{	mpINJUNIT_MOVE_TYPE_SETUP = 0,
	mpINJUNIT_MOVE_TYPE_NORMAL = 1
} MpInjUnitMoveTypeEnum;

typedef enum MpInjUnitStateEnum
{	mpINJUNIT_UNDEFINED = 0,
	mpINJUNIT_FORWARD_END_POSITION = 1,
	mpINJUNIT_FORWARD_STOP_POSITION = 2,
	mpINJUNIT_FORWARD_MOVEMENT = 3,
	mpINJUNIT_BACKWARD_END_POSITION = 4,
	mpINJUNIT_BACKWARD_STOP_POSITION = 5,
	mpINJUNIT_BACKWARD_MOVEMENT = 6
} MpInjUnitStateEnum;

typedef enum MpInjUnitValveTypeEnum
{	mpINJUNIT_VALVE_TYPE_DIRECT = 0,
	mpINJUNIT_VALVE_TYPE_SERVO = 1,
	mpINJUNIT_VALVE_TYPE_PROP = 2
} MpInjUnitValveTypeEnum;

typedef enum MpInjUnitErrorEnum
{	mpINJUNIT_NO_ERROR = 0,
	mpINJUNIT_ERR_ACTIVATION = -1064239103,
	mpINJUNIT_ERR_MPLINK_NULL = -1064239102,
	mpINJUNIT_ERR_MPLINK_INVALID = -1064239101,
	mpINJUNIT_ERR_MPLINK_CHANGED = -1064239100,
	mpINJUNIT_ERR_MPLINK_CORRUPT = -1064239099,
	mpINJUNIT_ERR_MPLINK_IN_USE = -1064239098,
	mpINJUNIT_ERR_PAR_NULL = -1064239097,
	mpINJUNIT_ERR_CONFIG_NULL = -1064239096,
	mpINJUNIT_ERR_CONFIG_NO_PV = -1064239095,
	mpINJUNIT_ERR_CONFIG_LOAD = -1064239094,
	mpINJUNIT_WRN_CONFIG_LOAD = -2137980917,
	mpINJUNIT_ERR_CONFIG_SAVE = -1064239092,
	mpINJUNIT_ERR_CONFIG_INVALID = -1064239091,
	mpINJUNIT_WRN_PARAMETER_LIMITED = -2137775104,
	mpINJUNIT_WRN_CONFIG_WAIT_IDLE = -2137775103,
	mpINJUNIT_WRN_PAR_WAIT_IDLE = -2137775102,
	mpINJUNIT_ERR_PROTECT_TIMEOUT = -1064033277
} MpInjUnitErrorEnum;

typedef enum MpInjUnitBasicAlarmEnum
{	mpINJUNIT_ALM_PARAMETER_LIMITED = 0,
	mpINJUNIT_ALM_PROTECT_TIMEOUT = 1
} MpInjUnitBasicAlarmEnum;

typedef struct MpInjUnitInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring CurrentForce[256];
	plcstring ForwardEnd[256];
	plcstring ForwardSlow[256];
	plcstring BackwardEnd[256];
	plcstring BackwardSlow[256];
} MpInjUnitInputSignalsType;

typedef struct MpInjUnitOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring ForwardValve[256];
	plcstring BackwardValve[256];
	plcstring ValveSignal[256];
	plcstring ServoPumpParameterSet[256];
} MpInjUnitOutputSignalsType;

typedef struct MpInjUnitForwardVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float ProtectMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpInjUnitForwardVelocityType;

typedef struct MpInjUnitForwardForceType
{	float Maximum;
	float SetupModeMaximum;
	float ProtectMaximum;
	float Tolerance;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpInjUnitForwardForceType;

typedef struct MpInjUnitDelayType
{	float ValveOn;
	float ValveOff;
	float AfterMove;
	float Velocity;
	float Force;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpInjUnitDelayType;

typedef struct MpInjUnitForwardType
{	enum MpInjUnitProfileGenerationEnum ProfileGeneration;
	plcbit UseEndSwitch;
	plcbit UseSlowDownSwitch;
	plcbit UseForceLimit;
	struct MpInjUnitForwardVelocityType VelocityProfileLimits;
	struct MpInjUnitForwardForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float PositionTolerance;
	float TimeTolerance;
	struct MpInjUnitDelayType Delay;
} MpInjUnitForwardType;

typedef struct MpInjUnitVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpInjUnitVelocityType;

typedef struct MpInjUnitForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpInjUnitForceType;

typedef struct MpInjUnitBackwardType
{	enum MpInjUnitProfileGenerationEnum ProfileGeneration;
	plcbit UseEndSwitch;
	plcbit UseSlowDownSwitch;
	struct MpInjUnitVelocityType VelocityProfileLimits;
	struct MpInjUnitForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float PositionTolerance;
	float TimeTolerance;
	struct MpInjUnitDelayType Delay;
} MpInjUnitBackwardType;

typedef struct MpInjUnitValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpInjUnitValveLinearizationType;

typedef struct MpInjUnitValveSettingsType
{	enum MpInjUnitValveTypeEnum ValveType;
	struct MpInjUnitValveLinearizationType ValveLinearization;
} MpInjUnitValveSettingsType;

typedef struct MpInjUnitBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	plcbit EnableAccelerationOverride;
	struct MpInjUnitInputSignalsType InputSignals;
	struct MpInjUnitOutputSignalsType OutputSignals;
	struct MpInjUnitForwardType Forward;
	struct MpInjUnitBackwardType Backward;
	struct MpInjUnitValveSettingsType ValveSettings;
} MpInjUnitBasicHConfigType;

typedef struct MpInjUnitProfileType
{	float Velocity[10];
	float Force[10];
	float Position[10];
	float Time[10];
	float AccelerationOverride[10];
} MpInjUnitProfileType;

typedef struct MpInjUnitProtectProfileType
{	float Timeout;
	float Velocity;
	float Force;
	float Position;
	float Delay;
} MpInjUnitProtectProfileType;

typedef struct MpInjUnitSetupModeProfileType
{	float Velocity;
	float Force;
} MpInjUnitSetupModeProfileType;

typedef struct MpInjUnitSetupModeType
{	struct MpInjUnitSetupModeProfileType ForwardProfile;
	struct MpInjUnitSetupModeProfileType BackwardProfile;
} MpInjUnitSetupModeType;

typedef struct MpInjUnitBasicParType
{	struct MpInjUnitProfileType ForwardProfile;
	struct MpInjUnitProfileType BackwardProfile;
	struct MpInjUnitProtectProfileType ProtectProfile;
	struct MpInjUnitSetupModeType SetupMode;
} MpInjUnitBasicParType;

typedef struct MpInjUnitStatusIDType
{	enum MpInjUnitErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpInjUnitStatusIDType;

typedef struct MpInjUnitDiagType
{	struct MpInjUnitStatusIDType StatusID;
} MpInjUnitDiagType;

typedef struct MpInjUnitInfoType
{	struct MpInjUnitDiagType Diag;
} MpInjUnitInfoType;

typedef struct MpInjUnitBasicInfoType
{	float Velocity;
	float MaxForce;
	float MinPosition;
	float MaxPosition;
	float MaxVelocity;
	unsigned char StepForward;
	unsigned char StepBackward;
	enum MpInjUnitStateEnum State;
	struct MpInjUnitDiagType Diag;
} MpInjUnitBasicInfoType;

typedef struct MpInjUnitBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjUnitBasicParType* Parameters;
	enum MpInjUnitMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjUnitBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Forward;
	plcbit Backward;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpInjUnitBasic_typ;

typedef struct MpInjUnitBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjUnitBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjUnitInfoType Info;
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
} MpInjUnitBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpInjUnitBasic(struct MpInjUnitBasic* inst);
_BUR_PUBLIC void MpInjUnitBasicHConfig(struct MpInjUnitBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPINJUNIT_ */

