/* Automation Studio generated header file */
/* Do not edit ! */
/* MpSafeGate 6.4.0 */

#ifndef _MPSAFEGATE_
#define _MPSAFEGATE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpSafeGate_VERSION
#define _MpSafeGate_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpSafeGateSwitchTypeEnum
{	mpSAFEGATE_SWITCH_NONE = 0,
	mpSAFEGATE_SWITCH_SINGLE_PULSE = 1,
	mpSAFEGATE_SWITCH_LEVEL = 2
} MpSafeGateSwitchTypeEnum;

typedef enum MpSafeGateErrorEnum
{	mpSAFEGATE_NO_ERROR = 0,
	mpSAFEGATE_ERR_ACTIVATION = -1064239103,
	mpSAFEGATE_ERR_MPLINK_NULL = -1064239102,
	mpSAFEGATE_ERR_MPLINK_INVALID = -1064239101,
	mpSAFEGATE_ERR_MPLINK_CHANGED = -1064239100,
	mpSAFEGATE_ERR_MPLINK_CORRUPT = -1064239099,
	mpSAFEGATE_ERR_MPLINK_IN_USE = -1064239098,
	mpSAFEGATE_ERR_PAR_NULL = -1064239097,
	mpSAFEGATE_ERR_CONFIG_NULL = -1064239096,
	mpSAFEGATE_ERR_CONFIG_NO_PV = -1064239095,
	mpSAFEGATE_ERR_CONFIG_LOAD = -1064239094,
	mpSAFEGATE_WRN_CONFIG_LOAD = -2137980917,
	mpSAFEGATE_ERR_CONFIG_SAVE = -1064239092,
	mpSAFEGATE_ERR_CONFIG_INVALID = -1064239091,
	mpSAFEGATE_WRN_OPEN_TIMEOUT = -2137730048,
	mpSAFEGATE_WRN_CLOSE_TIMEOUT = -2137730047
} MpSafeGateErrorEnum;

typedef enum MpSafeGateBasicAlarmEnum
{	mpSAFEGATE_ALM_NO_END_SWITCH = 0,
	mpSAFEGATE_ALM_NO_SLOW_SWITCH = 1
} MpSafeGateBasicAlarmEnum;

typedef struct MpSafeGateInputSignalsType
{	plcstring OpenEnd[256];
	plcstring OpenSlow[256];
	plcstring CloseEnd[256];
	plcstring CloseSlow[256];
} MpSafeGateInputSignalsType;

typedef struct MpSafeGateOutputSignalsType
{	plcstring OpenValve[256];
	plcstring CloseValve[256];
	plcstring OpenFast[256];
	plcstring CloseFast[256];
} MpSafeGateOutputSignalsType;

typedef struct MpSafeGateConfigDirType
{	float MoveTime;
	float DelayTime;
	float Timeout;
	enum MpSafeGateSwitchTypeEnum SlowdownSwitchType;
	enum MpSafeGateSwitchTypeEnum EndSwitchType;
} MpSafeGateConfigDirType;

typedef struct MpSafeGateBasicPConfigType
{	plcstring Location[101];
	struct MpSafeGateInputSignalsType InputSignals;
	struct MpSafeGateOutputSignalsType OutputSignals;
	struct MpSafeGateConfigDirType Open;
	struct MpSafeGateConfigDirType Close;
} MpSafeGateBasicPConfigType;

typedef struct MpSafeGateStatusIDType
{	enum MpSafeGateErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpSafeGateStatusIDType;

typedef struct MpSafeGateDiagType
{	struct MpSafeGateStatusIDType StatusID;
} MpSafeGateDiagType;

typedef struct MpSafeGateInfoType
{	struct MpSafeGateDiagType Diag;
} MpSafeGateInfoType;

typedef struct MpSafeGateBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpSafeGateInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Open;
	plcbit Close;
	plcbit Stop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit InPosition;
	plcbit Stopped;
	plcbit MoveActive;
} MpSafeGateBasic_typ;

typedef struct MpSafeGateBasicPConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpSafeGateBasicPConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpSafeGateInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpSafeGateBasicPConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpSafeGateBasic(struct MpSafeGateBasic* inst);
_BUR_PUBLIC void MpSafeGateBasicPConfig(struct MpSafeGateBasicPConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPSAFEGATE_ */

