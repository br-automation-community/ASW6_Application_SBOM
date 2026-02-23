/* Automation Studio generated header file */
/* Do not edit ! */
/* MpTieBar 6.4.0 */

#ifndef _MPTIEBAR_
#define _MPTIEBAR_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpTieBar_VERSION
#define _MpTieBar_VERSION 6.4.0
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
typedef enum MpTieBarUnlockModeEnum
{	mpTIEBAR_UNLOCK_BY_PRESSURE = 0,
	mpTIEBAR_UNLOCK_BY_POSITION = 1
} MpTieBarUnlockModeEnum;

typedef enum MpTieBarMoveTypeEnum
{	mpTIEBAR_MOVE_TYPE_SETUP = 0,
	mpTIEBAR_MOVE_TYPE_NORMAL = 1
} MpTieBarMoveTypeEnum;

typedef enum MpTieBarStateEnum
{	mpTIEBAR_UNDEFINED = 0,
	mpTIEBAR_FORWARD_END_POSITION = 1,
	mpTIEBAR_FORWARD_STOP_POSITION = 2,
	mpTIEBAR_FORWARD_MOVEMENT = 3,
	mpTIEBAR_BACKWARD_END_POSITION = 4,
	mpTIEBAR_BACKWARD_STOP_POSITION = 5,
	mpTIEBAR_BACKWARD_MOVEMENT = 6
} MpTieBarStateEnum;

typedef enum MpTieBarValveTypeEnum
{	mpTIEBAR_VALVE_TYPE_DIRECT = 0,
	mpTIEBAR_VALVE_TYPE_SERVO = 1,
	mpTIEBAR_VALVE_TYPE_PROP = 2
} MpTieBarValveTypeEnum;

typedef enum MpTieBarErrorEnum
{	mpTIEBAR_NO_ERROR = 0,
	mpTIEBAR_ERR_ACTIVATION = -1064239103,
	mpTIEBAR_ERR_MPLINK_NULL = -1064239102,
	mpTIEBAR_ERR_MPLINK_INVALID = -1064239101,
	mpTIEBAR_ERR_MPLINK_CHANGED = -1064239100,
	mpTIEBAR_ERR_MPLINK_CORRUPT = -1064239099,
	mpTIEBAR_ERR_MPLINK_IN_USE = -1064239098,
	mpTIEBAR_ERR_PAR_NULL = -1064239097,
	mpTIEBAR_ERR_CONFIG_NULL = -1064239096,
	mpTIEBAR_ERR_CONFIG_NO_PV = -1064239095,
	mpTIEBAR_ERR_CONFIG_LOAD = -1064239094,
	mpTIEBAR_WRN_CONFIG_LOAD = -2137980917,
	mpTIEBAR_ERR_CONFIG_SAVE = -1064239092,
	mpTIEBAR_ERR_CONFIG_INVALID = -1064239091,
	mpTIEBAR_WRN_PARAMETER_LIMITED = -2137738240,
	mpTIEBAR_WRN_CONFIG_WAIT_IDLE = -2137738239,
	mpTIEBAR_WRN_PAR_WAIT_IDLE = -2137738238
} MpTieBarErrorEnum;

typedef enum MpTieBarBasicAlarmEnum
{	mpTIEBAR_ALM_PARAMETER_LIMITED = 0
} MpTieBarBasicAlarmEnum;

typedef struct MpTieBarInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring CurrentForce[256];
	plcstring CurrentMoldPosition[256];
} MpTieBarInputSignalsType;

typedef struct MpTieBarOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring ForwardValve[256];
	plcstring BackwardValve[256];
	plcstring LockValve[256];
	plcstring UnlockValve[256];
	plcstring ValveSignal[256];
	plcstring ServoPumpParameterSet[256];
} MpTieBarOutputSignalsType;

typedef struct MpTieBarValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpTieBarValveLinearizationType;

typedef struct MpTieBarValveSettingsType
{	enum MpTieBarValveTypeEnum ValveType;
	struct MpTieBarValveLinearizationType ValveLinearization;
} MpTieBarValveSettingsType;

typedef struct MpTieBarVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpTieBarVelocityType;

typedef struct MpTieBarForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpTieBarForceType;

typedef struct MpTieBarDelayType
{	float ValveOn;
	float ValveOff;
	float AfterMove;
	float Velocity;
	float Force;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpTieBarDelayType;

typedef struct MpTieBarMoveConfigType
{	struct MpTieBarVelocityType VelocityProfileLimits;
	struct MpTieBarForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float PositionTolerance;
	float TimeTolerance;
	struct MpTieBarDelayType Delay;
} MpTieBarMoveConfigType;

typedef struct MpTieBarLockUnlockVelocityType
{	float Maximum;
	float Acceleration;
	float Deceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpTieBarLockUnlockVelocityType;

typedef struct MpTieBarLockUnlockForceType
{	float Maximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpTieBarLockUnlockForceType;

typedef struct MpTieBarLockConfigType
{	struct MpTieBarLockUnlockVelocityType VelocityProfileLimits;
	struct MpTieBarLockUnlockForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float ForceTolerance;
	float TimeTolerance;
	struct MpTieBarDelayType Delay;
} MpTieBarLockConfigType;

typedef struct MpTieBarUnlockConfigType
{	struct MpTieBarLockUnlockVelocityType VelocityProfileLimits;
	struct MpTieBarLockUnlockForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float PositionTolerance;
	float ForceTolerance;
	float TimeTolerance;
	struct MpTieBarDelayType Delay;
} MpTieBarUnlockConfigType;

typedef struct MpTieBarBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	plcbit EnableAccelerationOverride;
	struct MpTieBarInputSignalsType InputSignals;
	struct MpTieBarOutputSignalsType OutputSignals;
	struct MpTieBarValveSettingsType ValveSettings;
	struct MpTieBarMoveConfigType Forward;
	struct MpTieBarMoveConfigType Backward;
	struct MpTieBarLockConfigType Lock;
	struct MpTieBarUnlockConfigType Unlock;
} MpTieBarBasicHConfigType;

typedef struct MpTieBarProfileType
{	float Velocity;
	float Force;
	float AccelerationOverride;
} MpTieBarProfileType;

typedef struct MpTieBarLockProfileType
{	float Velocity[5];
	float Force[5];
	float ForceLimit[5];
	float AccelerationOverride[5];
} MpTieBarLockProfileType;

typedef struct MpTieBarUnlockProfileType
{	enum MpTieBarUnlockModeEnum UnlockMode;
	float Velocity[5];
	float Force[5];
	float UnlockPosition[5];
	float UnlockForce[5];
	float AccelerationOverride[5];
} MpTieBarUnlockProfileType;

typedef struct MpTieBarSetupModeProfileType
{	float Velocity;
	float Force;
} MpTieBarSetupModeProfileType;

typedef struct MpTieBarSetupModeType
{	struct MpTieBarSetupModeProfileType ForwardProfile;
	struct MpTieBarSetupModeProfileType BackwardProfile;
} MpTieBarSetupModeType;

typedef struct MpTieBarBasicParType
{	struct MpTieBarProfileType ForwardProfile;
	struct MpTieBarProfileType BackwardProfile;
	struct MpTieBarLockProfileType LockProfile;
	struct MpTieBarUnlockProfileType UnlockProfile;
	struct MpTieBarSetupModeType SetupMode;
} MpTieBarBasicParType;

typedef struct MpTieBarStatusIDType
{	enum MpTieBarErrorEnum ID;
	MpComSeveritiesEnum Severity;
	unsigned short Code;
} MpTieBarStatusIDType;

typedef struct MpTieBarDiagType
{	struct MpTieBarStatusIDType StatusID;
} MpTieBarDiagType;

typedef struct MpTieBarBasicInfoType
{	float Velocity;
	float MaxPosition;
	float MaxVelocity;
	unsigned char StepLock;
	unsigned char StepUnlock;
	enum MpTieBarStateEnum State;
	struct MpTieBarDiagType Diag;
} MpTieBarBasicInfoType;

typedef struct MpTieBarInfoType
{	struct MpTieBarDiagType Diag;
} MpTieBarInfoType;

typedef struct MpTieBarBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTieBarBasicParType* Parameters;
	enum MpTieBarMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTieBarBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Forward;
	plcbit Backward;
	plcbit Lock;
	plcbit Unlock;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpTieBarBasic_typ;

typedef struct MpTieBarBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTieBarBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTieBarInfoType Info;
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
} MpTieBarBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpTieBarBasic(struct MpTieBarBasic* inst);
_BUR_PUBLIC void MpTieBarBasicHConfig(struct MpTieBarBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPTIEBAR_ */

