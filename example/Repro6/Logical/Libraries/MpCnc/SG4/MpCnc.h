/* Automation Studio generated header file */
/* Do not edit ! */
/* MpCnc 6.5.1 */

#ifndef _MPCNC_
#define _MPCNC_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpCnc_VERSION
#define _MpCnc_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McAxGroup.h> 
#include <MpBase.h>
#endif
 
#ifdef _SG3
#include <McAxGroup.h> 
#include <MpBase.h>
#endif
 
#ifdef _SGC
#include <McAxGroup.h> 
#include <MpBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum MpCncErrorEnum
{	mcCNC_NO_ERROR = 0,
	mcCNC_ERR_AXES_GROUP = -1067212544,
	mcCNC_WRN_OVR_OUT_OF_RANGE = -2140954367,
	mcCNC_INF_NOT_ENOUGH_AXES = 1080271106,
	mcCNC_WRN_CMD_NOT_ALLOWED = -2140954365,
	mcCNC_ERR_ACTIVATION = -1064239103,
	mcCNC_ERR_MPLINK_NULL = -1064239102,
	mcCNC_ERR_MPLINK_INVALID = -1064239101,
	mcCNC_ERR_MPLINK_CHANGED = -1064239100,
	mcCNC_ERR_MPLINK_CORRUPT = -1064239099,
	mcCNC_ERR_MPLINK_IN_USE = -1064239098,
	mcCNC_ERR_PAR_NULL = -1064239097,
	mcCNC_ERR_POWERED_OFF = -1067212540
} MpCncErrorEnum;

typedef struct MpCncStatusIDType
{	enum MpCncErrorEnum ID;
	enum MpComSeveritiesEnum Severity;
} MpCncStatusIDType;

typedef struct MpCncDiagExtType
{	struct MpCncStatusIDType StatusID;
} MpCncDiagExtType;

typedef struct MpCnc5AxisInfoType
{	plcbit CommunicationReady;
	plcbit ReadyToPowerOn;
	plcbit WaitForContinue;
	struct McPrgInfoType Program;
	struct McPathInfoType Path;
	enum McJogStatusEnum JogStatus;
	enum McGroupPLCopenStateEnum PLCopenState;
	struct MpCncDiagExtType Diag;
} MpCnc5AxisInfoType;

typedef struct MpCnc4AxisInfoType
{	plcbit CommunicationReady;
	plcbit ReadyToPowerOn;
	plcbit WaitForContinue;
	struct McPrgInfoType Program;
	struct McPathInfoType Path;
	enum McJogStatusEnum JogStatus;
	enum McGroupPLCopenStateEnum PLCopenState;
	struct MpCncDiagExtType Diag;
} MpCnc4AxisInfoType;

typedef struct MpCnc3AxisInfoType
{	plcbit CommunicationReady;
	plcbit ReadyToPowerOn;
	plcbit WaitForContinue;
	struct McPrgInfoType Program;
	struct McPathInfoType Path;
	enum McJogStatusEnum JogStatus;
	enum McGroupPLCopenStateEnum PLCopenState;
	struct MpCncDiagExtType Diag;
} MpCnc3AxisInfoType;

typedef struct MpCnc2AxisInfoType
{	plcbit CommunicationReady;
	plcbit ReadyToPowerOn;
	plcbit WaitForContinue;
	struct McPrgInfoType Program;
	struct McPathInfoType Path;
	enum McJogStatusEnum JogStatus;
	enum McGroupPLCopenStateEnum PLCopenState;
	struct MpCncDiagExtType Diag;
} MpCnc2AxisInfoType;

typedef struct MpCnc2AxisJogType
{	float Velocity[2];
	struct McJogPathLimitsType PathLimits;
	unsigned long CoordSystem;
} MpCnc2AxisJogType;

typedef struct MpCnc2AxisParType
{	plcstring ProgramName[261];
	struct McPrgAdvParType MoveProgramOptions;
	struct MpCnc2AxisJogType Jog;
	plcstring Block[261];
} MpCnc2AxisParType;

typedef struct MpCnc5AxisJogType
{	float Velocity[5];
	struct McJogPathLimitsType PathLimits;
	unsigned long CoordSystem;
} MpCnc5AxisJogType;

typedef struct MpCnc5AxisParType
{	plcstring ProgramName[261];
	struct McPrgAdvParType MoveProgramOptions;
	struct MpCnc5AxisJogType Jog;
	plcstring Block[261];
} MpCnc5AxisParType;

typedef struct MpCnc4AxisJogType
{	float Velocity[4];
	struct McJogPathLimitsType PathLimits;
	unsigned long CoordSystem;
} MpCnc4AxisJogType;

typedef struct MpCnc4AxisParType
{	plcstring ProgramName[261];
	struct McPrgAdvParType MoveProgramOptions;
	struct MpCnc4AxisJogType Jog;
	plcstring Block[261];
} MpCnc4AxisParType;

typedef struct MpCnc3AxisJogType
{	float Velocity[3];
	struct McJogPathLimitsType PathLimits;
	unsigned long CoordSystem;
} MpCnc3AxisJogType;

typedef struct MpCnc3AxisParType
{	plcstring ProgramName[261];
	struct McPrgAdvParType MoveProgramOptions;
	struct MpCnc3AxisJogType Jog;
	plcstring Block[261];
} MpCnc3AxisParType;

typedef struct MpCncFlexJogType
{	float Velocity[15];
	struct McJogPathLimitsType PathLimits;
	unsigned long CoordSystem;
} MpCncFlexJogType;

typedef struct MpCncFlexParType
{	plcstring ProgramName[261];
	struct McPrgAdvParType MoveProgramOptions;
	struct MpCncFlexJogType Jog;
	plcstring Block[261];
} MpCncFlexParType;

typedef struct MpCncFlexInfoType
{	plcbit CommunicationReady;
	plcbit ReadyToPowerOn;
	plcbit WaitForContinue;
	struct McPrgInfoType Program;
	struct McPathInfoType Path;
	enum McJogStatusEnum JogStatus;
	enum McGroupPLCopenStateEnum PLCopenState;
	struct MpCncDiagExtType Diag;
} MpCncFlexInfoType;

typedef struct MpCnc2Axis
{
	/* VAR_INPUT (analog) */
	struct McAxesGroupType* MpLink;
	struct MpCnc2AxisParType* Parameters;
	float Override;
	float RapidOverride;
	float FeedrateOverride;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double X;
	double Y;
	float PathVelocity;
	struct MpCnc2AxisInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Power;
	plcbit Home;
	plcbit MoveProgram;
	plcbit Interrupt;
	plcbit Continue;
	plcbit Stop;
	plcbit Jog;
	plcbit MoveBlock;
	plcbit SingleStep;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandAborted;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit MoveActive;
	plcbit MoveInterrupted;
	plcbit InMotion;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit SingleStepActive;
} MpCnc2Axis_typ;

typedef struct MpCnc3Axis
{
	/* VAR_INPUT (analog) */
	struct McAxesGroupType* MpLink;
	struct MpCnc3AxisParType* Parameters;
	float Override;
	float RapidOverride;
	float FeedrateOverride;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double X;
	double Y;
	double Z;
	float PathVelocity;
	struct MpCnc3AxisInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Power;
	plcbit Home;
	plcbit MoveProgram;
	plcbit Interrupt;
	plcbit Continue;
	plcbit Stop;
	plcbit Jog;
	plcbit MoveBlock;
	plcbit SingleStep;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandAborted;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit MoveActive;
	plcbit MoveInterrupted;
	plcbit InMotion;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit SingleStepActive;
} MpCnc3Axis_typ;

typedef struct MpCnc4Axis
{
	/* VAR_INPUT (analog) */
	struct McAxesGroupType* MpLink;
	struct MpCnc4AxisParType* Parameters;
	float Override;
	float RapidOverride;
	float FeedrateOverride;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double X;
	double Y;
	double Z;
	double C;
	float PathVelocity;
	struct MpCnc4AxisInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Power;
	plcbit Home;
	plcbit MoveProgram;
	plcbit Interrupt;
	plcbit Continue;
	plcbit Stop;
	plcbit Jog;
	plcbit MoveBlock;
	plcbit SingleStep;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandAborted;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit MoveActive;
	plcbit MoveInterrupted;
	plcbit InMotion;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit SingleStepActive;
} MpCnc4Axis_typ;

typedef struct MpCnc5Axis
{
	/* VAR_INPUT (analog) */
	struct McAxesGroupType* MpLink;
	struct MpCnc5AxisParType* Parameters;
	float Override;
	float RapidOverride;
	float FeedrateOverride;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double X;
	double Y;
	double Z;
	double C;
	double A;
	float PathVelocity;
	struct MpCnc5AxisInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Power;
	plcbit Home;
	plcbit MoveProgram;
	plcbit Interrupt;
	plcbit Continue;
	plcbit Stop;
	plcbit Jog;
	plcbit MoveBlock;
	plcbit SingleStep;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandAborted;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit MoveActive;
	plcbit MoveInterrupted;
	plcbit InMotion;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit SingleStepActive;
} MpCnc5Axis_typ;

typedef struct MpCncFlex
{
	/* VAR_INPUT (analog) */
	struct McAxesGroupType* MpLink;
	struct MpCncFlexParType* Parameters;
	float Override;
	float RapidOverride;
	float FeedrateOverride;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double Position[15];
	float PathVelocity;
	struct MpCncFlexInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Update;
	plcbit Power;
	plcbit Home;
	plcbit MoveProgram;
	plcbit Interrupt;
	plcbit Continue;
	plcbit Stop;
	plcbit Jog;
	plcbit MoveBlock;
	plcbit SingleStep;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit CommandBusy;
	plcbit CommandAborted;
	plcbit PowerOn;
	plcbit IsHomed;
	plcbit MoveActive;
	plcbit MoveInterrupted;
	plcbit InMotion;
	plcbit MoveDone;
	plcbit Stopped;
	plcbit SingleStepActive;
} MpCncFlex_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpCnc2Axis(struct MpCnc2Axis* inst);
_BUR_PUBLIC void MpCnc3Axis(struct MpCnc3Axis* inst);
_BUR_PUBLIC void MpCnc4Axis(struct MpCnc4Axis* inst);
_BUR_PUBLIC void MpCnc5Axis(struct MpCnc5Axis* inst);
_BUR_PUBLIC void MpCncFlex(struct MpCncFlex* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPCNC_ */

