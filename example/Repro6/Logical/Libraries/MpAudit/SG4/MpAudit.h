/* Automation Studio generated header file */
/* Do not edit ! */
/* MpAudit 6.5.1 */

#ifndef _MPAUDIT_
#define _MPAUDIT_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpAudit_VERSION
#define _MpAudit_VERSION 6.5.1
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
typedef enum MpAuditTrailUIStatusEnum
{	mpAUDIT_UI_STATUS_IDLE,
	mpAUDIT_UI_STATUS_UPDATE,
	mpAUDIT_UI_STATUS_FILTER,
	mpAUDIT_UI_STATUS_EXPORT,
	mpAUDIT_UI_STATUS_WARNING,
	mpAUDIT_UI_STATUS_ERROR
} MpAuditTrailUIStatusEnum;

typedef enum MpAuditFileTypeEnum
{	mpAUDIT_FILE_TYPE_TXT = 0,
	mpAUDIT_FILE_TYPE_XML = 1
} MpAuditFileTypeEnum;

typedef enum MpAuditArchiveModeEnum
{	mpAUDIT_ARCHIVE_DAILY = 0,
	mpAUDIT_ARCHIVE_MO_TO_FR = 1,
	mpAUDIT_ARCHIVE_BATCH = 2
} MpAuditArchiveModeEnum;

typedef enum MpAuditQueryModeEnum
{	mpAUDIT_QUERY_MODE_ALL,
	mpAUDIT_QUERY_MODE_NEW
} MpAuditQueryModeEnum;

typedef enum MpAuditUIMessageEnum
{	mpAUDIT_UI_MSG_NONE = 0,
	mpAUDIT_UI_MSG_WARNING = 1,
	mpAUDIT_UI_MSG_ERROR = 2
} MpAuditUIMessageEnum;

typedef enum MpAuditMeasurementSystemEnum
{	mpAUDIT_ENGINEERING_UNITS = 0,
	mpAUDIT_METRIC = 1,
	mpAUDIT_IMPERIAL = 2,
	mpAUDIT_IMPERIAL_US = 3
} MpAuditMeasurementSystemEnum;

typedef enum MpAuditErrorEnum
{	mpAUDIT_NO_ERROR = 0,
	mpAUDIT_ERR_ACTIVATION = -1064239103,
	mpAUDIT_ERR_MPLINK_NULL = -1064239102,
	mpAUDIT_ERR_MPLINK_INVALID = -1064239101,
	mpAUDIT_ERR_MPLINK_CHANGED = -1064239100,
	mpAUDIT_ERR_MPLINK_CORRUPT = -1064239099,
	mpAUDIT_ERR_MPLINK_IN_USE = -1064239098,
	mpAUDIT_ERR_CONFIG_NULL = -1064239096,
	mpAUDIT_ERR_CONFIG_NO_PV = -1064239095,
	mpAUDIT_ERR_CONFIG_LOAD = -1064239094,
	mpAUDIT_WRN_CONFIG_LOAD = -2137980917,
	mpAUDIT_ERR_CONFIG_SAVE = -1064239092,
	mpAUDIT_ERR_CONFIG_INVALID = -1064239091,
	mpAUDIT_ERR_TEXT_SOURCE = -1064124508,
	mpAUDIT_ERR_TEXT_NAMESPACE = -1064124507,
	mpAUDIT_ERR_TEXT_IDENT = -1064124506,
	mpAUDIT_ERR_ARCHIVE_NOT_FOUND = -1064124502,
	mpAUDIT_ERR_ARCHIVE_WRITE = -1064124501,
	mpAUDIT_ERR_TEXT_OVERFLOW = -1064124500,
	mpAUDIT_ERR_BUFFER_CREATE = -1064124499,
	mpAUDIT_ERR_WRITE_EXPORT_FILE = -1064124498,
	mpAUDIT_ERR_READ_BUFFER_ENTRIES = -1064124497,
	mpAUDIT_ERR_EVENT_RECORDER = -1064124496,
	mpAUDIT_INF_ARCHIVE_NO_ENTRIES = 1083359153,
	mpAUDIT_ERR_INVALID_FILE_DEV = -1064124494,
	mpAUDIT_ERR_MAX_ARCHIVES = -1064124493,
	mpAUDIT_ERR_MISSING_UICONNECT = -1064124492,
	mpAUDIT_ERR_READ_VC_EVENTS = -1064124490,
	mpAUDIT_WRN_OPC_AUDIT_DISABLED = -2137866313,
	mpAUDIT_ERR_MONITOR_PV = -1064124488,
	mpAUDIT_ERR_NO_BATCHID = -1064124487,
	mpAUDIT_ERR_ARCHIVE_REMOVE = -1064124486,
	mpAUDIT_ERR_QUERY_NOT_FOUND = -1064124485,
	mpAUDIT_INF_QUERY_NO_DATA = 1083359164,
	mpAUDIT_ERR_INVALID_FILE_NAME = -1064124483
} MpAuditErrorEnum;

typedef enum MpAuditTrailAlarmEnum
{	mpAUDIT_ALM_ARCHIVE_AVAILABLE = 0,
	mpAUDIT_ALM_ARCHIVE_OVERFLOW = 1
} MpAuditTrailAlarmEnum;

typedef enum MpAuditCfgEnum
{	mpAUDIT_CFG_QUERIES = 190,
	mpAUDIT_CFG_TRAIL = 100
} MpAuditCfgEnum;

typedef enum MpAuditCfgQueryOperatorsEnum
{	mpAUDIT_CFG_QUERY_LT = 0,
	mpAUDIT_CFG_QUERY_LE = 1,
	mpAUDIT_CFG_QUERY_GT = 2,
	mpAUDIT_CFG_QUERY_GE = 3,
	mpAUDIT_CFG_QUERY_EQ = 4,
	mpAUDIT_CFG_QUERY_NE = 5,
	mpAUDIT_CFG_QUERY_LIKE = 6
} MpAuditCfgQueryOperatorsEnum;

typedef enum MpAuditCfgQueryCompareToEnum
{	mpAUDIT_CFG_QUERY_VALUE = 0,
	mpAUDIT_CFG_QUERY_PV = 1
} MpAuditCfgQueryCompareToEnum;

typedef enum MpAuditCfgTrailArchiveModeEnum
{	mpAUDIT_CFG_TRAIL_ARCH_DAILY = 0,
	mpAUDIT_CFG_TRAIL_ARCH_MO_TO_FR = 1,
	mpAUDIT_CFG_TRAIL_ARCH_BY_BATCH = 2
} MpAuditCfgTrailArchiveModeEnum;

typedef enum MpAuditCfgTrailFileTypeEnum
{	mpAUDIT_CFG_TRAIL_TXT = 0,
	mpAUDIT_CFG_TRAIL_XML = 1
} MpAuditCfgTrailFileTypeEnum;

typedef enum MpAuditCfgTrailTaskClassEnum
{	mpAUDIT_CFG_TRAIL_TC_CYCLIC_1 = 1,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_2 = 2,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_3 = 3,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_4 = 4,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_5 = 5,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_6 = 6,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_7 = 7,
	mpAUDIT_CFG_TRAIL_TC_CYCLIC_8 = 8
} MpAuditCfgTrailTaskClassEnum;

typedef enum MpAuditCfgTrailMemoryEnum
{	mpAUDIT_CFG_TRAIL_ROM_DRAM = 0,
	mpAUDIT_CFG_TRAIL_ROM_RAM = 1,
	mpAUDIT_CFG_TRAIL_RAM = 2
} MpAuditCfgTrailMemoryEnum;

typedef enum MpAuditCfgTrailArchiveEnum
{	mpAUDIT_CFG_TRAIL_ARCHIVE_OFF = 0,
	mpAUDIT_CFG_TRAIL_ARCHIVE_ON = 1
} MpAuditCfgTrailArchiveEnum;

typedef struct MpAuditTrailUICurrDTFilterType
{	plcbit Enable;
	plcdt DateTime;
} MpAuditTrailUICurrDTFilterType;

typedef struct MpAuditTrailUIEventFilterType
{	plcbit Enable;
	plcbit Exclude;
	unsigned long Event[5];
} MpAuditTrailUIEventFilterType;

typedef struct MpAuditTrailUIOpFilterType
{	plcbit Enable;
	plcbit Exclude;
	plcwstring Name[51];
} MpAuditTrailUIOpFilterType;

typedef struct MpAuditTrailUIPatternFilterType
{	plcbit Enable;
	plcbit Exclude;
	plcwstring Compare[51];
} MpAuditTrailUIPatternFilterType;

typedef struct MpAuditTrailUIBatchFilterType
{	plcbit Enable;
	plcwstring Name[51];
} MpAuditTrailUIBatchFilterType;

typedef struct MpAuditExportFilterType
{	struct MpAuditTrailUICurrDTFilterType From;
	struct MpAuditTrailUICurrDTFilterType Until;
	struct MpAuditTrailUIEventFilterType Event;
	struct MpAuditTrailUIOpFilterType Operator;
	struct MpAuditTrailUIPatternFilterType Pattern;
	struct MpAuditTrailUIBatchFilterType Batch;
} MpAuditExportFilterType;

typedef struct MpAuditTrailUISetupType
{	unsigned short EventListSize;
	unsigned char ScrollWindow;
} MpAuditTrailUISetupType;

typedef struct MpAuditTrailUIOutputType
{	unsigned short EventID[20];
	plcwstring EventText[20][256];
	plcbit PageUp;
	plcbit StepUp;
	plcbit StepDown;
	plcbit PageDown;
	float RangeStart;
	float RangeEnd;
} MpAuditTrailUIOutputType;

typedef struct MpAuditTrailUISetDTFilterType
{	plcbit Enable;
	unsigned short Year;
	unsigned char Month;
	unsigned char Day;
	unsigned char Hour;
	unsigned char Minute;
} MpAuditTrailUISetDTFilterType;

typedef struct MpAuditTrailUIFilterDialogType
{	unsigned short LayerStatus;
	struct MpAuditTrailUISetDTFilterType From;
	struct MpAuditTrailUISetDTFilterType Until;
	struct MpAuditTrailUIEventFilterType Event;
	struct MpAuditTrailUIOpFilterType Operator;
	plcbit Confirm;
	plcbit Cancel;
	struct MpAuditTrailUIPatternFilterType Pattern;
	struct MpAuditTrailUIBatchFilterType Batch;
} MpAuditTrailUIFilterDialogType;

typedef struct MpAuditTrailUICurrentFilterType
{	struct MpAuditTrailUICurrDTFilterType From;
	struct MpAuditTrailUICurrDTFilterType Until;
	struct MpAuditTrailUIEventFilterType Event;
	struct MpAuditTrailUIOpFilterType Operator;
	struct MpAuditTrailUIPatternFilterType Pattern;
	struct MpAuditTrailUIBatchFilterType Batch;
} MpAuditTrailUICurrentFilterType;

typedef struct MpAuditUIFilterType
{	plcbit ShowDialog;
	struct MpAuditTrailUIFilterDialogType Dialog;
	struct MpAuditTrailUICurrentFilterType Current;
	unsigned short DefaultLayerStatus;
} MpAuditUIFilterType;

typedef struct MpAuditUIMessageBoxType
{	unsigned short LayerStatus;
	enum MpAuditUIMessageEnum Type;
	unsigned short ErrorNumber;
	signed long StatusID;
	plcbit Confirm;
	plcbit Cancel;
} MpAuditUIMessageBoxType;

typedef struct MpAuditTrailUIConnectType
{	enum MpAuditTrailUIStatusEnum Status;
	struct MpAuditTrailUIOutputType Output;
	struct MpAuditUIFilterType Filter;
	plcbit Export;
	struct MpAuditUIMessageBoxType MessageBox;
} MpAuditTrailUIConnectType;

typedef struct MpAuditStatusIDType
{	enum MpAuditErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpAuditStatusIDType;

typedef struct MpAuditDiagType
{	struct MpAuditStatusIDType StatusID;
} MpAuditDiagType;

typedef struct MpAuditTrailUIInfoType
{	struct MpAuditDiagType Diag;
	plcstring GeneratedFileName[256];
} MpAuditTrailUIInfoType;

typedef struct MpAuditExportInfoType
{	struct MpAuditDiagType Diag;
	plcstring GeneratedFileName[256];
} MpAuditExportInfoType;

typedef struct MpAuditQueryInfoType
{	unsigned long AvailableSpace;
	unsigned long RowsRead;
	plcbit HasMoreRows;
	struct MpAuditDiagType Diag;
} MpAuditQueryInfoType;

typedef struct MpAuditRegParInfoType
{	struct MpAuditDiagType Diag;
} MpAuditRegParInfoType;

typedef struct MpAuditTrailInfoType
{	unsigned short NumberArchives;
	plcstring GeneratedFileName[256];
	struct MpAuditDiagType Diag;
} MpAuditTrailInfoType;

typedef struct MpAuditVC4EventInternalType
{	unsigned long hEventSys;
} MpAuditVC4EventInternalType;

typedef struct MpAuditMonitorInternalType
{	unsigned long Handle;
} MpAuditMonitorInternalType;

typedef struct MpAuditCfgQueryColumnsType
{	plcstring EventIdentifier[4];
	plcstring EventTime[8];
	plcstring EntryIndex[5];
	plcstring EventDescription[6];
	plcstring OperatorName[4];
	plcstring MappComponent[5];
	plcstring OldValue[5];
	plcstring NewValue[5];
	plcstring Name[6];
	plcstring DeviceName[5];
	plcstring Path[6];
	plcstring Message[5];
	plcstring Comment[5];
	plcstring ErrorNumber[5];
	plcstring DatapointIdentifier[6];
	plcstring Time[6];
	plcstring AlarmCode[6];
	plcstring Severity[5];
	plcstring Object[5];
	plcstring Attribute[6];
	plcstring VC4Unit[6];
	plcstring VC4UnitText[7];
	plcstring VC4SelectionTextgroup[5];
	plcstring VisualisationName[5];
	plcstring CustomEventType[5];
	plcstring OpcClientId[6];
	plcstring OpcNodeName[10];
	plcstring OpcNodeDescription[10];
	plcstring PackMLState[7];
	plcstring PackMLMode[6];
	plcstring PackMLInfo[6];
	plcstring FileSource[4];
	plcstring FileDest[5];
	plcstring EventText[6];
	plcstring DisplayEventText[7];
} MpAuditCfgQueryColumnsType;

typedef struct MpAuditCfgQueryValueType
{	plcstring Value[256];
} MpAuditCfgQueryValueType;

typedef struct MpAuditCfgQueryCompareToType
{	enum MpAuditCfgQueryCompareToEnum Type;
	struct MpAuditCfgQueryValueType Value;
} MpAuditCfgQueryCompareToType;

typedef struct MpAuditCfgQuerySelectColType
{	plcstring Column[256];
	plcstring Pv[256];
} MpAuditCfgQuerySelectColType;

typedef struct MpAuditCfgQuerySelectType
{	unsigned long NumberOfColumns;
	struct MpAuditCfgQuerySelectColType Columns[20];
} MpAuditCfgQuerySelectType;

typedef struct MpAuditCfgQueryWhereFilterType
{	plcstring Column[256];
	enum MpAuditCfgQueryOperatorsEnum Operator;
	struct MpAuditCfgQueryCompareToType CompareTo;
} MpAuditCfgQueryWhereFilterType;

typedef struct MpAuditCfgQueryWhereType
{	plcstring Connect[256];
	struct MpBaseCfgArrayType Filter;
} MpAuditCfgQueryWhereType;

typedef struct MpAuditCfgQuerySingleType
{	plcstring Name[101];
	plcstring UpdateCount[256];
	plcstring Component[51];
	struct MpAuditCfgQuerySelectType Select;
	struct MpAuditCfgQueryWhereType Where;
} MpAuditCfgQuerySingleType;

typedef struct MpAuditCfgQueryDataQueriesType
{	struct MpBaseCfgArrayType Query;
} MpAuditCfgQueryDataQueriesType;

typedef struct MpAuditCfgQueryType
{	struct MpAuditCfgQueryDataQueriesType DataQueries;
} MpAuditCfgQueryType;

typedef struct MpAuditCfgTrailGeneralType
{	plcbit Enable;
	plcbit EnableCockpit;
	enum MpAuditCfgTrailTaskClassEnum CyclicTaskClass;
	plcstring Parent[51];
} MpAuditCfgTrailGeneralType;

typedef struct MpAuditCfgTrailEventsType
{	struct MpBaseCfgArrayType Event;
} MpAuditCfgTrailEventsType;

typedef struct MpAuditCfgTrailDataType
{	unsigned long Size;
	unsigned long MaximumSaveInterval;
	unsigned long BufferSize;
} MpAuditCfgTrailDataType;

typedef struct MpAuditCfgTrailMemoryType
{	enum MpAuditCfgTrailMemoryEnum Type;
	struct MpAuditCfgTrailDataType Data;
} MpAuditCfgTrailMemoryType;

typedef struct MpAuditCfgTrailTextSourceType
{	plcstring Display[256];
	plcstring Export[256];
} MpAuditCfgTrailTextSourceType;

typedef struct MpAuditCfgTrailArchiveOnType
{	enum MpAuditCfgTrailArchiveModeEnum Mode;
	unsigned long Time;
	unsigned long MaximumSize;
} MpAuditCfgTrailArchiveOnType;

typedef struct MpAuditCfgTrailArchiveType
{	enum MpAuditCfgTrailArchiveEnum Type;
	struct MpAuditCfgTrailArchiveOnType On;
} MpAuditCfgTrailArchiveType;

typedef struct MpAuditCfgTrailExportType
{	plcbit RawData;
	enum MpAuditCfgTrailFileTypeEnum FileType;
	plcbit Encrypt;
} MpAuditCfgTrailExportType;

typedef struct MpAuditCfgTrailAuditType
{	struct MpAuditCfgTrailEventsType EventList;
	struct MpAuditCfgTrailMemoryType Memory;
	struct MpAuditCfgTrailTextSourceType Text;
	struct MpAuditCfgTrailArchiveType Archive;
	struct MpAuditCfgTrailExportType Export;
} MpAuditCfgTrailAuditType;

typedef struct MpAuditCfgTrailPvListType
{	plcstring Pv[256];
	plcstring Identifier[256];
} MpAuditCfgTrailPvListType;

typedef struct MpAuditCfgTrailPvMonitorType
{	struct MpBaseCfgArrayType PvList;
} MpAuditCfgTrailPvMonitorType;

typedef struct MpAuditCfgTrailType
{	struct MpAuditCfgTrailGeneralType General;
	struct MpAuditCfgTrailAuditType Audit;
	struct MpAuditCfgTrailPvMonitorType VariableMonitor;
} MpAuditCfgTrailType;

typedef struct MpAuditTrailUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *DeviceName;
	plcstring *FileName;
	struct MpAuditTrailUISetupType UISetup;
	plcstring *Language;
	enum MpAuditMeasurementSystemEnum MeasurementSystem;
	struct MpAuditTrailUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpAuditTrailUIInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[30];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpAuditTrailUI_typ;

typedef struct MpAuditTrail
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *DeviceName;
	plcstring *FileName;
	plcstring *Language;
	enum MpAuditMeasurementSystemEnum MeasurementSystem;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long CurrentRecord;
	unsigned long NumberEntries;
	struct MpAuditTrailInfoType Info;
	/* VAR (analog) */
	unsigned long InternalState;
	unsigned long InternalData[23];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Overwrite;
	plcbit Export;
	plcbit ExportArchive;
	plcbit Clear;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
	plcbit ArchiveAvailable;
} MpAuditTrail_typ;

typedef struct MpAuditVC4Event
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned short MinUserID;
	unsigned short MaxUserID;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpAuditVC4EventInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Localize;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpAuditVC4Event_typ;

typedef struct MpAuditRegPar
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *PVName;
	plcstring *Identifier;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpAuditRegParInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[23];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpAuditRegPar_typ;

typedef struct MpAuditExport
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpAuditExportFilterType* Filter;
	unsigned long ToRecord;
	plcstring *DeviceName;
	plcstring *FileName;
	plcstring *Language;
	enum MpAuditMeasurementSystemEnum MeasurementSystem;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long Record;
	struct MpAuditExportInfoType Info;
	/* VAR (analog) */
	unsigned long InternalState;
	unsigned long InternalData[20];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Overwrite;
	plcbit Export;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpAuditExport_typ;

typedef struct MpAuditQuery
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	enum MpAuditQueryModeEnum Mode;
	plcstring *Name;
	plcstring *Language;
	enum MpAuditMeasurementSystemEnum MeasurementSystem;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpAuditQueryInfoType Info;
	/* VAR (analog) */
	unsigned long InternalState;
	unsigned long InternalData[23];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Execute;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpAuditQuery_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpAuditTrailUI(struct MpAuditTrailUI* inst);
_BUR_PUBLIC void MpAuditTrail(struct MpAuditTrail* inst);
_BUR_PUBLIC void MpAuditVC4Event(struct MpAuditVC4Event* inst);
_BUR_PUBLIC void MpAuditRegPar(struct MpAuditRegPar* inst);
_BUR_PUBLIC void MpAuditExport(struct MpAuditExport* inst);
_BUR_PUBLIC void MpAuditQuery(struct MpAuditQuery* inst);
_BUR_PUBLIC signed long MpAuditWStringChange(struct MpComIdentType* MpLink, plcwstring* Old, plcwstring* New, plcstring* Identifier);
_BUR_PUBLIC signed long MpAuditStringChange(struct MpComIdentType* MpLink, plcstring* Old, plcstring* New, plcstring* Identifier);
_BUR_PUBLIC signed long MpAuditCustomEvent(struct MpComIdentType* MpLink, plcwstring* Type, plcwstring* Message, plcwstring* Comment);
_BUR_PUBLIC signed long MpAuditValueChange(struct MpComIdentType* MpLink, double Old, double New, plcstring* Identifier);
_BUR_PUBLIC signed long MpAuditStartBatch(struct MpComIdentType* MpLink, plcwstring* Name);


#ifdef __cplusplus
};
#endif
#endif /* _MPAUDIT_ */

