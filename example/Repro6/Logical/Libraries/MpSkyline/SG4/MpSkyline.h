/* Automation Studio generated header file */
/* Do not edit ! */
/* MpSkyline 6.5.1 */

#ifndef _MPSKYLINE_
#define _MPSKYLINE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpSkyline_VERSION
#define _MpSkyline_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "sys_lib.h"
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "sys_lib.h"
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "sys_lib.h"
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpSkylineErrorEnum
{	mpSKYLINE_NO_ERROR = 0,
	mpSKYLINE_ERR_ACTIVATION = -1064239103,
	mpSKYLINE_ERR_MPLINK_NULL = -1064239102,
	mpSKYLINE_ERR_MPLINK_INVALID = -1064239101,
	mpSKYLINE_ERR_MPLINK_CHANGED = -1064239100,
	mpSKYLINE_ERR_MPLINK_CORRUPT = -1064239099,
	mpSKYLINE_ERR_MPLINK_IN_USE = -1064239098,
	mpSKYLINE_ERR_PAR_NULL = -1064239097,
	mpSKYLINE_ERR_CONFIG_INVALID = -1064239091,
	mpSKYLINE_ERR_OPTION_STATE = -1064126464,
	mpSKYLINE_ERR_OPTION_COLLECTION = -1064126463,
	mpSKYLINE_ERR_MISSING_STATE = -1064126462,
	mpSKYLINE_ERR_SIZE_STATE = -1064126461,
	mpSKYLINE_ERR_MODULE = -1064126460,
	mpSKYLINE_ERR_MODULE_STATE = -1064126459,
	mpSKYLINE_ERR_NOTIFICATION = -1064126458,
	mpSKYLINE_ERR_MPSERVER_MISSING = -1064126457,
	mpSKYLINE_WRN_SIZE_TOO_SMALL = -2137868280,
	mpSKYLINE_INF_INITIALIZED = 1083357193,
	mpSKYLINE_INF_CONFIG_CHANGED = 1083357194
} MpSkylineErrorEnum;

typedef enum MpSkylineAlarmEnum
{	mpSKYLINE_ALM_INVALID_CONFIG = 0
} MpSkylineAlarmEnum;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC signed long MpSkylineSetModuleState(struct MpComIdentType* MpLink, plcstring* Module, plcstring* State);
_BUR_PUBLIC signed long MpSkylineSetNotification(struct MpComIdentType* MpLink, plcstring* Module, plcstring* Notification);
_BUR_PUBLIC signed long MpSkylineResetNotification(struct MpComIdentType* MpLink, plcstring* Module, plcstring* Notification);
_BUR_PUBLIC signed long MpSkylineSetOptionState(struct MpComIdentType* MpLink, plcstring* Module, plcstring* Option, plcstring* State);
_BUR_PUBLIC signed long MpSkylineCheckOptionState(struct MpComIdentType* MpLink, plcstring* Module, plcstring* Option, plcstring* CurrentState, unsigned long CurrentStateSize);


#ifdef __cplusplus
};
#endif
#endif /* _MPSKYLINE_ */

