/* Automation Studio generated header file */
/* Do not edit ! */
/* MpScale 6.4.0 */

#ifndef _MPSCALE_
#define _MPSCALE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpScale_VERSION
#define _MpScale_VERSION 6.4.0
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
typedef enum MpScaleExecutingCmdEnum
{	mpSCALE_CMD_IDLE = 0,
	mpSCALE_CMD_CALIBRATION_NEG = 1,
	mpSCALE_CMD_CALIBRATION_POS = 2,
	mpSCALE_CMD_CALIBRATION = 3
} MpScaleExecutingCmdEnum;

typedef enum MpScalePulseInputSourceEnum
{	mpSCALE_SOURCE_PULSE = 0,
	mpSCALE_SOURCE_COUNTER_2BYTES = 1,
	mpSCALE_SOURCE_COUNTER_4BYTES = 2
} MpScalePulseInputSourceEnum;

typedef enum MpScalePulseDirectionEnum
{	mpSCALE_PULSE_UNDEFINED = 0,
	mpSCALE_PULSE_POSITIVE = 1,
	mpSCALE_PULSE_NEGATIVE = 2
} MpScalePulseDirectionEnum;

typedef enum MpScaleABRPositionTypeEnum
{	mpSCALE_SOURCE_INT = 0,
	mpSCALE_SOURCE_DINT = 1
} MpScaleABRPositionTypeEnum;

typedef enum MpScaleErrorEnum
{	mpSCALE_NO_ERROR = 0,
	mpSCALE_ERR_ACTIVATION = -1064239103,
	mpSCALE_ERR_MPLINK_NULL = -1064239102,
	mpSCALE_ERR_MPLINK_INVALID = -1064239101,
	mpSCALE_ERR_MPLINK_CHANGED = -1064239100,
	mpSCALE_ERR_MPLINK_CORRUPT = -1064239099,
	mpSCALE_ERR_MPLINK_IN_USE = -1064239098,
	mpSCALE_ERR_CONFIG_NULL = -1064239096,
	mpSCALE_ERR_CONFIG_NO_PV = -1064239095,
	mpSCALE_ERR_CONFIG_LOAD = -1064239094,
	mpSCALE_WRN_CONFIG_LOAD = -2137980917,
	mpSCALE_ERR_CONFIG_SAVE = -1064239092,
	mpSCALE_ERR_CONFIG_INVALID = -1064239091,
	mpSCALE_WRN_PARAMETER_LIMITED = -2137758720,
	mpSCALE_WRN_POS_LIMITED_MAX = -2137758719,
	mpSCALE_WRN_POS_LIMITED_MIN = -2137758718
} MpScaleErrorEnum;

typedef enum MpScalePotiAlarmEnum
{	mpSCALE_ALM_PARAMETER_LIMITED = 0,
	mpSCALE_ALM_POSITION_LIMITED_MAX = 1,
	mpSCALE_ALM_POSITION_LIMITED_MIN = 2
} MpScalePotiAlarmEnum;

typedef struct MpScalePotiConfigType
{	signed short MinAnalogValue;
	signed short MaxAnalogValue;
	float MinPosition;
	float MaxPosition;
	signed short InputTolerance;
	float ToleranceTime;
} MpScalePotiConfigType;

typedef struct MpScaleABRConfigType
{	unsigned long ReferenceImpulseNumber;
	float ReferenceDistance;
	float OffsetPosition;
	enum MpScaleABRPositionTypeEnum PositionDataType;
	unsigned long InputTolerance;
	float ToleranceTime;
} MpScaleABRConfigType;

typedef struct MpScalePulseConfigType
{	plcbit AbsoluteMeasurement;
	unsigned short PulsesPerRotation;
	float DistancePerRotation;
	float OffsetPosition;
	enum MpScalePulseInputSourceEnum InputSource;
	float MinPosition;
	float MaxPosition;
} MpScalePulseConfigType;

typedef struct MpScalePumpDirectionType
{	float MinFlow;
	float MaxFlow;
	float FlowOffset;
	float MaxVelocity;
} MpScalePumpDirectionType;

typedef struct MpScalePumpConfigType
{	plcstring Name[101];
	struct MpScalePumpDirectionType PositiveDirection;
	struct MpScalePumpDirectionType NegativeDirection;
} MpScalePumpConfigType;

typedef struct MpScalePressureConfigType
{	float FilterTime;
	signed short MinAnalogValue;
	signed short MaxAnalogValue;
	float MinPressure;
	float MaxPressure;
} MpScalePressureConfigType;

typedef struct MpScaleStatusIDType
{	enum MpScaleErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpScaleStatusIDType;

typedef struct MpScaleDiagExtType
{	struct MpScaleStatusIDType StatusID;
	enum MpScaleExecutingCmdEnum ExecutingCommand;
} MpScaleDiagExtType;

typedef struct MpScalePotiInfoType
{	signed short OldCalibrationValueNegative;
	signed short NewCalibrationValueNegative;
	signed short OldCalibrationValuePositive;
	signed short NewCalibrationValuePositive;
	struct MpScaleDiagExtType Diag;
} MpScalePotiInfoType;

typedef struct MpScaleABRInfoType
{	struct MpScaleDiagExtType Diag;
} MpScaleABRInfoType;

typedef struct MpScaleDiagType
{	struct MpScaleStatusIDType StatusID;
} MpScaleDiagType;

typedef struct MpScalePulseInfoType
{	struct MpScaleDiagType Diag;
} MpScalePulseInfoType;

typedef struct MpScalePumpInfoType
{	struct MpScaleDiagType Diag;
} MpScalePumpInfoType;

typedef struct MpScaleInfoType
{	struct MpScaleDiagType Diag;
} MpScaleInfoType;

typedef struct MpScalePulse
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	enum MpScalePulseDirectionEnum CountingDirection;
	unsigned short Counter2Bytes;
	signed long Counter4Bytes;
	float DynamicOffset;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Position;
	struct MpScalePulseInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Pulse;
	plcbit SetDynamicOffset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpScalePulse_typ;

typedef struct MpScalePoti
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	signed short AnalogInput;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Position;
	struct MpScalePotiInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit CalibrateNegative;
	plcbit CalibratePositive;
	plcbit SaveCalibration;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CalibrationNegativeReady;
	plcbit CalibrationPositiveReady;
	plcbit SaveCalibrationNegativeDone;
	plcbit SaveCalibrationPositiveDone;
} MpScalePoti_typ;

typedef struct MpScaleABR
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	signed short PositionINT;
	signed long PositionDINT;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Position;
	struct MpScaleABRInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Calibrate;
	plcbit SaveCalibration;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CalibrationReady;
	plcbit SaveCalibrationDone;
} MpScaleABR_typ;

typedef struct MpScalePump
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	float Velocity;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float PumpFlow;
	struct MpScalePumpInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpScalePump_typ;

typedef struct MpScalePressure
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	signed short AnalogInput;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Pressure;
	struct MpScaleInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpScalePressure_typ;

typedef struct MpScalePumpConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpScalePumpConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpScaleInfoType Info;
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
} MpScalePumpConfig_typ;

typedef struct MpScalePulseConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpScalePulseConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpScaleInfoType Info;
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
} MpScalePulseConfig_typ;

typedef struct MpScalePotiConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpScalePotiConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpScaleInfoType Info;
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
} MpScalePotiConfig_typ;

typedef struct MpScaleABRConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpScaleABRConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpScaleInfoType Info;
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
} MpScaleABRConfig_typ;

typedef struct MpScalePressureConfig
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpScalePressureConfigType* Configuration;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpScaleInfoType Info;
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
} MpScalePressureConfig_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpScalePulse(struct MpScalePulse* inst);
_BUR_PUBLIC void MpScalePoti(struct MpScalePoti* inst);
_BUR_PUBLIC void MpScaleABR(struct MpScaleABR* inst);
_BUR_PUBLIC void MpScalePump(struct MpScalePump* inst);
_BUR_PUBLIC void MpScalePressure(struct MpScalePressure* inst);
_BUR_PUBLIC void MpScalePumpConfig(struct MpScalePumpConfig* inst);
_BUR_PUBLIC void MpScalePulseConfig(struct MpScalePulseConfig* inst);
_BUR_PUBLIC void MpScalePotiConfig(struct MpScalePotiConfig* inst);
_BUR_PUBLIC void MpScaleABRConfig(struct MpScaleABRConfig* inst);
_BUR_PUBLIC void MpScalePressureConfig(struct MpScalePressureConfig* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPSCALE_ */

