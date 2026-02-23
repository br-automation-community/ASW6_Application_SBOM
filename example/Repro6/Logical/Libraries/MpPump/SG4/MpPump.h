/* Automation Studio generated header file */
/* Do not edit ! */
/* MpPump 6.4.0 */

#ifndef _MPPUMP_
#define _MPPUMP_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpPump_VERSION
#define _MpPump_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
		#include "MTBasics.h"
		#include "MTLookUp.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
		#include "MTBasics.h"
		#include "MTLookUp.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
		#include "MTBasics.h"
		#include "MTLookUp.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpPumpBasicInfoModeEnum
{	mpPUMP_SCALING = 0,
	mpPUMP_LINEARIZING = 1,
	mpPUMP_PRESSURE_MEASUREMENT = 2,
	mpPUMP_FLOW_MEASUREMENT = 3
} MpPumpBasicInfoModeEnum;

typedef enum MpPumpBasicLinearizationModeEnum
{	mpPUMP_LINEARIZATION_OFF = 0,
	mpPUMP_LINEARIZATION_MANUAL = 1,
	mpPUMP_LINEARIZATION_AUTO = 2
} MpPumpBasicLinearizationModeEnum;

typedef enum MpPumpBasicInfoMeasurementEnum
{	mpPUMP_MEASUREMENT_IDLE = 0,
	mpPUMP_MEASUREMENT_SEARCH_MIN = 1,
	mpPUMP_MEASUREMENT_SEARCH_MAX = 2,
	mpPUMP_MEASUREMENT_SEARCH_POINTS = 3
} MpPumpBasicInfoMeasurementEnum;

typedef enum MpPumpErrorEnum
{	mpPUMP_NO_ERROR = 0,
	mpPUMP_ERR_ACTIVATION = -1064239103,
	mpPUMP_ERR_MPLINK_NULL = -1064239102,
	mpPUMP_ERR_MPLINK_INVALID = -1064239101,
	mpPUMP_ERR_MPLINK_CHANGED = -1064239100,
	mpPUMP_ERR_MPLINK_CORRUPT = -1064239099,
	mpPUMP_ERR_MPLINK_IN_USE = -1064239098,
	mpPUMP_ERR_CONFIG_NULL = -1064239096,
	mpPUMP_ERR_CONFIG_NO_PV = -1064239095,
	mpPUMP_ERR_CONFIG_LOAD = -1064239094,
	mpPUMP_WRN_CONFIG_LOAD = -2137980917,
	mpPUMP_ERR_CONFIG_SAVE = -1064239092,
	mpPUMP_ERR_CONFIG_INVALID = -1064239091,
	mpPUMP_ERR_MEASUREMENT_FAIL = -1063984128,
	mpPUMP_ERR_MEASURING_NOT_ALLOWED = -1063984127
} MpPumpErrorEnum;

typedef enum MpPumpBasicAlarmEnum
{	mpPUMP_ALM_MEASUREMENT_TIMEOUT = 0,
	mpPUMP_ALM_MEASUREMENT_FAILED = 1
} MpPumpBasicAlarmEnum;

typedef struct MpPumpBasicTableType
{	float LinearizationCurveX[50];
	float LinearizationCurveY[50];
} MpPumpBasicTableType;

typedef struct MpPumpBasicAutoSetType
{	float MinChange;
	unsigned short StepSizeToFindMinChange;
	unsigned short StepSizeToFindMax;
	unsigned char NumberOfValues;
} MpPumpBasicAutoSetType;

typedef struct MpPumpBasicAutoType
{	struct MpPumpBasicAutoSetType Flow;
	struct MpPumpBasicAutoSetType Pressure;
} MpPumpBasicAutoType;

typedef struct MpPumpBasicLinearizationType
{	enum MpPumpBasicLinearizationModeEnum Mode;
	struct MpPumpBasicTableType FlowTable;
	struct MpPumpBasicTableType PressureTable;
	struct MpPumpBasicAutoType AutoSettings;
} MpPumpBasicLinearizationType;

typedef struct MpPumpBasicConfigType
{	float MaxFlowIn;
	float MaxPressureIn;
	float MinFlowOut;
	float MaxFlowOut;
	float MinPressureOut;
	float MaxPressureOut;
	struct MpPumpBasicLinearizationType Linearization;
} MpPumpBasicConfigType;

typedef struct MpPumpStatusIDType
{	enum MpPumpErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpPumpStatusIDType;

typedef struct MpPumpDiagType
{	struct MpPumpStatusIDType StatusID;
} MpPumpDiagType;

typedef struct MpPumpBasicInfoType
{	enum MpPumpBasicInfoModeEnum Mode;
	enum MpPumpBasicInfoMeasurementEnum Measurement;
	struct MpPumpDiagType Diag;
} MpPumpBasicInfoType;

typedef struct MpPumpInfoType
{	struct MpPumpDiagType Diag;
} MpPumpInfoType;

typedef struct MpPumpBasic
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	float CurrentPressure;
	float CurrentFlow;
	float Pressure;
	float Flow;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	signed short PressureSignal;
	signed short FlowSignal;
	struct MpPumpBasicInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit MeasurePressure;
	plcbit MeasureFlow;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit MeasurementActive;
	plcbit MeasurementDone;
} MpPumpBasic_typ;

typedef struct MpPumpBasicConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpPumpBasicConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpPumpInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Load;
	plcbit Save;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPumpBasicConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpPumpBasic(struct MpPumpBasic* inst);
_BUR_PUBLIC void MpPumpBasicConfig(struct MpPumpBasicConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPPUMP_ */

