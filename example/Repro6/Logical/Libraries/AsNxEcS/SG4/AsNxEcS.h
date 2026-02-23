/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXECS_
#define _ASNXECS_
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
typedef struct nxecsStartBusComm
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ecStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxecsStartBusComm_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void nxecsStartBusComm(struct nxecsStartBusComm* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define nxecsERR_ETHERCAT_STACK 38353U
 #define nxecsERR_TIMEOUT 38352U
 #define nxecsERR_SEND_MESSAGE 38351U
 #define nxecsERR_INVALID_DEVICE 38350U
#else
 _GLOBAL_CONST unsigned short nxecsERR_ETHERCAT_STACK;
 _GLOBAL_CONST unsigned short nxecsERR_TIMEOUT;
 _GLOBAL_CONST unsigned short nxecsERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short nxecsERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASNXECS_ */

