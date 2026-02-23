/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASMCDCS_
#define _ASMCDCS_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum ASMcDcsFilterModeEnum
{	asMCDCS_FILTER_LOW_PASS = 0,
	asMCDCS_FILTER_OFF = 65535
} ASMcDcsFilterModeEnum;

typedef enum ASMcDcsDataTypeEnum
{	asMCDCS_DATATYPE_DINTREAL = 0,
	asMCDCS_DATATYPE_DINT = 1,
	asMCDCS_DATATYPE_REAL = 2,
	asMCDCS_DATATYPE_INT = 4
} ASMcDcsDataTypeEnum;

typedef enum ASMcDcsErrorEnum
{	asMCDCS_ERR_INVALID_MODE = 35500,
	asMCDCS_ERR_INVALID_POSITION_CFG = 35501,
	asMCDCS_ERR_INVALID_SWITCHES = 35502,
	asMCDCS_ERR_INVALID_SWITCHES_PER = 35503,
	asMCDCS_ERR_INVALID_START_POS = 35504,
	asMCDCS_ERR_INVALID_TRACK_OPTION = 35505,
	asMCDCS_ERR_INVALID_FILTER_MODE = 35506,
	asMCDCS_ERR_INVALID_FILTER_PARAM = 35507,
	asMCDCS_ERR_INVALID_TIMESTAMP = 35508,
	asMCDCS_ERR_INTERNAL = 35509,
	asMCDCS_ERR_INVALID_ONLINE_CHNG = 35510,
	asMCDCS_ERR_INVALID_SW_POS_CNT = 35511
} ASMcDcsErrorEnum;

typedef struct ASMcDcsTidcsAdditionalInfoType
{	float Velocity;
	float Acceleration;
	float ActualPosition;
	float CalculatedPosition;
	unsigned short NextCamIndex;
	unsigned short ErrorInIndex;
	plcbit CurrentOutputStatus;
} ASMcDcsTidcsAdditionalInfoType;

typedef struct ASMcDcsAdditionalInfoType
{	float Velocity;
	float Acceleration;
	float ActualPosition;
	float CalculatedPosition;
	unsigned short NextCamIndex;
	unsigned short ErrorInIndex;
} ASMcDcsAdditionalInfoType;

typedef struct ASMcDcsPositionConfigType
{	enum ASMcDcsDataTypeEnum DataType;
	unsigned long Period;
	float PositionCompensation;
} ASMcDcsPositionConfigType;

typedef struct ASMcDcsEdcsTrackType
{	float NetworkCompensation;
	float SensorCompensation;
	float OnCompensation;
	float OffCompensation;
	float Hysteresis;
	plcbit DisableNegativeDirection;
} ASMcDcsEdcsTrackType;

typedef struct ASMcDcsFilterType
{	enum ASMcDcsFilterModeEnum Mode;
	float Parameter1;
	float Parameter2;
	float Parameter3;
	float Parameter4;
	float Parameter5;
	float Parameter6;
} ASMcDcsFilterType;

typedef struct ASMcDcsHwInputType
{	unsigned char UnitState;
	signed char SequenceReadback;
} ASMcDcsHwInputType;

typedef struct ASMcDcsHwOutputType
{	unsigned char UnitControl;
	signed char Sequence;
	signed short Timestamp1;
	signed short Timestamp2;
} ASMcDcsHwOutputType;

typedef struct ASMcDcsEdcsInternalType
{	unsigned short Mode;
	unsigned short cyclesToWait;
	struct ASMcDcsPositionConfigType PositionConfig;
	plcbit ForceEvent;
	struct ASMcDcsEdcsTrackType TrackOptions;
	unsigned long SwitchesPeriod;
	signed long StartPosition;
	float SwitchingPosition[132];
	struct ASMcDcsFilterType FilterOptions;
	struct ASMcDcsHwInputType HwInput;
	signed char OldCount;
	signed char EventCount;
	plcbit Event;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	unsigned short ErrorID;
	plcbit WaitingForEvent;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	float reserve1;
	unsigned short cntSwitchingPositions;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	float tcCycleTime;
	signed long sysTime;
	unsigned char reserve2;
	unsigned char step;
	unsigned short edgeIndex;
	unsigned long memory[100];
} ASMcDcsEdcsInternalType;

typedef struct ASMcDcsEventInputType
{	signed char EventInputData[3];
} ASMcDcsEventInputType;

typedef struct ASMcDcsGdcsTrackType
{	float Filter;
	float OnCompensation;
	float OffCompensation;
	float Hysteresis;
	float DisableNegativeDirection;
} ASMcDcsGdcsTrackType;

typedef struct ASMcDcsGdcsInternalType
{	unsigned short Mode;
	unsigned short cyclesToWait;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsGdcsTrackType TrackOptions;
	unsigned long SwitchesPeriod;
	signed long StartPosition;
	float SwitchingPosition[132];
	plcbit EnableTrack;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	unsigned short ErrorID;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit Value;
	plcbit StartStop;
	unsigned short cntSwitchingPositions;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	float tcCycleTime;
	unsigned char reserve2;
	unsigned char step;
	unsigned short edgeIndex;
	unsigned long memory[100];
} ASMcDcsGdcsInternalType;

typedef struct ASMcDcsPdcsTrackType
{	float NetworkCompensation;
	float OnCompensation;
	float OffCompensation;
	float Hysteresis;
	plcbit DisableNegativeDirection;
} ASMcDcsPdcsTrackType;

typedef struct ASMcDcsPdcsInternalType
{	unsigned short Mode;
	unsigned short cyclesToWait;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPdcsTrackType TrackOptions;
	unsigned long SwitchesPeriod;
	signed long StartPosition;
	float SwitchingPosition[132];
	struct ASMcDcsFilterType FilterOptions;
	struct ASMcDcsHwInputType HwInput;
	signed char OldCount;
	plcbit EnableTrack;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	unsigned short ErrorID;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	plcbit StartStop;
	unsigned short cntSwitchingPositions;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	float tcCycleTime;
	signed long sysTime;
	unsigned char reserve2;
	unsigned char step;
	unsigned short edgeIndex;
	unsigned long memory[100];
} ASMcDcsPdcsInternalType;

typedef struct ASMcDcsPositionType
{	signed long Integer;
	float Real;
} ASMcDcsPositionType;

typedef struct ASMcDcsTidcsSwitchesType
{	unsigned long Period;
	signed long StartPosition;
	float FirstOnPosition[64];
	float CamWidthTime[64];
} ASMcDcsTidcsSwitchesType;

typedef struct ASMcDcsSwitchesType
{	unsigned long Period;
	signed long StartPosition;
	float FirstOnPosition[64];
	float LastOnPosition[64];
} ASMcDcsSwitchesType;

typedef struct ASMcDcsTdcsAdditionalInfoType
{	float Velocity;
	float Acceleration;
	float ActualPosition;
	float CalculatedPosition;
} ASMcDcsTdcsAdditionalInfoType;

typedef struct ASMcDcsTdcsTrackType
{	float NetworkCompensation;
	float OnCompensation;
	float OffCompensation;
	float Hysteresis;
} ASMcDcsTdcsTrackType;

typedef struct ASMcDcsTdcsInternalType
{	unsigned short Mode;
	unsigned short cyclesToWait;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsTdcsTrackType TrackOptions;
	unsigned long SwitchPeriod;
	signed long StartPosition;
	struct ASMcDcsFilterType FilterOptions;
	struct ASMcDcsHwInputType HwInput;
	signed char PositionCountOld1;
	signed char PositionCountOld;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit InOperation;
	plcbit OutputForced;
	signed char EdgeCnt;
	plcbit Busy;
	plcbit Error;
	plcbit CommandedValue;
	unsigned short ErrorID;
	plcbit InitSwitch;
	plcbit SwitchInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsTdcsAdditionalInfoType AdditionalInfo;
	float tcCycleTime;
	signed long sysTime;
	plcbit SwitchPositionUsed;
	unsigned char step;
	unsigned short edgeIndex;
	plcbit PositionCountAlreadyIncremented;
	unsigned char StatusWaitForPeriodEnd;
	unsigned short Reserve2;
	unsigned long memory[100];
} ASMcDcsTdcsInternalType;

typedef struct ASMcDcsTdcsSwitchType
{	unsigned long Period;
	signed long StartPosition;
	float Position;
	signed char PositionCount;
} ASMcDcsTdcsSwitchType;

typedef struct ASMcDcsTidcsTrackType
{	float NetworkCompensation;
	float OnCompensation;
	float OffCompensation;
	float Hysteresis;
} ASMcDcsTidcsTrackType;

typedef struct ASMcDcsTidcsInternalType
{	unsigned short Mode;
	unsigned short cyclesToWait;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsTidcsTrackType TrackOptions;
	unsigned long SwitchesPeriod;
	signed long StartPosition;
	float SwitchingPosition[132];
	struct ASMcDcsFilterType FilterOptions;
	struct ASMcDcsHwInputType HwInput;
	signed char OldCount;
	plcbit EnableTrack;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	unsigned short ErrorID;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	plcbit StartStop;
	plcbit OutputForced;
	unsigned short cntSwitchingPositions;
	plcbit timeStampSaved;
	struct ASMcDcsTidcsAdditionalInfoType AdditionalInfo;
	unsigned char step;
	struct ASMcDcsHwOutputType HwOutput;
	float tcCycleTime;
	signed long sysTime;
	unsigned short edgeIndex;
	unsigned char reserve;
	signed long savedTsValue;
	unsigned long memory[100];
} ASMcDcsTidcsInternalType;

typedef struct ASMcDcsEventDigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	struct ASMcDcsSwitchesType Switches;
	struct ASMcDcsEdcsTrackType TrackOptions;
	struct ASMcDcsFilterType FilterOptions;
	unsigned short Mode;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPositionType Position;
	struct ASMcDcsHwInputType HwInput;
	struct ASMcDcsEventInputType EventInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	/* VAR (analog) */
	struct ASMcDcsEdcsInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit ForceEventInput;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	plcbit WaitingForEvent;
} ASMcDcsEventDigitalCamSwitch_typ;

typedef struct ASMcDcsGeneralDigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	struct ASMcDcsSwitchesType Switches;
	struct ASMcDcsGdcsTrackType TrackOptions;
	unsigned short Mode;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPositionType Position;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	/* VAR (analog) */
	struct ASMcDcsGdcsInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit EnableTrack;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit Value;
} ASMcDcsGeneralDigitalCamSwitch_typ;

typedef struct ASMcDcsPrecisionDigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	struct ASMcDcsSwitchesType Switches;
	struct ASMcDcsPdcsTrackType TrackOptions;
	struct ASMcDcsFilterType FilterOptions;
	unsigned short Mode;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPositionType Position;
	struct ASMcDcsHwInputType HwInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsAdditionalInfoType AdditionalInfo;
	/* VAR (analog) */
	struct ASMcDcsPdcsInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit EnableTrack;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
} ASMcDcsPrecisionDigitalCamSwitch_typ;

typedef struct ASMcDcsThresholdDigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	struct ASMcDcsTdcsSwitchType Switch;
	struct ASMcDcsTdcsTrackType TrackOptions;
	struct ASMcDcsFilterType FilterOptions;
	unsigned short Mode;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPositionType Position;
	struct ASMcDcsHwInputType HwInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsTdcsAdditionalInfoType AdditionalInfo;
	/* VAR (analog) */
	struct ASMcDcsTdcsInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitch;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit ForceOutputStatus;
	plcbit ForceOutput;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	plcbit SwitchInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
	plcbit SwitchPositionUsed;
	plcbit CommandedValue;
} ASMcDcsThresholdDigitalCamSwitch_typ;

typedef struct ASMcDcsTimedDigitalCamSwitch
{
	/* VAR_INPUT (analog) */
	struct ASMcDcsTidcsSwitchesType Switches;
	struct ASMcDcsTidcsTrackType TrackOptions;
	struct ASMcDcsFilterType FilterOptions;
	unsigned short Mode;
	struct ASMcDcsPositionConfigType PositionConfig;
	struct ASMcDcsPositionType Position;
	struct ASMcDcsHwInputType HwInput;
	/* VAR_OUTPUT (analog) */
	unsigned short ErrorID;
	struct ASMcDcsHwOutputType HwOutput;
	struct ASMcDcsTidcsAdditionalInfoType AdditionalInfo;
	/* VAR (analog) */
	struct ASMcDcsTidcsInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit InitSwitches;
	plcbit InitTrackOptions;
	plcbit InitFilterOptions;
	plcbit EnableTrack;
	plcbit ForceOutputStatus;
	plcbit ForceOutput;
	/* VAR_OUTPUT (digital) */
	plcbit InOperation;
	plcbit Busy;
	plcbit Error;
	plcbit SwitchesInitialized;
	plcbit TrackOptionsInitialized;
	plcbit FilterOptionsInitialized;
} ASMcDcsTimedDigitalCamSwitch_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ASMcDcsEventDigitalCamSwitch(struct ASMcDcsEventDigitalCamSwitch* inst);
_BUR_PUBLIC void ASMcDcsGeneralDigitalCamSwitch(struct ASMcDcsGeneralDigitalCamSwitch* inst);
_BUR_PUBLIC void ASMcDcsPrecisionDigitalCamSwitch(struct ASMcDcsPrecisionDigitalCamSwitch* inst);
_BUR_PUBLIC void ASMcDcsThresholdDigitalCamSwitch(struct ASMcDcsThresholdDigitalCamSwitch* inst);
_BUR_PUBLIC void ASMcDcsTimedDigitalCamSwitch(struct ASMcDcsTimedDigitalCamSwitch* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ASMCDCS_MODE_FORCE_OUTPUT 4U
 #define ASMCDCS_TDCS_MODE_PERIOD 1U
 #define ASMCDCS_TDCS_MODE_EXP_PERIOD 2U
 #define ASMCDCS_TDCS_MODE_DIRECT 0U
 #define ASMCDCS_MODE_ENABLETRACK_AT_ONCE 128U
 #define ASMCDCS_MODE_FORCE_BEHAVIOR_2 64U
 #define ASMCDCS_MODE_FORCE_BEHAVIOR_1 0U
 #define ASMCDCS_MODE_DIRECT_SET_VALUE 8U
 #define ASMCDCS_MODE_PERIOD_ADVANCED 2U
 #define ASMCDCS_MODE_PERIOD 1U
 #define ASMCDCS_MODE_FORCE_EVENT 2U
 #define ASMCDCS_MODE_DIRECT 0U
#else
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_FORCE_OUTPUT;
 _GLOBAL_CONST unsigned short ASMCDCS_TDCS_MODE_PERIOD;
 _GLOBAL_CONST unsigned short ASMCDCS_TDCS_MODE_EXP_PERIOD;
 _GLOBAL_CONST unsigned short ASMCDCS_TDCS_MODE_DIRECT;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_ENABLETRACK_AT_ONCE;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_FORCE_BEHAVIOR_2;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_FORCE_BEHAVIOR_1;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_DIRECT_SET_VALUE;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_PERIOD_ADVANCED;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_PERIOD;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_FORCE_EVENT;
 _GLOBAL_CONST unsigned short ASMCDCS_MODE_DIRECT;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASMCDCS_ */

