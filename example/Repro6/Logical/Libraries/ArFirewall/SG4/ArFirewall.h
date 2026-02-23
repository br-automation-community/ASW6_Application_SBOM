/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARFIREWALL_
#define _ARFIREWALL_
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
typedef struct ArFirewallAddRule
{
	/* VAR_INPUT (analog) */
	plcstring Rule[257];
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
} ArFirewallAddRule_typ;

typedef struct ArFirewallDeleteAllRules
{
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
} ArFirewallDeleteAllRules_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArFirewallAddRule(struct ArFirewallAddRule* inst);
_BUR_PUBLIC void ArFirewallDeleteAllRules(struct ArFirewallDeleteAllRules* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arFIREWALL_ERR_SYSTEM (-1070583545)
 #define arFIREWALL_ERR_INVALID_RULE (-1070583546)
#else
 _GLOBAL_CONST signed long arFIREWALL_ERR_SYSTEM;
 _GLOBAL_CONST signed long arFIREWALL_ERR_INVALID_RULE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARFIREWALL_ */

