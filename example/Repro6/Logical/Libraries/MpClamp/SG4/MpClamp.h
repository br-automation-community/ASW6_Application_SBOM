/* Automation Studio generated header file */
/* Do not edit ! */
/* MpClamp 6.4.0 */

#ifndef _MPCLAMP_
#define _MPCLAMP_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpClamp_VERSION
#define _MpClamp_VERSION 6.4.0
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
typedef enum MpClampLocationEnum
{	mpCLAMP_LOCATION_PISTON = 0,
	mpCLAMP_LOCATION_PLATE = 1
} MpClampLocationEnum;

typedef enum MpClampToggleTypeEnum
{	mpCLAMP_TOGGLE_TYPE_NO_TOGGLE = 0,
	mpCLAMP_5_POINT_TOGGLE = 1,
	mpCLAMP_LINEARIZATION_TABLE = 2
} MpClampToggleTypeEnum;

typedef enum MpClampMechanicalTypeEnum
{	mpCLAMP_MECH_TYPE_HYDRAULIC = 0,
	mpCLAMP_MECH_TYPE_ELECTRIC = 1
} MpClampMechanicalTypeEnum;

typedef enum MpClampMoveTypeEnum
{	mpCLAMP_MOVE_TYPE_SETUP = 0,
	mpCLAMP_MOVE_TYPE_NORMAL = 1,
	mpCLAMP_MOVE_TYPE_MOLD_HEIGHT = 2
} MpClampMoveTypeEnum;

typedef enum MpClampStateEnum
{	mpCLAMP_STATE_UNDEFINED = 0,
	mpCLAMP_STATE_CLOSE_END_POSITION = 1,
	mpCLAMP_STATE_CLOSE_STP_POSITION = 2,
	mpCLAMP_STATE_CLOSE_MOVEMENT = 3,
	mpCLAMP_STATE_OPEN_END_POSITION = 4,
	mpCLAMP_STATE_OPEN_STP_POSITION = 5,
	mpCLAMP_STATE_OPEN_MOVEMENT = 6
} MpClampStateEnum;

typedef enum MpClampConditionEnum
{	mpCLAMP_CONDITION_FORCE = 0,
	mpCLAMP_CONDITION_POSITION = 1,
	mpCLAMP_CONDITION_SWITCH = 2
} MpClampConditionEnum;

typedef enum MpClampLockConditionEnum
{	mpCLAMP_LOCKCOND_FORCE = 0,
	mpCLAMP_LOCKCOND_SWITCH = 1
} MpClampLockConditionEnum;

typedef enum MpClampMotionSystemTypeEnum
{	mpCLAMP_MOTION_SYS_MAPP = 0
} MpClampMotionSystemTypeEnum;

typedef enum MpClampAxisHomingTypeEnum
{	mpCLAMP_HOME_NOT_USED = 0,
	mpCLAMP_HOME_ABS_CORRECTION = 1,
	mpCLAMP_HOME_DIRECT = 2
} MpClampAxisHomingTypeEnum;

typedef enum MpClampValveTypeEnum
{	mpCLAMP_VALVE_TYPE_DIRECT = 0,
	mpCLAMP_VALVE_TYPE_SERVO = 1,
	mpCLAMP_VALVE_TYPE_PROP = 2
} MpClampValveTypeEnum;

typedef enum MpClampErrorEnum
{	mpCLAMP_NO_ERROR = 0,
	mpCLAMP_ERR_ACTIVATION = -1064239103,
	mpCLAMP_ERR_MPLINK_NULL = -1064239102,
	mpCLAMP_ERR_MPLINK_INVALID = -1064239101,
	mpCLAMP_ERR_MPLINK_CHANGED = -1064239100,
	mpCLAMP_ERR_MPLINK_CORRUPT = -1064239099,
	mpCLAMP_ERR_MPLINK_IN_USE = -1064239098,
	mpCLAMP_ERR_PAR_NULL = -1064239097,
	mpCLAMP_ERR_CONFIG_NULL = -1064239096,
	mpCLAMP_ERR_CONFIG_NO_PV = -1064239095,
	mpCLAMP_ERR_CONFIG_LOAD = -1064239094,
	mpCLAMP_WRN_CONFIG_LOAD = -2137980917,
	mpCLAMP_ERR_CONFIG_SAVE = -1064239092,
	mpCLAMP_ERR_CONFIG_INVALID = -1064239091,
	mpCLAMP_WRN_PARAMETER_LIMITED = -2137766912,
	mpCLAMP_ERR_PROTECT_TIMEOUT = -1064025087,
	mpCLAMP_ERR_MOLD_LOCKED = -1064025086,
	mpCLAMP_WRN_CONFIG_WAIT_IDLE = -2137766909,
	mpCLAMP_WRN_PAR_WAIT_IDLE = -2137766908,
	mpCLAMP_ERR_PRELOCK_TIMEOUT = -1064025083,
	mpCLAMP_ERR_POSTUNLOCK_TIMEOUT = -1064025082,
	mpCLAMP_ERR_AXIS_ERROR = -1064025081,
	mpCLAMP_ERR_LIBRARY_MISSING = -1064025080,
	mpCLAMP_ERR_COMMAND_INVALID = -1064025079
} MpClampErrorEnum;

typedef enum MpClampBasicAlarmEnum
{	mpCLAMP_ALM_PARAMETER_LIMITED = 0,
	mpCLAMP_ALM_PROTECT_TIMEOUT = 1,
	mpCLAMP_ALM_PRELOCK_TIMEOUT = 2,
	mpCLAMP_ALM_POSTUNLOCK_TIMEOUT = 3,
	mpCLAMP_ALM_MOLD_LOCKED_TIMEOUT = 4
} MpClampBasicAlarmEnum;

typedef struct MpClamp5PointToggleType
{	float A;
	float B;
	float H;
	float L1;
	float L;
	float D;
	float Beta;
} MpClamp5PointToggleType;

typedef struct MpClampToggleLinTableType
{	float PistonPosition[200];
	float PlatePosition[200];
	unsigned short NumberOfNodes;
} MpClampToggleLinTableType;

typedef struct MpClampToggleMechanicsType
{	enum MpClampToggleTypeEnum Type;
	struct MpClamp5PointToggleType FivePointToggle;
	struct MpClampToggleLinTableType LinearTable;
} MpClampToggleMechanicsType;

typedef struct MpClampEToggleSettingsType
{	enum MpClampLocationEnum PositionInput;
	struct MpClampToggleMechanicsType ToggleMechanics;
} MpClampEToggleSettingsType;

typedef struct MpClampToggleSettingsType
{	enum MpClampLocationEnum PositionMeasurement;
	enum MpClampLocationEnum PositionInput;
	struct MpClampToggleMechanicsType ToggleMechanics;
} MpClampToggleSettingsType;

typedef struct MpClampCloseVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float ProtectMaximum;
	float LockMaximum;
	float MoldHeightAdjust;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpClampCloseVelocityType;

typedef struct MpClampOpenVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpClampOpenVelocityType;

typedef struct MpClampAxisPrepPowerType
{	plcbit Enable;
} MpClampAxisPrepPowerType;

typedef struct MpClampAxisPrepHomeType
{	enum MpClampAxisHomingTypeEnum Type;
} MpClampAxisPrepHomeType;

typedef struct MpClampAxisPreparationType
{	struct MpClampAxisPrepPowerType Power;
	struct MpClampAxisPrepHomeType Home;
} MpClampAxisPreparationType;

typedef struct MpClampMotionSystemType
{	enum MpClampMotionSystemTypeEnum Type;
	plcstring AxisReference[256];
	struct MpClampAxisPreparationType AxisPreparation;
} MpClampMotionSystemType;

typedef struct MpClampEInputSignalsType
{	plcstring PrepareAxis[256];
	plcstring HomingPosition[256];
	plcstring CurrentForce[256];
	plcstring CurrentLockingPosition[256];
	plcstring Unlocked[256];
	plcstring Locked[256];
	plcstring PreLockEnd[256];
	plcstring PostUnlockEnd[256];
} MpClampEInputSignalsType;

typedef struct MpClampEOutputSignalsType
{	plcstring AxisReady[256];
	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring LockValve[256];
	plcstring UnLockValve[256];
	plcstring PreLockValve[256];
	plcstring PostUnLockValve[256];
	plcstring ServoPumpParameterSet[256];
} MpClampEOutputSignalsType;

typedef struct MpClampEOpenForceType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
} MpClampEOpenForceType;

typedef struct MpClampEOpenConfigType
{	struct MpClampOpenVelocityType VelocityProfileLimits;
	struct MpClampEOpenForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
} MpClampEOpenConfigType;

typedef struct MpClampECloseForceType
{	float Maximum;
	float SetupModeMaximum;
	float ProtectMaximum;
	float LockMaximum;
	float MoldHeightAdjust;
	float Acceleration;
	float Deceleration;
} MpClampECloseForceType;

typedef struct MpClampECloseConfigType
{	struct MpClampCloseVelocityType VelocityProfileLimits;
	struct MpClampECloseForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
	plcbit UseLockedSwitch;
} MpClampECloseConfigType;

typedef struct MpClampVelocityType
{	float Maximum;
	float Acceleration;
	float Deceleration;
	float JoltTime;
} MpClampVelocityType;

typedef struct MpClampForceType
{	float Maximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpClampForceType;

typedef struct MpClampDelayType
{	float ValveOn;
	float Velocity;
	float Force;
	float ValveOff;
	float AfterMove;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpClampDelayType;

typedef struct MpClampLockConfigType
{	plcbit Enable;
	struct MpClampVelocityType VelocityProfileLimits;
	struct MpClampForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampDelayType Delay;
} MpClampLockConfigType;

typedef struct MpClampUnlockConfigType
{	plcbit Enable;
	struct MpClampVelocityType VelocityProfileLimits;
	struct MpClampForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampDelayType Delay;
} MpClampUnlockConfigType;

typedef struct MpClampPostUnlockCfgType
{	plcbit Enable;
	struct MpClampVelocityType VelocityProfileLimits;
	struct MpClampForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampDelayType Delay;
} MpClampPostUnlockCfgType;

typedef struct MpClampPreLockConfigType
{	plcbit Enable;
	struct MpClampVelocityType VelocityProfileLimits;
	struct MpClampForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampDelayType Delay;
} MpClampPreLockConfigType;

typedef struct MpClampBasicEConfigType
{	enum MpClampMechanicalTypeEnum MechanicalType;
	struct MpClampMotionSystemType MotionSystem;
	struct MpClampEInputSignalsType InputSignals;
	struct MpClampEOutputSignalsType OutputSignals;
	float MaxPosition;
	plcbit EnableAccelerationOverride;
	float MoldLockedTimeout;
	plcbit ToggleClamp;
	struct MpClampToggleSettingsType ToggleSettings;
	struct MpClampEOpenConfigType Open;
	struct MpClampECloseConfigType Close;
	struct MpClampLockConfigType Lock;
	struct MpClampUnlockConfigType Unlock;
	struct MpClampPostUnlockCfgType PostUnlock;
	struct MpClampPreLockConfigType PreLock;
} MpClampBasicEConfigType;

typedef struct MpClampInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring CurrentForce[256];
	plcstring CurrentLockingPosition[256];
	plcstring Unlocked[256];
	plcstring Locked[256];
	plcstring PreLockEnd[256];
	plcstring PostUnlockEnd[256];
} MpClampInputSignalsType;

typedef struct MpClampOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring OpenValve[256];
	plcstring CloseValve[256];
	plcstring LockValve[256];
	plcstring UnLockValve[256];
	plcstring PreLockValve[256];
	plcstring PostUnLockValve[256];
	plcstring OpenFastValve[256];
	plcstring CloseFastValve[256];
	plcstring ValveSignal[256];
	plcstring OpenBackForceValve[256];
	plcstring ServoPumpParameterSet[256];
} MpClampOutputSignalsType;

typedef struct MpClampValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpClampValveLinearizationType;

typedef struct MpClampValveSettingsType
{	enum MpClampValveTypeEnum ValveType;
	struct MpClampValveLinearizationType ValveLinearization;
} MpClampValveSettingsType;

typedef struct MpClampOpenForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpClampOpenForceType;

typedef struct MpClampValveSwitchType
{	unsigned char ProfileStep;
	float DelayTime;
} MpClampValveSwitchType;

typedef struct MpClampValveType
{	plcbit Enable;
	struct MpClampValveSwitchType SwitchOn;
	struct MpClampValveSwitchType SwitchOff;
} MpClampValveType;

typedef struct MpClampOpenConfigType
{	struct MpClampOpenVelocityType VelocityProfileLimits;
	struct MpClampOpenForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampValveType FastValve;
	struct MpClampValveType BackForceValve;
	float PositionTolerance;
	float TimeTolerance;
	struct MpClampDelayType Delay;
} MpClampOpenConfigType;

typedef struct MpClampCloseForceType
{	float Maximum;
	float SetupModeMaximum;
	float ProtectMaximum;
	float LockMaximum;
	float MoldHeightAdjust;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpClampCloseForceType;

typedef struct MpClampCloseConfigType
{	struct MpClampCloseVelocityType VelocityProfileLimits;
	struct MpClampCloseForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpClampValveType FastValve;
	float PositionTolerance;
	float TimeTolerance;
	struct MpClampDelayType Delay;
	plcbit UseLockedSwitch;
} MpClampCloseConfigType;

typedef struct MpClampBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	float MoldLockedTimeout;
	plcbit EnableAccelerationOverride;
	struct MpClampInputSignalsType InputSignals;
	struct MpClampOutputSignalsType OutputSignals;
	struct MpClampValveSettingsType ValveSettings;
	plcbit ToggleClamp;
	struct MpClampToggleSettingsType ToggleSettings;
	struct MpClampOpenConfigType Open;
	struct MpClampCloseConfigType Close;
	struct MpClampLockConfigType Lock;
	struct MpClampUnlockConfigType Unlock;
	struct MpClampPostUnlockCfgType PostUnlock;
	struct MpClampPreLockConfigType PreLock;
	enum MpClampMechanicalTypeEnum MechanicalType;
} MpClampBasicHConfigType;

typedef struct MpClampMoveProfileType
{	float Velocity[10];
	float Force[10];
	float Position[10];
	float AccelerationOverride[10];
} MpClampMoveProfileType;

typedef struct MpClampProtectProfileType
{	float Timeout;
	float Velocity;
	float Force;
	float Position;
} MpClampProtectProfileType;

typedef struct MpClampPreLockProfileType
{	float Velocity;
	float Force;
	float Timeout;
	float AccelerationOverride;
} MpClampPreLockProfileType;

typedef struct MpClampUnlockProfileType
{	enum MpClampConditionEnum UnlockCondition;
	float Velocity;
	float Force;
	float ForceLimit;
	float Position;
	float AccelerationOverride;
} MpClampUnlockProfileType;

typedef struct MpClampLockProfileType
{	float Velocity;
	float Force;
	float ForceHoldOnTime;
	float ForceLimit;
	float Position;
	float AccelerationOverride;
	enum MpClampLockConditionEnum LockCondition;
} MpClampLockProfileType;

typedef struct MpClampSetupModeMoveProfileType
{	float Velocity;
	float Force;
} MpClampSetupModeMoveProfileType;

typedef struct MpClampSetupModeType
{	struct MpClampSetupModeMoveProfileType OpenProfile;
	struct MpClampSetupModeMoveProfileType CloseProfile;
} MpClampSetupModeType;

typedef struct MpClampBasicParType
{	struct MpClampMoveProfileType OpenProfile;
	struct MpClampMoveProfileType CloseProfile;
	struct MpClampProtectProfileType ProtectProfile;
	struct MpClampPreLockProfileType PostUnlockProfile;
	struct MpClampPreLockProfileType PreLockProfile;
	struct MpClampUnlockProfileType UnlockProfile;
	struct MpClampLockProfileType LockProfile;
	struct MpClampSetupModeType SetupMode;
} MpClampBasicParType;

typedef struct MpClampMeasurementType
{	float Position;
	float Velocity;
	float MinPosition;
	float MaxPosition;
	float MaxVelocity;
} MpClampMeasurementType;

typedef struct MpClampStatusIDType
{	enum MpClampErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpClampStatusIDType;

typedef struct MpClampDiagType
{	struct MpClampStatusIDType StatusID;
} MpClampDiagType;

typedef struct MpClampBasicInfoType
{	unsigned char StepOpen;
	unsigned char StepClose;
	struct MpClampMeasurementType Cylinder;
	struct MpClampMeasurementType Plate;
	enum MpClampStateEnum State;
	struct MpClampDiagType Diag;
	float Torque;
	plcbit InTorqueLimitation;
} MpClampBasicInfoType;

typedef struct MpClampInfoType
{	struct MpClampDiagType Diag;
} MpClampInfoType;

typedef struct MpClampBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpClampBasicParType* Parameters;
	enum MpClampMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpClampBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Open;
	plcbit Close;
	plcbit Unlock;
	plcbit Lock;
	plcbit PostUnlock;
	plcbit PreLock;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpClampBasic_typ;

typedef struct MpClampBasicEConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpClampBasicEConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpClampInfoType Info;
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
} MpClampBasicEConfig_typ;

typedef struct MpClampBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpClampBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpClampInfoType Info;
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
} MpClampBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpClampBasic(struct MpClampBasic* inst);
_BUR_PUBLIC void MpClampBasicEConfig(struct MpClampBasicEConfig* inst);
_BUR_PUBLIC void MpClampBasicHConfig(struct MpClampBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPCLAMP_ */

