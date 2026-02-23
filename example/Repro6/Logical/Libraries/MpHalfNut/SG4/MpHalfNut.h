/* Automation Studio generated header file */
/* Do not edit ! */
/* MpHalfNut 6.4.0 */

#ifndef _MPHALFNUT_
#define _MPHALFNUT_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpHalfNut_VERSION
#define _MpHalfNut_VERSION 6.4.0
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
typedef enum MpHalfNutMoveTypeEnum
{	mpHALFNUT_MOVE_TYPE_SETUP = 0,
	mpHALFNUT_MOVE_TYPE_NORMAL = 1
} MpHalfNutMoveTypeEnum;

typedef enum MpHalfNutStateEnum
{	mpHALFNUT_UNDEFINED = 0,
	mpHALFNUT_CLOSE_END_POSITION = 1,
	mpHALFNUT_CLOSE_STOP_POSITION = 2,
	mpHALFNUT_CLOSE_MOVEMENT = 3,
	mpHALFNUT_OPEN_END_POSITION = 4,
	mpHALFNUT_OPEN_STOP_POSITION = 5,
	mpHALFNUT_OPEN_MOVEMENT = 6
} MpHalfNutStateEnum;

typedef enum MpHalfNutErrorEnum
{	mpHALFNUT_NO_ERROR = 0,
	mpHALFNUT_ERR_ACTIVATION = -1064239103,
	mpHALFNUT_ERR_MPLINK_NULL = -1064239102,
	mpHALFNUT_ERR_MPLINK_INVALID = -1064239101,
	mpHALFNUT_ERR_MPLINK_CHANGED = -1064239100,
	mpHALFNUT_ERR_MPLINK_CORRUPT = -1064239099,
	mpHALFNUT_ERR_MPLINK_IN_USE = -1064239098,
	mpHALFNUT_ERR_PAR_NULL = -1064239097,
	mpHALFNUT_ERR_CONFIG_NULL = -1064239096,
	mpHALFNUT_ERR_CONFIG_NO_PV = -1064239095,
	mpHALFNUT_ERR_CONFIG_LOAD = -1064239094,
	mpHALFNUT_WRN_CONFIG_LOAD = -2137980917,
	mpHALFNUT_ERR_CONFIG_SAVE = -1064239092,
	mpHALFNUT_ERR_CONFIG_INVALID = -1064239091,
	mpHALFNUT_WRN_PARAMETER_LIMITED = -2137754624,
	mpHALFNUT_WRN_CONFIG_WAIT_IDLE = -2137754623,
	mpHALFNUT_WRN_PAR_WAIT_IDLE = -2137754622
} MpHalfNutErrorEnum;

typedef enum MpHalfNutBasicAlarmEnum
{	mpHALFNUT_ALM_PARAMETER_LIMITED = 0
} MpHalfNutBasicAlarmEnum;

typedef struct MpHalfNutInputSignalsType
{	plcstring OpenEnd[256];
	plcstring CloseEnd[256];
} MpHalfNutInputSignalsType;

typedef struct MpHalfNutOutputSignalsType
{	plcstring SetVelocity[256];
	plcstring SetForce[256];
	plcstring OpenValve[256];
	plcstring CloseValve[256];
	plcstring ServoPumpParameterSet[256];
} MpHalfNutOutputSignalsType;

typedef struct MpHalfNutVelocityType
{	float Maximum;
	float SetupModeMaximum;
	float Acceleration;
	float Deceleration;
	float JoltTime;
} MpHalfNutVelocityType;

typedef struct MpHalfNutForceType
{	float Maximum;
	float SetupModeMaximum;
	float PumpForceOffset;
	float Acceleration;
	float Deceleration;
} MpHalfNutForceType;

typedef struct MpHalfNutDelayType
{	float ValveOn;
	float ValveOff;
	float AfterMove;
	float Velocity;
	float Force;
	float VelocityDuringDelay;
	float ForceDuringDelay;
} MpHalfNutDelayType;

typedef struct MpHalfNutMoveConfigType
{	plcbit UseEndSwitch;
	struct MpHalfNutVelocityType VelocityProfileLimits;
	struct MpHalfNutForceType ForceProfileLimits;
	unsigned char ServoPumpParameterSet;
	struct MpHalfNutDelayType Delay;
} MpHalfNutMoveConfigType;

typedef struct MpHalfNutBasicHConfigType
{	plcbit EnableAccelerationOverride;
	struct MpHalfNutInputSignalsType InputSignals;
	struct MpHalfNutOutputSignalsType OutputSignals;
	struct MpHalfNutMoveConfigType Open;
	struct MpHalfNutMoveConfigType Close;
} MpHalfNutBasicHConfigType;

typedef struct MpHalfNutProfileType
{	float Velocity[10];
	float Force[10];
	float Time[10];
	float AccelerationOverride[10];
} MpHalfNutProfileType;

typedef struct MpHalfNutSetupModeProfileType
{	float Velocity;
	float Force;
} MpHalfNutSetupModeProfileType;

typedef struct MpHalfNutSetupModeType
{	struct MpHalfNutSetupModeProfileType OpenProfile;
	struct MpHalfNutSetupModeProfileType CloseProfile;
} MpHalfNutSetupModeType;

typedef struct MpHalfNutBasicParType
{	struct MpHalfNutProfileType OpenProfile;
	struct MpHalfNutProfileType CloseProfile;
	struct MpHalfNutSetupModeType SetupMode;
} MpHalfNutBasicParType;

typedef struct MpHalfNutStatusIDType
{	enum MpHalfNutErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpHalfNutStatusIDType;

typedef struct MpHalfNutDiagType
{	struct MpHalfNutStatusIDType StatusID;
} MpHalfNutDiagType;

typedef struct MpHalfNutBasicInfoType
{	unsigned char StepOpen;
	unsigned char StepClose;
	enum MpHalfNutStateEnum State;
	struct MpHalfNutDiagType Diag;
} MpHalfNutBasicInfoType;

typedef struct MpHalfNutInfoType
{	struct MpHalfNutDiagType Diag;
} MpHalfNutInfoType;

typedef struct MpHalfNutBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHalfNutBasicParType* Parameters;
	enum MpHalfNutMoveTypeEnum MoveType;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHalfNutBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Open;
	plcbit Close;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpHalfNutBasic_typ;

typedef struct MpHalfNutBasicHConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpHalfNutBasicHConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpHalfNutInfoType Info;
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
} MpHalfNutBasicHConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpHalfNutBasic(struct MpHalfNutBasic* inst);
_BUR_PUBLIC void MpHalfNutBasicHConfig(struct MpHalfNutBasicHConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPHALFNUT_ */

