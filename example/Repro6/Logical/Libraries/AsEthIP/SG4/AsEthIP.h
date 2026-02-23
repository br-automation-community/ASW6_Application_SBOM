/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASETHIP_
#define _ASETHIP_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <AsARCfg.h>
#include <brsystem.h>
#include <AsIecCon.h>
#include <DataObj.h>
#include <runtime.h>
#include <sys_lib.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct EIPExit
{
	/* VAR_INPUT (analog) */
	unsigned long handle;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} EIPExit_typ;

typedef struct EIPCyclic
{
	/* VAR_INPUT (analog) */
	unsigned long handle;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} EIPCyclic_typ;

typedef struct EIPInit
{
	/* VAR_INPUT (analog) */
	unsigned long pconfig;
	/* VAR_OUTPUT (analog) */
	plcstring extstatus[81];
	unsigned long handle;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} EIPInit_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void EIPExit(struct EIPExit* inst);
_BUR_PUBLIC void EIPCyclic(struct EIPCyclic* inst);
_BUR_PUBLIC void EIPInit(struct EIPInit* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ASETHIP_ */

