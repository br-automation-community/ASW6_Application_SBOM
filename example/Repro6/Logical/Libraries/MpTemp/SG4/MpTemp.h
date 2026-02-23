/* Automation Studio generated header file */
/* Do not edit ! */
/* MpTemp 6.4.0 */

#ifndef _MPTEMP_
#define _MPTEMP_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpTemp_VERSION
#define _MpTemp_VERSION 6.4.0
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
typedef enum MpTempControllerSignalCoolEnum
{	mpTEMP_SIGNAL_MOD_COOL_PWM = 0,
	mpTEMP_SIGNAL_MOD_COOL_PFM = 1,
	mpTEMP_SIGNAL_MOD_COOL_NOT_USED = 2
} MpTempControllerSignalCoolEnum;

typedef enum MpTempControllerSignalHeatEnum
{	mpTEMP_SIGNAL_MOD_HEAT_PWM = 0,
	mpTEMP_SIGNAL_MOD_HEAT_NOT_USED = 1
} MpTempControllerSignalHeatEnum;

typedef enum MpTempHCMConceptEnum
{	mpTEMP_HCM_CONCEPT_CCS = 0
} MpTempHCMConceptEnum;

typedef enum MpTempHCMOperationEnum
{	mpTEMP_OPERATION_DISCONTINUOUS = 0,
	mpTEMP_OPERATION_CONTINUOUS = 1
} MpTempHCMOperationEnum;

typedef enum MpTempSystemTypeEnum
{	mpTEMP_SYSTEM_TYPE_PT2 = 0,
	mpTEMP_SYSTEM_TYPE_IT1 = 1,
	mpTEMP_SYSTEM_TYPE_NONE = 3
} MpTempSystemTypeEnum;

typedef enum MpTempHCMStateEnum
{	mpTEMP_HCM_WAIT = 0,
	mpTEMP_HCM_MEASUREMENT = 1,
	mpTEMP_HCM_INTERVAL = 2,
	mpTEMP_HCM_IDLE = 3
} MpTempHCMStateEnum;

typedef enum MpTempHysteresisModeEnum
{	mpTEMP_HYSTERESIS_ON = 0,
	mpTEMP_HYSTERESIS_OFF_HEAT_ONLY = 1,
	mpTEMP_HYSTERESIS_OFF_COOL_ONLY = 2
} MpTempHysteresisModeEnum;

typedef enum MpTempProfileModeEnum
{	mpTEMP_PROFILE_MODE_OFF = 0,
	mpTEMP_PROFILE_MODE_TIME_OPT = 1,
	mpTEMP_PROFILE_MODE_RATE_LIMITED = 2
} MpTempProfileModeEnum;

typedef enum MpTempProfileStateEnum
{	mpTEMP_PROFILE_STATE_DISABLED = 0,
	mpTEMP_PROFILE_STATE_READY = 1,
	mpTEMP_PROFILE_STATE_ACTIVE = 2
} MpTempProfileStateEnum;

typedef enum MpTempProfileSyncModeEnum
{	mpTEMP_PROFILE_SYNC_OFF = 0,
	mpTEMP_PROFILE_SYNC_AUTO = 1,
	mpTEMP_PROFILE_SYNC_USER = 2
} MpTempProfileSyncModeEnum;

typedef enum MpTempPWMScheduleModeEnum
{	mpTEMP_PWM_MODE_SHIFT = 0,
	mpTEMP_PWM_MODE_SPLIT = 1
} MpTempPWMScheduleModeEnum;

typedef enum MpTempTuningModeEnum
{	mpTEMP_TUNING_MODE_OFF = 0,
	mpTEMP_TUNING_MODE_HEAT = 1,
	mpTEMP_TUNING_MODE_HEAT_COOL = 2,
	mpTEMP_TUNING_MODE_OSC_HEAT = 3,
	mpTEMP_TUNING_MODE_OSC_HEAT_COOL = 4,
	mpTEMP_TUNING_MODE_OSC_COOL = 5
} MpTempTuningModeEnum;

typedef enum MpTempTuningStateEnum
{	mpTEMP_TUNING_STATE_IDLE = 0,
	mpTEMP_TUNING_STATE_INIT = 1,
	mpTEMP_TUNING_STATE_SYSTEM_CHECK = 2,
	mpTEMP_TUNING_STATE_DELAY_TIME = 3,
	mpTEMP_TUNING_STATE_IDENT = 4,
	mpTEMP_TUNING_STATE_PREDICTION = 5,
	mpTEMP_TUNING_STATE_IN_SETPOINT = 6,
	mpTEMP_TUNING_STATE_ERROR = 99,
	mpTEMP_TUNING_STATE_ABORTED = 100
} MpTempTuningStateEnum;

typedef enum MpTempTuningSystemCheckEnum
{	mpTEMP_TUNING_SYS_CHECK_SHORT = 0,
	mpTEMP_TUNING_SYS_CHECK_MEDIUM = 1,
	mpTEMP_TUNING_SYS_CHECK_LONG = 2
} MpTempTuningSystemCheckEnum;

typedef enum MpTempZoneTypeEnum
{	mpTEMP_ZONE_TYPE_HEAT = 0,
	mpTEMP_ZONE_TYPE_COOL = 1,
	mpTEMP_ZONE_TYPE_HEAT_COOL = 2
} MpTempZoneTypeEnum;

typedef enum MpTempSoftStartModeEnum
{	mpTEMP_SOFTSTART_MOD_POWER_LIM = 0,
	mpTEMP_SOFTSTART_MOD_SLEW_RATE = 1
} MpTempSoftStartModeEnum;

typedef enum MpTempSoftStartEnableEnum
{	mpTEMP_SOFTSTART_USE_GROUP = 0,
	mpTEMP_SOFTSTART_USE_ZONE = 1,
	mpTEMP_SOFTSTART_NOT_USED = 2
} MpTempSoftStartEnableEnum;

typedef enum MpTempSoftStartStateEnum
{	mpTEMP_SOFTSTART_HEATING = 0,
	mpTEMP_SOFTSTART_HOLD_TEMP = 1,
	mpTEMP_SOFTSTART_REACHED_TEMP = 2,
	mpTEMP_SOFTSTART_FINISHED = 3,
	mpTEMP_SOFTSTART_EXCLUDED = 4,
	mpTEMP_SOFTSTART_SKIPPED = 5,
	mpTEMP_SOFTSTART_OFF = 6
} MpTempSoftStartStateEnum;

typedef enum MpTempErrorEnum
{	mpTEMP_NO_ERROR = 0,
	mpTEMP_ERR_ACTIVATION = -1064239103,
	mpTEMP_ERR_MPLINK_NULL = -1064239102,
	mpTEMP_ERR_MPLINK_INVALID = -1064239101,
	mpTEMP_ERR_MPLINK_CHANGED = -1064239100,
	mpTEMP_ERR_MPLINK_CORRUPT = -1064239099,
	mpTEMP_ERR_MPLINK_IN_USE = -1064239098,
	mpTEMP_ERR_PAR_NULL = -1064239097,
	mpTEMP_ERR_CONFIG_NULL = -1064239096,
	mpTEMP_ERR_CONFIG_NO_PV = -1064239095,
	mpTEMP_ERR_CONFIG_LOAD = -1064239094,
	mpTEMP_WRN_CONFIG_LOAD = -2137980917,
	mpTEMP_ERR_CONFIG_SAVE = -1064239092,
	mpTEMP_ERR_CONFIG_INVALID = -1064239091,
	mpTEMP_ERR_PID_PAR_INVALID = -1063980032,
	mpTEMP_ERR_TUNING_PAR_INVALID = -1063980031,
	mpTEMP_ERR_PROFILE_PAR_INVALID = -1063980030,
	mpTEMP_ERR_TOLERANCE_BAND = -1063980029,
	mpTEMP_ERR_TUNING = -1063980028,
	mpTEMP_ERR_PROFILE = -1063980027,
	mpTEMP_WRN_TUNING = -2137721850,
	mpTEMP_WRN_PROFILE = -2137721849,
	mpTEMP_ERR_COMMAND_INVALID = -1063980024,
	mpTEMP_ERR_CONTROLLER = -1063980023,
	mpTEMP_ERR_CONFIG_PAR_INVALID = -1063980022,
	mpTEMP_ERR_NO_LINKED_COMPONENTS = -1063980021,
	mpTEMP_INF_PROFILE_NOT_SUITABLE = 1083503628,
	mpTEMP_ERR_TUNING_ABORTED = -1063980019,
	mpTEMP_INF_COMPONENT_DISABLED = 1083503630,
	mpTEMP_ERR_PWM = -1063980017,
	mpTEMP_ERR_SIMULATION = -1063980016,
	mpTEMP_ERR_AVG_CURRENT_OUTSIDE = -1063980015,
	mpTEMP_ERR_MAX_CURRENT_EXCEEDED = -1063980014,
	mpTEMP_WRN_LINKED_CTRL_WARNING = -2137721837,
	mpTEMP_ERR_LINKED_CTRL_ERROR = -1063980012,
	mpTEMP_WRN_ACT_CURRENT_OUTSIDE = -2137721835,
	mpTEMP_ERR_HYSTERESIS_INVALID = -1063980010,
	mpTEMP_WRN_CONFIG_PAR_INVALID = -2137721833,
	mpTEMP_ERR_HCM_NOT_USED = -1063980008
} MpTempErrorEnum;

typedef enum MpTempAlarmEnum
{	mpTEMP_ALM_PAR_INVALID = 0,
	mpTEMP_ALM_COMMAND_INVALID = 1,
	mpTEMP_ALM_TUNING_FAILED = 2,
	mpTEMP_ALM_TUNING_DONE = 3,
	mpTEMP_ALM_OUTSIDE_TOLERANCE = 4,
	mpTEMP_ALM_AVG_CURRENT_OUTSIDE = 5,
	mpTEMP_ALM_MAX_CURRENT_EXCEEDED = 6
} MpTempAlarmEnum;

typedef struct MpTempSystemParType
{	float Gain;
	float TimeConstant1;
	float TimeConstant2;
	float DelayTime;
} MpTempSystemParType;

typedef struct MpTempSystemType
{	struct MpTempSystemParType Heat;
	struct MpTempSystemParType Cool;
} MpTempSystemType;

typedef struct MpTempPWMParType
{	float Period;
	float MinPulseWidth;
	float MinPause;
} MpTempPWMParType;

typedef struct MpTempPWMType
{	struct MpTempPWMParType Heat;
	struct MpTempPWMParType Cool;
} MpTempPWMType;

typedef struct MpTempHCMCurrentType
{	float PhaseL1;
	float PhaseL2;
	float PhaseL3;
} MpTempHCMCurrentType;

typedef struct MpTempToleranceBandType
{	float Lower;
	float Upper;
} MpTempToleranceBandType;

typedef struct MpTempHCMType
{	plcbit Enable;
	struct MpTempHCMCurrentType ReferenceCurrent;
	struct MpTempHCMCurrentType MaximumCurrent;
	struct MpTempToleranceBandType ToleranceBand;
} MpTempHCMType;

typedef struct MpTempControllerFilterType
{	plcbit Enable;
	float NoiseReduction;
} MpTempControllerFilterType;

typedef struct MpTempControllerSignalHeatType
{	enum MpTempControllerSignalHeatEnum Type;
} MpTempControllerSignalHeatType;

typedef struct MpTempControllerSignalCoolType
{	enum MpTempControllerSignalCoolEnum Type;
} MpTempControllerSignalCoolType;

typedef struct MpTempSignalModulationType
{	struct MpTempControllerSignalHeatType Heat;
	struct MpTempControllerSignalCoolType Cool;
} MpTempSignalModulationType;

typedef struct MpTempPFMParType
{	float PulseWidth;
	float MinPause;
	float MinOutput;
	plcbit ForceMinPause;
	float MaxOutput;
} MpTempPFMParType;

typedef struct MpTempPFMType
{	struct MpTempPFMParType Cool;
} MpTempPFMType;

typedef struct MpTempSoftStartSettingsType
{	enum MpTempSoftStartModeEnum Mode;
	float ReducedMaximumHeatOutput;
	float SlewRate;
	float FilterTime;
	float DelayTime;
	plcbit QuickStart;
} MpTempSoftStartSettingsType;

typedef struct MpTempSoftStartControllerType
{	enum MpTempSoftStartEnableEnum Type;
	struct MpTempSoftStartSettingsType Settings;
} MpTempSoftStartControllerType;

typedef struct MpTempControllerConfigType
{	enum MpTempZoneTypeEnum Type;
	float AmbientTemperature;
	float MaxHeatPower;
	float MaxHeatOutput;
	float MaxCoolOutput;
	enum MpTempProfileModeEnum ProfileMode;
	enum MpTempTuningSystemCheckEnum SystemCheck;
	struct MpTempSystemType SystemParameters;
	struct MpTempPWMType PWMParameters;
	struct MpTempHCMType HCMParameters;
	struct MpTempControllerFilterType TemperatureFilter;
	struct MpTempSignalModulationType SignalModulation;
	struct MpTempPFMType PFMParameters;
	struct MpTempSoftStartControllerType SoftStart;
} MpTempControllerConfigType;

typedef struct MpTempPWMScheduleParType
{	enum MpTempPWMScheduleModeEnum Mode;
	float Period;
	float MinPulseWidth;
	float MinPause;
} MpTempPWMScheduleParType;

typedef struct MpTempPWMScheduleType
{	struct MpTempPWMScheduleParType Heat;
	struct MpTempPWMScheduleParType Cool;
} MpTempPWMScheduleType;

typedef struct MpTempSoftStartGroupType
{	plcbit Enable;
	float Temperature;
	float HoldTime;
	struct MpTempSoftStartSettingsType Settings;
} MpTempSoftStartGroupType;

typedef struct MpTempGroupConfigType
{	plcbit EnableLoadBalancing;
	float MaxHeatPower;
	struct MpTempPWMScheduleType PWMScheduleParameters;
	struct MpTempSoftStartGroupType SoftStart;
} MpTempGroupConfigType;

typedef struct MpTempHCMConfigType
{	enum MpTempHCMConceptEnum CurrentSensingConcept;
	enum MpTempHCMOperationEnum OperationMode;
	float MeasurementTime;
	float IntervalTime;
	float IdleTime;
} MpTempHCMConfigType;

typedef struct MpTempProfileParType
{	float SlewRate;
	float FilterTime;
	float DelayTime;
	plcbit QuickStart;
} MpTempProfileParType;

typedef struct MpTempGroupProfileType
{	enum MpTempProfileSyncModeEnum SynchronizationMode;
	struct MpTempProfileParType Heat;
	struct MpTempProfileParType Cool;
} MpTempGroupProfileType;

typedef struct MpTempGroupParType
{	plcbit SynchronizeTuning;
	struct MpTempGroupProfileType Profile;
} MpTempGroupParType;

typedef struct MpTempPIDParType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
} MpTempPIDParType;

typedef struct MpTempPIDType
{	struct MpTempPIDParType Heat;
	struct MpTempPIDParType Cool;
	float IntegratorPreloading;
} MpTempPIDType;

typedef struct MpTempTuningType
{	enum MpTempTuningModeEnum Mode;
	float SetPointHeat;
	float SetPointCool;
} MpTempTuningType;

typedef struct MpTempControllerProfileType
{	struct MpTempProfileParType Heat;
	struct MpTempProfileParType Cool;
	float AttenuationFactor;
	float OvershootReduction;
} MpTempControllerProfileType;

typedef struct MpTempHysteresisBand
{	float HeatToCool;
	float CoolToHeat;
} MpTempHysteresisBand;

typedef struct MpTempHysteresisType
{	enum MpTempHysteresisModeEnum Mode;
	struct MpTempHysteresisBand Band;
} MpTempHysteresisType;

typedef struct MpTempControllerParType
{	struct MpTempPIDType PID;
	struct MpTempTuningType Tuning;
	struct MpTempControllerProfileType Profile;
	struct MpTempToleranceBandType ToleranceBand;
	struct MpTempHysteresisType Hysteresis;
} MpTempControllerParType;

typedef struct MpTempProfileType
{	struct MpTempProfileParType Heat;
	struct MpTempProfileParType Cool;
} MpTempProfileType;

typedef struct MpTempSystemCharacteristicsType
{	enum MpTempSystemTypeEnum Heat;
	enum MpTempSystemTypeEnum Cool;
} MpTempSystemCharacteristicsType;

typedef struct MpTempTuningQualityType
{	unsigned char Heat;
	unsigned char Cool;
} MpTempTuningQualityType;

typedef struct MpTempTuningFilterType
{	float NoiseReduction;
} MpTempTuningFilterType;

typedef struct MpTempTuningInfoType
{	enum MpTempTuningStateEnum State;
	struct MpTempPIDType PIDParameters;
	struct MpTempSystemType SystemParameters;
	struct MpTempProfileType ProfileParameters;
	struct MpTempTuningQualityType Quality;
	struct MpTempTuningFilterType TemperatureFilter;
	struct MpTempSystemCharacteristicsType SystemType;
} MpTempTuningInfoType;

typedef struct MpTempControllerProfileInfoType
{	plcbit Active;
	plcbit InSetPoint;
} MpTempControllerProfileInfoType;

typedef struct MpTempControlInfoType
{	float ControlError;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	float ActualTemperatureFiltered;
	float ActualTemperatureDerivative;
	plcbit TemperatureFilterUsed;
} MpTempControlInfoType;

typedef struct MpTempSimulationInfoType
{	float HeatValue;
	float CoolValue;
	float ActualTemperature;
	plcbit Heat;
	plcbit Cool;
	struct MpTempSystemCharacteristicsType SystemType;
} MpTempSimulationInfoType;

typedef struct MpTempStatusIDType
{	enum MpTempErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpTempStatusIDType;

typedef struct MpTempDiagType
{	struct MpTempStatusIDType StatusID;
} MpTempDiagType;

typedef struct MpTempControllerHCMInfoType
{	float AverageCurrentL1;
	float AverageCurrentL2;
	float AverageCurrentL3;
} MpTempControllerHCMInfoType;

typedef struct MpTempSoftStartCtrlInfoType
{	enum MpTempSoftStartStateEnum State;
} MpTempSoftStartCtrlInfoType;

typedef struct MpTempSystemInfoType
{	struct MpTempSystemType Parameters;
	struct MpTempSystemCharacteristicsType Type;
} MpTempSystemInfoType;

typedef struct MpTempParameterizationInfoType
{	struct MpTempPIDType Controller;
	struct MpTempSystemInfoType System;
	struct MpTempProfileType Profile;
	struct MpTempControllerFilterType KalmanFilter;
} MpTempParameterizationInfoType;

typedef struct MpTempControllerInfoType
{	float SetTemperature;
	float FeedForwardHeat;
	float FeedForwardCool;
	plcbit InTolerance;
	struct MpTempTuningInfoType Tuning;
	struct MpTempControllerProfileInfoType Profile;
	struct MpTempControlInfoType Control;
	struct MpTempSimulationInfoType Simulation;
	struct MpTempDiagType Diag;
	struct MpTempControllerHCMInfoType HCM;
	struct MpTempSoftStartCtrlInfoType SoftStart;
	struct MpTempParameterizationInfoType Parameterization;
} MpTempControllerInfoType;

typedef struct MpTempGroupProfileInfoType
{	plcbit Active;
	plcbit InSetPoint;
	struct MpTempProfileParType Heat;
	struct MpTempProfileParType Cool;
} MpTempGroupProfileInfoType;

typedef struct MpTempGroupPowerType
{	float Actual;
	float Required;
	plcbit InLimitation;
} MpTempGroupPowerType;

typedef struct MpTempSoftStartGroupInfoType
{	enum MpTempSoftStartStateEnum State;
} MpTempSoftStartGroupInfoType;

typedef struct MpTempGroupInfoType
{	struct MpTempGroupProfileInfoType Profile;
	struct MpTempGroupPowerType HeatPower;
	struct MpTempDiagType Diag;
	struct MpTempSoftStartGroupInfoType SoftStart;
} MpTempGroupInfoType;

typedef struct MpTempHCMInfoType
{	enum MpTempHCMStateEnum State;
	struct MpTempDiagType Diag;
} MpTempHCMInfoType;

typedef struct MpTempInfoType
{	struct MpTempDiagType Diag;
} MpTempInfoType;

typedef struct MpTempController
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTempControllerParType* Parameters;
	float SetTemperature;
	float ActualTemperature;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float HeatValue;
	float CoolValue;
	struct MpTempControllerInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Control;
	plcbit Tune;
	plcbit Simulate;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit Heat;
	plcbit Cool;
	plcbit ControlActive;
	plcbit TuningActive;
	plcbit TuningDone;
	plcbit Simulation;
} MpTempController_typ;

typedef struct MpTempControllerConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTempControllerConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTempInfoType Info;
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
} MpTempControllerConfig_typ;

typedef struct MpTempGroup
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTempGroupParType* Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTempGroupInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Control;
	plcbit Tune;
	plcbit LimitPower;
	plcbit Simulate;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit ControlActive;
	plcbit TuningActive;
	plcbit TuningDone;
	plcbit PowerLimitationActive;
	plcbit Simulation;
} MpTempGroup_typ;

typedef struct MpTempGroupConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTempGroupConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTempInfoType Info;
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
} MpTempGroupConfig_typ;

typedef struct MpTempHCM
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	float CurrentL1;
	float CurrentL2;
	float CurrentL3;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTempHCMInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Monitor;
	plcbit AutoDetect;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit MonitoringActive;
	plcbit MonitoringDone;
	plcbit DetectionActive;
	plcbit DetectionDone;
} MpTempHCM_typ;

typedef struct MpTempHCMConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpTempHCMConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpTempHCMInfoType Info;
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
} MpTempHCMConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpTempController(struct MpTempController* inst);
_BUR_PUBLIC void MpTempControllerConfig(struct MpTempControllerConfig* inst);
_BUR_PUBLIC void MpTempGroup(struct MpTempGroup* inst);
_BUR_PUBLIC void MpTempGroupConfig(struct MpTempGroupConfig* inst);
_BUR_PUBLIC void MpTempHCM(struct MpTempHCM* inst);
_BUR_PUBLIC void MpTempHCMConfig(struct MpTempHCMConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPTEMP_ */

