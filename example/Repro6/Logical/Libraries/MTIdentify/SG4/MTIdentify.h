/* Automation Studio generated header file */
/* Do not edit ! */
/* MTIdentify 6.4.0 */

#ifndef _MTIDENTIFY_
#define _MTIDENTIFY_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTIdentify_VERSION
#define _MTIdentify_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "brsystem.h"
#endif

#ifdef _SG4
		#include "brsystem.h"
#endif

#ifdef _SGC
		#include "brsystem.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MTIdentifyTransferFcnModeEnum
{	mtIDENTIFY_CONTINUOUS_TF = 0
} MTIdentifyTransferFcnModeEnum;

typedef enum MTIdentifyBestResultInternalEnum
{	mtIDENTIFY_NO_INFO,
	mtIDENTIFY_DIFF_APPROACH,
	mtIDENTIFY_INT_APPROACH
} MTIdentifyBestResultInternalEnum;

typedef enum MTIdentifySystemCheckInternEnum
{	mtIDENTIFY_SYSTEM_NOT_CHECKED,
	mtIDENTIFY_SYSTEMCHECK_PASSED,
	mtIDENTIFY_SYSTEMCHECK_FAILED
} MTIdentifySystemCheckInternEnum;

typedef struct MTIdentifyTransferFcnParType
{	float WeightingFactor;
	float SystemCheckTime;
	float FilterTime;
	unsigned short DownSamplingFactor;
} MTIdentifyTransferFcnParType;

typedef struct MTIdentifyTFSignalScanIntType
{	double MinValue;
	double MeanValue;
	double MaxValue;
} MTIdentifyTFSignalScanIntType;

typedef struct MTIdentifyTFSystemCheckIntType
{	struct MTIdentifyTFSignalScanIntType uScan;
	struct MTIdentifyTFSignalScanIntType yScan;
	unsigned long Counter;
	float ElapsedTime;
	enum MTIdentifySystemCheckInternEnum Status;
} MTIdentifyTFSystemCheckIntType;

typedef struct MTIdentifyStatisticsInternalType
{	unsigned long N;
	double Sum;
	double Sum2;
	double Mean;
	double Mean2;
	double RMS;
	double Variance;
	double StdDeviation;
	unsigned short idx;
	double Array[500];
} MTIdentifyStatisticsInternalType;

typedef struct MTIdentifyTFIdentInternalType
{	double PMatrix[81];
	double DataVector[9];
	double ParameterVector[9];
	unsigned char NumberOfParameters;
	unsigned long Samples;
	double Numerator[5];
	double Denominator[5];
	double e;
	struct MTIdentifyStatisticsInternalType eStatistics;
	double eQuality;
	plcbit IdentificationValid;
	double tmpTimer;
	double parSum;
	struct MTIdentifyStatisticsInternalType parSumStatistics;
	double parQuality;
} MTIdentifyTFIdentInternalType;

typedef struct MTIdentifyTFInternalType
{	float CycleTime;
	struct MTIdentifyTransferFcnParType Parameters;
	plcbit InhibitUpdate;
	plcbit ParametersValid;
	plcbit EnableOld;
	plcbit UpdateOld;
	plcbit IdentifyOld;
	unsigned char OrderNumerator;
	unsigned char OrderDenominator;
	unsigned char MainState;
	struct MTIdentifyTFSystemCheckIntType SystemCheck;
	unsigned long IdentificationCounter;
	double uOffset;
	double yOffset;
	double yOld;
	double uFilt[5];
	double yFilt[5];
	double uDiff[5];
	double yDiff[5];
	double uDiffOld[5];
	double yDiffOld[5];
	double uInt[5];
	double yInt[5];
	struct MTIdentifyStatisticsInternalType yStatistics;
	plcbit ModifiedSystemOutputSignal;
	double ApproachCompareQuality;
	enum MTIdentifyBestResultInternalEnum BestIdentificationResult;
	struct MTIdentifyTFIdentInternalType DataDiffApproach;
	struct MTIdentifyTFIdentInternalType DataIntApproach;
} MTIdentifyTFInternalType;

typedef struct MTIdentifyTransferFcn
{
	/* VAR_INPUT (analog) */
	struct MTIdentifyTransferFcnParType Parameters;
	enum MTIdentifyTransferFcnModeEnum Mode;
	float SystemInput;
	float SystemOutput;
	unsigned char OrderNumerator;
	unsigned char OrderDenominator;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Numerator[5];
	float Denominator[5];
	float Quality;
	float EstimationDeviation;
	/* VAR (analog) */
	struct MTIdentifyTFInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit Identify;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
	plcbit SystemCheckActive;
	plcbit IdentificationActive;
	plcbit IdentificationValid;
} MTIdentifyTransferFcn_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTIdentifyTransferFcn(struct MTIdentifyTransferFcn* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtIDENTIFY_WRN_DENOM_COEFF_NEG (-2131752005)
 #define mtIDENTIFY_WRN_SYS_NOT_SETTLED (-2131752006)
 #define mtIDENTIFY_WRN_SYS_ORDER_INVALID (-2131752007)
 #define mtIDENTIFY_WRN_PAR_INVALID (-2131752008)
 #define mtIDENTIFY_ERR_PAR_INVALID (-1058010183)
 #define mtIDENTIFY_ERR_CYCLETIME_INVALID (-1058010184)
#else
 _GLOBAL_CONST signed long mtIDENTIFY_WRN_DENOM_COEFF_NEG;
 _GLOBAL_CONST signed long mtIDENTIFY_WRN_SYS_NOT_SETTLED;
 _GLOBAL_CONST signed long mtIDENTIFY_WRN_SYS_ORDER_INVALID;
 _GLOBAL_CONST signed long mtIDENTIFY_WRN_PAR_INVALID;
 _GLOBAL_CONST signed long mtIDENTIFY_ERR_PAR_INVALID;
 _GLOBAL_CONST signed long mtIDENTIFY_ERR_CYCLETIME_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTIDENTIFY_ */

