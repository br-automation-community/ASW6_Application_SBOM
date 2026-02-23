/* Automation Studio generated header file */
/* Do not edit ! */
/* MpHydAxis 6.4.0 */

#ifndef _MPHYDAXIS_
#define _MPHYDAXIS_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpHydAxis_VERSION
#define _MpHydAxis_VERSION 6.4.0
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
typedef enum MpHydAxisCtrlSourceEnum
{	mpHYDAXIS_NOT_USED = 0,
	mpHYDAXIS_VARIABLE_REAL = 1,
	mpHYDAXIS_VARIABLE_LREAL = 2
} MpHydAxisCtrlSourceEnum;

typedef enum MpHydAxisDestinationTypeEnum
{	mpHYDAXIS_DEST_VAR_NOT_USED = 0,
	mpHYDAXIS_DEST_VAR_REAL = 1,
	mpHYDAXIS_DEST_VAR_INT = 2,
	mpHYDAXIS_DEST_VAR_UINT = 3
} MpHydAxisDestinationTypeEnum;

typedef enum MpHydAxisPrValveCtrlEnum
{	mpHYDAXIS_VALVECTRL_FLOW = 0,
	mpHYDAXIS_VALVECTRL_VALVESIGNAL = 1
} MpHydAxisPrValveCtrlEnum;

typedef enum MpHydAxisPrValveFlowDirEnum
{	mpHYDAXIS_FLOW_DIR_POS = 0,
	mpHYDAXIS_FLOW_DIR_NEG = 1
} MpHydAxisPrValveFlowDirEnum;

typedef enum MpHydAxisPrValveFlowLinTypeEnum
{	mpHYDAXIS_FLOW_LIN_TYPE_NOT_USED = 0,
	mpHYDAXIS_FLOW_LIN_TYPE_SQU_ROOT = 1
} MpHydAxisPrValveFlowLinTypeEnum;

typedef enum MpHydAxisPrValveFlowLinUsedEnum
{	mpHYDAXIS_FLOW_LIN_NOT_USED = 0,
	mpHYDAXIS_FLOW_LIN_USED = 1
} MpHydAxisPrValveFlowLinUsedEnum;

typedef enum MpHydAxisPrValveFlowLinPrsEnum
{	mpHYDAXIS_PRESSURE_P = 0,
	mpHYDAXIS_PRESSURE_A = 1,
	mpHYDAXIS_PRESSURE_B = 2,
	mpHYDAXIS_PRESSURE_T = 3
} MpHydAxisPrValveFlowLinPrsEnum;

typedef enum MpHydAxisPrValvePressureTypeEnum
{	mpHYDAXIS_PRS_NOT_USED = 0,
	mpHYDAXIS_PRS_VARIABLE_REAL = 1,
	mpHYDAXIS_PRS_CONSTANT = 2
} MpHydAxisPrValvePressureTypeEnum;

typedef enum MpHydAxisCtrlTypeEnum
{	mpHYDAXIS_DIFFERENTIAL_CYLINDER = 0
} MpHydAxisCtrlTypeEnum;

typedef enum MpHydAxisCtrlProfileGenTypeEnum
{	mpHYDAXIS_APPLICATION = 0
} MpHydAxisCtrlProfileGenTypeEnum;

typedef enum MpHydAxisCtrlPositionUnitEnum
{	mpHYDAXIS_MILLIMETER = 0
} MpHydAxisCtrlPositionUnitEnum;

typedef enum MpHydAxisCtrlLoadUnitEnum
{	mpHYDAXIS_KILONEWTON = 0
} MpHydAxisCtrlLoadUnitEnum;

typedef enum MpHydAxisCtrlSensorsVelEnum
{	mpHYDAXIS_VEL_NOT_USED = 0,
	mpHYDAXIS_VEL_VARIABLE_REAL = 1
} MpHydAxisCtrlSensorsVelEnum;

typedef enum MpHydAxisCtrlSensorsPressureEnum
{	mpHYDAXIS_PRESSURE_NOT_USED = 0,
	mpHYDAXIS_PRESSURE_VARIABLE_REAL = 1
} MpHydAxisCtrlSensorsPressureEnum;

typedef enum MpHydAxisCtrlSensorsLoadEnum
{	mpHYDAXIS_LOAD_NOT_USED = 0,
	mpHYDAXIS_LOAD_VARIABLE_REAL = 1,
	mpHYDAXIS_LOAD_CALCULATION = 2
} MpHydAxisCtrlSensorsLoadEnum;

typedef enum MpHydAxisCtrlPosCtrlEnum
{	mpHYDAXIS_POS_CTRL_NOT_USED = 0,
	mpHYDAXIS_POS_CTRL_USED = 1
} MpHydAxisCtrlPosCtrlEnum;

typedef enum MpHydAxisCtrlPosCtrlTypeEnum
{	mpHYDAXIS_POS_CTRL_TYPE_NOT_USED = 0,
	mpHYDAXIS_POS_CTRL_TYPE_POS = 1
} MpHydAxisCtrlPosCtrlTypeEnum;

typedef enum MpHydAxisCtrlPosCtrlFFEnum
{	mpHYDAXIS_FF_NOT_USED = 0,
	mpHYDAXIS_FF_USED = 1
} MpHydAxisCtrlPosCtrlFFEnum;

typedef enum MpHydAxisCtrlPosCtrlFFConvEnum
{	mpHYDAXIS_FF_DEFAULT = 0,
	mpHYDAXIS_FF_USER_DEFINED = 1
} MpHydAxisCtrlPosCtrlFFConvEnum;

typedef enum MpHydAxisCtrlLoadCtrlEnum
{	mpHYDAXIS_LOAD_CTRL_NOT_USED = 0,
	mpHYDAXIS_LOAD_CTRL_USED = 1
} MpHydAxisCtrlLoadCtrlEnum;

typedef enum MpHydAxisCtrlLoadCtrlFFEnum
{	mpHYDAXIS_LOAD_FF_NOT_USED = 0,
	mpHYDAXIS_LOAD_FF_USED = 1
} MpHydAxisCtrlLoadCtrlFFEnum;

typedef enum MpHydAxisCtrlLoadConTypeEnum
{	mpHYDAXIS_LOAD_CON_TYPE_NOT_USED = 0,
	mpHYDAXIS_LOAD_CON_TYPE_PID = 1
} MpHydAxisCtrlLoadConTypeEnum;

typedef enum MpHydAxisCtrlLoadConISetTypeEnum
{	mpHYDAXIS_LOAD_CON_I_SET_BASIC = 0,
	mpHYDAXIS_LOAD_CON_I_SET_ADV = 1
} MpHydAxisCtrlLoadConISetTypeEnum;

typedef enum MpHydAxisCtrlPumpFlowDirectEnum
{	mpHYDAXIS_PUMP_DIRECTION_POS = 0,
	mpHYDAXIS_PUMP_DIRECTION_POS_NEG = 1
} MpHydAxisCtrlPumpFlowDirectEnum;

typedef enum MpHydAxisCtrlPumpFlowMapEnum
{	mpHYDAXIS_PUMP_FLOW_KEEP_SIGN = 0,
	mpHYDAXIS_PUMP_FLOW_INVERT_SIGN = 1
} MpHydAxisCtrlPumpFlowMapEnum;

typedef enum MpHydAxisCtrlPumpActuationEnum
{	mpHYDAXIS_PUMP_FLOW = 0,
	mpHYDAXIS_PUMP_PRESSURE_FLOW = 1,
	mpHYDAXIS_PUMP_SPEED = 2,
	mpHYDAXIS_PUMP_PRESSURE_SPEED = 3
} MpHydAxisCtrlPumpActuationEnum;

typedef enum MpHydAxisCtrlPumpFlowSrcEnum
{	mpHYDAXIS_PUMP_FLOW_CONTROL = 0,
	mpHYDAXIS_PUMP_FLOW_CONSTANT = 1,
	mpHYDAXIS_PUMP_FLOW_VARIABLE = 2
} MpHydAxisCtrlPumpFlowSrcEnum;

typedef enum MpHydAxisCtrlPumpSpeedSrcEnum
{	mpHYDAXIS_PUMP_SPEED_CONSTANT = 0,
	mpHYDAXIS_PUMP_SPEED_VARIABLE = 1
} MpHydAxisCtrlPumpSpeedSrcEnum;

typedef enum MpHydAxisCtrlPumpPressureSrcEnum
{	mpHYDAXIS_PUMP_PRESSURE_CONSTANT = 0,
	mpHYDAXIS_PUMP_PRESSURE_VARIABLE = 1
} MpHydAxisCtrlPumpPressureSrcEnum;

typedef enum MpHydAxisCtrlSWValvActuationEnum
{	mpHYDAXIS_NO_COILS_ENERGIZED = 0,
	mpHYDAXIS_COIL_1_ENERGIZED = 1,
	mpHYDAXIS_COIL_2_ENERGIZED = 2,
	mpHYDAXIS_COIL_1_AND_2_ENERGIZED = 3
} MpHydAxisCtrlSWValvActuationEnum;

typedef enum MpHydAxisCtrlPValveActuationEnum
{	mpHYDAXIS_VALVE_FLOW = 0,
	mpHYDAXIS_VALVE_SIGNAL = 2
} MpHydAxisCtrlPValveActuationEnum;

typedef enum MpHydAxisCtrlPValveFlowSrcEnum
{	mpHYDAXIS_VALVE_FLOW_CONTROL = 0,
	mpHYDAXIS_VALVE_FLOW_CONSTANT = 1,
	mpHYDAXIS_VALVE_FLOW_VARIABLE = 2,
	mpHYDAXIS_VALVE_FLOW_LOAD_CTRL = 3,
	mpHYDAXIS_VALVE_FLOW_ALT_CTRL = 4
} MpHydAxisCtrlPValveFlowSrcEnum;

typedef enum MpHydAxisCtrlPValveFlowMapEnum
{	mpHYDAXIS_VALVE_FLOW_KEEP_SIGN = 0,
	mpHYDAXIS_VALVE_FLOW_INVERT_SIGN = 1
} MpHydAxisCtrlPValveFlowMapEnum;

typedef enum MpHydAxisCtrlPValveSignalSrcEnum
{	mpHYDAXIS_VALVE_SIGNAL_CONSTANT = 0,
	mpHYDAXIS_VALVE_SIGNAL_VARIABLE = 1
} MpHydAxisCtrlPValveSignalSrcEnum;

typedef enum MpHydAxisCtrlActuatorEnum
{	mpHYDAXIS_SWITCHING_VALVE = 0,
	mpHYDAXIS_PUMP = 1,
	mpHYDAXIS_PROPORTIONAL_VALVE = 2
} MpHydAxisCtrlActuatorEnum;

typedef enum MpHydAxisErrorEnum
{	mpHYDAXIS_NO_ERROR = 0,
	mpHYDAXIS_ERR_ACTIVATION = -1064239103,
	mpHYDAXIS_ERR_MPLINK_NULL = -1064239102,
	mpHYDAXIS_ERR_MPLINK_INVALID = -1064239101,
	mpHYDAXIS_ERR_MPLINK_CHANGED = -1064239100,
	mpHYDAXIS_ERR_MPLINK_CORRUPT = -1064239099,
	mpHYDAXIS_ERR_MPLINK_IN_USE = -1064239098,
	mpHYDAXIS_ERR_CONFIG_NULL = -1064239096,
	mpHYDAXIS_ERR_CONFIG_NO_PV = -1064239095,
	mpHYDAXIS_ERR_CONFIG_LOAD = -1064239094,
	mpHYDAXIS_WRN_CONFIG_LOAD = -2137980917,
	mpHYDAXIS_ERR_CONFIG_SAVE = -1064239092,
	mpHYDAXIS_ERR_CONFIG_INVALID = -1064239091,
	mpHYDAXIS_ERR_CONFIG_PAR = -1064027392,
	mpHYDAXIS_ERR_COMMAND_FAILED = -1064027391,
	mpHYDAXIS_ERR_ACTUATOR_INACTIVE = -1064027390,
	mpHYDAXIS_ERR_ACTUATOR_ERROR = -1064027389,
	mpHYDAXIS_WRN_ACTUATOR_INACTIVE = -2137769212,
	mpHYDAXIS_WRN_ACTUATOR_ERROR = -2137769211,
	mpHYDAXIS_WRN_COMMAND_FAILED = -2137769209,
	mpHYDAXIS_ERR_CFG_STRUCT = -1064027384,
	mpHYDAXIS_WRN_CFG_STRUCT = -2137769207,
	mpHYDAXIS_INF_CFG_STRUCT = 1083456266,
	mpHYDAXIS_WRN_NO_ACTION_CHANGE = -2137769205,
	mpHYDAXIS_WRN_CONFIG_NOT_SAVED = -2137769204
} MpHydAxisErrorEnum;

typedef enum MpHydAxisAlarmEnum
{	mpHYDAXIS_ALM_PAR_INVALID = 0,
	mpHYDAXIS_ALM_ACTUATOR_INACTIVE = 1,
	mpHYDAXIS_ALM_ACTUATOR_ERROR = 2,
	mpHYDAXIS_ALM_ACTUATOR_EXT_CTRL = 3,
	mpHYDAXIS_ALM_CONFIG_NOT_SAVED = 4
} MpHydAxisAlarmEnum;

typedef struct MpHydAxisStatusIDType
{	enum MpHydAxisErrorEnum ID;
	MpComSeveritiesEnum Severity;
	unsigned short Code;
} MpHydAxisStatusIDType;

typedef struct MpHydAxisDiagType
{	struct MpHydAxisStatusIDType StatusID;
} MpHydAxisDiagType;

typedef struct MpHydAxisSwitchingValveInfoType
{	plcbit Coil1Energized;
	plcbit Coil2Energized;
	plcbit InExternalControl;
	struct MpHydAxisDiagType Diag;
	plcstring ExternalSource[33];
} MpHydAxisSwitchingValveInfoType;

typedef struct MpHydAxisPrValveSetValueInfoType
{	float SetFlow;
	float AdditionalValveSignal;
	float SetValveSignal;
	float SetFlow2;
	float AdditionalValveSignal2;
} MpHydAxisPrValveSetValueInfoType;

typedef struct MpHydAxisPrValveCurveInfoType
{	float InputFlow;
	float OutputValveSignal;
	float InputFlow2;
	float OutputValveSignal2;
} MpHydAxisPrValveCurveInfoType;

typedef struct MpHydAxisPrValveFlowLinInfoType
{	enum MpHydAxisPrValveFlowDirEnum FlowDirection;
	plcbit Active;
	float PressureDrop;
	float LinearizationGain;
} MpHydAxisPrValveFlowLinInfoType;

typedef struct MpHydAxisPrValveCtrlInfoType
{	enum MpHydAxisPrValveCtrlEnum Type;
	struct MpHydAxisPrValveSetValueInfoType SetValues;
	struct MpHydAxisPrValveCurveInfoType ValveCurve;
	float Output;
	float Output1;
	float Output2;
	struct MpHydAxisPrValveFlowLinInfoType PressureFlowLinearization;
} MpHydAxisPrValveCtrlInfoType;

typedef struct MpHydAxisPrValveSignalInfoType
{	float InputValveSignal;
} MpHydAxisPrValveSignalInfoType;

typedef struct MpHydAxisPrValveSignalsInfoType
{	struct MpHydAxisPrValveSignalInfoType ValveSignal1;
	struct MpHydAxisPrValveSignalInfoType ValveSignal2;
} MpHydAxisPrValveSignalsInfoType;

typedef struct MpHydAxisPrValveSensorsInfoType
{	float PressureP;
	float PressureA;
	float PressureB;
	float PressureT;
} MpHydAxisPrValveSensorsInfoType;

typedef struct MpHydAxisPropValveInfoType
{	plcbit InExternalControl;
	plcstring ExternalSource[33];
	struct MpHydAxisPrValveCtrlInfoType Controller;
	struct MpHydAxisPrValveSignalsInfoType ValveSignals;
	struct MpHydAxisDiagType Diag;
	struct MpHydAxisPrValveSensorsInfoType Sensors;
} MpHydAxisPropValveInfoType;

typedef struct MpHydAxisCtrlActValuesInfoType
{	double Position;
	float Velocity;
	float Pressure1;
	float Pressure2;
	float Load;
} MpHydAxisCtrlActValuesInfoType;

typedef struct MpHydAxisCtrlSetValuesInfoType
{	double Position;
	float Velocity;
	float Load;
} MpHydAxisCtrlSetValuesInfoType;

typedef struct MpHydAxisCtrlSystemInfoType
{	struct MpHydAxisCtrlActValuesInfoType ActValues;
	struct MpHydAxisCtrlSetValuesInfoType SetValues;
} MpHydAxisCtrlSystemInfoType;

typedef struct MpHydAxisPosCtrlFFInfoType
{	plcbit Active;
	float InputVelocity;
	float OutputFlow;
} MpHydAxisPosCtrlFFInfoType;

typedef struct MpHydAxisPosCtrlPositionInfoType
{	plcbit Active;
	float ControlError;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	float OutputSignal;
} MpHydAxisPosCtrlPositionInfoType;

typedef struct MpHydAxisPosCtrlInfoType
{	struct MpHydAxisPosCtrlFFInfoType FeedForward;
	struct MpHydAxisPosCtrlPositionInfoType PositionController;
} MpHydAxisPosCtrlInfoType;

typedef struct MpHydAxisLoadCtrlFFInfoType
{	plcbit Active;
	float OutputFlow;
} MpHydAxisLoadCtrlFFInfoType;

typedef struct MpHydAxisLoadCtrlPIDInfoType
{	plcbit Active;
	float ControlError;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	float OutputSignal;
} MpHydAxisLoadCtrlPIDInfoType;

typedef struct MpHydAxisLoadCtrlInfoType
{	struct MpHydAxisLoadCtrlFFInfoType FeedForward;
	struct MpHydAxisLoadCtrlPIDInfoType PIDController;
} MpHydAxisLoadCtrlInfoType;

typedef struct MpHydAxisAlternatingCtrlInfoType
{	plcbit IsUsed;
	plcstring ActuatorReference[33];
	plcbit InPositionControl;
	plcbit InLoadControl;
} MpHydAxisAlternatingCtrlInfoType;

typedef struct MpHydAxisCtrlActionInfoType
{	unsigned char ActiveAction;
	plcstring Name[81];
	struct MpHydAxisPosCtrlInfoType PositionControl;
	struct MpHydAxisLoadCtrlInfoType LoadControl;
	struct MpHydAxisAlternatingCtrlInfoType AlternatingControl;
} MpHydAxisCtrlActionInfoType;

typedef struct MpHydAxisControllerInfoType
{	struct MpHydAxisCtrlSystemInfoType System;
	struct MpHydAxisCtrlActionInfoType Action;
	struct MpHydAxisDiagType Diag;
} MpHydAxisControllerInfoType;

typedef struct MpHydAxisInfoType
{	struct MpHydAxisDiagType Diag;
} MpHydAxisInfoType;

typedef struct MpHydAxisSwValveCoilType
{	plcstring Name[33];
	float SwitchingDuration;
} MpHydAxisSwValveCoilType;

typedef struct MpHydAxisSwValveCoilsType
{	unsigned char NumberOfCoils;
	struct MpHydAxisSwValveCoilType Coil1;
	struct MpHydAxisSwValveCoilType Coil2;
} MpHydAxisSwValveCoilsType;

typedef struct MpHydAxisSwValveInSignalsType
{	plcstring EnergizeCoil1[256];
	plcstring EnergizeCoil2[256];
} MpHydAxisSwValveInSignalsType;

typedef struct MpHydAxisSwValveOutSignalsType
{	plcstring Coil1Signal[256];
	plcstring Coil2Signal[256];
} MpHydAxisSwValveOutSignalsType;

typedef struct MpHydAxisSwValveConfigType
{	struct MpHydAxisSwValveCoilsType Coils;
	struct MpHydAxisSwValveInSignalsType InputSignals;
	struct MpHydAxisSwValveOutSignalsType OutputSignals;
} MpHydAxisSwValveConfigType;

typedef struct MpHydAxisPrValveInputSignalsType
{	plcstring SetFlow[256];
	plcstring AdditionalValveSignal[256];
	plcstring SetValveSignal[256];
} MpHydAxisPrValveInputSignalsType;

typedef struct MpHydAxisPrValveCurvePointType
{	float ValveSignal;
	float Flow;
} MpHydAxisPrValveCurvePointType;

typedef struct MpHydAxisPrValveCurveType
{	struct MpHydAxisPrValveCurvePointType MinimumPoint;
	unsigned short NumberOfAdditionalPoints;
	unsigned long AdditionalPoints;
	struct MpHydAxisPrValveCurvePointType MaximumPoint;
} MpHydAxisPrValveCurveType;

typedef struct MpHydAxisPrValvePosFlowLinType
{	enum MpHydAxisPrValveFlowLinUsedEnum Type;
	float NominalPressureDrop;
	enum MpHydAxisPrValveFlowLinPrsEnum InputPort;
	enum MpHydAxisPrValveFlowLinPrsEnum OutputPort;
} MpHydAxisPrValvePosFlowLinType;

typedef struct MpHydAxisPrValveNegFlowLinType
{	enum MpHydAxisPrValveFlowLinUsedEnum Type;
	float NominalPressureDrop;
	enum MpHydAxisPrValveFlowLinPrsEnum InputPort;
	enum MpHydAxisPrValveFlowLinPrsEnum OutputPort;
} MpHydAxisPrValveNegFlowLinType;

typedef struct MpHydAxisPrValveFlowLinType
{	enum MpHydAxisPrValveFlowLinTypeEnum Type;
	struct MpHydAxisPrValvePosFlowLinType PositiveFlowLinearization;
	struct MpHydAxisPrValveNegFlowLinType NegativeFlowLinearization;
} MpHydAxisPrValveFlowLinType;

typedef struct MpHydAxisPrValveControllerType
{	enum MpHydAxisPrValveCtrlEnum Type;
	struct MpHydAxisPrValveInputSignalsType InputSignals;
	struct MpHydAxisPrValveCurveType ValveCurve;
	struct MpHydAxisPrValveFlowLinType PressureFlowLinearization;
} MpHydAxisPrValveControllerType;

typedef struct MpHydAxisPrValveLimitsType
{	float MinimumValveSignal;
	float MaximumValveSignal;
} MpHydAxisPrValveLimitsType;

typedef struct MpHydAxisPrValveScalingIntType
{	float MinimumUnscaledValue;
	float MaximumUnscaledValue;
	signed short MinimumScaledValue;
	signed short MaximumScaledValue;
} MpHydAxisPrValveScalingIntType;

typedef struct MpHydAxisPrValveScalingUintType
{	float MinimumUnscaledValue;
	float MaximumUnscaledValue;
	unsigned short MinimumScaledValue;
	unsigned short MaximumScaledValue;
} MpHydAxisPrValveScalingUintType;

typedef struct MpHydAxisPrValveDestinationType
{	enum MpHydAxisDestinationTypeEnum Type;
	plcstring PvMapping[256];
	struct MpHydAxisPrValveScalingIntType ScalingInt;
	struct MpHydAxisPrValveScalingUintType ScalingUint;
} MpHydAxisPrValveDestinationType;

typedef struct MpHydAxisPrValveOutputSignalType
{	struct MpHydAxisPrValveDestinationType Destination;
} MpHydAxisPrValveOutputSignalType;

typedef struct MpHydAxisPrValveSignalType
{	plcstring Name[33];
	struct MpHydAxisPrValveLimitsType Limits;
	struct MpHydAxisPrValveOutputSignalType OutputValveSignal;
} MpHydAxisPrValveSignalType;

typedef struct MpHydAxisPrValveSignalsType
{	unsigned char NumberOfValveSignals;
	struct MpHydAxisPrValveSignalType ValveSignal1;
	struct MpHydAxisPrValveSignalType ValveSignal2;
} MpHydAxisPrValveSignalsType;

typedef struct MpHydAxisPrValvePressureSrcType
{	enum MpHydAxisPrValvePressureTypeEnum Type;
	plcstring PVmapping[256];
	float ConstantPressure;
} MpHydAxisPrValvePressureSrcType;

typedef struct MpHydAxisPrValvePressureSensType
{	struct MpHydAxisPrValvePressureSrcType Source;
} MpHydAxisPrValvePressureSensType;

typedef struct MpHydAxisPrValveSensorsType
{	struct MpHydAxisPrValvePressureSensType PressureP;
	struct MpHydAxisPrValvePressureSensType PressureA;
	struct MpHydAxisPrValvePressureSensType PressureB;
	struct MpHydAxisPrValvePressureSensType PressureT;
} MpHydAxisPrValveSensorsType;

typedef struct MpHydAxisPrValveConfigType
{	struct MpHydAxisPrValveControllerType Controller;
	struct MpHydAxisPrValveSignalsType ValveSignals;
	struct MpHydAxisPrValveSensorsType Sensors;
} MpHydAxisPrValveConfigType;

typedef struct MpHydAxisCtrlType
{	enum MpHydAxisCtrlTypeEnum Type;
	float Area1;
	float Area2;
} MpHydAxisCtrlType;

typedef struct MpHydAxisCtrlProfileGenType
{	enum MpHydAxisCtrlProfileGenTypeEnum Type;
	enum MpHydAxisCtrlPositionUnitEnum PositionUnit;
	enum MpHydAxisCtrlLoadUnitEnum LoadUnit;
	plcstring SetPosition[256];
	plcstring SetVelocity[256];
	plcstring SetLoad[256];
} MpHydAxisCtrlProfileGenType;

typedef struct MpHydAxisCtrlSensorsPosType
{	enum MpHydAxisCtrlSourceEnum Source;
	plcstring PVmapping[256];
} MpHydAxisCtrlSensorsPosType;

typedef struct MpHydAxisCtrlSensorsVelType
{	enum MpHydAxisCtrlSensorsVelEnum Source;
	plcstring PVmapping[256];
} MpHydAxisCtrlSensorsVelType;

typedef struct MpHydAxisCtrlSensorsPressureType
{	enum MpHydAxisCtrlSensorsPressureEnum Source;
	plcstring PVmapping[256];
} MpHydAxisCtrlSensorsPressureType;

typedef struct MpHydAxisCtrlSensorsLoadType
{	enum MpHydAxisCtrlSensorsLoadEnum Source;
	plcstring PVmapping[256];
} MpHydAxisCtrlSensorsLoadType;

typedef struct MpHydAxisCtrlSensorsType
{	struct MpHydAxisCtrlSensorsPosType Position;
	struct MpHydAxisCtrlSensorsVelType Velocity;
	struct MpHydAxisCtrlSensorsPressureType Pressure1;
	struct MpHydAxisCtrlSensorsPressureType Pressure2;
	struct MpHydAxisCtrlSensorsLoadType Load;
} MpHydAxisCtrlSensorsType;

typedef struct MpHydAxisCtrlInputSignalsType
{	plcstring Action[256];
} MpHydAxisCtrlInputSignalsType;

typedef struct MpHydAxisControllerConfigType
{	struct MpHydAxisCtrlType HydraulicAxisType;
	struct MpHydAxisCtrlProfileGenType ProfileGeneration;
	struct MpHydAxisCtrlSensorsType Sensors;
	unsigned short NumberOfActions;
	unsigned long Actions;
	struct MpHydAxisCtrlInputSignalsType InputSignals;
} MpHydAxisControllerConfigType;

typedef struct MpHydAxisCtrlPosCtrlFFConvType
{	enum MpHydAxisCtrlPosCtrlFFConvEnum Type;
	float EffectiveArea1;
	float EffectiveArea2;
} MpHydAxisCtrlPosCtrlFFConvType;

typedef struct MpHydAxisCtrlPosCtrlFFType
{	enum MpHydAxisCtrlPosCtrlFFEnum Used;
	float Gain;
	struct MpHydAxisCtrlPosCtrlFFConvType VelocityFlowConversion;
} MpHydAxisCtrlPosCtrlFFType;

typedef struct MpHydAxisCtrlPosPIDType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
	float MinOutput;
	float MaxOutput;
	float MinIntegrationPart;
	float MaxIntegrationPart;
} MpHydAxisCtrlPosPIDType;

typedef struct MpHydAxisCtrlPosControllerType
{	enum MpHydAxisCtrlPosCtrlTypeEnum Type;
	struct MpHydAxisCtrlPosPIDType Position;
} MpHydAxisCtrlPosControllerType;

typedef struct MpHydAxisCtrlPosCtrlType
{	enum MpHydAxisCtrlPosCtrlEnum Used;
	struct MpHydAxisCtrlPosCtrlFFType Feedforward;
	struct MpHydAxisCtrlPosControllerType Controller;
} MpHydAxisCtrlPosCtrlType;

typedef struct MpHydAxisCtrlLoadCtrlFFType
{	enum MpHydAxisCtrlLoadCtrlFFEnum Used;
	plcstring AdditionalFlow[33];
} MpHydAxisCtrlLoadCtrlFFType;

typedef struct MpHydAxisCtrlLoadConPIDParType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
} MpHydAxisCtrlLoadConPIDParType;

typedef struct MpHydAxisCtrlLoadConBasicIType
{	float InitialValue;
	float MinIntegrationPart;
	float MaxIntegrationPart;
} MpHydAxisCtrlLoadConBasicIType;

typedef struct MpHydAxisCtrlLoadConAdvIType
{	plcstring InitialValue[33];
	plcstring SetInitialValue[33];
	plcstring HoldIntegration[33];
	plcstring MinIntegrationPart[33];
	plcstring MaxIntegrationPart[33];
} MpHydAxisCtrlLoadConAdvIType;

typedef struct MpHydAxisCtrlLoadConIntSetType
{	enum MpHydAxisCtrlLoadConISetTypeEnum Type;
	struct MpHydAxisCtrlLoadConBasicIType Basic;
	struct MpHydAxisCtrlLoadConAdvIType Advanced;
} MpHydAxisCtrlLoadConIntSetType;

typedef struct MpHydAxisCtrlLoadControllerType
{	enum MpHydAxisCtrlLoadConTypeEnum Type;
	struct MpHydAxisCtrlLoadConPIDParType PIDParameters;
	struct MpHydAxisCtrlLoadConIntSetType IntegratorSettings;
	float MinOutput;
	float MaxOutput;
} MpHydAxisCtrlLoadControllerType;

typedef struct MpHydAxisCtrlLoadCtrlType
{	enum MpHydAxisCtrlLoadCtrlEnum Used;
	struct MpHydAxisCtrlLoadCtrlFFType Feedforward;
	struct MpHydAxisCtrlLoadControllerType Controller;
} MpHydAxisCtrlLoadCtrlType;

typedef struct MpHydAxisCtrlActionType
{	plcstring Name[81];
	struct MpHydAxisCtrlPosCtrlType PositionControl;
	struct MpHydAxisCtrlLoadCtrlType LoadControl;
	unsigned short NumberOfActuators;
	unsigned long Actuators;
} MpHydAxisCtrlActionType;

typedef struct MpHydAxisCtrlSwValveActuatType
{	enum MpHydAxisCtrlSWValvActuationEnum Type;
} MpHydAxisCtrlSwValveActuatType;

typedef struct MpHydAxisCtrlSwValveType
{	plcstring ValveReference[33];
	struct MpHydAxisCtrlSwValveActuatType Actuation;
} MpHydAxisCtrlSwValveType;

typedef struct MpHydAxisCtrlPumpFlowFFMapType
{	enum MpHydAxisCtrlPumpFlowMapEnum Type;
	float Usage;
} MpHydAxisCtrlPumpFlowFFMapType;

typedef struct MpHydAxisCtrlPumpFlowCtrlMapType
{	enum MpHydAxisCtrlPumpFlowMapEnum Type;
	float Usage;
} MpHydAxisCtrlPumpFlowCtrlMapType;

typedef struct MpHydAxisCtrlPumpSetFlowType
{	enum MpHydAxisCtrlPumpFlowSrcEnum Type;
	struct MpHydAxisCtrlPumpFlowFFMapType FeedForwardMapping;
	struct MpHydAxisCtrlPumpFlowCtrlMapType ControllerMapping;
	float Value;
	plcstring PVmapping[256];
} MpHydAxisCtrlPumpSetFlowType;

typedef struct MpHydAxisCtrlPumpSetPressureType
{	enum MpHydAxisCtrlPumpPressureSrcEnum Type;
	float Value;
	plcstring PVmapping[256];
} MpHydAxisCtrlPumpSetPressureType;

typedef struct MpHydAxisCtrlPumpSetSpeedType
{	enum MpHydAxisCtrlPumpSpeedSrcEnum Type;
	float Value;
	plcstring PVmapping[256];
} MpHydAxisCtrlPumpSetSpeedType;

typedef struct MpHydAxisCtrlPumpActuationType
{	enum MpHydAxisCtrlPumpActuationEnum Type;
	struct MpHydAxisCtrlPumpSetFlowType SetFlowSource;
	struct MpHydAxisCtrlPumpSetPressureType SetPressureSource;
	struct MpHydAxisCtrlPumpSetSpeedType SetSpeedSource;
	unsigned char ControllerParameterSet;
} MpHydAxisCtrlPumpActuationType;

typedef struct MpHydAxisCtrlPumpType
{	plcstring PumpReference[33];
	enum MpHydAxisCtrlPumpFlowDirectEnum FlowDirection;
	struct MpHydAxisCtrlPumpActuationType Actuation;
} MpHydAxisCtrlPumpType;

typedef struct MpHydAxisCtrlPValveFlowFFMapType
{	enum MpHydAxisCtrlPValveFlowMapEnum Type;
	float Usage;
	float UsageLoadCtrl;
} MpHydAxisCtrlPValveFlowFFMapType;

typedef struct MpHydAxisCtrlPValveFlowCtMapType
{	enum MpHydAxisCtrlPValveFlowMapEnum Type;
	float Usage;
	float UsageLoadCtrl;
} MpHydAxisCtrlPValveFlowCtMapType;

typedef struct MpHydAxisCtrlPValveSetFlowType
{	enum MpHydAxisCtrlPValveFlowSrcEnum Type;
	struct MpHydAxisCtrlPValveFlowFFMapType FeedForwardMapping;
	struct MpHydAxisCtrlPValveFlowCtMapType ControllerMapping;
	float Value;
	plcstring PVmapping[256];
} MpHydAxisCtrlPValveSetFlowType;

typedef struct MpHydAxisCtrlPValveSetSignalType
{	enum MpHydAxisCtrlPValveSignalSrcEnum Type;
	float Value;
	plcstring PVmapping[256];
} MpHydAxisCtrlPValveSetSignalType;

typedef struct MpHydAxisCtrlPropValveActType
{	enum MpHydAxisCtrlPValveActuationEnum Type;
	struct MpHydAxisCtrlPValveSetFlowType SetFlowSource;
	struct MpHydAxisCtrlPValveSetSignalType SetValveSignalSource;
} MpHydAxisCtrlPropValveActType;

typedef struct MpHydAxisCtrlPropValveType
{	plcstring ValveReference[33];
	struct MpHydAxisCtrlPropValveActType Actuation;
} MpHydAxisCtrlPropValveType;

typedef struct MpHydAxisCtrlActuatorType
{	enum MpHydAxisCtrlActuatorEnum Type;
	struct MpHydAxisCtrlSwValveType SwitchingValve;
	struct MpHydAxisCtrlPumpType Pump;
	struct MpHydAxisCtrlPropValveType ProportionalValve;
} MpHydAxisCtrlActuatorType;

typedef struct MpHydAxisSwitchingValve
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisSwitchingValveInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Control;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit ControlActive;
} MpHydAxisSwitchingValve_typ;

typedef struct MpHydAxisSwitchingValveConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydAxisSwValveConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisInfoType Info;
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
} MpHydAxisSwitchingValveConfig_typ;

typedef struct MpHydAxisProportionalValve
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisPropValveInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Control;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit ControlActive;
} MpHydAxisProportionalValve_typ;

typedef struct MpHydAxisProportionalValveConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydAxisPrValveConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisInfoType Info;
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
} MpHydAxisProportionalValveConfig_typ;

typedef struct MpHydAxisController
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisControllerInfoType Info;
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
} MpHydAxisController_typ;

typedef struct MpHydAxisControllerConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHydAxisControllerConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHydAxisInfoType Info;
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
} MpHydAxisControllerConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpHydAxisSwitchingValve(struct MpHydAxisSwitchingValve* inst);
_BUR_PUBLIC void MpHydAxisSwitchingValveConfig(struct MpHydAxisSwitchingValveConfig* inst);
_BUR_PUBLIC void MpHydAxisProportionalValve(struct MpHydAxisProportionalValve* inst);
_BUR_PUBLIC void MpHydAxisProportionalValveConfig(struct MpHydAxisProportionalValveConfig* inst);
_BUR_PUBLIC void MpHydAxisController(struct MpHydAxisController* inst);
_BUR_PUBLIC void MpHydAxisControllerConfig(struct MpHydAxisControllerConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPHYDAXIS_ */

