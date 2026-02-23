/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _FXCLOCK_
#define _FXCLOCK_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct FxClockGetPtpClock
{
	/* VAR_INPUT (analog) */
	plcstring (*Config);
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcdword ClockID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxClockGetPtpClock_typ;

typedef struct FxClockGetTstmpOfPrevSysTick
{
	/* VAR_INPUT (analog) */
	plcdword ClockID;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long Sec;
	unsigned long Nsec;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxClockGetTstmpOfPrevSysTick_typ;

typedef struct FxClockGetTime
{
	/* VAR_INPUT (analog) */
	plcdword ClockID;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long Sec;
	unsigned long Nsec;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxClockGetTime_typ;

typedef struct FxClockGetSyncInfo
{
	/* VAR_INPUT (analog) */
	plcdword ClockID;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	signed long Offset;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit IsOffsetValid;
	plcbit IsSync;
} FxClockGetSyncInfo_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void FxClockGetPtpClock(struct FxClockGetPtpClock* inst);
_BUR_PUBLIC void FxClockGetTstmpOfPrevSysTick(struct FxClockGetTstmpOfPrevSysTick* inst);
_BUR_PUBLIC void FxClockGetTime(struct FxClockGetTime* inst);
_BUR_PUBLIC void FxClockGetSyncInfo(struct FxClockGetSyncInfo* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define fxCLOCK_ERR_INVALID_CLOCK_ID (-1070582897)
 #define fxCLOCK_ERR_INVALID_CONFIG (-1070582898)
 #define fxCLOCK_ERR_CLOCK_ERROR (-1070582899)
 #define fxCLOCK_ERR_CLOCK_ID_UNSUPPORTED (-1070582900)
#else
 _GLOBAL_CONST signed long fxCLOCK_ERR_INVALID_CLOCK_ID;
 _GLOBAL_CONST signed long fxCLOCK_ERR_INVALID_CONFIG;
 _GLOBAL_CONST signed long fxCLOCK_ERR_CLOCK_ERROR;
 _GLOBAL_CONST signed long fxCLOCK_ERR_CLOCK_ID_UNSUPPORTED;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _FXCLOCK_ */

