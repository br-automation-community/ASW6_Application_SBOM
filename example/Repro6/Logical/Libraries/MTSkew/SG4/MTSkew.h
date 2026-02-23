/* Automation Studio generated header file */
/* Do not edit ! */
/* MTSkew 6.4.0 */

#ifndef _MTSKEW_
#define _MTSKEW_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTSkew_VERSION
#define _MTSkew_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "sys_lib.h"
		#include "brsystem.h"
#endif

#ifdef _SG4
		#include "sys_lib.h"
		#include "brsystem.h"
#endif

#ifdef _SGC
		#include "sys_lib.h"
		#include "brsystem.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MTSkewActuatorSetupEnum
{	mtSKEW_SETUP_TWO_AC = 0,
	mtSKEW_SETUP_TWO_BD = 1,
	mtSKEW_SETUP_FOUR = 2
} MTSkewActuatorSetupEnum;

typedef enum MTSkewCtrlModeEnum
{	mtSKEW_MODE_OFF = 0,
	mtSKEW_MODE_ANTISKEW = 1,
	mtSKEW_MODE_AUTOSKEW = 2
} MTSkewCtrlModeEnum;

typedef enum MTSkewCtrlStateEnum
{	mtSKEW_STATE_OFF = 0,
	mtSKEW_STATE_ANTISKEW = 1,
	mtSKEW_STATE_ANTISKEW_POS = 2,
	mtSKEW_STATE_AUTOSKEW = 3
} MTSkewCtrlStateEnum;

typedef enum MTSkewObserverStateEnum
{	mtSKEW_OBSERVER_OFF = 0,
	mtSKEW_OBSERVER_INIT = 1,
	mtSKEW_OBSERVER_OPENLOOP = 2,
	mtSKEW_OBSERVER_CLOSEDLOOP = 3
} MTSkewObserverStateEnum;

typedef enum MTSkewPIDIntegrationEnum
{	mtSKEW_INTEGRATION_FREE = 0,
	mtSKEW_HOLD_POSITIVE = 1,
	mtSKEW_HOLD_NEGATIVE = -1
} MTSkewPIDIntegrationEnum;

typedef enum MTSkewIdentModeEnum
{	mtSKEW_IDENT_MODE_ADVANCED = 0,
	mtSKEW_IDENT_MODE_BASIC = 1
} MTSkewIdentModeEnum;

typedef enum MTSkewIdentStateEnum
{	mtSKEW_IDENT_OFF = 0,
	mtSKEW_IDENT_INIT_SVF = 1,
	mtSKEW_IDENT_IDLE = 2,
	mtSKEW_IDENT_HOME_ACTUATORS = 3,
	mtSKEW_IDENT_OFFSET = 4,
	mtSKEW_IDENT_EXCITE = 5,
	mtSKEW_IDENT_DYN_DAMP = 6,
	mtSKEW_IDENT_MOVE_2_I_CCW = 7,
	mtSKEW_IDENT_KINEMATIC_I_CCW = 8,
	mtSKEW_IDENT_MOVE_2_M_CCW = 9,
	mtSKEW_IDENT_KINEMATIC_M_CCW = 10,
	mtSKEW_IDENT_MOVE_2_I_CW = 11,
	mtSKEW_IDENT_KINEMATIC_I_CW = 12,
	mtSKEW_IDENT_MOVE_2_M_CW = 13,
	mtSKEW_IDENT_KINEMATIC_M_CW = 14,
	mtSKEW_IDENT_MOVE_2_HOME = 15,
	mtSKEW_IDENT_DONE = 16,
	mtSKEW_IDENT_ABORTED = 17,
	mtSKEW_IDENT_ERROR = 18
} MTSkewIdentStateEnum;

typedef enum MTSkewIdentOrientEnum
{	mtSKEW_IDENT_ORIENT_M_CW = -2,
	mtSKEW_IDENT_ORIENT_I_CW = -1,
	mtSKEW_IDENT_ORIENT_ZERO = 0,
	mtSKEW_IDENT_ORIENT_I_CCW = 1,
	mtSKEW_IDENT_ORIENT_M_CCW = 2
} MTSkewIdentOrientEnum;

typedef struct MTSkewActuatorLimitsType
{	float MinPosition;
	float MaxPosition;
	float MaxVelocity;
	float MaxAcceleration;
} MTSkewActuatorLimitsType;

typedef struct MTSkewActuatorConfigType
{	struct MTSkewActuatorLimitsType Limits;
	enum MTSkewActuatorSetupEnum MechanicalSetup;
	float HomePosition[4];
} MTSkewActuatorConfigType;

typedef struct MTSkewCoordinatesXZType
{	float x;
	float z;
} MTSkewCoordinatesXZType;

typedef struct MTSkewSystemType
{	float Gain;
	float GainCorrectionCCW;
	float GainCorrectionCW;
	float DynamicConstant;
	float DampingConstant;
} MTSkewSystemType;

typedef struct MTSkewOscillationParType
{	float DampingFactor;
} MTSkewOscillationParType;

typedef struct MTSkewPIDParType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
} MTSkewPIDParType;

typedef struct MTSkewCtrlParType
{	struct MTSkewOscillationParType AntiSkew;
	struct MTSkewPIDParType SkewPosition;
	struct MTSkewSystemType SkewSystem;
	float HomePositionOffset[4];
} MTSkewCtrlParType;

typedef struct MTSkewCtrl_LTH_Type
{	signed char Transformation[4];
	float Position;
	float CorrectionVelocity;
} MTSkewCtrl_LTH_Type;

typedef struct MTSkewCtrl_LTHcomp_Type
{	float ProportionalGain;
	struct MTSkewCtrl_LTH_Type List;
	struct MTSkewCtrl_LTH_Type Trim;
	struct MTSkewCtrl_LTH_Type Hoist;
	float CorrectionVelocity[4];
} MTSkewCtrl_LTHcomp_Type;

typedef struct MTSkewOscillationSystType
{	float Gain;
	float AngularFrequency;
	float DampingFactor;
} MTSkewOscillationSystType;

typedef struct MTSkewOscillationParAugType
{	float SetDampingFactor;
	float OutputLimit;
	float OutputRateLimit;
} MTSkewOscillationParAugType;

typedef struct MTSkewOscillationDataType
{	struct MTSkewOscillationParAugType Parameters;
	struct MTSkewOscillationSystType ClosedLoopSystem;
	float Output;
} MTSkewOscillationDataType;

typedef struct MTSkewKalmanEstParType
{	unsigned long NbInitCycles;
	double Q[3];
	double r;
} MTSkewKalmanEstParType;

typedef struct MTSkewKalmanEstStatesType
{	plcbit Initialized;
	unsigned long CntInitCycles;
	double ObserverStates[3];
	double ErrorCovariance[9];
	double StationaryValue;
} MTSkewKalmanEstStatesType;

typedef struct MTSkewKalmanEstDataType
{	struct MTSkewKalmanEstParType Parameters;
	struct MTSkewKalmanEstStatesType States;
	float Output;
} MTSkewKalmanEstDataType;

typedef struct MTSkewPIDStatesType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
	float FilterTime;
	float FilterTimeFactor;
	float OutputLimit;
	float ControlErrorOld;
	float ProportionalPart;
	float IntegrationPart;
	float DerivativePart;
	enum MTSkewPIDIntegrationEnum IntegrationStatus;
} MTSkewPIDStatesType;

typedef struct MTSkewStationaryDataType
{	plcbit Initialize;
	plcbit Suspend;
	enum MTSkewPIDIntegrationEnum HoldIntegration;
	struct MTSkewPIDStatesType States;
	float Output;
} MTSkewStationaryDataType;

typedef struct MTSkewCtrl_S_Type
{	signed char Transformation[4];
	float Position;
	float PositionOffset;
	struct MTSkewOscillationSystType OpenLoopSystem;
	float DesiredSkewAngle[3];
	struct MTSkewOscillationDataType OscillationController;
	struct MTSkewKalmanEstDataType KalmanEstimator;
	struct MTSkewStationaryDataType StationaryController;
	float CorrectionVelocity;
} MTSkewCtrl_S_Type;

typedef struct MTSkewLimiterDataType
{	signed char InLimitation;
	float OldValue;
} MTSkewLimiterDataType;

typedef struct MTSkewCtrl_LTHS_Type
{	struct MTSkewCtrl_LTHcomp_Type LTH;
	struct MTSkewCtrl_S_Type Skew;
	float CorrectionVelocity[4];
	struct MTSkewLimiterDataType Limiter[4];
} MTSkewCtrl_LTHS_Type;

typedef struct MTSkewCtrlStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTSkewCtrlStatVarType;

typedef struct MTSkewCtrlIntType
{	double CycleTime;
	struct MTSkewActuatorConfigType Configuration;
	float DelayTime;
	struct MTSkewCtrlParType Parameters;
	struct MTSkewCtrl_LTHS_Type LTHS;
	struct MTSkewCtrlStatVarType StatusVariables;
} MTSkewCtrlIntType;

typedef struct MTSkewIdentSVFType
{	plcbit Initialize;
	double FilterTime;
	double NumCoeffD0[4];
	double NumCoeffD1[4];
	double NumCoeffD2[4];
	double DenomCoeff[4];
	double SkewAngleD0State[3];
	double SkewAngleD1State[3];
	double SkewAngleD2State[3];
	double SkewPositionState[3];
	unsigned short InitCounter;
	plcbit Initialized;
	double SkewAngleD0;
	double SkewAngleD1;
	double SkewAngleD2;
	double SkewPosition;
} MTSkewIdentSVFType;

typedef struct MTSkewIdentExciteType
{	float MaxSkewAngle;
	double Timer;
	double TimerThreshold;
	plcbit Error;
} MTSkewIdentExciteType;

typedef struct MTSkewIdentProfileType
{	plcbit Active;
	float StartPosition;
	float EndPosition;
	float MaxVelocity;
	signed char MoveDir;
	float MaxDistance;
	double MinDuration;
	float Distance;
	plcbit Exceeded;
	float Velocity;
	double ExpirationTimer;
	double ExpirationThreshold;
	plcbit Expired;
} MTSkewIdentProfileType;

typedef struct MTSkewIdentActuSysType
{	unsigned char State;
	enum MTSkewIdentOrientEnum Orientation;
	plcbit OrientationChanged;
	float Margins[5];
	struct MTSkewIdentExciteType Excite;
	struct MTSkewIdentProfileType Profile[4];
} MTSkewIdentActuSysType;

typedef struct MTSkewIdentLSQType
{	unsigned long NbSamples;
	double PMatrix[4][4];
	double CoeffVec[4];
} MTSkewIdentLSQType;

typedef struct MTSkewIdentDataType
{	unsigned char State;
	double MinIdentTime;
	float HoistLength;
	struct MTSkewIdentLSQType LSQ;
	double Timer;
	double OscTime;
	double SkewPositionSum;
	double SkewPositionMean[6];
	double GainTimesSkewPositionPlusOffset[6];
	float DynamicConstant;
	float DampingConstant;
	float Gain;
	float Offset;
	plcbit Done;
	plcbit Error;
} MTSkewIdentDataType;

typedef struct MTSkewIdentStatVarType
{	plcbit ConfigurationValid;
	enum MTSkewIdentStateEnum State;
	enum MTSkewIdentModeEnum Mode;
	plcbit GotStarted;
	plcbit GotAborted;
	plcbit Start;
	plcbit StartOld;
	plcbit Stop;
	plcbit StopOld;
	plcbit EnableOld;
} MTSkewIdentStatVarType;

typedef struct MTSkewIdentInternalType
{	double CycleTime;
	struct MTSkewActuatorConfigType Configuration;
	signed char ActuatorSetup[4];
	struct MTSkewIdentSVFType SVF;
	struct MTSkewIdentActuSysType ActuatorSystem;
	struct MTSkewIdentDataType IdentData;
	struct MTSkewIdentStatVarType StatusVariables;
} MTSkewIdentInternalType;

typedef struct MTSkewObserverParType
{	double AngleFactor;
	double AngularFrequencyFactor;
	double DisturbanceFactor;
	double DynamicFactor;
} MTSkewObserverParType;

typedef struct MTSkewObserverDataType
{	double MinInitTime;
	double InitTimer;
	plcbit Initialized;
	double StatesFigure[3];
	double DynamicFigure;
	double ErrorCovariance[3][3];
	float ActSkewGain;
	double InputVector[3];
	double SystemMatrix[3][3];
	double SystemStates[3];
	double OutputVector[3];
} MTSkewObserverDataType;

typedef struct MSkewObserverStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MSkewObserverStatVarType;

typedef struct MTSkewObserverIntType
{	double CycleTime;
	struct MTSkewActuatorConfigType Configuration;
	signed char ActuatorSetup[4];
	struct MTSkewSystemType SkewSystem;
	struct MTSkewObserverParType ObserverParameters;
	float SkewPosition;
	struct MTSkewObserverDataType Observer;
	struct MSkewObserverStatVarType StatusVariables;
} MTSkewObserverIntType;

typedef struct MTSkewSimDimensionsType
{	struct MTSkewCoordinatesXZType TrolleyWidth;
	struct MTSkewCoordinatesXZType SpreaderWidth;
} MTSkewSimDimensionsType;

typedef struct MTSkewSimInitValuesType
{	float ActuatorPositionOffset[4];
	float SkewAngle;
} MTSkewSimInitValuesType;

typedef struct MTSkewSimConfigType
{	struct MTSkewSimDimensionsType Dimensions;
	struct MTSkewActuatorConfigType Actuators;
	struct MTSkewSimInitValuesType InitValue;
	float DelayTime;
} MTSkewSimConfigType;

typedef struct MTSkewSimModelInfoType
{	struct MTSkewSystemType SkewSystem;
} MTSkewSimModelInfoType;

typedef struct MTSkewSimSystemParType
{	float LoadMass;
	float LoadMomentOfInertia;
	float DampingFactor;
	float KinematicFactor;
} MTSkewSimSystemParType;

typedef struct MTSkewSimNoiseFactorType
{	float Actuators;
	float Skew;
} MTSkewSimNoiseFactorType;

typedef struct MTSkewSimModelParType
{	struct MTSkewSimSystemParType System;
	struct MTSkewSimNoiseFactorType NoiseFactor;
} MTSkewSimModelParType;

typedef struct MTSkewTimeDelayFcnType
{	unsigned long DelayCounter;
	unsigned long ActBufferIndex;
	unsigned long ActBufferElements;
	unsigned long OldBufferElements;
	float DelayTimeAct;
	float* BufferPointer;
} MTSkewTimeDelayFcnType;

typedef struct MTSkewSimActuDataType
{	signed char InLimitation;
	float Velocity;
	float VelocityLimited;
	float VelocityOld;
	float Position;
} MTSkewSimActuDataType;

typedef struct MTSkewSimModCharType
{	float SingularAngle;
	double HoistLength;
	double JB;
	double dB;
	double iB;
	double cB;
	double T;
	double w;
	double d;
} MTSkewSimModCharType;

typedef struct MTSkewSimModIntDataType
{	double Angle[3];
	double AngularVelocity[3];
} MTSkewSimModIntDataType;

typedef struct MTSkewSimSkewDataType
{	struct MTSkewTimeDelayFcnType Delay[4];
	struct MTSkewSimActuDataType Actuator[4];
	signed char Transformation[4];
	float Position;
	struct MTSkewSimModCharType Characteristics;
	struct MTSkewSimModIntDataType SimModelInt;
	float ActAngle;
	float ActAngularVelocity;
} MTSkewSimSkewDataType;

typedef struct MTSkewSimModStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTSkewSimModStatVarType;

typedef struct MTSkewSimModelIntType
{	double CycleTime;
	struct MTSkewSimConfigType Configuration;
	struct MTSkewSimModelParType Parameters;
	struct MTSkewSimSkewDataType Skew;
	struct MTSkewSimModStatVarType StatusVariables;
} MTSkewSimModelIntType;

typedef struct MTSkewController
{
	/* VAR_INPUT (analog) */
	struct MTSkewCtrlParType Parameters;
	struct MTSkewActuatorConfigType Configuration;
	float DelayTime;
	float ActPosition[4];
	float SetSkewAngle;
	float ActSkewAngle[3];
	float ActHoistLength;
	enum MTSkewCtrlModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetVelocity[4];
	enum MTSkewCtrlStateEnum State;
	/* VAR (analog) */
	struct MTSkewCtrlIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit InLimitation;
} MTSkewController_typ;

typedef struct MTSkewIdentification
{
	/* VAR_INPUT (analog) */
	struct MTSkewActuatorConfigType Configuration;
	float ActPosition[4];
	float ActSkewAngle;
	float ActHoistLength;
	float MaxSkewAngle;
	enum MTSkewIdentModeEnum Mode;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetVelocity[4];
	struct MTSkewSystemType SkewSystem;
	enum MTSkewIdentStateEnum State;
	/* VAR (analog) */
	struct MTSkewIdentInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Start;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit InProgress;
	plcbit IdentDone;
	plcbit Stopped;
} MTSkewIdentification_typ;

typedef struct MTSkewObserver
{
	/* VAR_INPUT (analog) */
	struct MTSkewSystemType SkewSystem;
	float DynamicFactor;
	struct MTSkewActuatorConfigType Configuration;
	float ActPosition[4];
	float ActSkewAngle;
	float ActHoistLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float EstSkewAngle[3];
	enum MTSkewObserverStateEnum State;
	/* VAR (analog) */
	struct MTSkewObserverIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit InvalidSkewAngle;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTSkewObserver_typ;

typedef struct MTSkewSimulationModel
{
	/* VAR_INPUT (analog) */
	struct MTSkewSimModelParType Parameters;
	struct MTSkewSimConfigType Configuration;
	float SetVelocity[4];
	float ActHoistLength;
	float WindTorque;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float ActPosition[4];
	float ActSkewAngle;
	float ActSkewAngularVelocity;
	struct MTSkewSimModelInfoType Info;
	/* VAR (analog) */
	struct MTSkewSimModelIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTSkewSimulationModel_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTSkewController(struct MTSkewController* inst);
_BUR_PUBLIC void MTSkewIdentification(struct MTSkewIdentification* inst);
_BUR_PUBLIC void MTSkewObserver(struct MTSkewObserver* inst);
_BUR_PUBLIC void MTSkewSimulationModel(struct MTSkewSimulationModel* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtSKW_WRN_SIM_SYSTEM_PAR_INVALID (-2131744937)
 #define mtSKW_WRN_NOISE_FACTOR_INVALID (-2131744938)
 #define mtSKW_WRN_IDENT_ABORTED (-2131744939)
 #define mtSKW_WRN_OBSERVER_PAR_INVALID (-2131744940)
 #define mtSKW_WRN_MODE_INVALID (-2131744941)
 #define mtSKW_WRN_CTRL_PAR_INVALID (-2131744942)
 #define mtSKW_WRN_SYSTEM_PAR_INVALID (-2131744943)
 #define mtSKW_WRN_HOISTLENGTH_INVALID (-2131744944)
 #define mtSKW_ERR_SIM_SYSTEM_PAR_INVALID (-1058003113)
 #define mtSKW_ERR_NOISE_FACTOR_INVALID (-1058003114)
 #define mtSKW_ERR_IDENT_INVALID (-1058003115)
 #define mtSKW_ERR_CTRL_PAR_INVALID (-1058003117)
 #define mtSKW_ERR_SYSTEM_PAR_INVALID (-1058003118)
 #define mtSKW_ERR_DELAY_TIME_INVALID (-1058003119)
 #define mtSKW_ERR_CONFIGURATION_INVALID (-1058003120)
#else
 _GLOBAL_CONST signed long mtSKW_WRN_SIM_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_NOISE_FACTOR_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_IDENT_ABORTED;
 _GLOBAL_CONST signed long mtSKW_WRN_OBSERVER_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_MODE_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_CTRL_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_WRN_HOISTLENGTH_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_SIM_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_NOISE_FACTOR_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_IDENT_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_CTRL_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_DELAY_TIME_INVALID;
 _GLOBAL_CONST signed long mtSKW_ERR_CONFIGURATION_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTSKEW_ */

