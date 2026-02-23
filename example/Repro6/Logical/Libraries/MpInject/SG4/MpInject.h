/* Automation Studio generated header file */
/* Do not edit ! */
/* MpInject 6.4.0 */

#ifndef _MPINJECT_
#define _MPINJECT_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpInject_VERSION
#define _MpInject_VERSION 6.4.0
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
typedef enum MpInjectMechanicalTypeEnum
{	mpINJECT_MECH_TYPE_HYDRAULIC = 0,
	mpINJECT_MECH_TYPE_ELECTRIC = 1
} MpInjectMechanicalTypeEnum;

typedef enum MpInjectMoveTypeEnum
{	mpINJECT_MOVE_TYPE_SETUP = 0,
	mpINJECT_MOVE_TYPE_NORMAL = 1
} MpInjectMoveTypeEnum;

typedef enum MpInjectStateEnum
{	mpINJECT_STATE_UNDEFINED = 0,
	mpINJECT_STATE_INJ_END_POSITION = 1,
	mpINJECT_STATE_INJ_STOP_POSITION = 2,
	mpINJECT_STATE_INJ_MOVEMENT = 3,
	mpINJECT_STATE_DEC_END_POSITION = 4,
	mpINJECT_STATE_DEC_STOP_POSITION = 5,
	mpINJECT_STATE_DEC_MOVEMENT = 6
} MpInjectStateEnum;

typedef enum MpInjectExecutingCmdEnum
{	mpINJECT_CMD_IDLE = 0,
	mpINJECT_CMD_INJECTION = 1,
	mpINJECT_CMD_HOLD_ON_PRESSURE = 2,
	mpINJECT_CMD_DECOMPRESSION = 3,
	mpINJECT_CMD_PLASTIFICATION = 4
} MpInjectExecutingCmdEnum;

typedef enum MpInjectSwitchoverReasonEnum
{	mpINJECT_SWITCHOVER_POSITION = 0,
	mpINJECT_SWITCHOVER_TIME = 1,
	mpINJECT_SWITCHOVER_PRESSURE = 2,
	mpINJECT_SWITCHOVER_CAVITY = 3,
	mpINJECT_SWITCHOVER_EXTERNAL = 4
} MpInjectSwitchoverReasonEnum;

typedef enum MpInjectProfileGenerationEnum
{	mpINJECT_POSITION_BASED = 0,
	mpINJECT_TIME_BASED = 1
} MpInjectProfileGenerationEnum;

typedef enum MpInjectMotionSystemTypeEnum
{	mpINJECT_MOTION_SYS_MAPP = 0
} MpInjectMotionSystemTypeEnum;

typedef enum MpInjectDigitalSourceEnum
{	mpINJECT_DIGITAL_INPUT_NOT_USED = 0,
	mpINJECT_DIGITAL_INPUT_TRIGGER_1 = 1,
	mpINJECT_DIGITAL_INPUT_TRIGGER_2 = 2
} MpInjectDigitalSourceEnum;

typedef enum MpInjectPressureSourceEnum
{	mpINJECT_ANALOG_INPUT_NOT_USED = 0,
	mpINJECT_ANALOG_INPUT_1 = 1,
	mpINJECT_ANALOG_INPUT_2 = 2,
	mpINJECT_ANALOG_INPUT_3 = 3,
	mpINJECT_ANALOG_INPUT_4 = 4
} MpInjectPressureSourceEnum;

typedef enum MpInjectSensorTypeEnum
{	mpINJECT_READ_FROM_DRIVE = 0,
	mpINJECT_READ_FROM_PV = 1,
	mpINJECT_SENSOR_NOT_USED = 2
} MpInjectSensorTypeEnum;

typedef enum MpInjectAxisHomingTypeEnum
{	mpINJECT_HOME_NOT_USED = 0,
	mpINJECT_HOME_ABS_CORRECTION = 1,
	mpINJECT_HOME_DIRECT = 2
} MpInjectAxisHomingTypeEnum;

typedef enum MpInjectValveTypeEnum
{	mpINJECT_VALVE_TYPE_DIRECT = 0,
	mpINJECT_VALVE_TYPE_SERVO = 1,
	mpINJECT_VALVE_TYPE_PROP = 2
} MpInjectValveTypeEnum;

typedef enum MpInjectControllerModeEnum
{	mpINJECT_CTRL_MODE_OPEN_LOOP = 0,
	mpINJECT_CTRL_MODE_CLOSED_LOOP = 1
} MpInjectControllerModeEnum;

typedef enum MpInjectErrorEnum
{	mpINJECT_NO_ERROR = 0,
	mpINJECT_ERR_ACTIVATION = -1064239103,
	mpINJECT_ERR_MPLINK_NULL = -1064239102,
	mpINJECT_ERR_MPLINK_INVALID = -1064239101,
	mpINJECT_ERR_MPLINK_CHANGED = -1064239100,
	mpINJECT_ERR_MPLINK_CORRUPT = -1064239099,
	mpINJECT_ERR_MPLINK_IN_USE = -1064239098,
	mpINJECT_ERR_PAR_NULL = -1064239097,
	mpINJECT_ERR_CONFIG_NULL = -1064239096,
	mpINJECT_ERR_CONFIG_NO_PV = -1064239095,
	mpINJECT_ERR_CONFIG_LOAD = -1064239094,
	mpINJECT_WRN_CONFIG_LOAD = -2137980917,
	mpINJECT_ERR_CONFIG_SAVE = -1064239092,
	mpINJECT_ERR_CONFIG_INVALID = -1064239091,
	mpINJECT_WRN_PARAMETER_LIMITED = -2137734144,
	mpINJECT_WRN_CONFIG_WAIT_IDLE = -2137734143,
	mpINJECT_WRN_PAR_WAIT_IDLE = -2137734142,
	mpINJECT_INF_WAIT_INJECT_FB = 1083491331,
	mpINJECT_WRN_MOVEMENT_ACTIVE = -2137734139,
	mpINJECT_ERR_AXIS_ERROR = -1063992314,
	mpINJECT_ERR_CONTROLLER = -1063992313,
	mpINJECT_ERR_LIBRARY_MISSING = -1063992312,
	mpINJECT_ERR_COMMAND_INVALID = -1063992311
} MpInjectErrorEnum;

typedef enum MpInjectBasicAlarmEnum
{	mpINJECT_ALM_PARAMETER_LIMITED = 0
} MpInjectBasicAlarmEnum;

typedef struct MpInjectInjectForceType
{	float Maximum;
	float SetupModeMaximum;
	float HoldMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpInjectInjectForceType;

typedef struct MpInjectVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float ReverseMovementMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpInjectVelocityType;

typedef struct MpInjectForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpInjectForceType;

typedef struct MpInjectBackPressureType
{	float Maximum;
	float Acceleration;
	float Deceleration;
} MpInjectBackPressureType;

typedef struct MpInjectAxisPrepPowerType
{	plcbit Enable;
} MpInjectAxisPrepPowerType;

typedef struct MpInjectAxisPrepHomeType
{	enum MpInjectAxisHomingTypeEnum Type;
} MpInjectAxisPrepHomeType;

typedef struct MpInjectAxisPreparationType
{	struct MpInjectAxisPrepPowerType Power;
	struct MpInjectAxisPrepHomeType Home;
} MpInjectAxisPreparationType;

typedef struct MpInjectMotionSystemType
{	enum MpInjectMotionSystemTypeEnum Type;
	plcstring AxisReference[256];
	struct MpInjectAxisPreparationType AxisPreparation;
} MpInjectMotionSystemType;

typedef struct MpInjectPressureSourceType
{	enum MpInjectPressureSourceEnum Type;
} MpInjectPressureSourceType;

typedef struct MpInjectSensorScalingType
{	signed short MinimumSignalValue;
	signed short MaximumSignalValue;
	float MinimumPressure;
	float MaximumPressure;
} MpInjectSensorScalingType;

typedef struct MpInjectPressureSensorType
{	enum MpInjectSensorTypeEnum Type;
	struct MpInjectPressureSourceType PressureSensorSource;
	plcstring CurrentPressure[256];
	struct MpInjectSensorScalingType Scaling;
} MpInjectPressureSensorType;

typedef struct MpInjectDigitalSourceType
{	enum MpInjectDigitalSourceEnum Type;
} MpInjectDigitalSourceType;

typedef struct MpInjectDigitalSensorType
{	enum MpInjectSensorTypeEnum Type;
	struct MpInjectDigitalSourceType DigitalSensorSource;
	plcstring DigitalValue[256];
} MpInjectDigitalSensorType;

typedef struct MpInjectEInputSignalsType
{	plcstring PrepareAxis[256];
	plcstring HomingPosition[256];
	struct MpInjectPressureSensorType PressureSensorSignal;
	float PressureFilterTime;
	struct MpInjectPressureSensorType CavityPressureSensorSignal;
	float CavityPressureFilterTime;
	struct MpInjectDigitalSensorType SwitchoverSensorSignal;
} MpInjectEInputSignalsType;

typedef struct MpInjectEOutputSignalsType
{	plcstring AxisReady[256];
} MpInjectEOutputSignalsType;

typedef struct MpInjectEPIDType
{	float ProportionalGain;
	float IntegralTime;
	float DerivativeTime;
	float DerivativeFilterTime;
} MpInjectEPIDType;

typedef struct MpInjectEControllerType
{	enum MpInjectControllerModeEnum Mode;
	struct MpInjectEPIDType Settings;
} MpInjectEControllerType;

typedef struct MpInjectEInjectionType
{	struct MpInjectVelocityType VelocityProfileLimits;
	struct MpInjectInjectForceType ForceProfileLimits;
	float PositionTolerance;
	float SwitchoverTime;
	float TimeTolerance;
	struct MpInjectEControllerType PressureController;
	enum MpInjectProfileGenerationEnum ProfileGeneration;
} MpInjectEInjectionType;

typedef struct MpInjectEDecompressionType
{	struct MpInjectVelocityType VelocityProfileLimits;
	struct MpInjectForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
} MpInjectEDecompressionType;

typedef struct MpInjectBasicEConfigType
{	enum MpInjectMechanicalTypeEnum MechanicalType;
	struct MpInjectMotionSystemType MotionSystem;
	struct MpInjectEInputSignalsType InputSignals;
	struct MpInjectEOutputSignalsType OutputSignals;
	float MaxPosition;
	plcbit EnableAccelerationOverride;
	struct MpInjectEInjectionType Injection;
	struct MpInjectEDecompressionType Decompression;
} MpInjectBasicEConfigType;

typedef struct MpInjectPlastAxisPrepPowerType
{	plcbit Enable;
} MpInjectPlastAxisPrepPowerType;

typedef struct MpInjectPlastAxisPrepHomeType
{	enum MpInjectAxisHomingTypeEnum Type;
} MpInjectPlastAxisPrepHomeType;

typedef struct MpInjectPlastAxisPreparationType
{	struct MpInjectPlastAxisPrepPowerType Power;
	struct MpInjectPlastAxisPrepHomeType Home;
} MpInjectPlastAxisPreparationType;

typedef struct MpInjectPlastMotionSystemType
{	enum MpInjectMotionSystemTypeEnum Type;
	plcstring AxisReference[256];
	struct MpInjectPlastAxisPreparationType AxisPreparation;
} MpInjectPlastMotionSystemType;

typedef struct MpInjectPlastEInputSignalsType
{	plcstring PrepareAxis[256];
} MpInjectPlastEInputSignalsType;

typedef struct MpInjectPlastEVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float EndDeceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpInjectPlastEVelocityType;

typedef struct MpInjectPlastEForceType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
} MpInjectPlastEForceType;

typedef struct MpInjectPlastEOutputSignalsType
{	plcstring AxisReady[256];
} MpInjectPlastEOutputSignalsType;

typedef struct MpInjectBackPressureLinType
{	float ValveSignals[50];
	float BackPressureValues[50];
	unsigned char NumberOfNodes;
} MpInjectBackPressureLinType;

typedef struct MpInjectBackPrsValveSetType
{	enum MpInjectValveTypeEnum ValveType;
	struct MpInjectBackPressureLinType ValveLinearization;
} MpInjectBackPrsValveSetType;

typedef struct MpInjectPIDType
{	float OutputLimit;
	float ProportionalGain;
	float IntegralTime;
	float DerivativeTime;
	float DerivativeFilterTime;
} MpInjectPIDType;

typedef struct MpInjectControllerType
{	enum MpInjectControllerModeEnum Mode;
	struct MpInjectPIDType Settings;
} MpInjectControllerType;

typedef struct MpInjectEPlastificationType
{	struct MpInjectPlastEVelocityType VelocityProfileLimits;
	struct MpInjectPlastEForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
	struct MpInjectBackPrsValveSetType ValveSettings;
	struct MpInjectControllerType BackPressureController;
} MpInjectEPlastificationType;

typedef struct MpInjectPlastBasicEConfigType
{	enum MpInjectMechanicalTypeEnum MechanicalType;
	struct MpInjectPlastMotionSystemType MotionSystem;
	struct MpInjectPlastEInputSignalsType InputSignals;
	struct MpInjectPlastEOutputSignalsType OutputSignals;
	float MaxPosition;
	plcbit EnableAccelerationOverride;
	enum MpInjectMechanicalTypeEnum InjectMechType;
	struct MpInjectEPlastificationType Plastification;
	struct MpInjectBackPressureType BackPressure;
} MpInjectPlastBasicEConfigType;

typedef struct MpInjectInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring CurrentPressure[256];
	plcstring CavityPressure[256];
	plcstring SwitchoverSensor[256];
	plcstring EnablePIDTracking[256];
	plcstring PIDTrackingValue[256];
} MpInjectInputSignalsType;

typedef struct MpInjectOutputSignalsType
{	plcstring SetForce[256];
	plcstring SetVelocity[256];
	plcstring InjectionValve[256];
	plcstring InjectionFastValve[256];
	plcstring DecompressionValve[256];
	plcstring ValveSignal[256];
	plcstring ServoPumpParameterSet[256];
} MpInjectOutputSignalsType;

typedef struct MpInjectValveLinearizationType
{	float ValveSignals[50];
	float CylinderVelocities[50];
	unsigned char NumberOfNodes;
} MpInjectValveLinearizationType;

typedef struct MpInjectValveSettingsType
{	enum MpInjectValveTypeEnum ValveType;
	struct MpInjectValveLinearizationType ValveLinearization;
} MpInjectValveSettingsType;

typedef struct MpInjectDelayType
{	float ValveOn;
	float Velocity;
	float Force;
	float ValveOff;
	float AfterMove;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpInjectDelayType;

typedef struct MpInjectFastValveType
{	plcbit Enable;
	float MaxVelocity;
	float MaxForce;
} MpInjectFastValveType;

typedef struct MpInjectIntegralPartLimitType
{	plcbit Enable;
	float MinIntegralOutput;
	float MaxIntegralOutput;
} MpInjectIntegralPartLimitType;

typedef struct MpInjectInjectionType
{	struct MpInjectVelocityType VelocityProfileLimits;
	struct MpInjectInjectForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpInjectValveSettingsType ValveSettings;
	struct MpInjectControllerType VelocityController;
	struct MpInjectControllerType PressureController;
	float PositionTolerance;
	float TimeTolerance;
	struct MpInjectDelayType Delay;
	struct MpInjectFastValveType FastValve;
	struct MpInjectIntegralPartLimitType HoldPrsIntegralPartLimitation;
	struct MpInjectIntegralPartLimitType InjVelIntegralPartLimitation;
	enum MpInjectProfileGenerationEnum ProfileGeneration;
} MpInjectInjectionType;

typedef struct MpInjectDecompressionType
{	struct MpInjectVelocityType VelocityProfileLimits;
	struct MpInjectForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpInjectValveSettingsType ValveSettings;
	float PositionTolerance;
	float TimeTolerance;
	struct MpInjectDelayType Delay;
} MpInjectDecompressionType;

typedef struct MpInjectBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	plcbit EnableAccelerationOverride;
	struct MpInjectInputSignalsType InputSignals;
	struct MpInjectOutputSignalsType OutputSignals;
	struct MpInjectInjectionType Injection;
	struct MpInjectDecompressionType Decompression;
	enum MpInjectMechanicalTypeEnum MechanicalType;
} MpInjectBasicHConfigType;

typedef struct MpInjectPlastificationType
{	struct MpInjectVelocityType VelocityProfileLimits;
	struct MpInjectForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpInjectBackPrsValveSetType ValveSettings;
	struct MpInjectControllerType BackPressureController;
	struct MpInjectControllerType VelocityController;
	float PositionTolerance;
	float TimeTolerance;
	unsigned short PulsesPerRevolution;
	float RotationMeasurementFilterTime;
	struct MpInjectDelayType Delay;
} MpInjectPlastificationType;

typedef struct MpInjectPlastInputSignalsType
{	plcstring RotationPulse[256];
	plcstring RotationVelocity[256];
} MpInjectPlastInputSignalsType;

typedef struct MpInjectPlastOutputSignalsType
{	plcstring SetForce[256];
	plcstring SetVelocity[256];
	plcstring PlastificationValve[256];
	plcstring ServoPumpParameterSet[256];
} MpInjectPlastOutputSignalsType;

typedef struct MpInjectPlastBasicHConfigType
{	float MaxPosition;
	plcbit EnableAccelerationOverride;
	plcbit UseExternalVelocity;
	struct MpInjectPlastInputSignalsType InputSignals;
	struct MpInjectPlastOutputSignalsType OutputSignals;
	struct MpInjectPlastificationType Plastification;
	struct MpInjectBackPressureType BackPressure;
	enum MpInjectMechanicalTypeEnum MechanicalType;
	enum MpInjectMechanicalTypeEnum InjectMechType;
} MpInjectPlastBasicHConfigType;

typedef struct MpInjectInjectionProfileType
{	float Velocity[10];
	float Force[10];
	float Position[10];
	float AccelerationOverride[10];
	float Time[10];
} MpInjectInjectionProfileType;

typedef struct MpInjectHoldPrsProfileType
{	float Velocity[10];
	float Pressure[10];
	float Time[10];
	float AccelerationOverride[10];
} MpInjectHoldPrsProfileType;

typedef struct MpInjectDecompProfileType
{	float Velocity;
	float Force;
	float Position;
	float AccelerationOverride;
} MpInjectDecompProfileType;

typedef struct MpInjectSetupModeProfileType
{	float Velocity;
	float Force;
} MpInjectSetupModeProfileType;

typedef struct MpInjectSetupModeType
{	struct MpInjectSetupModeProfileType Injection;
	struct MpInjectSetupModeProfileType Decompression;
} MpInjectSetupModeType;

typedef struct MpInjectSwitchOverType
{	plcbit EnableByPosition;
	float Position;
	plcbit EnableByPressure;
	float Pressure;
	plcbit EnableByTime;
	float Time;
	plcbit EnableByCavityPressure;
	float CavityPressure;
	float ReleasePosition;
	plcbit EnableByExternal;
} MpInjectSwitchOverType;

typedef struct MpInjectBasicParType
{	plcbit FastInjection;
	struct MpInjectInjectionProfileType InjectionProfile;
	struct MpInjectHoldPrsProfileType HoldOnPressureProfile;
	struct MpInjectDecompProfileType DecompressionBefore;
	struct MpInjectDecompProfileType DecompressionAfter;
	struct MpInjectSetupModeType SetupMode;
	struct MpInjectSwitchOverType Switchover;
} MpInjectBasicParType;

typedef struct MpInjectPlastProfileType
{	float Velocity[10];
	float Force[10];
	float Position[10];
	float BackPressure[10];
	float AccelerationOverride[10];
} MpInjectPlastProfileType;

typedef struct MpInjectPlastSetupModeType
{	float Velocity;
	float Force;
} MpInjectPlastSetupModeType;

typedef struct MpInjectPlastBasicParType
{	struct MpInjectPlastProfileType PlastificationProfile;
	struct MpInjectPlastSetupModeType SetupMode;
} MpInjectPlastBasicParType;

typedef struct MpInjectSwitchOverInfoType
{	enum MpInjectSwitchoverReasonEnum Reason;
	float Position;
	float Pressure;
	float CavityPressure;
	float Time;
} MpInjectSwitchOverInfoType;

typedef struct MpInjectPIDInfoType
{	float Out;
	float ProportionalPart;
	float IntegratorPart;
	float DerivativePart;
} MpInjectPIDInfoType;

typedef struct MpInjectStatusIDType
{	enum MpInjectErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpInjectStatusIDType;

typedef struct MpInjectDiagExtType
{	struct MpInjectStatusIDType StatusID;
	enum MpInjectExecutingCmdEnum ExecutingCommand;
} MpInjectDiagExtType;

typedef struct MpInjectBasicInfoType
{	float Velocity;
	float MinPosition;
	float MaxPosition;
	float MaxVelocity;
	float MaxPressure;
	unsigned char StepInjection;
	unsigned char StepHoldOn;
	unsigned char StepDecompression;
	struct MpInjectSwitchOverInfoType SwitchOver;
	enum MpInjectStateEnum State;
	struct MpInjectPIDInfoType PIDHoldPressure;
	struct MpInjectPIDInfoType PIDInjectVelocity;
	struct MpInjectDiagExtType Diag;
	float Position;
	float Pressure;
	plcbit InVelocityControl;
	plcbit InPressureControl;
} MpInjectBasicInfoType;

typedef struct MpInjectPlastBasicInfoType
{	float Velocity;
	float MaxVelocity;
	unsigned char StepPlastification;
	enum MpInjectStateEnum State;
	struct MpInjectDiagExtType Diag;
	float Torque;
	plcbit InTorqueLimitation;
} MpInjectPlastBasicInfoType;

typedef struct MpInjectDiagType
{	struct MpInjectStatusIDType StatusID;
} MpInjectDiagType;

typedef struct MpInjectInfoType
{	struct MpInjectDiagType Diag;
} MpInjectInfoType;

typedef struct MpInjectBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectBasicParType* Parameters;
	enum MpInjectMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Inject;
	plcbit Decompress;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpInjectBasic_typ;

typedef struct MpInjectPlastificationBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectPlastBasicParType* Parameters;
	enum MpInjectMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectPlastBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Plasticize;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpInjectPlastificationBasic_typ;

typedef struct MpInjectBasicEConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectBasicEConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectInfoType Info;
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
} MpInjectBasicEConfig_typ;

typedef struct MpInjectBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectInfoType Info;
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
} MpInjectBasicHConfig_typ;

typedef struct MpInjectPlastBasicEConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectPlastBasicEConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectInfoType Info;
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
} MpInjectPlastBasicEConfig_typ;

typedef struct MpInjectPlastBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpInjectPlastBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpInjectInfoType Info;
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
} MpInjectPlastBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpInjectBasic(struct MpInjectBasic* inst);
_BUR_PUBLIC void MpInjectPlastificationBasic(struct MpInjectPlastificationBasic* inst);
_BUR_PUBLIC void MpInjectBasicEConfig(struct MpInjectBasicEConfig* inst);
_BUR_PUBLIC void MpInjectBasicHConfig(struct MpInjectBasicHConfig* inst);
_BUR_PUBLIC void MpInjectPlastBasicEConfig(struct MpInjectPlastBasicEConfig* inst);
_BUR_PUBLIC void MpInjectPlastBasicHConfig(struct MpInjectPlastBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPINJECT_ */

