/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARISCEVENT_
#define _ARISCEVENT_
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
typedef struct ArIscEventCreate
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	unsigned long Ident;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArIscEventCreate_typ;

typedef struct ArIscEventOpen
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	unsigned long Ident;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArIscEventOpen_typ;

typedef struct ArIscEventTrigger
{
	/* VAR_INPUT (analog) */
	unsigned long Ident;
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
} ArIscEventTrigger_typ;

typedef struct ArIscEventWait
{
	/* VAR_INPUT (analog) */
	unsigned long Ident;
	unsigned long Timeout;
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
} ArIscEventWait_typ;

typedef struct ArIscEventClose
{
	/* VAR_INPUT (analog) */
	unsigned long Ident;
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
} ArIscEventClose_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArIscEventCreate(struct ArIscEventCreate* inst);
_BUR_PUBLIC void ArIscEventOpen(struct ArIscEventOpen* inst);
_BUR_PUBLIC void ArIscEventTrigger(struct ArIscEventTrigger* inst);
_BUR_PUBLIC void ArIscEventWait(struct ArIscEventWait* inst);
_BUR_PUBLIC void ArIscEventClose(struct ArIscEventClose* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arISCEVENT_INFINITE_TIME 4294967295U
 #define arISCEVENT_ERR_WAIT (-1070583391)
 #define arISCEVENT_ERR_TRIGGER (-1070583392)
 #define arISCEVENT_ERR_OPEN (-1070583393)
 #define arISCEVENT_ERR_CREATE (-1070583394)
 #define arISCEVENT_ERR_CLOSE (-1070583395)
#else
 _GLOBAL_CONST unsigned long arISCEVENT_INFINITE_TIME;
 _GLOBAL_CONST signed long arISCEVENT_ERR_WAIT;
 _GLOBAL_CONST signed long arISCEVENT_ERR_TRIGGER;
 _GLOBAL_CONST signed long arISCEVENT_ERR_OPEN;
 _GLOBAL_CONST signed long arISCEVENT_ERR_CREATE;
 _GLOBAL_CONST signed long arISCEVENT_ERR_CLOSE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARISCEVENT_ */

