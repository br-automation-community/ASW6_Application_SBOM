/* Automation Studio generated header file */
/* Do not edit ! */
/* MTGntCrane 6.4.0 */

#ifndef _MTGNTCRANE_
#define _MTGNTCRANE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTGntCrane_VERSION
#define _MTGntCrane_VERSION 6.4.0
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
typedef enum MTGntCraneFeedBackEnum
{	mtGNTCRANE_FB_OFF = 0,
	mtGNTCRANE_FB_ANTISWAY = 1,
	mtGNTCRANE_FB_ANTISWAY_LOADPOS = 2,
	mtGNTCRANE_FB_AXISPOS = 3
} MTGntCraneFeedBackEnum;

typedef enum MTGntCraneFeedForwardModeEnum
{	mtGNTCRANE_FF_OFF = 0,
	mtGNTCRANE_FF_VELOCITY = 1
} MTGntCraneFeedForwardModeEnum;

typedef enum MTGntCraneMotionStateEnum
{	mtGNTCRANE_DEC_NEG_DIR = -3,
	mtGNTCRANE_CONST_VEL_NEG_DIR = -2,
	mtGNTCRANE_ACC_NEG_DIR = -1,
	mtGNTCRANE_STANDSTILL = 0,
	mtGNTCRANE_ACC_POS_DIR = 1,
	mtGNTCRANE_CONST_VEL_POS_DIR = 2,
	mtGNTCRANE_DEC_POS_DIR = 3
} MTGntCraneMotionStateEnum;

typedef enum MTGntCraneObserverMeasModeEnum
{	mtGNTCRANE_MEAS_LOADPOSITION = 0,
	mtGNTCRANE_MEAS_LOADDEVIATION = 1,
	mtGNTCRANE_MEAS_DEFLECTIONANG = 2
} MTGntCraneObserverMeasModeEnum;

typedef enum MTGntCraneObserverDistModeEnum
{	mtGNTCRANE_DIST_AXISPOSITION = 0
} MTGntCraneObserverDistModeEnum;

typedef enum MTGntCraneObserverStateEnum
{	mtGNTCRANE_OBSERVER_OFF = 0,
	mtGNTCRANE_OBSERVER_INIT = 1,
	mtGNTCRANE_OBSERVER_OPENLOOP = 2,
	mtGNTCRANE_OBSERVER_CLOSEDLOOP = 3
} MTGntCraneObserverStateEnum;

typedef enum MTGntCranePIDIntegrationEnum
{	mtGNTCRANE_INTEGRATION_FREE = 0,
	mtGNTCRANE_HOLD_POSITIVE = 1,
	mtGNTCRANE_HOLD_NEGATIVE = -1
} MTGntCranePIDIntegrationEnum;

typedef enum MTGntCraneSimModelModeEnum
{	FULL = 0,
	REDUCED = 1,
	MINIMUM = 2
} MTGntCraneSimModelModeEnum;

typedef struct MTGntCrane2DCoordinatesType
{	float x;
	float y;
} MTGntCrane2DCoordinatesType;

typedef struct MTGntCrane2DConfigurationType
{	struct MTGntCrane2DCoordinatesType Space[2];
	float TrolleyHeight;
} MTGntCrane2DConfigurationType;

typedef struct MTGntCraneCoordinatesXZType
{	float x;
	float z;
} MTGntCraneCoordinatesXZType;

typedef struct MTGntCraneCoordinatesType
{	float x;
	float y;
	float z;
} MTGntCraneCoordinatesType;

typedef struct MTGntCraneCoordType
{	float y;
} MTGntCraneCoordType;

typedef struct MTGntCrane2DDynamicParType
{	float TrolleyVelocityLimit;
	float TrolleyAccelerationLimit;
	float HoistVelocityLimit;
	float HoistAccelerationLimit;
	float MaxDeflectionAngle;
} MTGntCrane2DDynamicParType;

typedef struct MTGntCraneDynamicParType
{	float TrolleyVelocityLimit;
	float TrolleyAccelerationLimit;
	float HoistVelocityLimit;
	float HoistAccelerationLimit;
	float GantryVelocityLimit;
	float GantryAccelerationLimit;
} MTGntCraneDynamicParType;

typedef struct MTGntCraneLoadOffsetsType
{	float x;
	float z;
} MTGntCraneLoadOffsetsType;

typedef struct MTGntCranePIDStatesType
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
	enum MTGntCranePIDIntegrationEnum IntegrationStatus;
} MTGntCranePIDStatesType;

typedef struct MTGntCranePIDPlusDataType
{	plcbit Initialize;
	enum MTGntCranePIDIntegrationEnum HoldIntegration;
	struct MTGntCranePIDStatesType States;
	float Output;
} MTGntCranePIDPlusDataType;

typedef struct MTGntCranePIParType
{	float Gain;
	float IntegrationTime;
} MTGntCranePIParType;

typedef struct MTGntCraneConfigurationType
{	float TrolleyHeight;
} MTGntCraneConfigurationType;

typedef struct MTGntCrane2DLoadAreaType
{	float Height;
	float Width;
} MTGntCrane2DLoadAreaType;

typedef struct MTGntCrane2DRestrictedAreaType
{	float x;
	float y;
	float Width;
} MTGntCrane2DRestrictedAreaType;

typedef struct MTGntCrane2DGeometricParType
{	struct MTGntCrane2DLoadAreaType Load;
	unsigned short NumberOfRestrictedAreas;
	struct MTGntCrane2DRestrictedAreaType RestrictedArea[50];
	float StartVerticalLength;
	float EndVerticalLength;
} MTGntCrane2DGeometricParType;

typedef struct MTGntCrane2DTrajectoryInfoType
{	float Duration;
	float MaxSetLoadY;
	unsigned short NumberOfKeyPoints;
	struct MTGntCrane2DCoordinatesType KeyPoints[12];
	struct MTGntCrane2DCoordinatesType StopArea[2];
	struct MTGntCrane2DCoordinatesType NextStartPosition;
} MTGntCrane2DTrajectoryInfoType;

typedef struct MTGntCrane2DTrajectoryParType
{	struct MTGntCrane2DDynamicParType Dynamic;
	struct MTGntCrane2DGeometricParType Geometric;
} MTGntCrane2DTrajectoryParType;

typedef struct MTGntCrane2DTrajTimerType
{	double CycleTime;
	double TimerV[3];
	double ReplanTimer;
} MTGntCrane2DTrajTimerType;

typedef struct MTGntCrane2DTrajConfigType
{	plcbit ConfigValid;
	struct MTGntCrane2DCoordinatesType ConfigSpace[2];
	float TrolleyHeight;
	plcbit InitPositionValid;
	float LoadHeight;
	float LoadWidth;
} MTGntCrane2DTrajConfigType;

typedef struct MTGntCrane2DTrajDynLimType
{	struct MTGntCrane2DCoordinatesType VelocityLimit;
	struct MTGntCrane2DCoordinatesType AccelerationLimit;
	float MaxDeflectionAngle;
} MTGntCrane2DTrajDynLimType;

typedef struct MTGntCrane2DTrajPathConfType
{	struct MTGntCrane2DCoordinatesType StartPosition[2];
	unsigned char StartPositionCnt;
	float StartSpeed;
	struct MTGntCrane2DCoordinatesType EndPosition[2];
	unsigned char EndPositionCnt;
	float EndSpeed;
	struct MTGntCrane2DCoordinatesType OldEndPosition;
	struct MTGntCrane2DCoordinatesType InitialLoadPosition;
} MTGntCrane2DTrajPathConfType;

typedef struct MTGntCrane2DTrajRestAreaType
{	unsigned short NbElems;
	unsigned short NbPoints;
	struct MTGntCrane2DCoordinatesType Elements[100];
	struct MTGntCrane2DCoordinatesType Frame[2];
} MTGntCrane2DTrajRestAreaType;

typedef struct MTGntCranePolygonIntType
{	double PositionX;
	double PositionY;
	double Length;
	double DirectionX;
	double DirectionY;
	double Angle;
} MTGntCranePolygonIntType;

typedef struct MTGntCrane2DTrajPolygonType
{	unsigned short NbPoints;
	struct MTGntCranePolygonIntType InitialPolygon[55];
	struct MTGntCrane2DCoordinatesType PolygonFrame[4];
} MTGntCrane2DTrajPolygonType;

typedef struct MTGntCrane2DTrajKeyDataType
{	double TotalTime2KeyPoint;
	double Time2KeyPoint;
	float XDistance2KeyPoint;
} MTGntCrane2DTrajKeyDataType;

typedef struct MTGntCrane2DTrajHoistKey
{	struct MTGntCrane2DCoordinatesType ReferencePosition;
	unsigned short NumberOfKeyPoints;
	struct MTGntCrane2DCoordinatesType KeyPoints[12];
	struct MTGntCrane2DTrajKeyDataType KeyPointData[12];
} MTGntCrane2DTrajHoistKey;

typedef struct MTGntCraneMoveKeyDataIntType
{	double MaxSpeed;
	double MaxAcceleration;
	double MaxDeceleration;
	signed char MovementIdent;
	double Duration;
	double TotalStartTime;
	double TotalDuration;
	signed char Direction;
	double Sigma;
	double TimeV[5];
	double DeltaSigmaV[5];
	double MovementV[5];
	double TotalTimeV[5];
	double SigmaI0V[5];
	double SigmaI1V[5];
	double SigmaI2V[5];
} MTGntCraneMoveKeyDataIntType;

typedef struct MTGntCrane2DTrajDynamicSeq
{	unsigned char NumberOfKeyDataSegments;
	unsigned char PlanningSegmentIndex;
	double FilterTime;
	struct MTGntCraneMoveKeyDataIntType MovementKeyData[8];
} MTGntCrane2DTrajDynamicSeq;

typedef struct MTGntCrane2DTrajStartingType
{	plcbit Suspended;
	plcbit Found;
	double VerticalLengthTimeDelta;
	double Time;
	double LowerTimeLimit;
} MTGntCrane2DTrajStartingType;

typedef struct MTGntCrane2DTrajBrakingType
{	plcbit Activated;
	double Sigma;
	plcbit Found;
	double Time;
	double Saving;
} MTGntCrane2DTrajBrakingType;

typedef struct MTGntCrane2DTrajBrkInfoType
{	signed char Signature;
	struct MTGntCrane2DTrajBrakingType HoistUp;
	struct MTGntCrane2DTrajBrakingType Trolley;
} MTGntCrane2DTrajBrkInfoType;

typedef struct MTGntCrane2DTrajMovDataType
{	struct MTGntCrane2DTrajStartingType TrolleyTiming;
	struct MTGntCrane2DTrajStartingType HoistDownTiming;
	struct MTGntCrane2DTrajBrkInfoType BrakeTiming;
	float HighestNogoAreaHeight;
	float AdditionalHoistElevation;
	float MaxRopeLength;
	float IntegralsAndDerivativesLoadX[5];
	float IntegralsAndDerivativesLoadY[5];
	double TimeReplanningStartPosition;
} MTGntCrane2DTrajMovDataType;

typedef struct MTGntCrane2DTrajStateVarType
{	unsigned short CommandState;
	unsigned short ExecutionState;
	plcbit ReplanningIsPossible;
	plcbit ReplanningIsPerformed;
	plcbit TrajectoryFinished;
	plcbit CalculateInfoOld;
	plcbit MoveOld;
	plcbit StopOld;
	plcbit EnableOld;
} MTGntCrane2DTrajStateVarType;

typedef struct MTGntCrane2DTrajectoryIntType
{	struct MTGntCrane2DTrajTimerType Timer;
	struct MTGntCrane2DTrajConfigType Configuration;
	struct MTGntCrane2DTrajDynLimType DynamicLimits;
	struct MTGntCrane2DTrajPathConfType PathConfiguration;
	struct MTGntCrane2DTrajRestAreaType RestrictedAreas;
	struct MTGntCrane2DTrajPolygonType Polygon;
	struct MTGntCrane2DTrajHoistKey HoistUpKeyPoints;
	struct MTGntCrane2DTrajHoistKey HoistDownKeyPoints;
	struct MTGntCrane2DTrajDynamicSeq HoistMovement;
	struct MTGntCrane2DTrajDynamicSeq TrolleyMovement;
	struct MTGntCrane2DTrajMovDataType MovementData;
	struct MTGntCrane2DTrajStateVarType StatusVariables;
} MTGntCrane2DTrajectoryIntType;

typedef struct MTGntCraneCoordIntType
{	double x;
	double y;
} MTGntCraneCoordIntType;

typedef struct MTGntCraneControllerInfoType
{	struct MTGntCraneCoordinatesType LoadLagError;
	float PredictedEndPositionLoadX;
	float PredictedEndPositionLoadZ;
	plcbit InLimitationTrolley;
	plcbit InLimitationHoist;
	plcbit InLimitationGantry;
} MTGntCraneControllerInfoType;

typedef struct MTGntCraneOscillationParType
{	float DampingFactor;
} MTGntCraneOscillationParType;

typedef struct MTGntCraneOscillationXZParType
{	struct MTGntCraneOscillationParType x;
	struct MTGntCraneOscillationParType z;
} MTGntCraneOscillationXZParType;

typedef struct MTGntCranePIDParType
{	float ProportionalGain;
	float IntegrationTime;
	float DerivativeTime;
} MTGntCranePIDParType;

typedef struct MTGntCraneXZPIDParType
{	struct MTGntCranePIDParType x;
	struct MTGntCranePIDParType z;
} MTGntCraneXZPIDParType;

typedef struct MTGntCraneControllerParType
{	struct MTGntCraneOscillationXZParType AntiSway;
	struct MTGntCraneXZPIDParType LoadPosition;
	struct MTGntCraneXZPIDParType AxisPosition;
	struct MTGntCranePIDParType HoistPosition;
	struct MTGntCraneDynamicParType Dynamic;
	enum MTGntCraneFeedForwardModeEnum FeedForwardMode;
	struct MTGntCraneLoadOffsetsType HoistLengthOffset;
} MTGntCraneControllerParType;

typedef struct MTGntCraneActuatorsType
{	float Trolley;
	float Hoist;
	float Gantry;
} MTGntCraneActuatorsType;

typedef struct MTGntCraneDynamicAxisParType
{	float VelocityLimit;
	float AccelerationLimit;
} MTGntCraneDynamicAxisParType;

typedef struct MTGntCraneControllerHParType
{	struct MTGntCraneOscillationParType AntiSway;
	struct MTGntCranePIDParType LoadPosition;
	struct MTGntCranePIDParType AxisPosition;
	struct MTGntCraneDynamicAxisParType Dynamic;
	float HoistLengthOffset;
} MTGntCraneControllerHParType;

typedef struct MTGntCraneControllerVParType
{	struct MTGntCranePIDParType HoistPosition;
	struct MTGntCraneDynamicAxisParType Dynamic;
} MTGntCraneControllerVParType;

typedef struct MTGntCraneControllerParIntType
{	enum MTGntCraneFeedForwardModeEnum FeedForwardMode;
	struct MTGntCraneControllerHParType x;
	struct MTGntCraneControllerVParType y;
	struct MTGntCraneControllerHParType z;
} MTGntCraneControllerParIntType;

typedef struct MTGntCraneCtrlHoistLengthType
{	float Set;
	float Act;
} MTGntCraneCtrlHoistLengthType;

typedef struct MTGntCraneCtrlHAxisFFType
{	float Position;
	float Velocity;
	float Acceleration;
} MTGntCraneCtrlHAxisFFType;

typedef struct MTGntCraneTimeDelayFcnType
{	unsigned long DelayCounter;
	unsigned long ActBufferIndex;
	unsigned long ActBufferElements;
	unsigned long OldBufferElements;
	float DelayTimeAct;
	float* BufferPointer;
} MTGntCraneTimeDelayFcnType;

typedef struct MTGntCraneCtrlDelayHDataType
{	struct MTGntCraneTimeDelayFcnType FFPositionBufferData;
	float FFPosition;
	struct MTGntCraneTimeDelayFcnType SetLoadBufferData[3];
	float SetLoad[3];
} MTGntCraneCtrlDelayHDataType;

typedef struct MTGntCraneOscillationSystType
{	float Gain;
	float AngularFrequency;
	float DampingFactor;
} MTGntCraneOscillationSystType;

typedef struct MTGntCraneOscillationParAugType
{	float SetDampingFactor;
	float OutputLimit;
	float OutputRateLimit;
} MTGntCraneOscillationParAugType;

typedef struct MTGntCraneOscillationDataType
{	struct MTGntCraneOscillationParAugType Parameters;
	struct MTGntCraneOscillationSystType ClosedLoopSystem;
	float Output;
} MTGntCraneOscillationDataType;

typedef struct MTGntCraneKalmanEstParType
{	unsigned long NbInitCycles;
	double Q[3];
	double r;
} MTGntCraneKalmanEstParType;

typedef struct MTGntCraneKalmanEstStatesType
{	plcbit Initialized;
	unsigned long CntInitCycles;
	double ObserverStates[3];
	double ErrorCovariance[9];
	double StationaryValue;
} MTGntCraneKalmanEstStatesType;

typedef struct MTGntCraneKalmanEstDataType
{	struct MTGntCraneKalmanEstParType Parameters;
	struct MTGntCraneKalmanEstStatesType States;
	float Output;
} MTGntCraneKalmanEstDataType;

typedef struct MTGntCraneStationaryDataType
{	plcbit Initialize;
	plcbit Suspend;
	enum MTGntCranePIDIntegrationEnum HoldIntegration;
	struct MTGntCranePIDStatesType States;
	float Output;
} MTGntCraneStationaryDataType;

typedef struct MTGntCraneLimiterDataType
{	signed char InLimitation;
	float OldValue;
} MTGntCraneLimiterDataType;

typedef struct MTGntCraneCtrlHAxisDataType
{	struct MTGntCraneCtrlHoistLengthType EffectiveHoistLength;
	struct MTGntCraneCtrlHAxisFFType FeedForward;
	struct MTGntCraneCtrlDelayHDataType Delay;
	struct MTGntCraneOscillationSystType OpenLoopSystem;
	struct MTGntCraneOscillationDataType OscillationController;
	struct MTGntCraneKalmanEstDataType KalmanEstimator;
	struct MTGntCraneStationaryDataType StationaryController;
	struct MTGntCranePIDPlusDataType PIDController;
	float CorrectionVelocity;
	float TotalVelocity;
	struct MTGntCraneLimiterDataType Limiter;
} MTGntCraneCtrlHAxisDataType;

typedef struct MTGntCraneCtrlVAxisFFType
{	float Position;
	float Velocity;
	float Acceleration;
} MTGntCraneCtrlVAxisFFType;

typedef struct MTGntCraneCtrlDelayVDataType
{	struct MTGntCraneTimeDelayFcnType SetHoistLengthBufferData;
	float SetHoistLength;
} MTGntCraneCtrlDelayVDataType;

typedef struct MTGntCraneCtrlVAxisDataType
{	struct MTGntCraneCtrlHoistLengthType HoistLength;
	struct MTGntCraneCtrlVAxisFFType FeedForward;
	struct MTGntCraneCtrlDelayVDataType Delay;
	struct MTGntCranePIDPlusDataType PIDController;
	float CorrectionVelocity;
	float TotalVelocity;
	struct MTGntCraneLimiterDataType Limiter;
} MTGntCraneCtrlVAxisDataType;

typedef struct MTGntCraneCtrlStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTGntCraneCtrlStatVarType;

typedef struct MTGntCraneCtrlIntType
{	double CycleTime;
	struct MTGntCraneConfigurationType Configuration;
	struct MTGntCraneActuatorsType DelayTime;
	struct MTGntCraneControllerParIntType Parameters;
	struct MTGntCraneCtrlHAxisDataType Trolley;
	struct MTGntCraneCtrlVAxisDataType Hoist;
	struct MTGntCraneCtrlHAxisDataType Gantry;
	struct MTGntCraneCtrlStatVarType StatusVariables;
} MTGntCraneCtrlIntType;

typedef struct MTGntCraneObserverDistModeXZType
{	enum MTGntCraneObserverDistModeEnum x;
	enum MTGntCraneObserverDistModeEnum z;
} MTGntCraneObserverDistModeXZType;

typedef struct MTGntCraneObserverMeasModeXZType
{	enum MTGntCraneObserverMeasModeEnum x;
	enum MTGntCraneObserverMeasModeEnum z;
} MTGntCraneObserverMeasModeXZType;

typedef struct MTGntCraneObserverDynamicXZType
{	float x;
	float z;
} MTGntCraneObserverDynamicXZType;

typedef struct MTGntCraneLoadObserverParType
{	struct MTGntCraneObserverDynamicXZType DynamicFactor;
	struct MTGntCraneObserverMeasModeXZType LoadMeasurementMode;
	struct MTGntCraneObserverDistModeXZType DisturbanceMode;
	struct MTGntCraneLoadOffsetsType HoistLengthOffset;
} MTGntCraneLoadObserverParType;

typedef struct MTGntCraneLoadObserverHParType
{	enum MTGntCraneObserverMeasModeEnum LoadMeasurementMode;
	enum MTGntCraneObserverDistModeEnum DisturbanceMode;
	float HoistLengthOffset;
	double DynamicFactor;
	double PositionFactor;
	double VelocityFactor;
	double DisturbanceFactor;
} MTGntCraneLoadObserverHParType;

typedef struct MTGntCraneLoadObserverIntParType
{	struct MTGntCraneLoadObserverHParType x;
	struct MTGntCraneLoadObserverHParType z;
} MTGntCraneLoadObserverIntParType;

typedef struct MTGntCraneLoadObserverDataType
{	double MinInitTime;
	double InitTimer;
	plcbit Initialized;
	double StatesFigure[3];
	double DynamicFigure;
	double ErrorCovariance[3][3];
	double OutputVector[3];
	double InputVector[3];
	double ActHoistLength;
	double ActLoadPos;
	double SystemMatrix[3][3];
	double SystemStates[3];
} MTGntCraneLoadObserverDataType;

typedef struct MTGntCraneLoadObsStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTGntCraneLoadObsStatVarType;

typedef struct MTGntCraneLoadObserverIntType
{	double CycleTime;
	struct MTGntCraneConfigurationType Configuration;
	struct MTGntCraneLoadObserverIntParType Parameters;
	struct MTGntCraneLoadObserverDataType ObserverX;
	struct MTGntCraneLoadObserverDataType ObserverZ;
	struct MTGntCraneLoadObsStatVarType StatusVariables;
} MTGntCraneLoadObserverIntType;

typedef struct MTGntCraneManualTrajParType
{	struct MTGntCraneDynamicParType Dynamic;
	struct MTGntCraneLoadOffsetsType HoistLengthOffset;
} MTGntCraneManualTrajParType;

typedef struct MTGntCraneManualTrajFactorType
{	float Jerk;
	float Snap;
} MTGntCraneManualTrajFactorType;

typedef struct MTGntCraneManualTrajHParType
{	struct MTGntCraneDynamicAxisParType Dynamic;
	struct MTGntCraneManualTrajFactorType Factor;
	float HoistLengthOffset;
} MTGntCraneManualTrajHParType;

typedef struct MTGntCraneManualTrajVParType
{	struct MTGntCraneDynamicAxisParType Dynamic;
	struct MTGntCraneManualTrajFactorType Factor;
} MTGntCraneManualTrajVParType;

typedef struct MTGntCraneManualTrajParIntType
{	struct MTGntCraneManualTrajHParType x;
	struct MTGntCraneManualTrajVParType y;
	struct MTGntCraneManualTrajHParType z;
} MTGntCraneManualTrajParIntType;

typedef struct MTGntCraneSimpleIntegratorType
{	double State;
} MTGntCraneSimpleIntegratorType;

typedef struct MTGntCraneManualTrajAxisDataType
{	float HoistLength;
	double ProfGenStates[5];
	struct MTGntCraneSimpleIntegratorType Integrator;
} MTGntCraneManualTrajAxisDataType;

typedef struct MTGntCraneManualTrajFBStateType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit SetStartValuesOld;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTGntCraneManualTrajFBStateType;

typedef struct MTGntCraneManualTrajIntType
{	double CycleTime;
	struct MTGntCraneConfigurationType Configuration;
	struct MTGntCraneManualTrajParIntType Parameters;
	struct MTGntCraneManualTrajAxisDataType Trolley;
	struct MTGntCraneManualTrajAxisDataType Hoist;
	struct MTGntCraneManualTrajAxisDataType Gantry;
	struct MTGntCraneManualTrajFBStateType StatusVariables;
} MTGntCraneManualTrajIntType;

typedef struct MTGntCraneAxesCtrlParType
{	struct MTGntCranePIParType Trolley;
	struct MTGntCranePIParType Hoist;
	struct MTGntCranePIParType Gantry;
} MTGntCraneAxesCtrlParType;

typedef struct MTGntCraneAxesParametersType
{	struct MTGntCraneDynamicParType Dynamic;
	struct MTGntCraneAxesCtrlParType Control;
} MTGntCraneAxesParametersType;

typedef struct MTGntCraneInitValuesType
{	float TrolleyPosition;
	float GantryPosition;
	struct MTGntCraneCoordinatesType LoadPosition;
} MTGntCraneInitValuesType;

typedef struct MTGntCraneNoiseFactorsType
{	float Trolley;
	float Hoist;
	float Gantry;
	float Load;
} MTGntCraneNoiseFactorsType;

typedef struct MTGntCraneSimConfigType
{	float TrolleyHeight;
	struct MTGntCraneInitValuesType InitValue;
	struct MTGntCraneActuatorsType DelayTime;
} MTGntCraneSimConfigType;

typedef struct MTGntCraneSwayHParType
{	float Mass;
	float FrictionConstant;
} MTGntCraneSwayHParType;

typedef struct MTGntCraneSwayVParType
{	float WinderRadius;
	float MomentOfInertia;
	float FrictionConstant;
} MTGntCraneSwayVParType;

typedef struct MTGntCraneSwayLParType
{	float Mass;
	struct MTGntCraneCoordinatesXZType DampingFactor;
} MTGntCraneSwayLParType;

typedef struct MTGntCraneSystemParType
{	struct MTGntCraneSwayHParType Trolley;
	struct MTGntCraneSwayVParType Hoist;
	struct MTGntCraneSwayHParType Gantry;
	struct MTGntCraneSwayLParType Load;
} MTGntCraneSystemParType;

typedef struct MTGntCraneSimModelParType
{	struct MTGntCraneSystemParType System;
	struct MTGntCraneAxesParametersType Axes;
	struct MTGntCraneNoiseFactorsType NoiseFactor;
} MTGntCraneSimModelParType;

typedef struct MTGntCraneSimDelayDataType
{	struct MTGntCraneTimeDelayFcnType SetValueBufferData[2];
} MTGntCraneSimDelayDataType;

typedef struct MTGntCrane3DPICtrlDataType
{	plcbit HoldIntegrator;
	plcbit ResetIntegrator;
	signed char InLimitation;
	float SetVelocity;
	float SetVelocityLimited;
	float SetVelocityOld;
	float ActVelocity;
	float ProportionalPart;
	float IntegrationPart;
} MTGntCrane3DPICtrlDataType;

typedef struct MTGntCraneSimModelIntDataType
{	double Pos[3];
	double Vel[3];
} MTGntCraneSimModelIntDataType;

typedef struct MTGntCraneSimTrolleyDataType
{	struct MTGntCraneSimDelayDataType Delay;
	struct MTGntCrane3DPICtrlDataType PIControl;
	float SetTorque;
	float SetTorqueAdd;
	float SetTorqueTotal;
	struct MTGntCraneSimModelIntDataType SimModelInt;
	float ActPosition;
	float ActVelocity;
} MTGntCraneSimTrolleyDataType;

typedef struct MTGntCraneSimHoistDataType
{	struct MTGntCraneSimDelayDataType Delay;
	struct MTGntCrane3DPICtrlDataType PIControl;
	float SetTorque;
	float SetTorqueAdd;
	float SetTorqueTotal;
	float MinLength;
	enum MTGntCraneSimModelModeEnum ModelMode;
	struct MTGntCraneSimModelIntDataType SimModelInt;
	float ActLength;
	float ActVelocity;
} MTGntCraneSimHoistDataType;

typedef struct MTGntCraneSimGantryDataType
{	struct MTGntCraneSimDelayDataType Delay;
	struct MTGntCrane3DPICtrlDataType PIControl;
	float SetTorque;
	float SetTorqueAdd;
	float SetTorqueTotal;
	struct MTGntCraneSimModelIntDataType SimModelInt;
	float ActPosition;
	float ActVelocity;
} MTGntCraneSimGantryDataType;

typedef struct MTGntCrane3DSphereAnglesType
{	float Theta;
	float Phi;
} MTGntCrane3DSphereAnglesType;

typedef struct MTGntCraneSimLoadDataType
{	struct MTGntCraneSimModelIntDataType SimModelIntX;
	struct MTGntCraneSimModelIntDataType SimModelIntZ;
	struct MTGntCraneCoordinatesType ActPosition;
	struct MTGntCraneCoordinatesType ActVelocity;
	struct MTGntCrane3DSphereAnglesType ActAngle;
} MTGntCraneSimLoadDataType;

typedef struct MTGntCraneSimModelStatVarType
{	plcbit ConfigurationValid;
	plcbit ParametersValid;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
} MTGntCraneSimModelStatVarType;

typedef struct MTGntCraneSimModelIntType
{	double CycleTime;
	struct MTGntCraneSimConfigType Configuration;
	struct MTGntCraneSimModelParType Parameters;
	struct MTGntCraneSimTrolleyDataType Trolley;
	struct MTGntCraneSimHoistDataType Hoist;
	struct MTGntCraneSimGantryDataType Gantry;
	struct MTGntCraneSimLoadDataType Load;
	struct MTGntCraneSimModelStatVarType StatusVariables;
} MTGntCraneSimModelIntType;

typedef struct MTGntCrane2DTrajectory
{
	/* VAR_INPUT (analog) */
	struct MTGntCrane2DConfigurationType Configuration;
	struct MTGntCrane2DCoordinatesType InitialLoadPosition;
	struct MTGntCrane2DTrajectoryParType Parameters;
	struct MTGntCrane2DCoordinatesType StartPosition;
	struct MTGntCraneCoordType StartVelocity;
	struct MTGntCrane2DCoordinatesType EndPosition;
	struct MTGntCraneCoordType EndVelocity;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetLoadX[5];
	float SetLoadY[5];
	float SetDeflectionAngleX;
	struct MTGntCrane2DTrajectoryInfoType Info;
	enum MTGntCraneMotionStateEnum MotionStateX;
	enum MTGntCraneMotionStateEnum MotionStateY;
	/* VAR (analog) */
	struct MTGntCrane2DTrajectoryIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit CalculateInfo;
	plcbit Move;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit InfoValid;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit ReplanningAllowed;
	plcbit ReplanningActive;
} MTGntCrane2DTrajectory_typ;

typedef struct MTGntCraneController
{
	/* VAR_INPUT (analog) */
	struct MTGntCraneControllerParType Parameters;
	struct MTGntCraneConfigurationType Configuration;
	struct MTGntCraneActuatorsType DelayTime;
	float SetLoadX[5];
	float SetLoadY[5];
	float SetLoadZ[5];
	float ActLoadX[3];
	float ActLoadY;
	float ActLoadZ[3];
	float ActTrolleyPosition;
	float ActGantryPosition;
	enum MTGntCraneFeedBackEnum ModeX;
	enum MTGntCraneFeedBackEnum ModeZ;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetTrolleyPosition;
	float SetHoistPosition;
	float SetGantryPosition;
	float SetTrolleyVelocity;
	float SetHoistVelocity;
	float SetGantryVelocity;
	float SetTrolleyAcceleration;
	float SetHoistAcceleration;
	float SetGantryAcceleration;
	enum MTGntCraneFeedBackEnum StateX;
	enum MTGntCraneFeedBackEnum StateZ;
	struct MTGntCraneControllerInfoType Info;
	/* VAR (analog) */
	struct MTGntCraneCtrlIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTGntCraneController_typ;

typedef struct MTGntCraneLoadObserver
{
	/* VAR_INPUT (analog) */
	struct MTGntCraneLoadObserverParType Parameters;
	struct MTGntCraneConfigurationType Configuration;
	float ActTrolleyPosition;
	float ActLoadMeasurementX;
	float ActLoadY;
	float ActGantryPosition;
	float ActLoadMeasurementZ;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float EstLoadX[3];
	float EstDeflectionAngleX;
	float EstDisturbanceX;
	float EstLoadZ[3];
	float EstDeflectionAngleZ;
	float EstDisturbanceZ;
	enum MTGntCraneObserverStateEnum StateX;
	enum MTGntCraneObserverStateEnum StateZ;
	/* VAR (analog) */
	struct MTGntCraneLoadObserverIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit InvalidMeasurementX;
	plcbit InvalidMeasurementZ;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTGntCraneLoadObserver_typ;

typedef struct MTGntCraneManualTrajectory
{
	/* VAR_INPUT (analog) */
	struct MTGntCraneManualTrajParType Parameters;
	struct MTGntCraneConfigurationType Configuration;
	struct MTGntCraneCoordinatesType InitialLoadPosition;
	float VelocityX;
	float VelocityY;
	float VelocityZ;
	float StartLoadX[5];
	float StartLoadY[5];
	float StartLoadZ[5];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float SetLoadX[5];
	float SetLoadY[5];
	float SetLoadZ[5];
	float SetDeflectionAngleX;
	float SetDeflectionAngleZ;
	enum MTGntCraneMotionStateEnum MotionStateX;
	enum MTGntCraneMotionStateEnum MotionStateY;
	enum MTGntCraneMotionStateEnum MotionStateZ;
	/* VAR (analog) */
	struct MTGntCraneManualTrajIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit SetStartValues;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit SetDone;
} MTGntCraneManualTrajectory_typ;

typedef struct MTGntCraneSimulationModel
{
	/* VAR_INPUT (analog) */
	struct MTGntCraneSimModelParType Parameters;
	struct MTGntCraneSimConfigType Configuration;
	float SetTrolleyVelocity;
	float SetTrolleyTorque;
	float SetHoistVelocity;
	float SetHoistTorque;
	float SetGantryVelocity;
	float SetGantryTorque;
	struct MTGntCraneCoordinatesType WindForce;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float ActTrolleyPosition;
	float ActTrolleyVelocity;
	float ActHoistLength;
	float ActHoistVelocity;
	float ActGantryPosition;
	float ActGantryVelocity;
	struct MTGntCraneCoordinatesType ActLoadPosition;
	struct MTGntCraneCoordinatesType ActLoadVelocity;
	/* VAR (analog) */
	struct MTGntCraneSimModelIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTGntCraneSimulationModel_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTGntCrane2DTrajectory(struct MTGntCrane2DTrajectory* inst);
_BUR_PUBLIC void MTGntCraneController(struct MTGntCraneController* inst);
_BUR_PUBLIC void MTGntCraneLoadObserver(struct MTGntCraneLoadObserver* inst);
_BUR_PUBLIC void MTGntCraneManualTrajectory(struct MTGntCraneManualTrajectory* inst);
_BUR_PUBLIC void MTGntCraneSimulationModel(struct MTGntCraneSimulationModel* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtCRN_WRN_SYSTEM_PAR_INVALID (-2131744985)
 #define mtCRN_WRN_NOISE_FACTOR_INVALID (-2131744966)
 #define mtCRN_WRN_AXIS_PAR_INVALID (-2131744984)
 #define mtCRN_WRN_OBSERVER_PAR_INVALID (-2131744971)
 #define mtCRN_WRN_MODE_INVALID (-2131744987)
 #define mtCRN_WRN_FF_MODE_INVALID (-2131744986)
 #define mtCRN_WRN_CTRL_PAR_INVALID (-2131744988)
 #define mtCRN_WRN_CRASH_DUE_TO_END_VEL (-2131744969)
 #define mtCRN_WRN_END_VEL_INVALID (-2131744958)
 #define mtCRN_WRN_END_POINT_INVALID (-2131744959)
 #define mtCRN_WRN_GEOMETRIC_PAR_INVALID (-2131744960)
 #define mtCRN_WRN_VEL_NOT_REACHED (-2131744961)
 #define mtCRN_WRN_START_EQUAL_DEST (-2131744968)
 #define mtCRN_WRN_COMMAND_INVALID (-2131744970)
 #define mtCRN_WRN_HOISTLENGTH_INVALID (-2131744964)
 #define mtCRN_WRN_DYNAMIC_PAR_INVALID (-2131744963)
 #define mtCRN_ERR_SYSTEM_PAR_INVALID (-1058003161)
 #define mtCRN_ERR_NOISE_FACTOR_INVALID (-1058003134)
 #define mtCRN_ERR_AXIS_PAR_INVALID (-1058003160)
 #define mtCRN_ERR_OBSERVER_PAR_INVALID (-1058003159)
 #define mtCRN_ERR_FF_MODE_INVALID (-1058003162)
 #define mtCRN_ERR_CTRL_PAR_INVALID (-1058003164)
 #define mtCRN_ERR_END_VEL_INVALID (-1058003139)
 #define mtCRN_ERR_START_VEL_INVALID (-1058003140)
 #define mtCRN_ERR_END_POINT_INVALID (-1058003141)
 #define mtCRN_ERR_START_POINT_INVALID (-1058003143)
 #define mtCRN_ERR_INIT_POINT_INVALID (-1058003144)
 #define mtCRN_ERR_GEOMETRIC_PAR_INVALID (-1058003145)
 #define mtCRN_ERR_DYNAMIC_PAR_INVALID (-1058003146)
 #define mtCRN_ERR_DELAY_TIME_INVALID (-1058003157)
 #define mtCRN_ERR_CONFIGURATION_INVALID (-1058003147)
#else
 _GLOBAL_CONST signed long mtCRN_WRN_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_NOISE_FACTOR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_AXIS_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_OBSERVER_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_MODE_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_FF_MODE_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_CTRL_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_CRASH_DUE_TO_END_VEL;
 _GLOBAL_CONST signed long mtCRN_WRN_END_VEL_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_END_POINT_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_GEOMETRIC_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_VEL_NOT_REACHED;
 _GLOBAL_CONST signed long mtCRN_WRN_START_EQUAL_DEST;
 _GLOBAL_CONST signed long mtCRN_WRN_COMMAND_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_HOISTLENGTH_INVALID;
 _GLOBAL_CONST signed long mtCRN_WRN_DYNAMIC_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_SYSTEM_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_NOISE_FACTOR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_AXIS_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_OBSERVER_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_FF_MODE_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_CTRL_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_END_VEL_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_START_VEL_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_END_POINT_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_START_POINT_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_INIT_POINT_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_GEOMETRIC_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_DYNAMIC_PAR_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_DELAY_TIME_INVALID;
 _GLOBAL_CONST signed long mtCRN_ERR_CONFIGURATION_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTGNTCRANE_ */

