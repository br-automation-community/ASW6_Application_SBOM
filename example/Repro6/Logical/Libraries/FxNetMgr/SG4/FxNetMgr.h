/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _FXNETMGR_
#define _FXNETMGR_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum FxNetMgrNetworkStateEnum
{	fxNETMGR_NET_STATE_UNINIT = 0,
	fxNETMGR_NET_STATE_INIT = 1,
	fxNETMGR_NET_STATE_IN_PROGRESS = 2,
	fxNETMGR_NET_STATE_ERROR = 3,
	fxNETMGR_NET_STATE_OPERATIONAL = 4
} FxNetMgrNetworkStateEnum;

typedef enum FxNetMgrCommandEnum
{	fxNETMGR_CMD_STARTUP_NETWORK = 0,
	fxNETMGR_CMD_DEPLOY_TSN_CONFIG = 1,
	fxNETMGR_CMD_VERIFY_TOPOLOGY = 2
} FxNetMgrCommandEnum;

typedef enum FxNetMgrProcessingStrategyEnum
{	fxNETMGR_PROC_STRAT_INITIAL = 0,
	fxNETMGR_PROC_STRAT_INCREMENTAL = 1
} FxNetMgrProcessingStrategyEnum;

typedef enum FxNetMgrErrorStateEnum
{	fxNETMGR_ERROR_NONE = 0,
	fxNETMGR_ERROR_TOP_VERIFICATION = 1,
	fxNETMGR_ERROR_DEVICE_CONFIG = 2,
	fxNETMGR_ERROR_TSN_CONFIG = 3,
	fxNETMGR_ERROR_NETWORK_SYSTEM = 4,
	fxNETMGR_ERROR_APP_CONFIG = 5,
	fxNETMGR_ERROR_TIMESYNC_CONFIG = 6,
	fxNETMGR_ERROR_DEVICE_REBOOT = 7
} FxNetMgrErrorStateEnum;

typedef struct FxNetMgrTriggerCmdExecution
{
	/* VAR_INPUT (analog) */
	enum FxNetMgrCommandEnum Command;
	enum FxNetMgrProcessingStrategyEnum Strategy;
	plcstring (*Domain);
	unsigned long TimeoutSec;
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
} FxNetMgrTriggerCmdExecution_typ;

typedef struct FxNetMgrGetNetworkState
{
	/* VAR_INPUT (analog) */
	plcstring (*Domain);
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum FxNetMgrNetworkStateEnum State;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit NetMgrBusy;
} FxNetMgrGetNetworkState_typ;

typedef struct FxNetMgrGetLastError
{
	/* VAR_INPUT (analog) */
	plcstring (*Domain);
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum FxNetMgrErrorStateEnum LastError;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxNetMgrGetLastError_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void FxNetMgrTriggerCmdExecution(struct FxNetMgrTriggerCmdExecution* inst);
_BUR_PUBLIC void FxNetMgrGetNetworkState(struct FxNetMgrGetNetworkState* inst);
_BUR_PUBLIC void FxNetMgrGetLastError(struct FxNetMgrGetLastError* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define fxNETMGR_ERR_UNKNOWN (-1038009704)
 #define fxNETMGR_ERR_BUSY (-1038009703)
 #define fxNETMGR_ERR_NOT_INITIALIZED (-1038009702)
 #define fxNETMGR_ERR_NOT_SUPPORTED (-1038009701)
 #define fxNETMGR_ERR_INVALID_PARAM (-1038009700)
#else
 _GLOBAL_CONST signed long fxNETMGR_ERR_UNKNOWN;
 _GLOBAL_CONST signed long fxNETMGR_ERR_BUSY;
 _GLOBAL_CONST signed long fxNETMGR_ERR_NOT_INITIALIZED;
 _GLOBAL_CONST signed long fxNETMGR_ERR_NOT_SUPPORTED;
 _GLOBAL_CONST signed long fxNETMGR_ERR_INVALID_PARAM;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _FXNETMGR_ */

