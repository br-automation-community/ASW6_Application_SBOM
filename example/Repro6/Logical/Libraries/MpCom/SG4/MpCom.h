/* Automation Studio generated header file */
/* Do not edit ! */
/* MpCom 6.5.1 */

#ifndef _MPCOM_
#define _MPCOM_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpCom_VERSION
#define _MpCom_VERSION 6.5.1
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
typedef enum MpComConfigScopeEnum
{	mpCOM_CONFIG_SCOPE_COMPONENT = 0,
	mpCOM_CONFIG_SCOPE_BRANCH = 1
} MpComConfigScopeEnum;

typedef enum MpComConfigAdvancedSourceEnum
{	mpCOM_CONFIGADVANCED_SOURCE_NEW = 0,
	mpCOM_CONFIGADVANCED_SOURCE_PAR = 1,
	mpCOM_CONFIGADVANCED_SOURCE_CFG = 2
} MpComConfigAdvancedSourceEnum;

typedef enum MpComConfigBasicSourceEnum
{	mpCOM_CONFIGBASIC_SOURCE_PAR = 0,
	mpCOM_CONFIGBASIC_SOURCE_CFG = 1
} MpComConfigBasicSourceEnum;

typedef enum MpComConfigWriteModeEnum
{	mpCOM_CONFIG_WRITE_DEFAULT = 0,
	mpCOM_CONFIG_WRITE_APPEND = 1,
	mpCOM_CONFIG_WRITE_REPLACE = 2,
	mpCOM_CONFIG_WRITE_DELETE = 3
} MpComConfigWriteModeEnum;

typedef enum MpComConfigTargetEnum
{	mpCOM_CONFIG_TARGET_PAR = 0,
	mpCOM_CONFIG_TARGET_CFG = 1
} MpComConfigTargetEnum;

typedef enum MpComDataSourceEnum
{	mpCOM_DATA_SOURCE_PAR = 0,
	mpCOM_DATA_SOURCE_CFG = 1
} MpComDataSourceEnum;

typedef enum MpComLoggerUIStatusEnum
{	mpCOM_LOGGERUI_IDLE = 0,
	mpCOM_LOGGERUI_REFRESH = 1,
	mpCOM_LOGGERUI_ERROR = 2
} MpComLoggerUIStatusEnum;

typedef enum MpComErrorEnum
{	mpCOM_NO_ERROR = 0,
	mpCOM_ERR_ACTIVATION = -1064239103,
	mpCOM_ERR_MPLINK_NULL = -1064239102,
	mpCOM_ERR_MPLINK_INVALID = -1064239101,
	mpCOM_ERR_MPLINK_CHANGED = -1064239100,
	mpCOM_ERR_MPLINK_CORRUPT = -1064239099,
	mpCOM_ERR_LINK_NOT_POSSIBLE = -1064238848,
	mpCOM_ERR_FILE_SYSTEM = -1064238847,
	mpCOM_ERR_INVALID_FILE_DEV = -1064238846,
	mpCOM_ERR_INVALID_FILE_NAME = -1064238845,
	mpCOM_ERR_NO_CONFIG_IMPORT = -1064238844,
	mpCOM_ERR_MISSING_UICONNECT = -1064238843,
	mpCOM_ERR_CONFIG_IMPORT_ERR = -1064238842,
	mpCOM_ERR_WRONG_FILTER_STRING = -1064238841,
	mpCOM_ERR_COMPONENT_NOT_FOUND = -1064238840,
	mpCOM_ERR_CONFIG_ACCESS_FAILED = -1064238839,
	mpCOM_ERR_CONFIG_READ_FAILED = -1064238838,
	mpCOM_ERR_CONFIG_WRITE_FAILED = -1064238837,
	mpCOM_ERR_CONFIG_NOT_OPEN = -1064238836,
	mpCOM_ERR_CONFIG_COPY_FAILED = -1064238835,
	mpCOM_ERR_CONFIG_INVALID_COPY = -1064238834,
	mpCOM_ERR_CONFIG_INVALID_DATA = -1064238833,
	mpCOM_WRN_CONFIG_PARAM_ACTIVE = -2137980656
} MpComErrorEnum;

typedef struct MpComStatusIDType
{	enum MpComErrorEnum ID;
	MpComSeveritiesEnum Severity;
	MpComFacilitiesEnum Facility;
} MpComStatusIDType;

typedef struct MpComDiagType
{	struct MpComStatusIDType StatusID;
} MpComDiagType;

typedef struct MpComConfigManagerInfoType
{	struct MpComDiagType Diag;
} MpComConfigManagerInfoType;

typedef struct MpComDumpInternalType
{	plcbit CmdOld;
} MpComDumpInternalType;

typedef struct MpComLoggerUISetupType
{	unsigned short LoggerListSize;
	unsigned char LoggerScrollWindow;
} MpComLoggerUISetupType;

typedef struct MpComLoggerUIDateTimeType
{	plcdt DateTime;
	unsigned long Microseconds;
} MpComLoggerUIDateTimeType;

typedef struct MpComLoggerUILoggerListType
{	plcwstring Message[20][256];
	signed long StatusID[20];
	struct MpComLoggerUIDateTimeType Time[20];
	plcstring Component[20][51];
	MpComFacilitiesEnum Facility[20];
	MpComSeveritiesEnum Severity[20];
	plcbit PageUp;
	plcbit PageDown;
	plcbit StepUp;
	plcbit StepDown;
	float RangeStart;
	float RangeEnd;
} MpComLoggerUILoggerListType;

typedef struct MpComLoggerUIConnectType
{	enum MpComLoggerUIStatusEnum Status;
	struct MpComLoggerUILoggerListType List;
	plcbit Clear;
	plcwstring SearchFilter[256];
} MpComLoggerUIConnectType;

typedef struct MpComLoggerUIInfoType
{	unsigned short CurrentBufferEntries;
	struct MpComDiagType Diag;
} MpComLoggerUIInfoType;

typedef struct MpComConfigArrayType
{	unsigned long Data;
	unsigned long Capacity;
	unsigned long Size;
} MpComConfigArrayType;

typedef struct MpComConfigAdvancedInfoType
{	struct MpComDiagType Diag;
} MpComConfigAdvancedInfoType;

typedef struct MpComConfigBasicInfoType
{	struct MpComDiagType Diag;
} MpComConfigBasicInfoType;

typedef struct MpComConfigManager
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *DeviceName;
	plcstring *FileName;
	enum MpComConfigScopeEnum Scope;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpComConfigManagerInfoType Info;
	/* VAR (analog) */
	struct MpComConfigInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Export;
	plcbit Import;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpComConfigManager_typ;

typedef struct MpComLoggerUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	enum MpComConfigScopeEnum Scope;
	plcstring *EntryFilter;
	unsigned short BufferSize;
	struct MpComLoggerUISetupType UISetup;
	struct MpComLoggerUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpComLoggerUIInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Clear;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpComLoggerUI_typ;

typedef struct MpComDump
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[51];
	plcstring FileName[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComDumpInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Dump;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpComDump_typ;

typedef struct MpComGetLink
{
	/* VAR_INPUT (analog) */
	plcstring *ComponentName;
	/* VAR_OUTPUT (analog) */
	struct MpComIdentType MpLink;
	signed long StatusID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Active;
	/* VAR (digital) */
	plcbit Internal;
} MpComGetLink_typ;

typedef struct MpComConfigBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned long Data;
	unsigned long DataType;
	enum MpComConfigWriteModeEnum WriteMode;
	enum MpComConfigBasicSourceEnum ReadFrom;
	enum MpComConfigTargetEnum ApplyTo;
	plcstring *Path;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum MpComDataSourceEnum CurrentDataSource;
	struct MpComConfigBasicInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[22];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit CmdRead;
	plcbit CmdWrite;
	plcbit CmdCopy;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Active;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpComConfigBasic_typ;

typedef struct MpComConfigAdvanced
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned long Data;
	unsigned long DataType;
	enum MpComConfigWriteModeEnum WriteMode;
	enum MpComConfigAdvancedSourceEnum ReadFrom;
	enum MpComConfigTargetEnum ApplyTo;
	plcstring *Path;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	enum MpComDataSourceEnum CurrentDataSource;
	struct MpComConfigAdvancedInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[23];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit CmdOpen;
	plcbit CmdRead;
	plcbit CmdWrite;
	plcbit CmdClose;
	plcbit CmdCopy;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Active;
	plcbit IsOpened;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpComConfigAdvanced_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpComConfigManager(struct MpComConfigManager* inst);
_BUR_PUBLIC void MpComLoggerUI(struct MpComLoggerUI* inst);
_BUR_PUBLIC void MpComDump(struct MpComDump* inst);
_BUR_PUBLIC void MpComGetLink(struct MpComGetLink* inst);
_BUR_PUBLIC void MpComConfigBasic(struct MpComConfigBasic* inst);
_BUR_PUBLIC void MpComConfigAdvanced(struct MpComConfigAdvanced* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPCOM_ */

