/* Automation Studio generated header file */
/* Do not edit ! */
/* MpMHeight 6.4.0 */

#ifndef _MPMHEIGHT_
#define _MPMHEIGHT_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpMHeight_VERSION
#define _MpMHeight_VERSION 6.4.0
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
typedef enum MpMHeightProfileGenerationEnum
{	mpMHEIGHT_POSITION_BASED = 0,
	mpMHEIGHT_TIME_BASED = 1
} MpMHeightProfileGenerationEnum;

typedef enum MpMHeightMoveTypeEnum
{	mpMHEIGHT_MOVE_TYPE_SETUP = 0
} MpMHeightMoveTypeEnum;

typedef enum MpMHeightStateEnum
{	mpMHEIGHT_UNDEFINED = 0,
	mpMHEIGHT_NEGATIVE_END_POSITION = 1,
	mpMHEIGHT_NEGATIVE_STOP_POSITION = 2,
	mpMHEIGHT_NEGATIVE_MOVEMENT = 3,
	mpMHEIGHT_POSITIVE_END_POSITION = 4,
	mpMHEIGHT_POSITIVE_STOP_POSITION = 5,
	mpMHEIGHT_POSITIVE_MOVEMENT = 6
} MpMHeightStateEnum;

typedef enum MpMHeightErrorEnum
{	mpMHEIGHT_NO_ERROR = 0,
	mpMHEIGHT_ERR_ACTIVATION = -1064239103,
	mpMHEIGHT_ERR_MPLINK_NULL = -1064239102,
	mpMHEIGHT_ERR_MPLINK_INVALID = -1064239101,
	mpMHEIGHT_ERR_MPLINK_CHANGED = -1064239100,
	mpMHEIGHT_ERR_MPLINK_CORRUPT = -1064239099,
	mpMHEIGHT_ERR_MPLINK_IN_USE = -1064239098,
	mpMHEIGHT_ERR_PAR_NULL = -1064239097,
	mpMHEIGHT_ERR_CONFIG_NULL = -1064239096,
	mpMHEIGHT_ERR_CONFIG_NO_PV = -1064239095,
	mpMHEIGHT_ERR_CONFIG_LOAD = -1064239094,
	mpMHEIGHT_WRN_CONFIG_LOAD = -2137980917,
	mpMHEIGHT_ERR_CONFIG_SAVE = -1064239092,
	mpMHEIGHT_ERR_CONFIG_INVALID = -1064239091,
	mpMHEIGHT_WRN_PARAMETER_LIMITED = -2137762816,
	mpMHEIGHT_WRN_CONFIG_WAIT_IDLE = -2137762815,
	mpMHEIGHT_WRN_PAR_WAIT_IDLE = -2137762814,
	mpMHEIGHT_ERR_POS_MOVE_TIMEOUT = -1064020989,
	mpMHEIGHT_ERR_NEG_MOVE_TIMEOUT = -1064020988
} MpMHeightErrorEnum;

typedef enum MpMHeightBasicAlarmEnum
{	mpMHEIGHT_ALM_PARAMETER_LIMITED = 0,
	mpMHEIGHT_ALM_TIMEOUT = 1
} MpMHeightBasicAlarmEnum;

typedef struct MpMHeightInputSignalsType
{	plcstring CurrentPosition[256];
	plcstring PositiveEnd[256];
	plcstring NegativeEnd[256];
} MpMHeightInputSignalsType;

typedef struct MpMHeightOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring PositiveValve[256];
	plcstring NegativeValve[256];
} MpMHeightOutputSignalsType;

typedef struct MpMHeightVelocityType
{	float Maximum;
	float Acceleration;
	float Deceleration;
	float DeadTimeCompensation;
	float JoltTime;
} MpMHeightVelocityType;

typedef struct MpMHeightForceType
{	float Maximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpMHeightForceType;

typedef struct MpMHeightDelayType
{	float ValveOn;
	float ValveOff;
	float AfterMove;
	float Velocity;
	float Force;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpMHeightDelayType;

typedef struct MpMHeightMoveConfigType
{	enum MpMHeightProfileGenerationEnum ProfileGeneration;
	struct MpMHeightVelocityType VelocityProfileLimits;
	struct MpMHeightForceType ForceProfileLimits;
	float PositionTolerance;
	float TimeTolerance;
	plcbit UseEndSwitch;
	struct MpMHeightDelayType Delay;
} MpMHeightMoveConfigType;

typedef struct MpMHeightBasicHConfigType
{	float MaxPosition;
	float VelocityFilterTime;
	struct MpMHeightInputSignalsType InputSignals;
	struct MpMHeightOutputSignalsType OutputSignals;
	struct MpMHeightMoveConfigType Positive;
	struct MpMHeightMoveConfigType Negative;
} MpMHeightBasicHConfigType;

typedef struct MpMHeightSetupModeProfileType
{	float Velocity;
	float Force;
	float Time;
	float TimeOut;
} MpMHeightSetupModeProfileType;

typedef struct MpMHeightSetupModeType
{	struct MpMHeightSetupModeProfileType PositiveProfile;
	struct MpMHeightSetupModeProfileType NegativeProfile;
} MpMHeightSetupModeType;

typedef struct MpMHeightBasicParType
{	struct MpMHeightSetupModeType SetupMode;
} MpMHeightBasicParType;

typedef struct MpMHeightStatusIDType
{	enum MpMHeightErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpMHeightStatusIDType;

typedef struct MpMHeightDiagType
{	struct MpMHeightStatusIDType StatusID;
} MpMHeightDiagType;

typedef struct MpMHeightInfoType
{	struct MpMHeightDiagType Diag;
} MpMHeightInfoType;

typedef struct MpMHeightBasicInfoType
{	float Velocity;
	float MinPosition;
	float MaxPosition;
	enum MpMHeightStateEnum State;
	struct MpMHeightDiagType Diag;
} MpMHeightBasicInfoType;

typedef struct MpMHeightBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpMHeightBasicParType* Parameters;
	enum MpMHeightMoveTypeEnum MoveType;
	float TargetPosition;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpMHeightBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Positive;
	plcbit Negative;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpMHeightBasic_typ;

typedef struct MpMHeightBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpMHeightBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpMHeightInfoType Info;
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
} MpMHeightBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpMHeightBasic(struct MpMHeightBasic* inst);
_BUR_PUBLIC void MpMHeightBasicHConfig(struct MpMHeightBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPMHEIGHT_ */

