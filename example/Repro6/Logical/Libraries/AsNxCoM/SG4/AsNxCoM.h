/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASNXCOM_
#define _ASNXCOM_
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
typedef struct nxcomEmcyTelegram_t
{	unsigned char data[8];
} nxcomEmcyTelegram_t;

typedef struct nxcomEmcyTelegrams_t
{	struct nxcomEmcyTelegram_t telegram[5];
} nxcomEmcyTelegrams_t;

typedef struct nxcomGetState
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long flags;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	unsigned long nmtState;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomGetState_typ;

typedef struct nxcomRecvEmcyDev
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long flags;
	unsigned long pEmcyData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	unsigned long emcyCount;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomRecvEmcyDev_typ;

typedef struct nxcomGetDiag
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long flags;
	unsigned long pEmcyData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	unsigned long nodeFlags;
	unsigned long lastDiagInfo;
	unsigned long devType;
	unsigned long nmtState;
	unsigned long emcyCount;
	unsigned long addInfo;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit devTypeValid;
} nxcomGetDiag_typ;

typedef struct nxcomNmt
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long command;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomNmt_typ;

typedef struct nxcomSdoRead
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long index;
	unsigned long subIndex;
	unsigned long dataCount;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomSdoRead_typ;

typedef struct nxcomSdoWrite
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long index;
	unsigned long subIndex;
	unsigned long dataCount;
	unsigned long pData;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomSdoWrite_typ;

typedef struct nxcomWriteEmcy
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned short errorCode;
	unsigned char errorRegister;
	unsigned long pManErrorCode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomWriteEmcy_typ;

typedef struct nxcomStartStop
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomStartStop_typ;

typedef struct nxcomSlaveActivate
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char node;
	unsigned long mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long coStatus;
	/* VAR (analog) */
	unsigned short _state;
	unsigned short _result;
	unsigned long _srcId;
	/* VAR_INPUT (digital) */
	plcbit enable;
} nxcomSlaveActivate_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void nxcomGetState(struct nxcomGetState* inst);
_BUR_PUBLIC void nxcomRecvEmcyDev(struct nxcomRecvEmcyDev* inst);
_BUR_PUBLIC void nxcomGetDiag(struct nxcomGetDiag* inst);
_BUR_PUBLIC void nxcomNmt(struct nxcomNmt* inst);
_BUR_PUBLIC void nxcomSdoRead(struct nxcomSdoRead* inst);
_BUR_PUBLIC void nxcomSdoWrite(struct nxcomSdoWrite* inst);
_BUR_PUBLIC void nxcomWriteEmcy(struct nxcomWriteEmcy* inst);
_BUR_PUBLIC void nxcomStartStop(struct nxcomStartStop* inst);
_BUR_PUBLIC void nxcomSlaveActivate(struct nxcomSlaveActivate* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define nxcomMODE_SLAVE_DEACTIVATE 2U
 #define nxcomMODE_SLAVE_ACTIVATE 1U
 #define nxcomMODE_START 1U
 #define nxcomMODE_STOP 0U
 #define nxcomNODE_FLAG_SDO_TIMEOUT 1U
 #define nxcomNODE_FLAG_SDO_ERROR 2U
 #define nxcomNODE_FLAG_CFG_FAULT 4U
 #define nxcomNODE_FLAG_HEARTBEAT_STARTED 8U
 #define nxcomNODE_FLAG_GUARD_ERROR 16U
 #define nxcomNODE_FLAG_CON_LOST 32U
 #define nxcomNODE_FLAG_HEARTBEAT_ERROR 64U
 #define nxcomNODE_FLAG_UNEXPECTED_STATE 128U
 #define nxcomNODE_FLAG_EMCY_RECEIVED 256U
 #define nxcomNODE_FLAG_EMCY_BUFF_OVER 512U
 #define nxcomNODE_FLAG_BOOTUP 1024U
 #define nxcomNODE_FLAG_UNEXPECTED_BOOTUP 2048U
 #define nxcomNODE_FLAG_INVALID_PARAMETER 4096U
 #define nxcomNODE_FLAG_STATE_NOT_HANDLED 1073741824U
 #define nxcomNODE_FLAG_DEACTIVATED 2147483648U
 #define nxcomFLAG_PEEK 1U
 #define nxcomEREG_MANU_SPEC_BIT 128U
 #define nxcomEREG_DEV_PROFILE_BIT 32U
 #define nxcomEREG_COMM_ERROR_BIT 16U
 #define nxcomEREG_TEMPERATURE_BIT 8U
 #define nxcomEREG_VOLTAGE_BIT 4U
 #define nxcomEREG_CURRENT_BIT 2U
 #define nxcomEREG_GENERIC_BIT 1U
 #define nxcomNMT_CMD_RESET_COMM 130U
 #define nxcomNMT_CMD_RESET_NODE 129U
 #define nxcomNMT_CMD_ENTER_PREOP 128U
 #define nxcomNMT_CMD_STOP 2U
 #define nxcomNMT_CMD_START 1U
 #define nxcomNMT_STATE_RESET_COMM 6U
 #define nxcomNMT_STATE_RESET_APPL 5U
 #define nxcomNMT_STATE_PRE_OPERATIONAL 4U
 #define nxcomNMT_STATE_OPERATIONAL 3U
 #define nxcomNMT_STATE_STOPPED 2U
 #define nxcomNMT_STATE_INITIALISING 1U
 #define nxcomNMT_STATE_UNKNOWN 0U
 #define nxcomERR_PARAMETER 34505U
 #define nxcomERR_DATALEN 34504U
 #define nxcomERR_CANOPEN_STACK 34503U
 #define nxcomERR_TIMEOUT 34502U
 #define nxcomERR_SEND_MESSAGE 34501U
 #define nxcomERR_INVALID_DEVICE 34500U
#else
 _GLOBAL_CONST unsigned long nxcomMODE_SLAVE_DEACTIVATE;
 _GLOBAL_CONST unsigned long nxcomMODE_SLAVE_ACTIVATE;
 _GLOBAL_CONST unsigned long nxcomMODE_START;
 _GLOBAL_CONST unsigned long nxcomMODE_STOP;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_SDO_TIMEOUT;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_SDO_ERROR;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_CFG_FAULT;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_HEARTBEAT_STARTED;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_GUARD_ERROR;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_CON_LOST;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_HEARTBEAT_ERROR;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_UNEXPECTED_STATE;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_EMCY_RECEIVED;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_EMCY_BUFF_OVER;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_BOOTUP;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_UNEXPECTED_BOOTUP;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_INVALID_PARAMETER;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_STATE_NOT_HANDLED;
 _GLOBAL_CONST unsigned long nxcomNODE_FLAG_DEACTIVATED;
 _GLOBAL_CONST unsigned long nxcomFLAG_PEEK;
 _GLOBAL_CONST unsigned char nxcomEREG_MANU_SPEC_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_DEV_PROFILE_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_COMM_ERROR_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_TEMPERATURE_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_VOLTAGE_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_CURRENT_BIT;
 _GLOBAL_CONST unsigned char nxcomEREG_GENERIC_BIT;
 _GLOBAL_CONST unsigned long nxcomNMT_CMD_RESET_COMM;
 _GLOBAL_CONST unsigned long nxcomNMT_CMD_RESET_NODE;
 _GLOBAL_CONST unsigned long nxcomNMT_CMD_ENTER_PREOP;
 _GLOBAL_CONST unsigned long nxcomNMT_CMD_STOP;
 _GLOBAL_CONST unsigned long nxcomNMT_CMD_START;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_RESET_COMM;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_RESET_APPL;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_PRE_OPERATIONAL;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_OPERATIONAL;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_STOPPED;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_INITIALISING;
 _GLOBAL_CONST unsigned long nxcomNMT_STATE_UNKNOWN;
 _GLOBAL_CONST unsigned short nxcomERR_PARAMETER;
 _GLOBAL_CONST unsigned short nxcomERR_DATALEN;
 _GLOBAL_CONST unsigned short nxcomERR_CANOPEN_STACK;
 _GLOBAL_CONST unsigned short nxcomERR_TIMEOUT;
 _GLOBAL_CONST unsigned short nxcomERR_SEND_MESSAGE;
 _GLOBAL_CONST unsigned short nxcomERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASNXCOM_ */

