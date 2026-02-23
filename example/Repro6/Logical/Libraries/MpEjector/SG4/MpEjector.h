/* Automation Studio generated header file */
/* Do not edit ! */
/* MpEjector 6.4.0 */

#ifndef _MPEJECTOR_
#define _MPEJECTOR_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpEjector_VERSION
#define _MpEjector_VERSION 6.4.0
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
typedef enum MpEjectorMechanicalTypeEnum
{	mpEJECTOR_MECH_TYPE_HYDRAULIC = 0,
	mpEJECTOR_MECH_TYPE_ELECTRIC = 1
} MpEjectorMechanicalTypeEnum;

typedef enum MpEjectorProfileGenerationEnum
{	mpEJECTOR_POSITION_BASED = 0,
	mpEJECTOR_TIME_BASED = 1
} MpEjectorProfileGenerationEnum;

typedef enum MpEjectorMoveTypeEnum
{	mpEJECTOR_MOVE_TYPE_SETUP = 0,
	mpEJECTOR_MOVE_TYPE_NORMAL = 1,
	mpEJECTOR_MOVE_TYPE_REPETITION = 3
} MpEjectorMoveTypeEnum;

typedef enum MpEjectorStateEnum
{	mpEJECTOR_UNDEFINED = 0,
	mpEJECTOR_BACKWARD_END_POSITION = 1,
	mpEJECTOR_BACKWARD_STOP_POSITION = 2,
	mpEJECTOR_BACKWARD_MOVEMENT = 3,
	mpEJECTOR_FORWARD_END_POSITION = 4,
	mpEJECTOR_FORWARD_STOP_POSITION = 5,
	mpEJECTOR_FORWARD_MOVEMENT = 6
} MpEjectorStateEnum;

typedef enum MpEjectorMotionSystemTypeEnum
{	mpEJECTOR_MOTION_SYS_MAPP = 0
} MpEjectorMotionSystemTypeEnum;

typedef enum MpEjectorAxisHomingTypeEnum
{	mpEJECTOR_HOME_NOT_USED = 0,
	mpEJECTOR_HOME_ABS_CORRECTION = 1,
	mpEJECTOR_HOME_DIRECT = 2
} MpEjectorAxisHomingTypeEnum;

typedef enum MpEjectorValveTypeEnum
{	mpEJECTOR_VALVE_TYPE_DIRECT = 0,
	mpEJECTOR_VALVE_TYPE_SERVO = 1,
	mpEJECTOR_VALVE_TYPE_PROP = 2
} MpEjectorValveTypeEnum;

typedef enum MpEjectorErrorEnum
{	mpEJECTOR_NO_ERROR = 0,
	mpEJECTOR_ERR_ACTIVATION = -1064239103,
	mpEJECTOR_ERR_MPLINK_NULL = -1064239102,
	mpEJECTOR_ERR_MPLINK_INVALID = -1064239101,
	mpEJECTOR_ERR_MPLINK_CHANGED = -1064239100,
	mpEJECTOR_ERR_MPLINK_CORRUPT = -1064239099,
	mpEJECTOR_ERR_MPLINK_IN_USE = -1064239098,
	mpEJECTOR_ERR_PAR_NULL = -1064239097,
	mpEJECTOR_ERR_CONFIG_NULL = -1064239096,
	mpEJECTOR_ERR_CONFIG_NO_PV = -1064239095,
	mpEJECTOR_ERR_CONFIG_LOAD = -1064239094,
	mpEJECTOR_WRN_CONFIG_LOAD = -2137980917,
	mpEJECTOR_ERR_CONFIG_SAVE = -1064239092,
	mpEJECTOR_ERR_CONFIG_INVALID = -1064239091,
	mpEJECTOR_WRN_PARAMETER_LIMITED = -2137742336,
	mpEJECTOR_WRN_CONFIG_WAIT_IDLE = -2137742335,
	mpEJECTOR_WRN_PAR_WAIT_IDLE = -2137742334,
	mpEJECTOR_ERR_MOVE_NOT_ENABLED = -1064000509,
	mpEJECTOR_ERR_AXIS_ERROR = -1064000508,
	mpEJECTOR_ERR_LIBRARY_MISSING = -1064000507,
	mpEJECTOR_ERR_COMMAND_INVALID = -1064000506
} MpEjectorErrorEnum;

typedef enum MpEjectorBasicAlarmEnum
{	mpEJECTOR_ALM_PARAMETER_LIMITED = 0,
	mpEJECTOR_ALM_MOVE_NOT_ENABLED = 1
} MpEjectorBasicAlarmEnum;

typedef struct MpEjectorVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpEjectorVelocityType;

typedef struct MpEjectorAxisPrepPowerType
{	plcbit Enable;
} MpEjectorAxisPrepPowerType;

typedef struct MpEjectorAxisPrepHomeType
{	enum MpEjectorAxisHomingTypeEnum Type;
} MpEjectorAxisPrepHomeType;

typedef struct MpEjectorAxisPreparationType
{	struct MpEjectorAxisPrepPowerType Power;
	struct MpEjectorAxisPrepHomeType Home;
} MpEjectorAxisPreparationType;

typedef struct MpEjectorMotionSystemType
{	enum MpEjectorMotionSystemTypeEnum Type;
	plcstring AxisReference[256];
	struct MpEjectorAxisPreparationType AxisPreparation;
} MpEjectorMotionSystemType;

typedef struct MpEjectorEForceType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
} MpEjectorEForceType;

typedef struct MpEjectorEMoveConfigType
{	enum MpEjectorProfileGenerationEnum ProfileGeneration;
	struct MpEjectorVelocityType VelocityProfileLimits;
	struct MpEjectorEForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
} MpEjectorEMoveConfigType;

typedef struct MpEjectorEInputSignalsType
{	plcstring PrepareAxis[256];
	plcstring HomingPosition[256];
} MpEjectorEInputSignalsType;

typedef struct MpEjectorEOutputSignalsType
{	plcstring AxisReady[256];
} MpEjectorEOutputSignalsType;

typedef struct MpEjectorBasicEConfigType
{	enum MpEjectorMechanicalTypeEnum MechanicalType;
	struct MpEjectorMotionSystemType MotionSystem;
	struct MpEjectorEInputSignalsType InputSignals;
	struct MpEjectorEOutputSignalsType OutputSignals;
	float MaxPosition;
	plcbit EnableAccelerationOverride;
	plcbit EnableRepetition;
	struct MpEjectorEMoveConfigType Forward;
	struct MpEjectorEMoveConfigType Backward;
} MpEjectorBasicEConfigType;

typedef struct MpEjectorInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring ForwardEnd[256];
	plcstring ForwardSlow[256];
	plcstring BackwardEnd[256];
	plcstring BackwardSlow[256];
} MpEjectorInputSignalsType;

typedef struct MpEjectorOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring ForwardValve[256];
	plcstring BackwardValve[256];
	plcstring ValveSignal[256];
	plcstring ServoPumpParameterSet[256];
} MpEjectorOutputSignalsType;

typedef struct MpEjectorValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpEjectorValveLinearizationType;

typedef struct MpEjectorValveSettingsType
{	enum MpEjectorValveTypeEnum ValveType;
	struct MpEjectorValveLinearizationType ValveLinearization;
} MpEjectorValveSettingsType;

typedef struct MpEjectorForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpEjectorForceType;

typedef struct MpEjectorDelayType
{	float ValveOn;
	float ValveOff;
	float AfterMove;
	float Velocity;
	float Force;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpEjectorDelayType;

typedef struct MpEjectorMoveConfigType
{	enum MpEjectorProfileGenerationEnum ProfileGeneration;
	plcbit UseEndSwitch;
	plcbit UseSlowDownSwitch;
	struct MpEjectorVelocityType VelocityProfileLimits;
	struct MpEjectorForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	float PositionTolerance;
	float TimeTolerance;
	struct MpEjectorDelayType Delay;
} MpEjectorMoveConfigType;

typedef struct MpEjectorBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	plcbit EnableAccelerationOverride;
	plcbit EnableRepetition;
	struct MpEjectorInputSignalsType InputSignals;
	struct MpEjectorOutputSignalsType OutputSignals;
	struct MpEjectorValveSettingsType ValveSettings;
	struct MpEjectorMoveConfigType Forward;
	struct MpEjectorMoveConfigType Backward;
	enum MpEjectorMechanicalTypeEnum MechanicalType;
} MpEjectorBasicHConfigType;

typedef struct MpEjectorProfileType
{	float Velocity[10];
	float Force[10];
	float Position[10];
	float Time[10];
	float AccelerationOverride[10];
} MpEjectorProfileType;

typedef struct MpEjectorRepetitionMoveType
{	float Velocity;
	float Force;
	float Position;
	float Time;
} MpEjectorRepetitionMoveType;

typedef struct MpEjectorRepetitionProfileType
{	struct MpEjectorRepetitionMoveType Forward;
	struct MpEjectorRepetitionMoveType Backward;
} MpEjectorRepetitionProfileType;

typedef struct MpEjectorSetupModeProfileType
{	float Velocity;
	float Force;
} MpEjectorSetupModeProfileType;

typedef struct MpEjectorSetupModeType
{	struct MpEjectorSetupModeProfileType ForwardProfile;
	struct MpEjectorSetupModeProfileType BackwardProfile;
} MpEjectorSetupModeType;

typedef struct MpEjectorBasicParType
{	struct MpEjectorProfileType ForwardProfile;
	struct MpEjectorProfileType BackwardProfile;
	struct MpEjectorRepetitionProfileType Repetition;
	struct MpEjectorSetupModeType SetupMode;
} MpEjectorBasicParType;

typedef struct MpEjectorStatusIDType
{	enum MpEjectorErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpEjectorStatusIDType;

typedef struct MpEjectorDiagType
{	struct MpEjectorStatusIDType StatusID;
} MpEjectorDiagType;

typedef struct MpEjectorBasicInfoType
{	float Velocity;
	float MinPosition;
	float MaxPosition;
	float MaxVelocity;
	unsigned char StepForward;
	unsigned char StepBackward;
	enum MpEjectorStateEnum State;
	struct MpEjectorDiagType Diag;
	float Position;
	float Torque;
	plcbit InTorqueLimitation;
} MpEjectorBasicInfoType;

typedef struct MpEjectorInfoType
{	struct MpEjectorDiagType Diag;
} MpEjectorInfoType;

typedef struct MpEjectorBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpEjectorBasicParType* Parameters;
	enum MpEjectorMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpEjectorBasicInfoType Info;
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
} MpEjectorBasic_typ;

typedef struct MpEjectorBasicEConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpEjectorBasicEConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpEjectorInfoType Info;
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
} MpEjectorBasicEConfig_typ;

typedef struct MpEjectorBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpEjectorBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpEjectorInfoType Info;
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
} MpEjectorBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpEjectorBasic(struct MpEjectorBasic* inst);
_BUR_PUBLIC void MpEjectorBasicEConfig(struct MpEjectorBasicEConfig* inst);
_BUR_PUBLIC void MpEjectorBasicHConfig(struct MpEjectorBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPEJECTOR_ */

