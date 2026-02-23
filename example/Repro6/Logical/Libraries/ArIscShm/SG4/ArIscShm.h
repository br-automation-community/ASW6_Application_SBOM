/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARISCSHM_
#define _ARISCSHM_
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
typedef struct ArIscShmOpen
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	unsigned long Ident;
	signed long StatusID;
	unsigned long Size;
	unsigned long Address;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArIscShmOpen_typ;

typedef struct ArIscShmClose
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
} ArIscShmClose_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArIscShmOpen(struct ArIscShmOpen* inst);
_BUR_PUBLIC void ArIscShmClose(struct ArIscShmClose* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arISCSHM_ERR_IDENT_INVALID (-1070583445)
 #define arISCSHM_ERR_OPEN (-1070583446)
#else
 _GLOBAL_CONST signed long arISCSHM_ERR_IDENT_INVALID;
 _GLOBAL_CONST signed long arISCSHM_ERR_OPEN;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARISCSHM_ */

