/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _FXPUBSUB_
#define _FXPUBSUB_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum FxPubSubCtlStateEnum
{	fxPUBSUB_CTL_STATE_STOPPED = 0,
	fxPUBSUB_CTL_STATE_RUNNING = 1,
	fxPUBSUB_CTL_STATE_UNINITIALIZED = 2
} FxPubSubCtlStateEnum;

typedef struct FxPubSubPublisherId64
{	unsigned long High;
	unsigned long Low;
} FxPubSubPublisherId64;

typedef struct FxPubSubControlStart
{
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
} FxPubSubControlStart_typ;

typedef struct FxPubSubControlStop
{
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
} FxPubSubControlStop_typ;

typedef struct FxPubSubConfigIsInitial
{
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit IsInitial;
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigIsInitial_typ;

typedef struct FxPubSubConfigRestoreInitial
{
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
} FxPubSubConfigRestoreInitial_typ;

typedef signed long FxPubSubConfigurationHandleType;

typedef struct FxPubSubConfigApply
{
	/* VAR_INPUT (analog) */
	FxPubSubConfigurationHandleType ConfigurationHandle;
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
} FxPubSubConfigApply_typ;

typedef struct FxPubSubConfigGetActive
{
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	FxPubSubConfigurationHandleType ConfigurationHandle;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetActive_typ;

typedef struct FxPubSubConfigFreeMemory
{
	/* VAR_INPUT (analog) */
	FxPubSubConfigurationHandleType ConfigurationHandle;
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
} FxPubSubConfigFreeMemory_typ;

typedef signed long FxPubSubConnectionHandleType;

typedef struct FxPubSubConfigGetConnection
{
	/* VAR_INPUT (analog) */
	FxPubSubConfigurationHandleType ConfigurationHandle;
	plcstring (*Name);
	/* VAR_OUTPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetConnection_typ;

typedef signed long FxPubSubWriterGroupHandleType;

typedef struct FxPubSubConfigGetWriterGroup
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	plcstring (*Name);
	/* VAR_OUTPUT (analog) */
	FxPubSubWriterGroupHandleType WriterGroupHandle;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetWriterGroup_typ;

typedef signed long FxPubSubDataSetWriterHandleType;

typedef struct FxPubSubConfigGetDataSetWriter
{
	/* VAR_INPUT (analog) */
	FxPubSubWriterGroupHandleType WriterGroupHandle;
	plcstring (*Name);
	/* VAR_OUTPUT (analog) */
	FxPubSubDataSetWriterHandleType DataSetWriterHandle;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetDataSetWriter_typ;

typedef signed long FxPubSubReaderGroupHandleType;

typedef struct FxPubSubConfigGetReaderGroup
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	plcstring (*Name);
	/* VAR_OUTPUT (analog) */
	FxPubSubReaderGroupHandleType ReaderGroupHandle;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetReaderGroup_typ;

typedef signed long FxPubSubDataSetReaderHandleType;

typedef struct FxPubSubConfigGetDataSetReader
{
	/* VAR_INPUT (analog) */
	FxPubSubReaderGroupHandleType ReaderGroupHandle;
	plcstring (*Name);
	/* VAR_OUTPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConfigGetDataSetReader_typ;

typedef struct FxPubSubConnectionSetEnabled
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enabled;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubConnectionSetEnabled_typ;

typedef struct FxPubSubConnectionSetPubId16
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	unsigned short PublisherID;
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
} FxPubSubConnectionSetPubId16_typ;

typedef struct FxPubSubConnectionSetPubId64
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	struct FxPubSubPublisherId64 PublisherID;
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
} FxPubSubConnectionSetPubId64_typ;

typedef struct FxPubSubConnectionSetAddress
{
	/* VAR_INPUT (analog) */
	FxPubSubConnectionHandleType ConnectionHandle;
	plcstring (*Address);
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
} FxPubSubConnectionSetAddress_typ;

typedef struct FxPubSubWriterGroupSetEnabled
{
	/* VAR_INPUT (analog) */
	FxPubSubWriterGroupHandleType WriterGroupHandle;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enabled;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubWriterGroupSetEnabled_typ;

typedef struct FxPubSubWriterGroupSetInterval
{
	/* VAR_INPUT (analog) */
	FxPubSubWriterGroupHandleType WriterGroupHandle;
	double PubInterval;
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
} FxPubSubWriterGroupSetInterval_typ;

typedef struct FxPubSubWriterGroupSetId
{
	/* VAR_INPUT (analog) */
	FxPubSubWriterGroupHandleType WriterGroupHandle;
	unsigned short WriterGroupID;
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
} FxPubSubWriterGroupSetId_typ;

typedef struct FxPubSubWriterSetEnabled
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetWriterHandleType DataSetWriterHandle;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enabled;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubWriterSetEnabled_typ;

typedef struct FxPubSubReaderGroupSetEnabled
{
	/* VAR_INPUT (analog) */
	FxPubSubReaderGroupHandleType ReaderGroupHandle;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enabled;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubReaderGroupSetEnabled_typ;

typedef struct FxPubSubReaderSetEnabled
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Enabled;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} FxPubSubReaderSetEnabled_typ;

typedef struct FxPubSubReaderSetPubId16
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	unsigned short PublisherID;
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
} FxPubSubReaderSetPubId16_typ;

typedef struct FxPubSubReaderSetPubId64
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	struct FxPubSubPublisherId64 PublisherID;
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
} FxPubSubReaderSetPubId64_typ;

typedef struct FxPubSubReaderSetWriterGroupId
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	unsigned short WriterGroupID;
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
} FxPubSubReaderSetWriterGroupId_typ;

typedef struct FxPubSubReaderSetInterval
{
	/* VAR_INPUT (analog) */
	FxPubSubDataSetReaderHandleType DataSetReaderHandle;
	double PubInterval;
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
} FxPubSubReaderSetInterval_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void FxPubSubControlStart(struct FxPubSubControlStart* inst);
_BUR_PUBLIC void FxPubSubControlStop(struct FxPubSubControlStop* inst);
_BUR_PUBLIC void FxPubSubConfigIsInitial(struct FxPubSubConfigIsInitial* inst);
_BUR_PUBLIC void FxPubSubConfigRestoreInitial(struct FxPubSubConfigRestoreInitial* inst);
_BUR_PUBLIC void FxPubSubConfigApply(struct FxPubSubConfigApply* inst);
_BUR_PUBLIC void FxPubSubConfigGetActive(struct FxPubSubConfigGetActive* inst);
_BUR_PUBLIC void FxPubSubConfigFreeMemory(struct FxPubSubConfigFreeMemory* inst);
_BUR_PUBLIC void FxPubSubConfigGetConnection(struct FxPubSubConfigGetConnection* inst);
_BUR_PUBLIC void FxPubSubConfigGetWriterGroup(struct FxPubSubConfigGetWriterGroup* inst);
_BUR_PUBLIC void FxPubSubConfigGetDataSetWriter(struct FxPubSubConfigGetDataSetWriter* inst);
_BUR_PUBLIC void FxPubSubConfigGetReaderGroup(struct FxPubSubConfigGetReaderGroup* inst);
_BUR_PUBLIC void FxPubSubConfigGetDataSetReader(struct FxPubSubConfigGetDataSetReader* inst);
_BUR_PUBLIC void FxPubSubConnectionSetEnabled(struct FxPubSubConnectionSetEnabled* inst);
_BUR_PUBLIC void FxPubSubConnectionSetPubId16(struct FxPubSubConnectionSetPubId16* inst);
_BUR_PUBLIC void FxPubSubConnectionSetPubId64(struct FxPubSubConnectionSetPubId64* inst);
_BUR_PUBLIC void FxPubSubConnectionSetAddress(struct FxPubSubConnectionSetAddress* inst);
_BUR_PUBLIC void FxPubSubWriterGroupSetEnabled(struct FxPubSubWriterGroupSetEnabled* inst);
_BUR_PUBLIC void FxPubSubWriterGroupSetInterval(struct FxPubSubWriterGroupSetInterval* inst);
_BUR_PUBLIC void FxPubSubWriterGroupSetId(struct FxPubSubWriterGroupSetId* inst);
_BUR_PUBLIC void FxPubSubWriterSetEnabled(struct FxPubSubWriterSetEnabled* inst);
_BUR_PUBLIC void FxPubSubReaderGroupSetEnabled(struct FxPubSubReaderGroupSetEnabled* inst);
_BUR_PUBLIC void FxPubSubReaderSetEnabled(struct FxPubSubReaderSetEnabled* inst);
_BUR_PUBLIC void FxPubSubReaderSetPubId16(struct FxPubSubReaderSetPubId16* inst);
_BUR_PUBLIC void FxPubSubReaderSetPubId64(struct FxPubSubReaderSetPubId64* inst);
_BUR_PUBLIC void FxPubSubReaderSetWriterGroupId(struct FxPubSubReaderSetWriterGroupId* inst);
_BUR_PUBLIC void FxPubSubReaderSetInterval(struct FxPubSubReaderSetInterval* inst);
_BUR_PUBLIC unsigned long FxPubSubMessagesSent(void);
_BUR_PUBLIC unsigned long FxPubSubMessagesSentFailed(void);
_BUR_PUBLIC unsigned long FxPubSubMessagesReceived(void);
_BUR_PUBLIC unsigned long FxPubSubMessagesReceivedInvalid(void);
_BUR_PUBLIC unsigned long FxPubSubDataSetWriterFailed(void);
_BUR_PUBLIC unsigned long FxPubSubDataSetReaderFailed(void);
_BUR_PUBLIC signed long FxPubSubWriterGrpSentMsgs(FxPubSubWriterGroupHandleType WriterGroupHandle, unsigned long* Count);
_BUR_PUBLIC signed long FxPubSubWriterGrpSentMsgsFailed(FxPubSubWriterGroupHandleType WriterGroupHandle, unsigned long* Count);
_BUR_PUBLIC signed long FxPubSubReaderGrpRcvdMsgs(FxPubSubReaderGroupHandleType ReaderGroupHandle, unsigned long* Count);
_BUR_PUBLIC signed long FxPubSubReaderGrpRcvdInvalidMsgs(FxPubSubReaderGroupHandleType ReaderGroupHandle, unsigned long* Count);
_BUR_PUBLIC FxPubSubCtlStateEnum FxPubSubControlGetState(void);


/* Constants */
#ifdef _REPLACE_CONST
 #define fxPUBSUB_INVALID_HANDLE (-1)
 #define fxPUBSUB_ERR_IN_PROGRESS (-1038015704)
 #define fxPUBSUB_ERR_NO_TASK (-1038015703)
 #define fxPUBSUB_ERR_STARTUP_FAILED (-1038015702)
 #define fxPUBSUB_ERR_TRANSFER (-1038015701)
 #define fxPUBSUB_WRN_NO_STATE_CHANGE (-2111757524)
 #define fxPUBSUB_ERR_ITEM_NOT_FOUND (-1038015699)
 #define fxPUBSUB_ERR_INVALID_HANDLE (-1038015698)
 #define fxPUBSUB_ERR_GET_CONFIG_FAIL (-1038015697)
 #define fxPUBSUB_ERR_EDIT_CONFIG_FAIL (-1038015696)
 #define fxPUBSUB_ERR_RESET_INITIAL (-1038015695)
 #define fxPUBSUB_ERR_NO_RESOURCE (-1038015694)
 #define fxPUBSUB_ERR_INVALID_PARAMETER (-1038015693)
 #define fxPUBSUB_ERR_DIAG_CNT_NOT_FOUND (-1038015692)
#else
 _GLOBAL_CONST signed long fxPUBSUB_INVALID_HANDLE;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_IN_PROGRESS;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_NO_TASK;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_STARTUP_FAILED;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_TRANSFER;
 _GLOBAL_CONST signed long fxPUBSUB_WRN_NO_STATE_CHANGE;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_ITEM_NOT_FOUND;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_INVALID_HANDLE;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_GET_CONFIG_FAIL;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_EDIT_CONFIG_FAIL;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_RESET_INITIAL;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_NO_RESOURCE;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_INVALID_PARAMETER;
 _GLOBAL_CONST signed long fxPUBSUB_ERR_DIAG_CNT_NOT_FOUND;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _FXPUBSUB_ */

