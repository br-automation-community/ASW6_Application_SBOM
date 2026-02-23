/* Automation Studio generated header file */
/* Do not edit ! */
/* Cp61850 2.0.6 */

#ifndef _CP61850_
#define _CP61850_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _Cp61850_VERSION
#define _Cp61850_VERSION 2.0.6
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "astime.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
		#include "AsETH.h"
		#include "AsUDP.h"
		#include "AsTCP.h"
		#include "FileIO.h"
		#include "brsystem.h"
#endif
#ifdef _SG4
		#include "astime.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
		#include "AsETH.h"
		#include "AsUDP.h"
		#include "AsTCP.h"
		#include "FileIO.h"
		#include "brsystem.h"
#endif
#ifdef _SGC
		#include "astime.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
		#include "AsETH.h"
		#include "AsUDP.h"
		#include "AsTCP.h"
		#include "FileIO.h"
		#include "brsystem.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum Cp61850AttributeEnum
{	cp61850_DA_UNKNOWN,
	cp61850_DA_BOOLEAN,
	cp61850_DA_INT8,
	cp61850_DA_INT16,
	cp61850_DA_INT32,
	cp61850_DA_INT64,
	cp61850_DA_INT8U,
	cp61850_DA_INT16U,
	cp61850_DA_INT32U,
	cp61850_DA_FLOAT32,
	cp61850_DA_DBPOS,
	cp61850_DA_QUALITY,
	cp61850_DA_TIMESTAMP,
	cp61850_DA_VSTRING,
	cp61850_DA_ENUMERATED,
	cp61850_DA_CODEDENUM,
	cp61850_DA_OSTRING
} Cp61850AttributeEnum;

typedef enum Cp61850DbposEnum
{	cp61850_DBPOS_INTERMEDIATE,
	cp61850_DBPOS_OFF,
	cp61850_DBPOS_ON,
	cp61850_DBPOS_BAD
} Cp61850DbposEnum;

typedef enum Cp61850ErrorEnum
{	cp61850_NO_ERROR = 0,
	cp61850_ERR_ASSERT = -1057216702,
	cp61850_ERR_INIT_SERVER = -1057216701,
	cp61850_ERR_SET_ATTRIBUTE_FAILED = -1057216700,
	cp61850_ERR_GET_ATTRIBUTE_FAILED = -1057216699,
	cp61850_ERR_INVALID_REFERENCE = -1057216698,
	cp61850_ERR_INVALID_VARIABLE = -1057216697,
	cp61850_ERR_INIT_GOOSE = -1057216696,
	cp61850_ERR_DATA_TYPE_MISMATCH = -1057216695,
	cp61850_ERR_CONF_FILE_NOT_FOUND = -1057216694,
	cp61850_ERR_INIT_CLIENT = -1057216693,
	cp61850_ERR_CONTROL_FAILED = -1057216692,
	cp61850_ERR_LOG_OPERATION_FAILED = -1057216691,
	cp61850_WRN_TERMINATED = -2130958526,
	cp61850_WRN_CLIENT_TERMINATED = -2130958525,
	cp61850_SUC_STARTED = 16525122,
	cp61850_SUC_CLIENT_STARTED = 16525123,
	cp61850_INF_DEBUG = 1090266946
} Cp61850ErrorEnum;

typedef enum Cp61850FubStateEnum
{	cp61850_FS_DISABLED,
	cp61850_FS_INIT,
	cp61850_FS_ACTIVE,
	cp61850_FS_DEINIT,
	cp61850_FS_ERROR
} Cp61850FubStateEnum;

typedef enum Cp61850FunctionalConstraintEnum
{	cp61850_FC_NONE,
	cp61850_FC_ST,
	cp61850_FC_MX,
	cp61850_FC_SP,
	cp61850_FC_SV,
	cp61850_FC_CF,
	cp61850_FC_DC,
	cp61850_FC_SG,
	cp61850_FC_SE,
	cp61850_FC_SR,
	cp61850_FC_OR,
	cp61850_FC_BL,
	cp61850_FC_EX,
	cp61850_FC_CO,
	cp61850_FC_GO
} Cp61850FunctionalConstraintEnum;

typedef enum Cp61850LogLevelEnum
{	cp61850_LOG_LEVEL_INFO,
	cp61850_LOG_LEVEL_SUCCESS,
	cp61850_LOG_LEVEL_WARNING,
	cp61850_LOG_LEVEL_ERROR,
	cp61850_LOG_LEVEL_DEBUG
} Cp61850LogLevelEnum;

typedef enum Cp61850QualityValidityEnum
{	cp61850_QV_GOOD,
	cp61850_QV_INVALID,
	cp61850_QV_RESERVED,
	cp61850_QV_QUESTIONABLE
} Cp61850QualityValidityEnum;

typedef struct Cp61850ClientHandleControlType
{	unsigned short Status;
	plcbit NewEvent;
} Cp61850ClientHandleControlType;

typedef struct Cp61850ClientControlInternalType
{	enum Cp61850FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	unsigned long pNode;
	struct Cp61850ClientHandleControlType HandleControl;
	plcbit oldControl;
} Cp61850ClientControlInternalType;

typedef struct Cp61850ClientHandleReadType
{	unsigned short Status;
	plcbit NewEvent;
} Cp61850ClientHandleReadType;

typedef struct Cp61850ClientGetAttributeIntType
{	enum Cp61850FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	unsigned long pVariable;
	unsigned long pNode;
	plctime PollingTimer;
	unsigned long pMmsVariable;
	struct Cp61850ClientHandleReadType HandleRead;
} Cp61850ClientGetAttributeIntType;

typedef struct Cp61850ClientHandleWriteType
{	unsigned short Status;
	plcbit NewEvent;
} Cp61850ClientHandleWriteType;

typedef struct Cp61850ClientInternalType
{	enum Cp61850FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	plcbit DiscoveryCompleted;
	unsigned long IpAddress;
	unsigned long pMmsClient;
	unsigned long pClientCB;
	plctime StartTime;
	plctime InitializationTime;
} Cp61850ClientInternalType;

typedef struct Cp61850ClientParametersType
{	plcstring IpAddress[81];
	unsigned short TcpPort;
} Cp61850ClientParametersType;

typedef struct Cp61850ClientSetAttributeIntType
{	enum Cp61850FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	unsigned long pVariable;
	unsigned long pNode;
	unsigned long pMmsVariable;
	struct Cp61850ClientHandleReadType HandleRead;
	struct Cp61850ClientHandleWriteType HandleWrite;
	plcbit oldWrite;
} Cp61850ClientSetAttributeIntType;

typedef struct Cp61850QualityDetailType
{	plcbit Overflow;
	plcbit OutOfRange;
	plcbit BadReference;
	plcbit Oscillatory;
	plcbit Failure;
	plcbit OldData;
	plcbit Inconsistent;
	plcbit Inaccurate;
} Cp61850QualityDetailType;

typedef struct Cp61850QualityType
{	enum Cp61850QualityValidityEnum Validity;
	struct Cp61850QualityDetailType Detail;
	plcbit SourceSubstituted;
	plcbit Test;
	plcbit OperatorBlocked;
} Cp61850QualityType;

typedef struct Cp61850ServerHandleControlType
{	plcbit NewEvent;
} Cp61850ServerHandleControlType;

typedef struct Cp61850ServerControlInternalType
{	enum Cp61850FubStateEnum FubState;
	signed short InitStep;
	unsigned long pDataObject;
	unsigned long pDataAttribute;
	struct Cp61850ServerHandleControlType HandleControl;
} Cp61850ServerControlInternalType;

typedef struct Cp61850ServerGooseInternalType
{	enum Cp61850FubStateEnum FubState;
	signed short InitStep;
	plcbit EnableAllGooses;
} Cp61850ServerGooseInternalType;

typedef struct Cp61850ServerInternalType
{	enum Cp61850FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	plctime StartTime;
	plctime InitializationTime;
} Cp61850ServerInternalType;

typedef struct Cp61850ServerParametersType
{	plcstring Interface[81];
	plcstring FileDevice[81];
	plcstring ConfigFile[81];
	plcstring IedName[81];
} Cp61850ServerParametersType;

typedef struct Cp61850ServerSetAttributeIntType
{	enum Cp61850FubStateEnum FubState;
	signed short InitStep;
	unsigned long pDataAttribute;
	unsigned long pVariable;
} Cp61850ServerSetAttributeIntType;

typedef struct LogTestInternalType
{	enum Cp61850FubStateEnum FubState;
	signed short InitStep;
	unsigned long pLog;
} LogTestInternalType;

typedef struct Cp61850Client
{
	/* VAR_INPUT (analog) */
	struct Cp61850ClientParametersType Parameters;
	enum Cp61850LogLevelEnum LogLevel;
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	/* VAR (analog) */
	struct Cp61850ClientInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850Client_typ;

typedef struct Cp61850ClientControl
{
	/* VAR_INPUT (analog) */
	struct Cp61850Client* Client;
	plcstring Reference[256];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	unsigned long ControlCounter;
	/* VAR (analog) */
	struct Cp61850ClientControlInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Value;
	plcbit Control;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit ControlDone;
} Cp61850ClientControl_typ;

typedef struct Cp61850ClientGetAttribute
{
	/* VAR_INPUT (analog) */
	struct Cp61850Client* Client;
	plcstring Reference[256];
	plcstring Variable[256];
	plctime PollingPeriod;
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	enum Cp61850AttributeEnum AttributeType;
	enum Cp61850AttributeEnum VariableType;
	enum Cp61850FunctionalConstraintEnum FunctionalConstraint;
	unsigned long ReadCounter;
	/* VAR (analog) */
	struct Cp61850ClientGetAttributeIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850ClientGetAttribute_typ;

typedef struct Cp61850ClientSetAttribute
{
	/* VAR_INPUT (analog) */
	struct Cp61850Client* Client;
	plcstring Reference[256];
	plcstring Variable[256];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	enum Cp61850AttributeEnum AttributeType;
	enum Cp61850AttributeEnum VariableType;
	enum Cp61850FunctionalConstraintEnum FunctionalConstraint;
	unsigned long WriteCounter;
	/* VAR (analog) */
	struct Cp61850ClientSetAttributeIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Write;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit WriteDone;
} Cp61850ClientSetAttribute_typ;

typedef struct Cp61850Server
{
	/* VAR_INPUT (analog) */
	struct Cp61850ServerParametersType Parameters;
	enum Cp61850LogLevelEnum LogLevel;
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	unsigned short Clients;
	/* VAR (analog) */
	struct Cp61850ServerInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850Server_typ;

typedef struct Cp61850ServerControl
{
	/* VAR_INPUT (analog) */
	plcstring Reference[256];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	unsigned long ControlCounter;
	/* VAR (analog) */
	struct Cp61850ServerControlInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit Value;
} Cp61850ServerControl_typ;

typedef struct Cp61850ServerGetAttribute
{
	/* VAR_INPUT (analog) */
	plcstring Reference[256];
	plcstring Variable[256];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	enum Cp61850AttributeEnum AttributeType;
	enum Cp61850AttributeEnum VariableType;
	/* VAR (analog) */
	struct Cp61850ServerSetAttributeIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850ServerGetAttribute_typ;

typedef struct Cp61850ServerGoose
{
	/* VAR_INPUT (analog) */
	plcstring Interface[81];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	unsigned long GoosesReceived;
	unsigned long GoosesSent;
	/* VAR (analog) */
	struct Cp61850ServerGooseInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit EnableAllGooses;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850ServerGoose_typ;

typedef struct Cp61850ServerSetAttribute
{
	/* VAR_INPUT (analog) */
	plcstring Reference[256];
	plcstring Variable[256];
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	enum Cp61850AttributeEnum AttributeType;
	enum Cp61850AttributeEnum VariableType;
	/* VAR (analog) */
	struct Cp61850ServerSetAttributeIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} Cp61850ServerSetAttribute_typ;

typedef struct LogTest
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[81];
	plcstring LogName[81];
	unsigned long pDataIn;
	unsigned long DataInSize;
	/* VAR_OUTPUT (analog) */
	enum Cp61850ErrorEnum ErrorID;
	unsigned long DataReadCounter;
	unsigned long pDataOut;
	unsigned long DataOutSize;
	unsigned long AvailableWriteBufferSize;
	/* VAR (analog) */
	struct LogTestInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit CreateLog;
	plcbit DeleteLog;
	plcbit WriteData;
	plcbit ReadData;
	plcbit BackgroundJob;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit LogCreated;
	plcbit LogDeleted;
	plcbit DataWritten;
} LogTest_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void Cp61850Client(struct Cp61850Client* inst);
_BUR_PUBLIC void Cp61850ClientControl(struct Cp61850ClientControl* inst);
_BUR_PUBLIC void Cp61850ClientGetAttribute(struct Cp61850ClientGetAttribute* inst);
_BUR_PUBLIC void Cp61850ClientSetAttribute(struct Cp61850ClientSetAttribute* inst);
_BUR_PUBLIC void Cp61850Server(struct Cp61850Server* inst);
_BUR_PUBLIC void Cp61850ServerControl(struct Cp61850ServerControl* inst);
_BUR_PUBLIC void Cp61850ServerGetAttribute(struct Cp61850ServerGetAttribute* inst);
_BUR_PUBLIC void Cp61850ServerGoose(struct Cp61850ServerGoose* inst);
_BUR_PUBLIC void Cp61850ServerSetAttribute(struct Cp61850ServerSetAttribute* inst);
_BUR_PUBLIC void LogTest(struct LogTest* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define SV_DATA_BUFFER_SIZE 254U
 #define SV_DATA_BUFFER_SIZE_ARR 253U
 #define SV_MAX_ENTRIES 16U
 #define SV_MAX_ENTRIES_ARR 15U
#else
 _GLOBAL_CONST unsigned short SV_DATA_BUFFER_SIZE;
 _GLOBAL_CONST unsigned short SV_DATA_BUFFER_SIZE_ARR;
 _GLOBAL_CONST unsigned short SV_MAX_ENTRIES;
 _GLOBAL_CONST unsigned short SV_MAX_ENTRIES_ARR;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _CP61850_ */

