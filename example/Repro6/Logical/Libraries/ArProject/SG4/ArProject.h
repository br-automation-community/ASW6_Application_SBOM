/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARPROJECT_
#define _ARPROJECT_
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
typedef struct ArProjectGetInfo
{
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring ConfigurationID[256];
	plcstring ConfigurationVersion[33];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArProjectGetInfo_typ;

typedef struct ArProjectGetPackageInfo
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[129];
	plcstring FilePath[257];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring ConfigurationID[256];
	plcstring ConfigurationVersion[33];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArProjectGetPackageInfo_typ;

typedef struct ArProjectInstallPackage
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[129];
	plcstring FilePath[257];
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
} ArProjectInstallPackage_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArProjectGetInfo(struct ArProjectGetInfo* inst);
_BUR_PUBLIC void ArProjectGetPackageInfo(struct ArProjectGetPackageInfo* inst);
_BUR_PUBLIC void ArProjectInstallPackage(struct ArProjectInstallPackage* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arPROJECT_ERR_INVALID_PACKAGE (-1070584044)
 #define arPROJECT_ERR_FILE (-1070584045)
 #define arPROJECT_ERR_DEVICE (-1070584046)
#else
 _GLOBAL_CONST signed long arPROJECT_ERR_INVALID_PACKAGE;
 _GLOBAL_CONST signed long arPROJECT_ERR_FILE;
 _GLOBAL_CONST signed long arPROJECT_ERR_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARPROJECT_ */

