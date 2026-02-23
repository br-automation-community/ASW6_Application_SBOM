/* Automation Studio generated header file */
/* Do not edit ! */
/* MpIO 6.5.1 */

#ifndef _MPIO_
#define _MPIO_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpIO_VERSION
#define _MpIO_VERSION 6.5.1
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
typedef enum MpIOErrorEnum
{	mpIO_NO_ERROR = 0,
	mpIO_ERR_ACTIVATION = -1064239103,
	mpIO_ERR_MPLINK_NULL = -1064239102,
	mpIO_ERR_MPLINK_INVALID = -1064239101,
	mpIO_ERR_MPLINK_CHANGED = -1064239100,
	mpIO_ERR_MPLINK_CORRUPT = -1064239099,
	mpIO_ERR_MPLINK_IN_USE = -1064239098,
	mpIO_ERR_CONFIG_INVALID = -1064239091,
	mpIO_ERR_INVALID_FILE_DEV = -1064120320,
	mpIO_ERR_INVALID_FILE_NAME = -1064120319,
	mpIO_ERR_BUILD_IMPORT_DATA = -1064120318,
	mpIO_ERR_ACTIVATE_IMPORT_DATA = -1064120317,
	mpIO_ERR_CREATE_BACKUP = -1064120316,
	mpIO_ERR_MISSING_UICONNECT = -1064120315,
	mpIO_ERR_MISSING_IMPORT = -1064120314,
	mpIO_ERR_IMPORT_NOT_ALLOWED = -1064120312
} MpIOErrorEnum;

typedef enum MpIOAlarmEnum
{	mpIO_ALM_IMPORT_FAILED = 0,
	mpIO_ALM_IMPORT_DONE = 1,
	mpIO_ALM_CONFIG_CHANGED = 2
} MpIOAlarmEnum;

typedef enum MpIOUIMessageEnum
{	mpIO_UI_MSG_NONE = 0,
	mpIO_UI_MSG_WARNING = 1,
	mpIO_UI_MSG_ERROR = 2,
	mpIO_UI_MSG_CONFIRM_IMPORT = 2,
	mpIO_UI_MSG_CONFIRM_REBOOT = 3
} MpIOUIMessageEnum;

typedef enum MpIOImportUIStatusEnum
{	mpIO_UI_STATUS_IDLE = 0,
	mpIO_UI_STATUS_REFRESH = 1,
	mpIO_UI_STATUS_BUILD = 2,
	mpIO_UI_STATUS_DIALOG = 3,
	mpIO_UI_STATUS_DISPOSE = 4,
	mpIO_UI_STATUS_IMPORT = 5,
	mpIO_UI_STATUS_WARNING = 6,
	mpIO_UI_STATUS_ERROR = 7
} MpIOImportUIStatusEnum;

typedef struct MpIOUIMessageBoxType
{	unsigned short LayerStatus;
	enum MpIOUIMessageEnum Type;
	signed long StatusID;
	unsigned short ErrorNumber;
	plcbit Confirm;
	plcbit Cancel;
} MpIOUIMessageBoxType;

typedef struct MpIOUIScrollSelectType
{	unsigned short MaxSelection;
	unsigned short SelectedIndex;
	plcbit PageUp;
	plcbit StepUp;
	plcbit StepDown;
	plcbit PageDown;
	float RangeStart;
	float RangeEnd;
	unsigned short ScrollStatus;
} MpIOUIScrollSelectType;

typedef struct MpIOUIFileListType
{	plcstring Names[20][101];
	struct MpIOUIScrollSelectType Scroll;
	plcbit Refresh;
} MpIOUIFileListType;

typedef struct MpIOImportUIConnectType
{	unsigned short DefaultLayerStatus;
	enum MpIOImportUIStatusEnum Status;
	struct MpIOUIFileListType FileList;
	struct MpIOUIMessageBoxType MessageBox;
	plcbit Import;
} MpIOImportUIConnectType;

typedef struct MpIOImportUISetupType
{	unsigned short FileListSize;
	unsigned char FileListScrollWindow;
} MpIOImportUISetupType;

typedef struct MpIOStatusIDType
{	enum MpIOErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpIOStatusIDType;

typedef struct MpIODiagType
{	struct MpIOStatusIDType StatusID;
} MpIODiagType;

typedef struct MpIOImportInfoType
{	plcbit ImportFileActive;
	struct MpIODiagType Diag;
} MpIOImportInfoType;

typedef struct MpIOImportUIInfoType
{	struct MpIODiagType Diag;
} MpIOImportUIInfoType;

typedef struct MpIOInternalType
{	unsigned long pObject;
	unsigned long pInstance;
	unsigned long State;
} MpIOInternalType;

typedef struct MpIOImport
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *DeviceName;
	plcstring *FileName;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpIOImportInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[21];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Import;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpIOImport_typ;

typedef struct MpIOImportUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	plcstring *DeviceName;
	struct MpIOImportUISetupType UISetup;
	struct MpIOImportUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpIOImportUIInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[30];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpIOImportUI_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpIOImport(struct MpIOImport* inst);
_BUR_PUBLIC void MpIOImportUI(struct MpIOImportUI* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPIO_ */

