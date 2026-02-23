/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASANSL_
#define _ASANSL_
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
typedef struct AsANSLTimeStampType
{	unsigned long timeStampSec;
	unsigned long timeStampNsec;
} AsANSLTimeStampType;

typedef struct AsANSLClientDiagInfoType
{	plcstring clientDataObjName[257];
	struct AsANSLTimeStampType clientTimeStamp;
	unsigned long clientConn;
	unsigned long clientConnErr;
} AsANSLClientDiagInfoType;

typedef struct AsANSLClientDiagConnInfoType
{	plcstring connName[65];
	plcstring connTargetAddr[65];
	struct AsANSLTimeStampType connTimeStamp;
	unsigned long connStatus;
	unsigned long connError;
	unsigned long connPvRead;
	unsigned long connPvReadErr;
	unsigned long connPvWrite;
	unsigned long connPvWriteErr;
	unsigned long connNumReadJobs;
	unsigned long connNumSendJobs;
	unsigned long connNumErr;
} AsANSLClientDiagConnInfoType;

typedef struct AsANSLClientDiagRedConnInfoType
{	plcstring redConnActIpAddr[65];
	unsigned long redConnAct;
	unsigned long redConnStatus;
	unsigned long redConnCluError;
	unsigned long redConnPriError;
	unsigned long redConnSecError;
	unsigned long redConnRRPrio;
} AsANSLClientDiagRedConnInfoType;

typedef struct AsANSLClientDiagPvInfoType
{	plcstring pvNameLocal[513];
	plcstring pvNameRemote[513];
	struct AsANSLTimeStampType pvTimeStamp;
	unsigned long pvStatus;
	unsigned long pvError;
	unsigned long pvDirection;
} AsANSLClientDiagPvInfoType;

typedef struct AsANSLServerDiagConnInfoType
{	plcstring connClientIpAddr[65];
	plcstring connServerIpAddr[65];
	struct AsANSLTimeStampType connTimeStamp;
	unsigned long connTimeout;
	unsigned long connSendDelay;
	unsigned long connPort;
	unsigned long connBufferSize;
	unsigned long connServiceObjects;
	unsigned long connBytesRecv;
	unsigned long connBytesSent;
	unsigned long connRequestsRecv;
	unsigned long connEventsSent;
	unsigned long connResponsesSent;
	unsigned long connEventPvs;
	plcbit connEventPvProcessing;
	unsigned long connEventPvRate;
	unsigned long connEventPvTime;
	unsigned long connEventPvsChangedBlock;
	unsigned long connEventPvsChangedAll;
	unsigned long connRRPrio;
	plcstring connRRName[65];
} AsANSLServerDiagConnInfoType;

typedef struct AsANSLClientStart
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientStart_typ;

typedef struct AsANSLClientStop
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientStop_typ;

typedef struct AsANSLClientDiag
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagInfoType ClientDiagInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiag_typ;

typedef struct AsANSLClientDiagAll
{
	/* VAR_INPUT (analog) */
	unsigned long index;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagInfoType ClientDiagInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagAll_typ;

typedef struct AsANSLClientDiagConn
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	plcstring connName[65];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagConnInfoType ClientDiagConnInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagConn_typ;

typedef struct AsANSLClientDiagConnAll
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	unsigned long index;
	unsigned long filterOption;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagConnInfoType ClientDiagConnInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagConnAll_typ;

typedef struct AsANSLClientDiagRedConn
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	plcstring connName[65];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagRedConnInfoType ClientDiagRedConnInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagRedConn_typ;

typedef struct AsANSLClientDiagPv
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	plcstring connName[65];
	plcstring localPvName[513];
	plcstring remotePvName[513];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagPvInfoType ClientDiagPvInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagPv_typ;

typedef struct AsANSLClientDiagPvAll
{
	/* VAR_INPUT (analog) */
	plcstring dataObjName[257];
	plcstring connName[65];
	unsigned long index;
	unsigned long filterOption;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLClientDiagPvInfoType ClientDiagPvInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLClientDiagPvAll_typ;

typedef struct AsANSLServerRRInfo
{
	/* VAR_INPUT (analog) */
	unsigned long pConnList;
	unsigned long maxConnListLenght;
	unsigned long cpuOption;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long connListLenght;
	unsigned long rrConnCount;
	unsigned long rrConnIndicator;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLServerRRInfo_typ;

typedef struct AsANSLServerDiagConnAll
{
	/* VAR_INPUT (analog) */
	unsigned long index;
	plcstring filterClientIpAddr[65];
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	struct AsANSLServerDiagConnInfoType ServerDiagConnInfo;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsANSLServerDiagConnAll_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void AsANSLClientStart(struct AsANSLClientStart* inst);
_BUR_PUBLIC void AsANSLClientStop(struct AsANSLClientStop* inst);
_BUR_PUBLIC void AsANSLClientDiag(struct AsANSLClientDiag* inst);
_BUR_PUBLIC void AsANSLClientDiagAll(struct AsANSLClientDiagAll* inst);
_BUR_PUBLIC void AsANSLClientDiagConn(struct AsANSLClientDiagConn* inst);
_BUR_PUBLIC void AsANSLClientDiagConnAll(struct AsANSLClientDiagConnAll* inst);
_BUR_PUBLIC void AsANSLClientDiagRedConn(struct AsANSLClientDiagRedConn* inst);
_BUR_PUBLIC void AsANSLClientDiagPv(struct AsANSLClientDiagPv* inst);
_BUR_PUBLIC void AsANSLClientDiagPvAll(struct AsANSLClientDiagPvAll* inst);
_BUR_PUBLIC void AsANSLServerRRInfo(struct AsANSLServerRRInfo* inst);
_BUR_PUBLIC void AsANSLServerDiagConnAll(struct AsANSLServerDiagConnAll* inst);
_BUR_PUBLIC unsigned long AsANSLServerConnCount(void);


/* Constants */
#ifdef _REPLACE_CONST
 #define asANSL_ERR_END_OF_LIST 31877U
 #define asANSL_ERR_PV_CONN_NOT_EXIST 31876U
 #define asANSL_ERR_CONN_NOT_EXIST 31875U
 #define asANSL_ERR_CLIENT_NOT_EXIST 31874U
 #define asANSL_ERR_DATAMODUL_NOT_EXIST 31873U
 #define asANSL_ERR_XML_INVALID 31872U
 #define asANSL_ERR_XML_PARSER_INIT_ERROR 31871U
 #define asANSL_ERR_PARAM_INVALID 31870U
 #define asANSL_ERR_FILE_RESOURCE 31655U
 #define asANSL_ERR_SYNC_RESOURCE 31654U
 #define asANSL_ERR_THREAD_RESOURCE 31653U
 #define asANSL_ERR_EVENT_RESOURCE 31652U
 #define asANSL_ERR_MEMORY_RESOURCE 31651U
 #define asANSL_RED_CONN_SEC_ERROR 32U
 #define asANSL_RED_CONN_SEC_OK 16U
 #define asANSL_RED_CONN_PRI_ERROR 8U
 #define asANSL_RED_CONN_PRI_OK 4U
 #define asANSL_RED_CONN_CLU_ERROR 2U
 #define asANSL_RED_CONN_CLU_OK 1U
 #define asANSL_RED_CONN_SEC_ACTIV 5U
 #define asANSL_RED_CONN_SEC_NOT_ACTIV 4U
 #define asANSL_RED_CONN_PRI_ACTIV 3U
 #define asANSL_RED_CONN_PRI_NOT_ACTIV 2U
 #define asANSL_RED_CONN_NO_CONNECTION 0U
 #define asANSL_PV_DIRECTION_WRITE 2U
 #define asANSL_PV_DIRECTION_READ 1U
 #define asANSL_OPTION_CPU_PARTNER 1U
 #define asANSL_OPTION_CPU_LOCAL 0U
 #define asANSL_OPTION_FILTER_ERROR 2U
 #define asANSL_OPTION_FILTER_NOERROR 1U
 #define asANSL_OPTION_FILTER_ALL 0U
#else
 _GLOBAL_CONST unsigned short asANSL_ERR_END_OF_LIST;
 _GLOBAL_CONST unsigned short asANSL_ERR_PV_CONN_NOT_EXIST;
 _GLOBAL_CONST unsigned short asANSL_ERR_CONN_NOT_EXIST;
 _GLOBAL_CONST unsigned short asANSL_ERR_CLIENT_NOT_EXIST;
 _GLOBAL_CONST unsigned short asANSL_ERR_DATAMODUL_NOT_EXIST;
 _GLOBAL_CONST unsigned short asANSL_ERR_XML_INVALID;
 _GLOBAL_CONST unsigned short asANSL_ERR_XML_PARSER_INIT_ERROR;
 _GLOBAL_CONST unsigned short asANSL_ERR_PARAM_INVALID;
 _GLOBAL_CONST unsigned short asANSL_ERR_FILE_RESOURCE;
 _GLOBAL_CONST unsigned short asANSL_ERR_SYNC_RESOURCE;
 _GLOBAL_CONST unsigned short asANSL_ERR_THREAD_RESOURCE;
 _GLOBAL_CONST unsigned short asANSL_ERR_EVENT_RESOURCE;
 _GLOBAL_CONST unsigned short asANSL_ERR_MEMORY_RESOURCE;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_SEC_ERROR;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_SEC_OK;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_PRI_ERROR;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_PRI_OK;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_CLU_ERROR;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_CLU_OK;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_SEC_ACTIV;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_SEC_NOT_ACTIV;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_PRI_ACTIV;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_PRI_NOT_ACTIV;
 _GLOBAL_CONST unsigned long asANSL_RED_CONN_NO_CONNECTION;
 _GLOBAL_CONST unsigned char asANSL_PV_DIRECTION_WRITE;
 _GLOBAL_CONST unsigned char asANSL_PV_DIRECTION_READ;
 _GLOBAL_CONST unsigned char asANSL_OPTION_CPU_PARTNER;
 _GLOBAL_CONST unsigned char asANSL_OPTION_CPU_LOCAL;
 _GLOBAL_CONST unsigned char asANSL_OPTION_FILTER_ERROR;
 _GLOBAL_CONST unsigned char asANSL_OPTION_FILTER_NOERROR;
 _GLOBAL_CONST unsigned char asANSL_OPTION_FILTER_ALL;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASANSL_ */

