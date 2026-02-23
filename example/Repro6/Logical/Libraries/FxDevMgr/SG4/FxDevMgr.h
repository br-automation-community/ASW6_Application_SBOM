/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _FXDEVMGR_
#define _FXDEVMGR_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum FxDevMgrScopeEnum
{	fxDEVMGR_SCOPE_LOCAL = 0,
	fxDEVMGR_SCOPE_GLOBAL = 1
} FxDevMgrScopeEnum;

typedef struct FxDevMgrSetIPAddress
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	plcstring (*Address);
	enum FxDevMgrScopeEnum Scope;
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
} FxDevMgrSetIPAddress_typ;

typedef struct FxDevMgrSetHostname
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	plcstring (*Hostname);
	enum FxDevMgrScopeEnum Scope;
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
} FxDevMgrSetHostname_typ;

typedef struct FxDevMgrSetUsername
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	plcstring (*Username);
	enum FxDevMgrScopeEnum Scope;
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
} FxDevMgrSetUsername_typ;

typedef struct FxDevMgrSetPassword
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	plcstring (*Password);
	enum FxDevMgrScopeEnum Scope;
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
} FxDevMgrSetPassword_typ;

typedef struct FxDevMgrRestoreInitialSettings
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	enum FxDevMgrScopeEnum Scope;
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
} FxDevMgrRestoreInitialSettings_typ;

typedef struct FxDevMgrRebootDevice
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
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
} FxDevMgrRebootDevice_typ;

typedef struct FxDevMgrApplySoftwareUpdate
{
	/* VAR_INPUT (analog) */
	plcstring (*Device);
	plcstring (*Path);
	/* VAR_OUTPUT (analog) */
	plcstring ErrorMessage[256];
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxDevMgrApplySoftwareUpdate_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void FxDevMgrSetIPAddress(struct FxDevMgrSetIPAddress* inst);
_BUR_PUBLIC void FxDevMgrSetHostname(struct FxDevMgrSetHostname* inst);
_BUR_PUBLIC void FxDevMgrSetUsername(struct FxDevMgrSetUsername* inst);
_BUR_PUBLIC void FxDevMgrSetPassword(struct FxDevMgrSetPassword* inst);
_BUR_PUBLIC void FxDevMgrRestoreInitialSettings(struct FxDevMgrRestoreInitialSettings* inst);
_BUR_PUBLIC void FxDevMgrRebootDevice(struct FxDevMgrRebootDevice* inst);
_BUR_PUBLIC void FxDevMgrApplySoftwareUpdate(struct FxDevMgrApplySoftwareUpdate* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define fxDEVMGR_ERR_UNKNOWN (-1038011703)
 #define fxDEVMGR_ERR_DEVICE_NOT_FOUND (-1038011702)
 #define fxDEVMGR_ERR_DEVICE_ACQUIRE (-1038011701)
 #define fxDEVMGR_ERR_DEVICE_RELEASE (-1038011700)
 #define fxDEVMGR_ERR_DATA_SAVE (-1038011699)
 #define fxDEVMGR_WARN_COMMISSIONED (-2111753522)
 #define fxDEVMGR_ERR_NOT_SUPPORTED (-1038011697)
 #define fxDEVMGR_ERR_INVALID_PARAMETER (-1038011696)
 #define fxDEVMGR_ERR_TIMEOUT (-1038011695)
 #define fxDEVMGR_ERR_AUTHENTICATION_FAIL (-1038011694)
 #define fxDEVMGR_ERR_AUTHORIZATION_FAIL (-1038011693)
 #define fxDEVMGR_ERR_ACCESS_DATA_MISSING (-1038011692)
 #define fxDEVMGR_ERR_EXECUTION_FAILED (-1038011691)
#else
 _GLOBAL_CONST signed long fxDEVMGR_ERR_UNKNOWN;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_DEVICE_NOT_FOUND;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_DEVICE_ACQUIRE;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_DEVICE_RELEASE;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_DATA_SAVE;
 _GLOBAL_CONST signed long fxDEVMGR_WARN_COMMISSIONED;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_NOT_SUPPORTED;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_INVALID_PARAMETER;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_TIMEOUT;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_AUTHENTICATION_FAIL;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_AUTHORIZATION_FAIL;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_ACCESS_DATA_MISSING;
 _GLOBAL_CONST signed long fxDEVMGR_ERR_EXECUTION_FAILED;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _FXDEVMGR_ */

