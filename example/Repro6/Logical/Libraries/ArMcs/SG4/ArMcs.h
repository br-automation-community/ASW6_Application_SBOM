/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARMCS_
#define _ARMCS_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>
#include <astime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct ArMcsAsyncInternalType
{	struct ArFBStateInternalType FBStateCtx;
	struct ArFBAsyFuMaInternalType AsyFuMaCtx;
} ArMcsAsyncInternalType;

typedef struct ArMcsRecreateCert
{
	/* VAR_INPUT (analog) */
	plcstring McsName[256];
	plcstring URI[514];
	unsigned long DnsNames;
	unsigned long DnsNameCount;
	unsigned long IPs;
	unsigned long IPCount;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArMcsAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArMcsRecreateCert_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArMcsRecreateCert(struct ArMcsRecreateCert* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arMCS_ERR_URI_INVALID (-1070582342)
 #define arMCS_ERR_INVALID (-1070582343)
 #define arMCS_ERR_IP_INVALID (-1070582344)
 #define arMCS_ERR_DNS_INVALID (-1070582345)
 #define arMCS_ERR_INTERNAL (-1070582346)
#else
 _GLOBAL_CONST signed long arMCS_ERR_URI_INVALID;
 _GLOBAL_CONST signed long arMCS_ERR_INVALID;
 _GLOBAL_CONST signed long arMCS_ERR_IP_INVALID;
 _GLOBAL_CONST signed long arMCS_ERR_DNS_INVALID;
 _GLOBAL_CONST signed long arMCS_ERR_INTERNAL;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARMCS_ */

