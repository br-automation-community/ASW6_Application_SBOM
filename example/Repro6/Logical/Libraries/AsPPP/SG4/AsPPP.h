/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASPPP_
#define _ASPPP_
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
typedef struct pppPARAMETER_typ
{	unsigned long pHostAddr;
	unsigned long pPeerAddr;
	unsigned long pOptions;
	unsigned long pSecrets;
	unsigned long sectablen;
} pppPARAMETER_typ;

typedef struct PPPStart
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pDeviceParam;
	unsigned long pPppParam;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} PPPStart_typ;

typedef struct PPPStop
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} PPPStop_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void PPPStart(struct PPPStart* inst);
_BUR_PUBLIC void PPPStop(struct PPPStop* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define pppERR_INVALID_DEVICE 32000U
#else
 _GLOBAL_CONST unsigned short pppERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASPPP_ */

