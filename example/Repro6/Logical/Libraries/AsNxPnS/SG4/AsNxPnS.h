/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXPNS_
#define _ASNXPNS_
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
typedef struct nxpnsProcessAlarm
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long deviceHandle;
	unsigned long alarmHandle;
	unsigned short userStructId;
	unsigned long api;
	unsigned long slot;
	unsigned long subslot;
	unsigned short alarmDataLen;
	unsigned long pAlarmData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long pnIoStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsProcessAlarm_typ;

typedef struct nxpnsDiagnosisAlarm
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long deviceHandle;
	unsigned long alarmHandle;
	unsigned long diagHandle;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long pnIoStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsDiagnosisAlarm_typ;

typedef struct nxpnsPlugModule
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long deviceHandle;
	unsigned long api;
	unsigned long slot;
	unsigned long moduleId;
	unsigned short moduleState;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsPlugModule_typ;

typedef struct nxpnsPullModule
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long deviceHandle;
	unsigned long api;
	unsigned long slot;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsPullModule_typ;

typedef struct nxpnsGetHandle
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long deviceHandle;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsGetHandle_typ;

typedef struct nxpnsAddChannelDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long api;
	unsigned long slot;
	unsigned long subslot;
	unsigned short channelNum;
	unsigned short channelProp;
	unsigned short channelErrType;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long diagHandle;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsAddChannelDiag_typ;

typedef struct nxpnsAddExtChannelDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long api;
	unsigned long slot;
	unsigned long subslot;
	unsigned short channelNum;
	unsigned short channelProp;
	unsigned short channelErrType;
	unsigned long extChannelAddValue;
	unsigned short extChannelErrType;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long diagHandle;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsAddExtChannelDiag_typ;

typedef struct nxpnsAddGenChannelDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long api;
	unsigned long slot;
	unsigned long subslot;
	unsigned short channelNum;
	unsigned short channelProp;
	unsigned short channelErrType;
	unsigned short userStructId;
	unsigned short diagDataLen;
	unsigned long pDiagData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	unsigned long diagHandle;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsAddGenChannelDiag_typ;

typedef struct nxpnsRemChannelDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long diagHandle;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsRemChannelDiag_typ;

typedef struct nxpnsSetName
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pName;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsSetName_typ;

typedef struct nxpnsStartBusComm
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsStartBusComm_typ;

typedef struct nxpnsFactoryReset
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsFactoryReset_typ;

typedef struct nxpnsGetName
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pName;
	unsigned char nameLen;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsGetName_typ;

typedef struct nxpnsGetIp
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pIpAddr;
	unsigned char IpAddrLen;
	unsigned long pNetMask;
	unsigned char NetMaskLen;
	unsigned long pGateway;
	unsigned char GatewayLen;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pnStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxpnsGetIp_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void nxpnsProcessAlarm(struct nxpnsProcessAlarm* inst);
_BUR_PUBLIC void nxpnsDiagnosisAlarm(struct nxpnsDiagnosisAlarm* inst);
_BUR_PUBLIC void nxpnsPlugModule(struct nxpnsPlugModule* inst);
_BUR_PUBLIC void nxpnsPullModule(struct nxpnsPullModule* inst);
_BUR_PUBLIC void nxpnsGetHandle(struct nxpnsGetHandle* inst);
_BUR_PUBLIC void nxpnsAddChannelDiag(struct nxpnsAddChannelDiag* inst);
_BUR_PUBLIC void nxpnsAddExtChannelDiag(struct nxpnsAddExtChannelDiag* inst);
_BUR_PUBLIC void nxpnsAddGenChannelDiag(struct nxpnsAddGenChannelDiag* inst);
_BUR_PUBLIC void nxpnsRemChannelDiag(struct nxpnsRemChannelDiag* inst);
_BUR_PUBLIC void nxpnsSetName(struct nxpnsSetName* inst);
_BUR_PUBLIC void nxpnsStartBusComm(struct nxpnsStartBusComm* inst);
_BUR_PUBLIC void nxpnsFactoryReset(struct nxpnsFactoryReset* inst);
_BUR_PUBLIC void nxpnsGetName(struct nxpnsGetName* inst);
_BUR_PUBLIC void nxpnsGetIp(struct nxpnsGetIp* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define nxpnsCPROP_QUALIFIED_DIAGNOSIS 1536U
 #define nxpnsCPROP_MAINTENANCE_DEMANDED 1024U
 #define nxpnsCPROP_MAINTENANCE_REQUIRED 512U
 #define nxpnsCPROP_DIAGNOSIS 0U
 #define nxpnsCERR_TIME_MIS 32777U
 #define nxpnsCERR_NET_COMP_FUNC_MIS 32776U
 #define nxpnsCERR_FIBER_OPTIC_MIS 32775U
 #define nxpnsCERR_MULTICAST_CR_MIS 32773U
 #define nxpnsCERR_ISOCHRONOUS_MODE_MIS 32772U
 #define nxpnsCERR_SYNC_MISMATCH 32771U
 #define nxpnsCERR_MEDIA_REDUNDANCY_MIS 32770U
 #define nxpnsCERR_REMOTE_MISM 32769U
 #define nxpnsCERR_DATA_TRANS_IMPOSSIBLE 32768U
 #define nxpnsCERR_SIMULATION_ACTIVE 10U
 #define nxpnsCERR_ERROR 9U
 #define nxpnsCERR_LOWER_LIM_VAL_EXCEEDED 8U
 #define nxpnsCERR_UPPER_LIM_VAL_EXCEEDED 7U
 #define nxpnsCERR_LINE_BREAK 6U
 #define nxpnsCERR_OVERTEMPERATURE 5U
 #define nxpnsCERR_OVERLOAD 4U
 #define nxpnsCERR_OVERVOLTAGE 3U
 #define nxpnsCERR_UNDERVOLTAGE 2U
 #define nxpnsCERR_SHORT_CIRCUIT 1U
 #define nxpnsALARM_DATALEN_MAX 1024U
 #define nxpnsMOD_PLUG_SUBSTITUTE_MOD 1U
 #define nxpnsMOD_PLUG_CORRECT_MOD 0U
 #define nxpnsERR_PARAMETER 35324U
 #define nxpnsERR_PROFINET_STACK 35323U
 #define nxpnsERR_TIMEOUT 35322U
 #define nxpnsERR_SEND_MESSAGE 35321U
 #define nxpnsERR_INVALID_DEVICE 35320U
#else
 _GLOBAL_CONST unsigned short nxpnsCPROP_QUALIFIED_DIAGNOSIS;
 _GLOBAL_CONST unsigned short nxpnsCPROP_MAINTENANCE_DEMANDED;
 _GLOBAL_CONST unsigned short nxpnsCPROP_MAINTENANCE_REQUIRED;
 _GLOBAL_CONST unsigned short nxpnsCPROP_DIAGNOSIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_TIME_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_NET_COMP_FUNC_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_FIBER_OPTIC_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_MULTICAST_CR_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_ISOCHRONOUS_MODE_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_SYNC_MISMATCH;
 _GLOBAL_CONST unsigned short nxpnsCERR_MEDIA_REDUNDANCY_MIS;
 _GLOBAL_CONST unsigned short nxpnsCERR_REMOTE_MISM;
 _GLOBAL_CONST unsigned short nxpnsCERR_DATA_TRANS_IMPOSSIBLE;
 _GLOBAL_CONST unsigned short nxpnsCERR_SIMULATION_ACTIVE;
 _GLOBAL_CONST unsigned short nxpnsCERR_ERROR;
 _GLOBAL_CONST unsigned short nxpnsCERR_LOWER_LIM_VAL_EXCEEDED;
 _GLOBAL_CONST unsigned short nxpnsCERR_UPPER_LIM_VAL_EXCEEDED;
 _GLOBAL_CONST unsigned short nxpnsCERR_LINE_BREAK;
 _GLOBAL_CONST unsigned short nxpnsCERR_OVERTEMPERATURE;
 _GLOBAL_CONST unsigned short nxpnsCERR_OVERLOAD;
 _GLOBAL_CONST unsigned short nxpnsCERR_OVERVOLTAGE;
 _GLOBAL_CONST unsigned short nxpnsCERR_UNDERVOLTAGE;
 _GLOBAL_CONST unsigned short nxpnsCERR_SHORT_CIRCUIT;
 _GLOBAL_CONST unsigned long nxpnsALARM_DATALEN_MAX;
 _GLOBAL_CONST unsigned short nxpnsMOD_PLUG_SUBSTITUTE_MOD;
 _GLOBAL_CONST unsigned short nxpnsMOD_PLUG_CORRECT_MOD;
 _GLOBAL_CONST unsigned short nxpnsERR_PARAMETER;
 _GLOBAL_CONST unsigned short nxpnsERR_PROFINET_STACK;
 _GLOBAL_CONST unsigned short nxpnsERR_TIMEOUT;
 _GLOBAL_CONST unsigned short nxpnsERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short nxpnsERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASNXPNS_ */

