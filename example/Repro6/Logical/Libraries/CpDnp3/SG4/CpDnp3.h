/* Automation Studio generated header file */
/* Do not edit ! */
/* CpDnp3 1.4.0 */

#ifndef _CPDNP3_
#define _CPDNP3_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _CpDnp3_VERSION
#define _CpDnp3_VERSION 1.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "astime.h"
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsTCP.h"
		#include "AsUDP.h"
		#include "AsETH.h"
		#include "AsARCfg.h"
		#include "FileIO.h"
		#include "dvframe.h"
		#include "ArSsl.h"
#endif
#ifdef _SG4
		#include "astime.h"
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsTCP.h"
		#include "AsUDP.h"
		#include "AsETH.h"
		#include "AsARCfg.h"
		#include "FileIO.h"
		#include "dvframe.h"
		#include "ArSsl.h"
#endif
#ifdef _SGC
		#include "astime.h"
		#include "sys_lib.h"
		#include "brsystem.h"
		#include "AsTCP.h"
		#include "AsUDP.h"
		#include "AsETH.h"
		#include "AsARCfg.h"
		#include "FileIO.h"
		#include "dvframe.h"
		#include "ArSsl.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum CpDnp3AnalogValueEnum
{	cpDNP3_ANALOG_VALUE_INT,
	cpDNP3_ANALOG_VALUE_DINT,
	cpDNP3_ANALOG_VALUE_REAL,
	cpDNP3_ANALOG_VALUE_LREAL
} CpDnp3AnalogValueEnum;

typedef enum CpDnp3ClassEnum
{	cpDNP3_CLASS_0 = 1,
	cpDNP3_CLASS_1 = 2,
	cpDNP3_CLASS_2 = 4,
	cpDNP3_CLASS_3 = 8,
	cpDNP3_NO_CLASS = 16
} CpDnp3ClassEnum;

typedef enum CpDnp3CounterValueEnum
{	cpDNP3_COUNTER_VALUE_INT,
	cpDNP3_COUNTER_VALUE_DINT,
	cpDNP3_COUNTER_VALUE_UINT,
	cpDNP3_COUNTER_VALUE_UDINT
} CpDnp3CounterValueEnum;

typedef enum CpDnp3DoubleInputEnum
{	cpDNP3_DI_INTERMEDIATE,
	cpDNP3_DI_OFF,
	cpDNP3_DI_ON,
	cpDNP3_DI_INDETERMINATE
} CpDnp3DoubleInputEnum;

typedef enum CpDnp3ErrorEnum
{	cpDNP3_NO_ERROR = 0,
	cpDNP3_ERR_ASSERT = -1057216752,
	cpDNP3_ERR_STACK_INIT_FAILED = -1057216751,
	cpDNP3_ERR_MASTER_NOT_REGISTERED = -1057216750,
	cpDNP3_ERR_DP_WRITE_FAILED = -1057216749,
	cpDNP3_ERR_INVALID_DP = -1057216748,
	cpDNP3_WRN_TERMINATED = -2130958576,
	cpDNP3_WRN_INVALID_POINT_COUNT = -2130958575,
	cpDNP3_SUC_STARTED = 16525072,
	cpDNP3_INF_DEBUG = 1090266896
} CpDnp3ErrorEnum;

typedef enum CpDnp3FubStateEnum
{	cpDNP3_FS_DISABLED,
	cpDNP3_FS_INIT,
	cpDNP3_FS_ACTIVE,
	cpDNP3_FS_DEINIT,
	cpDNP3_FS_ERROR
} CpDnp3FubStateEnum;

typedef enum CpDnp3GroupEnum
{	cpDNP3_GRP_BINARY_INPUT = 1,
	cpDNP3_GRP_BINARY_INPUT_E = 2,
	cpDNP3_GRP_DOUBLE_BINARY_INPUT = 3,
	cpDNP3_GRP_DOUBLE_BINARY_INPUT_E = 4,
	cpDNP3_GRP_BINARY_OUTPUT_STATUS = 10,
	cpDNP3_GRP_BINARY_OUTPUT_E = 11,
	cpDNP3_GRP_BINARY_OUTPUT_CMD = 12,
	cpDNP3_GRP_BINARY_OUTPUT_CMD_E = 13,
	cpDNP3_GRP_COUNTER = 20,
	cpDNP3_GRP_FROZEN_COUNTER = 21,
	cpDNP3_GRP_COUNTER_E = 22,
	cpDNP3_GRP_FROZEN_COUNTER_E = 23,
	cpDNP3_GRP_ANALOG_INPUT = 30,
	cpDNP3_GRP_FROZEN_ANALOG_INPUT = 31,
	cpDNP3_GRP_ANALOG_INPUT_E = 32,
	cpDNP3_GRP_FROZEN_ANALOG_INPUT_E = 33,
	cpDNP3_GRP_ANALOG_INPUT_DB = 34,
	cpDNP3_GRP_ANALOG_OUTPUT_STATUS = 40,
	cpDNP3_GRP_ANALOG_OUTPUT = 41,
	cpDNP3_GRP_ANALOG_OUTPUT_E = 42,
	cpDNP3_GRP_ANALOG_OUTPUT_CMD_E = 43,
	cpDNP3_GRP_OCTET_STRING = 110,
	cpDNP3_GRP_OCTET_STRING_E = 111
} CpDnp3GroupEnum;

typedef enum CpDnp3LogLevelEnum
{	cpDNP3_LOG_LEVEL_INFO,
	cpDNP3_LOG_LEVEL_SUCCESS,
	cpDNP3_LOG_LEVEL_WARNING,
	cpDNP3_LOG_LEVEL_ERROR,
	cpDNP3_LOG_LEVEL_DEBUG
} CpDnp3LogLevelEnum;

typedef enum CpDnp3VariationEnum
{	cpDNP3_VARIATION_1 = 1,
	cpDNP3_VARIATION_2,
	cpDNP3_VARIATION_3,
	cpDNP3_VARIATION_4,
	cpDNP3_VARIATION_5,
	cpDNP3_VARIATION_6,
	cpDNP3_VARIATION_7,
	cpDNP3_VARIATION_8,
	cpDNP3_VARIATION_9,
	cpDNP3_VARIATION_10,
	cpDNP3_VARIATION_11,
	cpDNP3_VARIATION_12
} CpDnp3VariationEnum;

typedef struct CpDnp3AnalogInputInternalType
{	enum CpDnp3FubStateEnum FubState;
	unsigned long pPoint;
	unsigned long pFrozenPoint;
	signed short InitStep;
} CpDnp3AnalogInputInternalType;

typedef struct CpDnp3AnalogInputsType
{	unsigned short Points;
} CpDnp3AnalogInputsType;

typedef struct CpDnp3AnalogOutputsType
{	unsigned short Points;
} CpDnp3AnalogOutputsType;

typedef struct CpDnp3AnalogValueType
{	signed short INT_;
	signed long DINT_;
	float REAL_;
	double LREAL_;
} CpDnp3AnalogValueType;

typedef struct CpDnp3BinaryInputInternalType
{	enum CpDnp3FubStateEnum FubState;
	unsigned long pPoint;
	signed short InitStep;
} CpDnp3BinaryInputInternalType;

typedef struct CpDnp3BinaryInputsType
{	unsigned short Points;
} CpDnp3BinaryInputsType;

typedef struct CpDnp3BinaryOutputInternalType
{	enum CpDnp3FubStateEnum FubState;
	unsigned long pPoint;
	unsigned long pCmdPoint;
	signed short InitStep;
} CpDnp3BinaryOutputInternalType;

typedef struct CpDnp3BinaryOutputsType
{	unsigned short Points;
} CpDnp3BinaryOutputsType;

typedef struct CpDnp3BufferUsageType
{	unsigned long BinaryInputs;
	unsigned long DoubleInputs;
	unsigned long Counters;
	unsigned long AnalogInputs;
} CpDnp3BufferUsageType;

typedef struct CpDnp3CountersType
{	unsigned short Points;
} CpDnp3CountersType;

typedef struct CpDnp3CounterValueType
{	signed short INT_;
	signed long DINT_;
	unsigned short UINT_;
	unsigned long UDINT_;
} CpDnp3CounterValueType;

typedef struct CpDnp3DoubleInputsType
{	unsigned short Points;
} CpDnp3DoubleInputsType;

typedef struct CpDnp3OctetStringsType
{	unsigned short Points;
	plcbit Class0;
} CpDnp3OctetStringsType;

typedef struct CpDnp3OutstationInternalType
{	enum CpDnp3FubStateEnum FubState;
	unsigned short CycleTime;
	signed short InitStep;
	unsigned long pOs;
	unsigned long pServer;
	plctime StartTime;
	plctime InitializationTime;
} CpDnp3OutstationInternalType;

typedef struct CpDnp3TcpParType
{	unsigned short TcpPort;
	unsigned short ReceiveTimeout;
	unsigned short Retries;
	unsigned short KeepAliveTimeout;
	plcstring InterfaceName[81];
	plcstring MasterAddress[256];
	plcbit MultipleMasters;
} CpDnp3TcpParType;

typedef struct CpDnp3UnsolicitedType
{	plcbit Enabled;
	unsigned short MasterAddress;
} CpDnp3UnsolicitedType;

typedef struct CpDnp3TlsParType
{	plcbit Enabled;
	plcstring ConfigurationName[81];
} CpDnp3TlsParType;

typedef struct CpDnp3ParametersType
{	unsigned short OutstationAddress;
	struct CpDnp3TcpParType TcpParameters;
	struct CpDnp3BinaryInputsType BinaryInputs;
	struct CpDnp3DoubleInputsType DoubleInputs;
	struct CpDnp3BinaryOutputsType BinaryOutputs;
	struct CpDnp3CountersType Counters;
	struct CpDnp3AnalogInputsType AnalogInputs;
	struct CpDnp3AnalogOutputsType AnalogOutputs;
	struct CpDnp3OctetStringsType OctetStrings;
	struct CpDnp3UnsolicitedType Unsolicited;
	plcbit SelfAddress;
	struct CpDnp3TlsParType TlsParameters;
} CpDnp3ParametersType;

typedef struct CpDnp3AnalogInput
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3AnalogValueEnum ValueType;
	enum CpDnp3ClassEnum Class;
	enum CpDnp3ClassEnum FrozenClass;
	double Deadband;
	struct CpDnp3AnalogValueType Value;
	unsigned char Flags;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	enum CpDnp3VariationEnum FrozenVariation;
	enum CpDnp3VariationEnum FrozenEventVariation;
	struct CpDnp3AnalogValueType FrozenValue;
	unsigned char FrozenFlags;
	/* VAR (analog) */
	struct CpDnp3AnalogInputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit UseFlags;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3AnalogInput_typ;

typedef struct CpDnp3AnalogOutput
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3AnalogValueEnum ValueType;
	enum CpDnp3ClassEnum Class;
	enum CpDnp3ClassEnum CmdClass;
	double Deadband;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	enum CpDnp3VariationEnum CommandEventVariation;
	struct CpDnp3AnalogValueType Value;
	unsigned char Flags;
	/* VAR (analog) */
	struct CpDnp3BinaryOutputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3AnalogOutput_typ;

typedef struct CpDnp3BinaryInput
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3ClassEnum Class;
	unsigned char Flags;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	/* VAR (analog) */
	struct CpDnp3BinaryInputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit UseFlags;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3BinaryInput_typ;

typedef struct CpDnp3BinaryOutput
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3ClassEnum Class;
	enum CpDnp3ClassEnum CmdClass;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	enum CpDnp3VariationEnum CommandEventVariation;
	unsigned char Flags;
	/* VAR (analog) */
	struct CpDnp3BinaryOutputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit UseFlags;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit Value;
} CpDnp3BinaryOutput_typ;

typedef struct CpDnp3Counter
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3CounterValueEnum ValueType;
	enum CpDnp3ClassEnum Class;
	enum CpDnp3ClassEnum FrozenClass;
	struct CpDnp3CounterValueType Value;
	unsigned char Flags;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	enum CpDnp3VariationEnum FrozenVariation;
	enum CpDnp3VariationEnum FrozenEventVariation;
	struct CpDnp3CounterValueType FrozenValue;
	unsigned char FrozenFlags;
	/* VAR (analog) */
	struct CpDnp3AnalogInputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit UseFlags;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3Counter_typ;

typedef struct CpDnp3DoubleInput
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	enum CpDnp3ClassEnum Class;
	enum CpDnp3DoubleInputEnum Value;
	unsigned char Flags;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	enum CpDnp3VariationEnum Variation;
	enum CpDnp3VariationEnum EventVariation;
	/* VAR (analog) */
	struct CpDnp3BinaryInputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit UseFlags;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3DoubleInput_typ;

typedef struct CpDnp3OctetString
{
	/* VAR_INPUT (analog) */
	struct CpDnp3Outstation* Outstation;
	unsigned short Index;
	unsigned char Value[255];
	unsigned char Length;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	/* VAR (analog) */
	struct CpDnp3BinaryInputInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpDnp3OctetString_typ;

typedef struct CpDnp3Outstation
{
	/* VAR_INPUT (analog) */
	struct CpDnp3ParametersType Parameters;
	enum CpDnp3LogLevelEnum LogLevel;
	/* VAR_OUTPUT (analog) */
	enum CpDnp3ErrorEnum ErrorID;
	struct CpDnp3BufferUsageType BufferUsage;
	unsigned short Clients;
	/* VAR (analog) */
	struct CpDnp3OutstationInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit ColdRestart;
	plcbit WarmRestart;
} CpDnp3Outstation_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CpDnp3AnalogInput(struct CpDnp3AnalogInput* inst);
_BUR_PUBLIC void CpDnp3AnalogOutput(struct CpDnp3AnalogOutput* inst);
_BUR_PUBLIC void CpDnp3BinaryInput(struct CpDnp3BinaryInput* inst);
_BUR_PUBLIC void CpDnp3BinaryOutput(struct CpDnp3BinaryOutput* inst);
_BUR_PUBLIC void CpDnp3Counter(struct CpDnp3Counter* inst);
_BUR_PUBLIC void CpDnp3DoubleInput(struct CpDnp3DoubleInput* inst);
_BUR_PUBLIC void CpDnp3OctetString(struct CpDnp3OctetString* inst);
_BUR_PUBLIC void CpDnp3Outstation(struct CpDnp3Outstation* inst);


#ifdef __cplusplus
};
#endif
#endif /* _CPDNP3_ */

