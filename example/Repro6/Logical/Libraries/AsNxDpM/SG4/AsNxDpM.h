/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXDPM_
#define _ASNXDPM_
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
typedef struct nxdpmLifeList_t
{	unsigned char node[128];
} nxdpmLifeList_t;

typedef struct nxdpmDiagData_t
{	unsigned char status1;
	unsigned char status2;
	unsigned char status3;
	unsigned char address;
	unsigned char identHigh;
	unsigned char identLow;
	unsigned char blockData[238];
} nxdpmDiagData_t;

typedef struct nxdpmAddAdrParam_t
{	unsigned char srcType;
	unsigned char srcSize;
	unsigned char destType;
	unsigned char destSize;
	unsigned char addParam[228];
} nxdpmAddAdrParam_t;

typedef struct nxdpmCommand
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long syncCommand;
	unsigned long freezeCommand;
	unsigned long group;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmCommand_typ;

typedef struct nxdpmSetMode
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmSetMode_typ;

typedef struct nxdpmActivate
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long activate;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmActivate_typ;

typedef struct nxdpmGetDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long flags;
	unsigned long pDiagData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned long diagDataLen;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmGetDiag_typ;

typedef struct nxdpmLifeList
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pLifeList;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmLifeList_typ;

typedef struct nxdpmV1C1Read
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long slotNumber;
	unsigned long index;
	unsigned long dataLen;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned long readDataLen;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C1Read_typ;

typedef struct nxdpmV1C1Write
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long slotNumber;
	unsigned long index;
	unsigned long dataLen;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned char errorDecode;
	unsigned char errorCode1;
	unsigned char errorCode2;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C1Write_typ;

typedef struct nxdpmSubscribe
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmSubscribe_typ;

typedef struct nxdpmUnsubscribe
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmUnsubscribe_typ;

typedef struct nxdpmAlarmReceive
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned long maxAlarmDataLen;
	unsigned long pAlarmData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned char slotNumber;
	unsigned char seqNumber;
	unsigned char alarmType;
	unsigned char alarmSpecifier;
	unsigned long alarmDataLen;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit addAck;
} nxdpmAlarmReceive_typ;

typedef struct nxdpmAlarmReset
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned char slotNumber;
	unsigned char seqNumber;
	unsigned char alarmType;
	unsigned char alarmSpecifier;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit addAck;
} nxdpmAlarmReset_typ;

typedef struct nxdpmV1C2Initiate
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long remoteAdr;
	unsigned short sendTimeout;
	unsigned char featuresSup1;
	unsigned char featuresSup2;
	unsigned char profileFeatSup1;
	unsigned char profileFeatSup2;
	unsigned short profileIdent;
	unsigned long pAddAdrParam;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned long connectionRef;
	unsigned char dataUnitSizeMax;
	unsigned char slFeaturesSup1;
	unsigned char slFeaturesSup2;
	unsigned char slProfFeatSup1;
	unsigned char slProfFeatSup2;
	unsigned char errorDecode;
	unsigned char errorCode1;
	unsigned char errorCode2;
	unsigned short detail;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C2Initiate_typ;

typedef struct nxdpmV1C2Read
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionRef;
	unsigned long slotNumber;
	unsigned long index;
	unsigned long dataLen;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned long readDataLen;
	unsigned char errorDecode;
	unsigned char errorCode1;
	unsigned char errorCode2;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C2Read_typ;

typedef struct nxdpmV1C2Write
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionRef;
	unsigned long slotNumber;
	unsigned long index;
	unsigned long dataLen;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned char errorDecode;
	unsigned char errorCode1;
	unsigned char errorCode2;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C2Write_typ;

typedef struct nxdpmV1C2Data
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionRef;
	unsigned long slotNumber;
	unsigned long index;
	unsigned long dataLen;
	unsigned long pDataWrite;
	unsigned long pDataRead;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	unsigned long readDataLen;
	unsigned char errorDecode;
	unsigned char errorCode1;
	unsigned char errorCode2;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C2Data_typ;

typedef struct nxdpmV1C2Abort
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long connectionRef;
	unsigned char subnet;
	unsigned char instance;
	unsigned char reasonCode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long dpStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxdpmV1C2Abort_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void nxdpmCommand(struct nxdpmCommand* inst);
_BUR_PUBLIC void nxdpmSetMode(struct nxdpmSetMode* inst);
_BUR_PUBLIC void nxdpmActivate(struct nxdpmActivate* inst);
_BUR_PUBLIC void nxdpmGetDiag(struct nxdpmGetDiag* inst);
_BUR_PUBLIC void nxdpmLifeList(struct nxdpmLifeList* inst);
_BUR_PUBLIC void nxdpmV1C1Read(struct nxdpmV1C1Read* inst);
_BUR_PUBLIC void nxdpmV1C1Write(struct nxdpmV1C1Write* inst);
_BUR_PUBLIC void nxdpmSubscribe(struct nxdpmSubscribe* inst);
_BUR_PUBLIC void nxdpmUnsubscribe(struct nxdpmUnsubscribe* inst);
_BUR_PUBLIC void nxdpmAlarmReceive(struct nxdpmAlarmReceive* inst);
_BUR_PUBLIC void nxdpmAlarmReset(struct nxdpmAlarmReset* inst);
_BUR_PUBLIC void nxdpmV1C2Initiate(struct nxdpmV1C2Initiate* inst);
_BUR_PUBLIC void nxdpmV1C2Read(struct nxdpmV1C2Read* inst);
_BUR_PUBLIC void nxdpmV1C2Write(struct nxdpmV1C2Write* inst);
_BUR_PUBLIC void nxdpmV1C2Data(struct nxdpmV1C2Data* inst);
_BUR_PUBLIC void nxdpmV1C2Abort(struct nxdpmV1C2Abort* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define nxdpmALARM_SPEC_ERR_DIS_SLOT_DIS 3U
 #define nxdpmALARM_SPEC_ERR_DIS_SLOT_OK 2U
 #define nxdpmALARM_SPEC_ERR_APP_SLOT_DIS 1U
 #define nxdpmALARM_SPEC_NO_DIFF 0U
 #define nxdpmALARM_UPDATE 6U
 #define nxdpmALARM_STATUS 5U
 #define nxdpmALARM_PLUG 4U
 #define nxdpmALARM_PULL 3U
 #define nxdpmALARM_PROCESS 2U
 #define nxdpmALARM_DIAGNOSTIC 1U
 #define nxdpmDEACTIVATE 2U
 #define nxdpmACTIVATE 1U
 #define nxdpmNODE_MASTER 3U
 #define nxdpmNODE_SLAVE 1U
 #define nxdpmNODE_NOT_PRESENT 0U
 #define nxdpmLIFE_LIST_SIZE 128U
 #define nxdpmFLAG_EXT_DIAG_OVERFLOW 128U
 #define nxdpmFLAG_DEACTIVATED 128U
 #define nxdpmFLAG_SYNC_MODE 32U
 #define nxdpmFLAG_FREEZE_MODE 16U
 #define nxdpmFLAG_WD_ON 8U
 #define nxdpmFLAG_1 4U
 #define nxdpmFLAG_STAT_DIAG 2U
 #define nxdpmFLAG_PRM_REQUEST 1U
 #define nxdpmFLAG_MASTER_LOCK 128U
 #define nxdpmFLAG_PRM_FAULT 64U
 #define nxdpmFLAG_INVALID_SLAVE_RESPONSE 32U
 #define nxdpmFLAG_NOT_SUPPORTED 16U
 #define nxdpmFLAG_EXT_DIAG 8U
 #define nxdpmFLAG_CFG_FAULT 4U
 #define nxdpmFLAG_STATION_NOT_READY 2U
 #define nxdpmFLAG_STATION_NON_EXISTENT 1U
 #define nxdpmFLAG_QUERY 2U
 #define nxdpmFLAG_PEEK 1U
 #define nxdpmMODE_OPERATE 192U
 #define nxdpmMODE_CLEAR 128U
 #define nxdpmMODE_STOP 64U
 #define nxdpmMODE_OFFLINE 0U
 #define nxdpmCMD_SYNC 32U
 #define nxdpmCMD_UNSYNC 16U
 #define nxdpmCMD_FREEZE 8U
 #define nxdpmCMD_UNFREEZE 4U
 #define nxdpmERR_NO_MORE_ENTRIES 34707U
 #define nxdpmERR_SUBSCRIBE_LISTENER 34706U
 #define nxdpmERR_MEMORY 34705U
 #define nxdpmERR_PARAMETER 34704U
 #define nxdpmERR_PROFIBUSDP_STACK 34703U
 #define nxdpmERR_TIMEOUT 34702U
 #define nxdpmERR_SEND_MESSAGE 34701U
 #define nxdpmERR_INVALID_DEVICE 34700U
#else
 _GLOBAL_CONST unsigned char nxdpmALARM_SPEC_ERR_DIS_SLOT_DIS;
 _GLOBAL_CONST unsigned char nxdpmALARM_SPEC_ERR_DIS_SLOT_OK;
 _GLOBAL_CONST unsigned char nxdpmALARM_SPEC_ERR_APP_SLOT_DIS;
 _GLOBAL_CONST unsigned char nxdpmALARM_SPEC_NO_DIFF;
 _GLOBAL_CONST unsigned char nxdpmALARM_UPDATE;
 _GLOBAL_CONST unsigned char nxdpmALARM_STATUS;
 _GLOBAL_CONST unsigned char nxdpmALARM_PLUG;
 _GLOBAL_CONST unsigned char nxdpmALARM_PULL;
 _GLOBAL_CONST unsigned char nxdpmALARM_PROCESS;
 _GLOBAL_CONST unsigned char nxdpmALARM_DIAGNOSTIC;
 _GLOBAL_CONST unsigned long nxdpmDEACTIVATE;
 _GLOBAL_CONST unsigned long nxdpmACTIVATE;
 _GLOBAL_CONST unsigned long nxdpmNODE_MASTER;
 _GLOBAL_CONST unsigned long nxdpmNODE_SLAVE;
 _GLOBAL_CONST unsigned long nxdpmNODE_NOT_PRESENT;
 _GLOBAL_CONST unsigned long nxdpmLIFE_LIST_SIZE;
 _GLOBAL_CONST unsigned char nxdpmFLAG_EXT_DIAG_OVERFLOW;
 _GLOBAL_CONST unsigned char nxdpmFLAG_DEACTIVATED;
 _GLOBAL_CONST unsigned char nxdpmFLAG_SYNC_MODE;
 _GLOBAL_CONST unsigned char nxdpmFLAG_FREEZE_MODE;
 _GLOBAL_CONST unsigned char nxdpmFLAG_WD_ON;
 _GLOBAL_CONST unsigned char nxdpmFLAG_1;
 _GLOBAL_CONST unsigned char nxdpmFLAG_STAT_DIAG;
 _GLOBAL_CONST unsigned char nxdpmFLAG_PRM_REQUEST;
 _GLOBAL_CONST unsigned char nxdpmFLAG_MASTER_LOCK;
 _GLOBAL_CONST unsigned char nxdpmFLAG_PRM_FAULT;
 _GLOBAL_CONST unsigned char nxdpmFLAG_INVALID_SLAVE_RESPONSE;
 _GLOBAL_CONST unsigned char nxdpmFLAG_NOT_SUPPORTED;
 _GLOBAL_CONST unsigned char nxdpmFLAG_EXT_DIAG;
 _GLOBAL_CONST unsigned char nxdpmFLAG_CFG_FAULT;
 _GLOBAL_CONST unsigned char nxdpmFLAG_STATION_NOT_READY;
 _GLOBAL_CONST unsigned char nxdpmFLAG_STATION_NON_EXISTENT;
 _GLOBAL_CONST unsigned long nxdpmFLAG_QUERY;
 _GLOBAL_CONST unsigned long nxdpmFLAG_PEEK;
 _GLOBAL_CONST unsigned long nxdpmMODE_OPERATE;
 _GLOBAL_CONST unsigned long nxdpmMODE_CLEAR;
 _GLOBAL_CONST unsigned long nxdpmMODE_STOP;
 _GLOBAL_CONST unsigned long nxdpmMODE_OFFLINE;
 _GLOBAL_CONST unsigned long nxdpmCMD_SYNC;
 _GLOBAL_CONST unsigned long nxdpmCMD_UNSYNC;
 _GLOBAL_CONST unsigned long nxdpmCMD_FREEZE;
 _GLOBAL_CONST unsigned long nxdpmCMD_UNFREEZE;
 _GLOBAL_CONST unsigned short nxdpmERR_NO_MORE_ENTRIES;
 _GLOBAL_CONST unsigned short nxdpmERR_SUBSCRIBE_LISTENER;
 _GLOBAL_CONST unsigned short nxdpmERR_MEMORY;
 _GLOBAL_CONST unsigned short nxdpmERR_PARAMETER;
 _GLOBAL_CONST unsigned short nxdpmERR_PROFIBUSDP_STACK;
 _GLOBAL_CONST unsigned short nxdpmERR_TIMEOUT;
 _GLOBAL_CONST unsigned short nxdpmERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short nxdpmERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASNXDPM_ */

