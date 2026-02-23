/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARSRM_
#define _ARSRM_
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
typedef struct ArSrmSiteManagerParType
{	plcstring Name[81];
	plcstring Value[256];
	plcbit Null;
} ArSrmSiteManagerParType;

typedef struct ArSrmGetSiteManagerPar
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[256];
	struct ArSrmSiteManagerParType* Parameters;
	unsigned short NrOfParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring InvalidSiteManagerPar[81];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSrmGetSiteManagerPar_typ;

typedef struct ArSrmSetSiteManagerPar
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[256];
	struct ArSrmSiteManagerParType* Parameters;
	unsigned short NrOfParameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring InvalidSiteManagerPar[81];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArSrmSetSiteManagerPar_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArSrmGetSiteManagerPar(struct ArSrmGetSiteManagerPar* inst);
_BUR_PUBLIC void ArSrmSetSiteManagerPar(struct ArSrmSetSiteManagerPar* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arSRM_ERR_FORMAT (-1070583643)
 #define arSRM_ERR_INVALID_NAME (-1070583644)
 #define arSRM_ERR_INVALID_DEVICE (-1070583645)
 #define arSRM_ERR_INTERNAL (-1070583646)
#else
 _GLOBAL_CONST signed long arSRM_ERR_FORMAT;
 _GLOBAL_CONST signed long arSRM_ERR_INVALID_NAME;
 _GLOBAL_CONST signed long arSRM_ERR_INVALID_DEVICE;
 _GLOBAL_CONST signed long arSRM_ERR_INTERNAL;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARSRM_ */

