/* Automation Studio generated header file */
/* Do not edit ! */
/* MpHydPump 6.4.0 */

#ifndef _MPHYDPUMP_
#define _MPHYDPUMP_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpHydPump_VERSION
#define _MpHydPump_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "powerlnk.h"
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "powerlnk.h"
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "powerlnk.h"
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpHydPumpPressureSourceEnum
{	mpHYDPUMP_ANALOG_INPUT_NOT_USED = 0,
	mpHYDPUMP_ANALOG_INPUT_1 = 1,
	mpHYDPUMP_ANALOG_INPUT_2 = 2,
	mpHYDPUMP_ANALOG_INPUT_3 = 3,
	mpHYDPUMP_ANALOG_INPUT_4 = 4
} MpHydPumpPressureSourceEnum;

typedef enum MpHydPumpControllerFeatureEnum
{	mpHYDPUMP_FEAT_HIGH_PERFORMANCE = 0,
	mpHYDPUMP_FEAT_AUTOTUNING = 1,
	mpHYDPUMP_FEAT_PROTECTION = 2
} MpHydPumpControllerFeatureEnum;

typedef enum MpHydPumpGroupFeatureEnum
{	mpHYDPUMP_GRP_FEAT_AUTOTUNING = 0
} MpHydPumpGroupFeatureEnum;

typedef enum MpHydPumpPressureSensorTypeEnum
{	mpHYDPUMP_READ_FROM_DRIVE = 0,
	mpHYDPUMP_READ_FROM_PV = 1,
	mpHYDPUMP_READ_FROM_PLK = 2
} MpHydPumpPressureSensorTypeEnum;

typedef enum MpHydPumpDriveLimitEnum
{	mpHYDPUMP_LIMITS_READ_FROM_DRIVE = 0,
	mpHYDPUMP_LIMITS_USER_DEFINED = 1
} MpHydPumpDriveLimitEnum;

typedef enum MpHydPumpMaxLoadEnum
{	mpHYDPUMP_CONTINUOUS_CURRENT = 0,
	mpHYDPUMP_PEAK_CURRENT = 1,
	mpHYDPUMP_POWER = 2,
	mpHYDPUMP_HEAT_SINK_TEMPERATURE = 3,
	mpHYDPUMP_MOTOR_TEMPERATURE = 4,
	mpHYDPUMP_MOTOR_MODEL_TEMP = 5,
	mpHYDPUMP_JUNCTION_TEMPERATURE = 6
} MpHydPumpMaxLoadEnum;

typedef enum MpHydPumpPumpTypeEnum
{	mpHYDPUMP_PUMP_USER_DEFINED = 0,
	mpHYDPUMP_PUMP_DORNINGER = 1
} MpHydPumpPumpTypeEnum;

typedef enum MpHydPumpDriveTypeEnum
{	mpHYDPUMP_DRIVE_TYPE_ACOPOS = 0
} MpHydPumpDriveTypeEnum;

typedef enum MpHydPumpAutotuningModeEnum
{	mpHYDPUMP_TUNE_ALL = 0,
	mpHYDPUMP_TUNE_SPEED = 1,
	mpHYDPUMP_TUNE_PRESSURE = 2,
	mpHYDPUMP_TUNE_TEST_PRESSURE = 3,
	mpHYDPUMP_FINE_TUNING_PRESSURE = 4
} MpHydPumpAutotuningModeEnum;

typedef enum MpHydPumpMotionSystemTypeEnum
{	mpHYDPUMP_MOTION_SYS_MAPP = 0,
	mpHYDPUMP_MOTION_SYS_USER = 1
} MpHydPumpMotionSystemTypeEnum;

typedef enum MpHydPumpTuningStateEnum
{	mpHYDPUMP_TUNING_IDLE = 0,
	mpHYDPUMP_TUNING_WAIT = 1,
	mpHYDPUMP_TUNING_IDENT_STEP_POS = 2,
	mpHYDPUMP_TUNING_IDENT_STEP_NEG = 3,
	mpHYDPUMP_TUNING_IDENT_OSC = 4,
	mpHYDPUMP_TUNING_DONE = 5,
	mpHYDPUMP_TUNING_TEST = 6
} MpHydPumpTuningStateEnum;

typedef enum MpHydPumpSimulationTypeEnum
{	mpHYDPUMP_SIMULATION_NOT_USED = 0,
	mpHYDPUMP_SIMULATION_PUMP_DRIVE = 1,
	mpHYDPUMP_SIMULATION_PUMP = 2
} MpHydPumpSimulationTypeEnum;

typedef enum MpHydPumpControllerTypeEnum
{	mpHYDPUMP_PRESSURE_SPEED_CONTROL = 0,
	mpHYDPUMP_SPEED_CONTROL = 1,
	mpHYDPUMP_PRESSURE_FLOW_CONTROL = 2,
	mpHYDPUMP_FLOW_CONTROL = 3
} MpHydPumpControllerTypeEnum;

typedef enum MpHydPumpUsedEnum
{	mpHYDPUMP_NOT_USED = 0,
	mpHYDPUMP_USED = 1
} MpHydPumpUsedEnum;

typedef enum MpHydPumpMinPressureCtrlTypeEnum
{	mpHYDPUMP_MIN_PRESSURE_NOT_USED = 0,
	mpHYDPUMP_MIN_PRESSURE_USED = 1
} MpHydPumpMinPressureCtrlTypeEnum;

typedef enum MpHydPumpAutotuningCtrlTypeEnum
{	mpHYDPUMP_PI_CONTROLLER = 0,
	mpHYDPUMP_PID_CONTROLLER = 1
} MpHydPumpAutotuningCtrlTypeEnum;

typedef enum MpHydPumpCompensationFilterEnum
{	mpHYDPUMP_COMP_FILTER_NOT_USED = 0,
	mpHYDPUMP_COMP_FILTER_USED = 1
} MpHydPumpCompensationFilterEnum;

typedef enum MpHydPumpDorningerPumpTypeEnum
{	mpHYDPUMP_DORNINGER_DHPH2_004 = 2004,
	mpHYDPUMP_DORNINGER_DHPH2_005 = 2005,
	mpHYDPUMP_DORNINGER_DHPH2_006 = 2006,
	mpHYDPUMP_DORNINGER_DHPH2_008 = 2008,
	mpHYDPUMP_DORNINGER_DHPH2_011 = 2011,
	mpHYDPUMP_DORNINGER_DHPH2_013 = 2013,
	mpHYDPUMP_DORNINGER_DHPH2_016 = 2016,
	mpHYDPUMP_DORNINGER_DHPH2_019 = 2019,
	mpHYDPUMP_DORNINGER_DHPH2_019_6 = 52019,
	mpHYDPUMP_DORNINGER_DHPH2_022 = 2022,
	mpHYDPUMP_DORNINGER_DHPH2_022_6 = 52022,
	mpHYDPUMP_DORNINGER_DHPH2_025 = 2025,
	mpHYDPUMP_DORNINGER_DHPH2_025_6 = 52025,
	mpHYDPUMP_DORNINGER_DHPH3_014 = 3014,
	mpHYDPUMP_DORNINGER_DHPH3_016 = 3016,
	mpHYDPUMP_DORNINGER_DHPH3_020 = 3020,
	mpHYDPUMP_DORNINGER_DHPH3_025 = 3025,
	mpHYDPUMP_DORNINGER_DHPH3_032 = 3032,
	mpHYDPUMP_DORNINGER_DHPH3_040 = 3040,
	mpHYDPUMP_DORNINGER_DHPH3_040_6 = 53040,
	mpHYDPUMP_DORNINGER_DHPH3_050 = 3050,
	mpHYDPUMP_DORNINGER_DHPH3_050_6 = 53050,
	mpHYDPUMP_DORNINGER_DHPH3_064 = 3064,
	mpHYDPUMP_DORNINGER_DHPH3_064_6 = 53064,
	mpHYDPUMP_DORNINGER_DHPH5_064 = 5064,
	mpHYDPUMP_DORNINGER_DHPH5_080 = 5080,
	mpHYDPUMP_DORNINGER_DHPH5_100 = 5100,
	mpHYDPUMP_DORNINGER_DHPH6_040 = 6040,
	mpHYDPUMP_DORNINGER_DHPH6_050 = 6050,
	mpHYDPUMP_DORNINGER_DHPH6_064 = 6064,
	mpHYDPUMP_DORNINGER_DHPH6_080 = 6080,
	mpHYDPUMP_DORNINGER_DHPH6_100 = 6100,
	mpHYDPUMP_DORNINGER_DHPH6_125 = 6125,
	mpHYDPUMP_DORNINGER_DHPH6_160 = 6160,
	mpHYDPUMP_DORNINGER_DHPH6_200 = 6200,
	mpHYDPUMP_DORNINGER_DHPH6_250 = 6250,
	mpHYDPUMP_DORNINGER_DHPC3_020 = 13020,
	mpHYDPUMP_DORNINGER_DHPC3_025 = 13025,
	mpHYDPUMP_DORNINGER_DHPC3_032 = 13032,
	mpHYDPUMP_DORNINGER_DHPC3_040 = 13040,
	mpHYDPUMP_DORNINGER_DHPC3_040_6 = 63040,
	mpHYDPUMP_DORNINGER_DHPC3_050 = 13050,
	mpHYDPUMP_DORNINGER_DHPC3_050_6 = 63050,
	mpHYDPUMP_DORNINGER_DHPC3_063_6 = 63063,
	mpHYDPUMP_DORNINGER_DHPC3_064 = 13064,
	mpHYDPUMP_DORNINGER_DHPC3_064_6 = 63064,
	mpHYDPUMP_DORNINGER_DHPC5_064 = 15064,
	mpHYDPUMP_DORNINGER_DHPC5_080 = 15080,
	mpHYDPUMP_DORNINGER_DHPC5_100 = 15100,
	mpHYDPUMP_DORNINGER_DHPC6_125 = 16125,
	mpHYDPUMP_DORNINGER_DHPC6_160 = 16160,
	mpHYDPUMP_DORNINGER_DHPC6_200 = 16200,
	mpHYDPUMP_DORNINGER_DHPC6_250 = 16250,
	mpHYDPUMP_DORNINGER_DHPS2_005 = 22005,
	mpHYDPUMP_DORNINGER_DHPS2_006 = 22006,
	mpHYDPUMP_DORNINGER_DHPS2_008 = 22008,
	mpHYDPUMP_DORNINGER_DHPS2_011 = 22011,
	mpHYDPUMP_DORNINGER_DHPS2_013 = 22013,
	mpHYDPUMP_DORNINGER_DHPS2_016 = 22016,
	mpHYDPUMP_DORNINGER_DHPS2_019 = 22019,
	mpHYDPUMP_DORNINGER_DHPS2_022 = 22022,
	mpHYDPUMP_DORNINGER_DHPS2_025 = 22025
} MpHydPumpDorningerPumpTypeEnum;

typedef enum MpHydPumpGroupControllerTypeEnum
{	mpHYDPUMP_GROUP_PRESSURE_FLOW = 0,
	mpHYDPUMP_GROUP_FLOW = 1
} MpHydPumpGroupControllerTypeEnum;

typedef enum MpHydPumpGroupValveActuationEnum
{	mpHYDPUMP_NO_COILS_ENERGIZED = 0,
	mpHYDPUMP_COIL_1_ENERGIZED = 1,
	mpHYDPUMP_COIL_2_ENERGIZED = 2,
	mpHYDPUMP_COIL_1_AND_2_ENERGIZED = 3
} MpHydPumpGroupValveActuationEnum;

typedef enum MpHydPumpErrorEnum
{	mpHYDPUMP_NO_ERROR = 0,
	mpHYDPUMP_ERR_ACTIVATION = -1064239103,
	mpHYDPUMP_ERR_MPLINK_NULL = -1064239102,
	mpHYDPUMP_ERR_MPLINK_INVALID = -1064239101,
	mpHYDPUMP_ERR_MPLINK_CHANGED = -1064239100,
	mpHYDPUMP_ERR_MPLINK_CORRUPT = -1064239099,
	mpHYDPUMP_ERR_MPLINK_IN_USE = -1064239098,
	mpHYDPUMP_ERR_PAR_NULL = -1064239097,
	mpHYDPUMP_ERR_CONFIG_NULL = -1064239096,
	mpHYDPUMP_ERR_CONFIG_NO_PV = -1064239095,
	mpHYDPUMP_ERR_CONFIG_LOAD = -1064239094,
	mpHYDPUMP_WRN_CONFIG_LOAD = -2137980917,
	mpHYDPUMP_ERR_CONFIG_SAVE = -1064239092,
	mpHYDPUMP_ERR_CONFIG_INVALID = -1064239091,
	mpHYDPUMP_ERR_CONFIG_PAR = -1064039936,
	mpHYDPUMP_ERR_PUMP_SWITCHED_OFF = -1064039935,
	mpHYDPUMP_ERR_CONTROLLER = -1064039934,
	mpHYDPUMP_ERR_CTRL_PAR_SET = -1064039933,
	mpHYDPUMP_ERR_ACOPOS_CONFIG = -1064039930,
	mpHYDPUMP_ERR_AXIS_ERROR = -1064039928,
	mpHYDPUMP_ERR_CONT_DESIGN_PAR = -1064039925,
	mpHYDPUMP_ERR_TUNING = -1064039924,
	mpHYDPUMP_ERR_LIBRARY_MISSING = -1064039923,
	mpHYDPUMP_WRN_2_SENSOR_SOURCES = -2137781746,
	mpHYDPUMP_ERR_REVERSE_TURN = -1064039921,
	mpHYDPUMP_WRN_PROTECTION = -2137781744,
	mpHYDPUMP_WRN_CONFIG_NOT_SAVED = -2137781743,
	mpHYDPUMP_ERR_PLK_CROSSLINK = -1064039918,
	mpHYDPUMP_WRN_GROUP_MODE = -2137781741,
	mpHYDPUMP_WRN_LOST_USED_PUMP = -2137781740,
	mpHYDPUMP_WRN_LOST_USED_VALVE = -2137781739,
	mpHYDPUMP_ERR_LOST_MASTER_PUMP = -1064039914,
	mpHYDPUMP_ERR_INVALID_CTRL_TYPE = -1064039913,
	mpHYDPUMP_WRN_USED_PUMP_ERROR = -2137781736,
	mpHYDPUMP_ERR_MASTER_PUMP_ERROR = -1064039911,
	mpHYDPUMP_ERR_GROUP_MODE = -1064039910,
	mpHYDPUMP_WRN_USED_VALVE_ERROR = -2137781733,
	mpHYDPUMP_ERR_SIM_MASTER_PUMP = -1064039908,
	mpHYDPUMP_WRN_SIM_USED_PUMP = -2137781731,
	mpHYDPUMP_ERR_LOST_USED_PUMP = -1064039906,
	mpHYDPUMP_ERR_LOST_USED_VALVE = -1064039905,
	mpHYDPUMP_ERR_MODE_CHANGED = -1064039904,
	mpHYDPUMP_ERR_SIM_USED_PUMP = -1064039903,
	mpHYDPUMP_ERR_USED_PUMP_ERROR = -1064039902,
	mpHYDPUMP_ERR_USED_VALVE_ERROR = -1064039901,
	mpHYDPUMP_ERR_LOW_SPEED = -1064039900,
	mpHYDPUMP_WRN_LOW_SPEED_INACTIV = -2137781723,
	mpHYDPUMP_ERR_INPUT_CFG_STRUCT = -1064039898,
	mpHYDPUMP_WRN_INPUT_CFG_STRUCT = -2137781721,
	mpHYDPUMP_ERR_COMMAND_FAILED = -1064039896,
	mpHYDPUMP_WRN_PUMP_IN_EXT_USE = -2137781719,
	mpHYDPUMP_WRN_VALVE_IN_EXT_USE = -2137781718,
	mpHYDPUMP_WRN_PUMP_INACTIVE = -2137781717,
	mpHYDPUMP_WRN_VALVE_INACTIVE = -2137781716,
	mpHYDPUMP_WRN_MODE_CHANGED = -2137781715,
	mpHYDPUMP_WRN_COMMAND_FAILED = -2137781714
} MpHydPumpErrorEnum;

typedef enum MpHydPumpAlarmEnum
{	mpHYDPUMP_ALM_PAR_INVALID = 0,
	mpHYDPUMP_ALM_TUNING_FAILED = 1,
	mpHYDPUMP_ALM_TUNING_DONE = 2,
	mpHYDPUMP_ALM_PUMP_SWITCHED_OFF = 3,
	mpHYDPUMP_ALM_REVERSE_TURN = 4,
	mpHYDPUMP_ALM_DRIVE_PROT = 5,
	mpHYDPUMP_ALM_PUMP_PROT = 6,
	mpHYDPUMP_ALM_CONFIG_NOT_SAVED = 7,
	mpHYDPUMP_ALM_USED_PUMP = 8,
	mpHYDPUMP_ALM_USED_VALVE = 9,
	mpHYDPUMP_ALM_LOW_SPEED = 10,
	mpHYDPUMP_ALM_PUMP_IN_EXT_USE = 11,
	mpHYDPUMP_ALM_VALVE_IN_EXT_USE = 12
} MpHydPumpAlarmEnum;

typedef struct MpHydPumpPressureSourceType
{	enum MpHydPumpPressureSourceEnum Type;
} MpHydPumpPressureSourceType;

typedef struct MpHydPumpHighPerfDriveTypeType
{	enum MpHydPumpDriveTypeEnum Type;
	struct MpHydPumpPressureSourceType PressureSensorSource;
} MpHydPumpHighPerfDriveTypeType;

typedef struct MpHydPumpHighPerfFeatureType
{	struct MpHydPumpHighPerfDriveTypeType DriveType;
} MpHydPumpHighPerfFeatureType;

typedef struct MpHydPumpExcitationSignalType
{	float StepHeight;
	float StepDuration;
	float WaitingTime;
	float OscillationAmplitude;
	float OscillationDuration;
} MpHydPumpExcitationSignalType;

typedef struct MpHydPumpTestSignalType
{	float SetSpeed;
	float SetPressure;
	float Duration;
} MpHydPumpTestSignalType;

typedef struct MpHydPumpPressureTuneFeatureType
{	float OperationPointSpeed;
	struct MpHydPumpExcitationSignalType ExcitationSpeedSignal;
	struct MpHydPumpTestSignalType TestSignal[5];
} MpHydPumpPressureTuneFeatureType;

typedef struct MpHydPumpAutotuningFeatureType
{	struct MpHydPumpPressureTuneFeatureType PressureTuning;
} MpHydPumpAutotuningFeatureType;

typedef struct MpHydPumpProtectionDriveTypeType
{	enum MpHydPumpDriveTypeEnum Type;
} MpHydPumpProtectionDriveTypeType;

typedef struct MpHydPumpDriveStartingPointsType
{	float LoadTorqueLimitation;
	float LoadSpeedLimitation;
} MpHydPumpDriveStartingPointsType;

typedef struct MpHydPumpDriveLimitSettingsType
{	enum MpHydPumpDriveLimitEnum Type;
	float NominalTorque;
	float MaximumTorque;
	float NominalSpeed;
	float MaximumSpeed;
	float AmbientTemperature;
} MpHydPumpDriveLimitSettingsType;

typedef struct MpHydPumpJunctionLimitType
{	float LoadTorqueLimitation;
	float NominalTorque;
} MpHydPumpJunctionLimitType;

typedef struct MpHydPumpLimitationCurveType
{	struct MpHydPumpDriveStartingPointsType StartingPoints;
	struct MpHydPumpDriveLimitSettingsType DriveLimitationSettings;
	struct MpHydPumpJunctionLimitType JunctionLimitationSettings;
} MpHydPumpLimitationCurveType;

typedef struct MpHydPumpDriveShutdownProtType
{	enum MpHydPumpUsedEnum Type;
	struct MpHydPumpLimitationCurveType LimitationCurve;
} MpHydPumpDriveShutdownProtType;

typedef struct MpHydPumpPumpStartingPointsType
{	float PumpLoadTorqueLimitation;
} MpHydPumpPumpStartingPointsType;

typedef struct MpHydPumpThermalPumpProtType
{	enum MpHydPumpUsedEnum Type;
	struct MpHydPumpPumpStartingPointsType StartingPoints;
} MpHydPumpThermalPumpProtType;

typedef struct MpHydPumpProtectionFeatureType
{	struct MpHydPumpProtectionDriveTypeType DriveType;
	struct MpHydPumpDriveShutdownProtType DriveShutdownProtection;
	struct MpHydPumpThermalPumpProtType ThermalPumpProtection;
} MpHydPumpProtectionFeatureType;

typedef struct MpHydPumpCtrlFeatureConfigType
{	enum MpHydPumpControllerFeatureEnum Type;
	struct MpHydPumpHighPerfFeatureType HighPerformance;
	struct MpHydPumpAutotuningFeatureType Autotuning;
	struct MpHydPumpProtectionFeatureType Protection;
} MpHydPumpCtrlFeatureConfigType;

typedef struct MpHydPumpGrpExcitationSignalType
{	float StepHeight;
	float StepDuration;
	float WaitingTime;
	float OscillationAmplitude;
	float OscillationDuration;
} MpHydPumpGrpExcitationSignalType;

typedef struct MpHydPumpGrpTestSignalType
{	float SetFlow;
	float SetPressure;
	float Duration;
} MpHydPumpGrpTestSignalType;

typedef struct MpHydPumpGrpPressureTuneFeatType
{	float OperationPointFlow;
	struct MpHydPumpGrpExcitationSignalType ExcitationFlowSignal;
	struct MpHydPumpGrpTestSignalType TestSignal[5];
} MpHydPumpGrpPressureTuneFeatType;

typedef struct MpHydPumpGrpAutotuningFeatType
{	struct MpHydPumpGrpPressureTuneFeatType PressureTuning;
} MpHydPumpGrpAutotuningFeatType;

typedef struct MpHydPumpGrpFeatureConfigType
{	enum MpHydPumpGroupFeatureEnum Type;
	struct MpHydPumpGrpAutotuningFeatType Autotuning;
} MpHydPumpGrpFeatureConfigType;

typedef struct MpHydPumpStatusIDType
{	enum MpHydPumpErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpHydPumpStatusIDType;

typedef struct MpHydPumpSimulationType
{	enum MpHydPumpSimulationTypeEnum Type;
	float MaximumSimulationPressure;
	float DeadVolume;
	float PumpLeakage;
} MpHydPumpSimulationType;

typedef struct MpHydPumpReverseTurnProtectType
{	enum MpHydPumpUsedEnum Type;
	float MaxReverseTurnTime;
} MpHydPumpReverseTurnProtectType;

typedef struct MpHydPumpLowSpeedProtectType
{	enum MpHydPumpUsedEnum Type;
	float LowSpeedLimit;
	float PressureLimit;
	float MaximumLowSpeedTime;
} MpHydPumpLowSpeedProtectType;

typedef struct MpHydPumpPumpType
{	enum MpHydPumpPumpTypeEnum Type;
	float DisplacementVolume;
	float VolumetricEfficiency;
	plcbit InvertDirectionOfRotation;
	struct MpHydPumpReverseTurnProtectType ReverseTurnProtection;
	enum MpHydPumpDorningerPumpTypeEnum PumpModelDorninger;
	struct MpHydPumpLowSpeedProtectType LowSpeedProtection;
} MpHydPumpPumpType;

typedef struct MpHydPumpMoveLimitsConfigType
{	float Speed;
	float Acceleration;
	float Deceleration;
	float ReversePumpSpeed;
} MpHydPumpMoveLimitsConfigType;

typedef struct MpHydPumpMotionSystemInputType
{	plcstring PowerOn[256];
	plcstring ActualAxisSpeed[256];
} MpHydPumpMotionSystemInputType;

typedef struct MpHydPumpMotionSystemOutputType
{	plcstring Power[256];
	plcstring SetAxisSpeed[256];
} MpHydPumpMotionSystemOutputType;

typedef struct MpHydPumpMotionSystemType
{	enum MpHydPumpMotionSystemTypeEnum Type;
	plcstring AxisReference[256];
	struct MpHydPumpMotionSystemInputType InputSignals;
	struct MpHydPumpMotionSystemOutputType OutputSignals;
} MpHydPumpMotionSystemType;

typedef struct MpHydPumpContInputSignalsType
{	plcstring SetSpeed[256];
	plcstring SetPressure[256];
	plcstring PressureControllerParameterSet[256];
	plcstring OnlySpeedControl[256];
	plcstring SetFlow[256];
	plcstring OnlyFlowControl[256];
	plcstring ActivateAccelerationMode[256];
} MpHydPumpContInputSignalsType;

typedef struct MpHydPumpSensorScalingType
{	signed short MinimumSignalValue;
	signed short MaximumSignalValue;
	float MinimumPressure;
	float MaximumPressure;
} MpHydPumpSensorScalingType;

typedef struct MpHydPumpPressureSensorType
{	enum MpHydPumpPressureSensorTypeEnum Type;
	plcstring ActualPressure[256];
	struct MpHydPumpSensorScalingType Scaling;
	plcstring DeviceName[33];
	plcstring ChannelName[33];
} MpHydPumpPressureSensorType;

typedef struct MpHydPumpSetValueLimitsType
{	float MaximumSetPressure;
	plcbit NegativeSetSpeedAllowed;
	plcbit NegativeSetFlowAllowed;
	float SetPressurePrefilterTimeUp;
	float SetPressurePrefilterTimeDown;
} MpHydPumpSetValueLimitsType;

typedef struct MpHydPumpCompensationFilterType
{	enum MpHydPumpCompensationFilterEnum Type;
	float CenterFrequencyNumerator;
	float DampingRatioNumerator;
	float CenterFrequencyDenominator;
	float DampingRatioDenominator;
} MpHydPumpCompensationFilterType;

typedef struct MpHydPumpAccelerationModeType
{	enum MpHydPumpUsedEnum Type;
	float DeactivationWindow;
} MpHydPumpAccelerationModeType;

typedef struct MpHydPumpParameterSetType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
	struct MpHydPumpCompensationFilterType CompensationFilter;
	float NegativeIntegratorLimit;
	struct MpHydPumpAccelerationModeType AccelerationMode;
} MpHydPumpParameterSetType;

typedef struct MpHydPumpMinPressureCtrlType
{	enum MpHydPumpMinPressureCtrlTypeEnum Type;
	float SetMinimumPressure;
	float ProportionalGain;
	float IntegrationTime;
} MpHydPumpMinPressureCtrlType;

typedef struct MpHydPumpControllerType
{	enum MpHydPumpControllerTypeEnum Type;
	struct MpHydPumpContInputSignalsType InputSignals;
	struct MpHydPumpPressureSensorType PressureSensorSignal;
	float PressureFilterTime;
	struct MpHydPumpSetValueLimitsType SetValueLimits;
	struct MpHydPumpParameterSetType ControllerParameterSets[10];
	struct MpHydPumpMinPressureCtrlType MinimumPressureController;
} MpHydPumpControllerType;

typedef struct MpHydPumpControllerFeatureType
{	plcstring FeatureReference1[33];
	plcstring FeatureReference2[33];
	plcstring FeatureReference3[33];
} MpHydPumpControllerFeatureType;

typedef struct MpHydPumpControllerConfigType
{	struct MpHydPumpSimulationType Simulation;
	struct MpHydPumpPumpType Pump;
	struct MpHydPumpMoveLimitsConfigType MovementLimits;
	struct MpHydPumpMotionSystemType MotionSystem;
	struct MpHydPumpControllerType Controller;
	struct MpHydPumpControllerFeatureType Features;
} MpHydPumpControllerConfigType;

typedef struct MpHydPumpGroupSimulationType
{	enum MpHydPumpSimulationTypeEnum Type;
	float MaximumSimulationPressure;
} MpHydPumpGroupSimulationType;

typedef struct MpHydPumpGroupInputSignalsType
{	plcstring SetFlow[256];
	plcstring SetPressure[256];
	plcstring Mode[256];
	plcstring ActivateAccelerationMode[256];
} MpHydPumpGroupInputSignalsType;

typedef struct MpHydPumpGroupFeatureType
{	plcstring FeatureReference1[33];
} MpHydPumpGroupFeatureType;

typedef struct MpHydPumpGroupConfigType
{	struct MpHydPumpGroupSimulationType Simulation;
	plcstring MasterPump[33];
	unsigned short NumberOfModes;
	unsigned long Modes;
	struct MpHydPumpGroupInputSignalsType InputSignals;
	struct MpHydPumpGroupFeatureType Features;
} MpHydPumpGroupConfigType;

typedef struct MpHydPumpGroupModeControllerType
{	enum MpHydPumpGroupControllerTypeEnum Type;
	unsigned char ControllerParameterSet;
} MpHydPumpGroupModeControllerType;

typedef struct MpHydPumpGroupModeSimParType
{	float OilVolume;
	float Leakage;
} MpHydPumpGroupModeSimParType;

typedef struct MpHydPumpGroupModeType
{	plcstring Name[33];
	float DelayTime;
	struct MpHydPumpGroupModeControllerType Controller;
	unsigned short NumberOfUsedPumps;
	unsigned long UsedPumps;
	unsigned short NumberOfUsedValves;
	unsigned long UsedValves;
	struct MpHydPumpGroupModeSimParType SimulationParameters;
} MpHydPumpGroupModeType;

typedef struct MpHydPumpGroupUsedPumpType
{	plcstring PumpReference[33];
	float Usage;
} MpHydPumpGroupUsedPumpType;

typedef struct MpHydPumpGroupUsedValveType
{	plcstring ValveReference[33];
	enum MpHydPumpGroupValveActuationEnum Actuation;
	float DelayTime;
} MpHydPumpGroupUsedValveType;

typedef struct MpHydPumpControllerDesignType
{	enum MpHydPumpAutotuningCtrlTypeEnum ControllerType;
	float RiseTime;
	float OvershootReduction;
	float OscillationReduction;
	plcbit UseCompensationFilter;
} MpHydPumpControllerDesignType;

typedef struct MpHydPumpPressureTuningType
{	struct MpHydPumpControllerDesignType ControllerDesign;
} MpHydPumpPressureTuningType;

typedef struct MpHydPumpAutotuningParType
{	struct MpHydPumpPressureTuningType PressureController;
} MpHydPumpAutotuningParType;

typedef struct MpHydPumpSpeedControllerInfoType
{	float ProportionalGain;
	float IntegrationTime;
	float FilterTime;
} MpHydPumpSpeedControllerInfoType;

typedef struct MpHydPumpAccModeInfoType
{	plcbit Active;
	plcbit Done;
} MpHydPumpAccModeInfoType;

typedef struct MpHydPumpSetValuesInfoType
{	float Speed;
	float Pressure;
	float VolumeFlow;
	float DriveSpeed;
	float AdditiveActuationValue;
} MpHydPumpSetValuesInfoType;

typedef struct MpHydPumpControlInfoType
{	plcbit InPressureControl;
	plcbit InMinimumPressureControl;
	plcbit InSpeedControl;
	plcbit CompensationFilterActive;
	struct MpHydPumpSpeedControllerInfoType SpeedController;
	plcbit ReverseTurnProtectionActive;
	plcbit InExternalControl;
	struct MpHydPumpAccModeInfoType AccelerationMode;
	plcbit LowSpeedProtectionActive;
	struct MpHydPumpSetValuesInfoType SetValues;
	plcstring ExternalSource[33];
} MpHydPumpControlInfoType;

typedef struct MpHydPumpSystemInfoType
{	float Speed;
	float Pressure;
	float VolumeFlow;
	float ElectricPower;
	float MechanicPower;
	float HydraulicPower;
} MpHydPumpSystemInfoType;

typedef struct MpHydPumpDiagType
{	struct MpHydPumpStatusIDType StatusID;
} MpHydPumpDiagType;

typedef struct MpHydPumpProtectionDriveInfoType
{	plcbit Active;
	plcbit InProtection;
	float Load;
	enum MpHydPumpMaxLoadEnum Cause;
} MpHydPumpProtectionDriveInfoType;

typedef struct MpHydPumpProtectionPumpInfoType
{	plcbit Active;
	plcbit InProtection;
	float Load;
	plcbit FlushingRequired;
	float FlushingSpeed;
} MpHydPumpProtectionPumpInfoType;

typedef struct MpHydPumpProtectionInfoType
{	float TorqueLimit;
	float SpeedLimit;
	struct MpHydPumpProtectionDriveInfoType Drive;
	struct MpHydPumpProtectionPumpInfoType Pump;
} MpHydPumpProtectionInfoType;

typedef struct MpHydPumpControllerInfoType
{	struct MpHydPumpControlInfoType Control;
	struct MpHydPumpSystemInfoType System;
	plcbit Simulation;
	struct MpHydPumpDiagType Diag;
	struct MpHydPumpProtectionInfoType Protection;
} MpHydPumpControllerInfoType;

typedef struct MpHydPumpPIDParametersType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
} MpHydPumpPIDParametersType;

typedef struct MpHydPumpTuningControlInfoType
{	struct MpHydPumpPIDParametersType PIDParameters;
	struct MpHydPumpCompensationFilterType CompensationFilter;
	plcbit FilterRecommended;
} MpHydPumpTuningControlInfoType;

typedef struct MpHydPumpPressureTuningInfoType
{	struct MpHydPumpTuningControlInfoType Parameters;
	unsigned char ParameterSet;
	enum MpHydPumpTuningStateEnum TuningState;
} MpHydPumpPressureTuningInfoType;

typedef struct MpHydPumpTuningSystemInfoType
{	float DeadVolume;
	float PumpLeakage;
} MpHydPumpTuningSystemInfoType;

typedef struct MpHydPumpAutotuningInfoType
{	struct MpHydPumpPressureTuningInfoType PressureController;
	struct MpHydPumpTuningSystemInfoType System;
	struct MpHydPumpDiagType Diag;
} MpHydPumpAutotuningInfoType;

typedef struct MpHydPumpInfoType
{	struct MpHydPumpDiagType Diag;
} MpHydPumpInfoType;

typedef struct MpHydPumpGroupControlInfoType
{	plcbit InPressureControl;
	plcbit InFlowControl;
	plcbit CompensationFilterActive;
	struct MpHydPumpAccModeInfoType AccelerationMode;
} MpHydPumpGroupControlInfoType;

typedef struct MpHydPumpGroupSystemInfoType
{	float Pressure;
	float VolumeFlow;
	float ElectricPower;
	float MechanicPower;
	float HydraulicPower;
	unsigned short NumberOfUsedPumps;
	float MaximumVolumeFlow;
	plcstring GroupMode[33];
	unsigned short GroupModeIndex;
} MpHydPumpGroupSystemInfoType;

typedef struct MpHydPumpGroupInfoType
{	struct MpHydPumpGroupControlInfoType Control;
	struct MpHydPumpGroupSystemInfoType System;
	plcbit Simulation;
	struct MpHydPumpDiagType Diag;
} MpHydPumpGroupInfoType;

typedef struct MpHydPumpController
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpControllerInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Power;
	plcbit Control;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit PowerOn;
	plcbit ControlActive;
} MpHydPumpController_typ;

typedef struct MpHydPumpControllerConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydPumpControllerConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpInfoType Info;
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
} MpHydPumpControllerConfig_typ;

typedef struct MpHydPumpAutotuning
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydPumpAutotuningParType* Parameters;
	enum MpHydPumpAutotuningModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpAutotuningInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit StartTuning;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit TuningActive;
	plcbit TuningDone;
} MpHydPumpAutotuning_typ;

typedef struct MpHydPumpControllerFeatureConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydPumpCtrlFeatureConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpInfoType Info;
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
} MpHydPumpControllerFeatureConfig_typ;

typedef struct MpHydPumpGroup
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpGroupInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Power;
	plcbit Control;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit PowerOn;
	plcbit ControlActive;
} MpHydPumpGroup_typ;

typedef struct MpHydPumpGroupConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydPumpGroupConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpInfoType Info;
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
} MpHydPumpGroupConfig_typ;

typedef struct MpHydPumpGroupFeatureConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydPumpGrpFeatureConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydPumpInfoType Info;
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
} MpHydPumpGroupFeatureConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpHydPumpController(struct MpHydPumpController* inst);
_BUR_PUBLIC void MpHydPumpControllerConfig(struct MpHydPumpControllerConfig* inst);
_BUR_PUBLIC void MpHydPumpAutotuning(struct MpHydPumpAutotuning* inst);
_BUR_PUBLIC void MpHydPumpControllerFeatureConfig(struct MpHydPumpControllerFeatureConfig* inst);
_BUR_PUBLIC void MpHydPumpGroup(struct MpHydPumpGroup* inst);
_BUR_PUBLIC void MpHydPumpGroupConfig(struct MpHydPumpGroupConfig* inst);
_BUR_PUBLIC void MpHydPumpGroupFeatureConfig(struct MpHydPumpGroupFeatureConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPHYDPUMP_ */

