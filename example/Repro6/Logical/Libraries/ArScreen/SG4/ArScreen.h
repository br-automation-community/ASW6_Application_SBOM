/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARSCREEN_
#define _ARSCREEN_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct ArScreenGetBrightness
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned char Percent;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenGetBrightness_typ;

typedef struct ArScreenSetBrightness
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	unsigned char Percent;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenSetBrightness_typ;

typedef struct ArScreenAwake
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenAwake_typ;

typedef struct ArScreenEnableRemoteControl
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenEnableRemoteControl_typ;

typedef struct ArScreenDisableRemoteControl
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenDisableRemoteControl_typ;

typedef struct ArScreenTriggerGPOSUpdate
{
	/* VAR_INPUT (analog) */
	unsigned long Screen;
	plcstring Url[514];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArScreenTriggerGPOSUpdate_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArScreenGetBrightness(struct ArScreenGetBrightness* inst);
_BUR_PUBLIC void ArScreenSetBrightness(struct ArScreenSetBrightness* inst);
_BUR_PUBLIC void ArScreenAwake(struct ArScreenAwake* inst);
_BUR_PUBLIC void ArScreenEnableRemoteControl(struct ArScreenEnableRemoteControl* inst);
_BUR_PUBLIC void ArScreenDisableRemoteControl(struct ArScreenDisableRemoteControl* inst);
_BUR_PUBLIC void ArScreenTriggerGPOSUpdate(struct ArScreenTriggerGPOSUpdate* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arSCREEN_ERR_NOT_SUPPORTED (-1070583244)
 #define arSCREEN_ERR_INVALID_BRIGHTNESS (-1070583245)
 #define arSCREEN_ERR_INVALID_SCREEN (-1070583246)
 #define arSCREEN_SCREEN_1 1U
 #define arSCREEN_SCREEN_ALL 0U
#else
 _GLOBAL_CONST signed long arSCREEN_ERR_NOT_SUPPORTED;
 _GLOBAL_CONST signed long arSCREEN_ERR_INVALID_BRIGHTNESS;
 _GLOBAL_CONST signed long arSCREEN_ERR_INVALID_SCREEN;
 _GLOBAL_CONST unsigned long arSCREEN_SCREEN_1;
 _GLOBAL_CONST unsigned long arSCREEN_SCREEN_ALL;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARSCREEN_ */

