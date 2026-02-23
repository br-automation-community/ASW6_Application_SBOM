/* Automation Studio generated header file */
/* Do not edit ! */
/* MTFilter 6.4.0 */

#ifndef _MTFILTER_
#define _MTFILTER_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTFilter_VERSION
#define _MTFilter_VERSION 6.4.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MTTypes.h"
		#include "sys_lib.h"
		#include "brsystem.h"
#endif

#ifdef _SG4
		#include "MTTypes.h"
		#include "sys_lib.h"
		#include "brsystem.h"
#endif

#ifdef _SGC
		#include "MTTypes.h"
		#include "sys_lib.h"
		#include "brsystem.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MTFilterTypeEnum
{	mtFILTER_BESSEL = 0,
	mtFILTER_BUTTERWORTH = 1
} MTFilterTypeEnum;

typedef enum MTFilterKalmanModeEnum
{	mtFILTER_NO_DISTURBANCE = 0,
	mtFILTER_CONST_DISTURBANCE = 1,
	mtFILTER_OSCILLATING_DISTURBANCE = 2
} MTFilterKalmanModeEnum;

typedef struct MTFilterMovingAvgInternalType
{	float Ts;
	plcbit ParameterValid;
	unsigned short NumOfElmements;
	double Sum;
	unsigned long pBuffer;
	unsigned short CntAct;
	unsigned short CntOld;
	unsigned short WindowLength;
	unsigned short BufferLength;
	plcbit BufferFull;
	plcbit MemAllocated;
	plcbit Update;
	plcbit UpdateOld;
	plcbit EnableOld;
	unsigned short statusTMP;
} MTFilterMovingAvgInternalType;

typedef struct MTFilterLowPassInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParameterValid;
	double AngularFrequency;
	double Num[6];
	double Den[6];
	double BVector[6];
	double AVector[6];
	double XVector[5];
	unsigned char TypeOld;
	unsigned char OrderOld;
	float CutOffFrequencyOld;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	unsigned long CounterOld;
	plcbit SysRefParaNew;
	struct MTTransferFcnType SystemReference;
} MTFilterLowPassInternalType;

typedef struct MTFilterHighPassInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParameterValid;
	double AngularFrequency;
	double Num[6];
	double Den[6];
	double BVector[6];
	double AVector[6];
	double XVector[5];
	unsigned char TypeOld;
	unsigned char OrderOld;
	float CutOffFrequencyOld;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	unsigned long CounterOld;
	plcbit SysRefParaNew;
	struct MTTransferFcnType SystemReference;
} MTFilterHighPassInternalType;

typedef struct MTFilterBandPassInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParameterValid;
	double AngularFrequency;
	double BandwidthRad;
	double Num[6];
	double Den[6];
	double BVector[6];
	double AVector[6];
	double XVector[5];
	unsigned char TypeOld;
	unsigned char OrderOld;
	float CenterFrequencyOld;
	float BandwidthOld;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	unsigned long CounterOld;
	plcbit SysRefParaNew;
	struct MTTransferFcnType SystemReference;
} MTFilterBandPassInternalType;

typedef struct MTFilterBandStopInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParameterValid;
	double AngularFrequency;
	double BandwidthRad;
	double Num[6];
	double Den[6];
	double BVector[6];
	double AVector[6];
	double XVector[5];
	unsigned char TypeOld;
	unsigned char OrderOld;
	float CenterFrequencyOld;
	float BandwidthOld;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	unsigned long CounterOld;
	plcbit SysRefParaNew;
	struct MTTransferFcnType SystemReference;
} MTFilterBandStopInternalType;

typedef struct MTFilterNotchInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParametersValid;
	float UpperFrequency;
	float LowerFrequency;
	float BandwidthAct;
	float DampingConstant;
	float FilterTimeConstant;
	double Num[3];
	double Den[3];
	double BVector[3];
	double AVector[3];
	double XVector[2];
	unsigned char TypeOld;
	unsigned char OrderOld;
	float CutOffFrequencyOld;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	plcbit SysRefParaNew;
	unsigned long CounterOld;
	struct MTTransferFcnType SystemReference;
} MTFilterNotchInternalType;

typedef struct MTFilterBiQuadInternalType
{	float Ts;
	double SamplingFrequency;
	plcbit ParameterValid;
	double Num[3];
	double Den[3];
	double BVector[3];
	double AVector[3];
	double XVector[2];
	float FrequencyNumeratorOld;
	float DampingRatioNumeratorOld;
	float FrequencyDenominatorOld;
	float DampingRatioDenominatorOld;
	double FrequencyNumeratorRad;
	double FrequencyDenominatorRad;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	plcbit DisabledBusy;
	plcbit SysRefParaNew;
	unsigned long CounterOld;
	struct MTTransferFcnType SystemReference;
} MTFilterBiQuadInternalType;

typedef struct MTFilterKalmanSysType
{	double A[16];
	double b[4];
	double cT[4];
	double d;
	unsigned char n;
} MTFilterKalmanSysType;

typedef struct MTFilterKalmanExtSysType
{	double A[36];
	double b[6];
	double cT[6];
	double d;
	unsigned char n;
} MTFilterKalmanExtSysType;

typedef struct MTFilterKalmanDiscreteExtSysType
{	double Phi[36];
	double Gamma[6];
	double cT[6];
	double d;
	unsigned char n;
} MTFilterKalmanDiscreteExtSysType;

typedef struct MTFilterKalmanStateSpaceType
{	struct MTFilterKalmanSysType Sys;
	struct MTFilterKalmanExtSysType ExtSys;
	struct MTFilterKalmanDiscreteExtSysType DiscreteExtSys;
} MTFilterKalmanStateSpaceType;

typedef struct MTFilterKalmanDisturbanceType
{	enum MTFilterKalmanModeEnum Mode;
	float Frequency;
} MTFilterKalmanDisturbanceType;

typedef struct MTFilterKalmanInternalType
{	double CycleTime;
	plcbit InhibitUpdate;
	plcbit ParametersValid;
	plcbit UpdateOld;
	plcbit EnableOld;
	struct MTFilterKalmanStateSpaceType StateSpace;
	double Rk;
	struct MTFilterKalmanDisturbanceType DisturbanceModel;
	unsigned char nTmp;
	double Qk[6];
	double xk[6];
	double Pk[36];
	unsigned char Status;
	double yk;
	double yk_p;
} MTFilterKalmanInternalType;

typedef struct MTFilterBandPass
{
	/* VAR_INPUT (analog) */
	enum MTFilterTypeEnum Type;
	unsigned char Order;
	float CenterFrequency;
	float Bandwidth;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterBandPassInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterBandPass_typ;

typedef struct MTFilterBandStop
{
	/* VAR_INPUT (analog) */
	enum MTFilterTypeEnum Type;
	unsigned char Order;
	float CenterFrequency;
	float Bandwidth;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterBandStopInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterBandStop_typ;

typedef struct MTFilterBiQuad
{
	/* VAR_INPUT (analog) */
	float CenterFrequencyNum;
	float DampingRatioNum;
	float CenterFrequencyDen;
	float DampingRatioDen;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterBiQuadInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterBiQuad_typ;

typedef struct MTFilterHighPass
{
	/* VAR_INPUT (analog) */
	enum MTFilterTypeEnum Type;
	unsigned char Order;
	float CutOffFrequency;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterHighPassInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterHighPass_typ;

typedef struct MTFilterLowPass
{
	/* VAR_INPUT (analog) */
	enum MTFilterTypeEnum Type;
	unsigned char Order;
	float CutOffFrequency;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterLowPassInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterLowPass_typ;

typedef struct MTFilterMovingAverage
{
	/* VAR_INPUT (analog) */
	unsigned short WindowLength;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	/* VAR (analog) */
	struct MTFilterMovingAvgInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterMovingAverage_typ;

typedef struct MTFilterNotch
{
	/* VAR_INPUT (analog) */
	float CenterFrequency;
	float Bandwidth;
	float In;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTFilterNotchInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterNotch_typ;

typedef struct MTFilterKalman
{
	/* VAR_INPUT (analog) */
	float Numerator[5];
	float Denominator[5];
	float NoiseReduction;
	struct MTFilterKalmanDisturbanceType DisturbanceModel;
	float SystemInput;
	float SystemOutput;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float FilteredOutput[2];
	float Disturbance;
	/* VAR (analog) */
	struct MTFilterKalmanInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTFilterKalman_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTFilterBandPass(struct MTFilterBandPass* inst);
_BUR_PUBLIC void MTFilterBandStop(struct MTFilterBandStop* inst);
_BUR_PUBLIC void MTFilterBiQuad(struct MTFilterBiQuad* inst);
_BUR_PUBLIC void MTFilterHighPass(struct MTFilterHighPass* inst);
_BUR_PUBLIC void MTFilterLowPass(struct MTFilterLowPass* inst);
_BUR_PUBLIC void MTFilterMovingAverage(struct MTFilterMovingAverage* inst);
_BUR_PUBLIC void MTFilterNotch(struct MTFilterNotch* inst);
_BUR_PUBLIC void MTFilterKalman(struct MTFilterKalman* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtBCD_WRN_DISTURB_MODEL_INVALID (-2131753970)
 #define mtBCD_WRN_NOISEREDUCTION_INVALID (-2131753971)
 #define mtBCD_WRN_TRANSFER_FCN_INVALID (-2131753972)
 #define mtBCD_WRN_FILTER_WINDOW_INVALID (-2131753973)
 #define mtBCD_WRN_DAMPING_DEN_INVALID (-2131753974)
 #define mtBCD_WRN_FREQ_DEN_INVALID (-2131753975)
 #define mtBCD_WRN_DAMPING_NUM_INVALID (-2131753976)
 #define mtBCD_WRN_FREQ_NUM_INVALID (-2131753977)
 #define mtBCD_WRN_FILTER_BANDWIDTH (-2131753978)
 #define mtBCD_WRN_CENTER_FREQ_INVALID (-2131753979)
 #define mtBCD_WRN_CUTOFF_FREQ_INVALID (-2131753980)
 #define mtBCD_WRN_FILTER_ORDER_INVALID (-2131753981)
 #define mtBCD_WRN_FILTER_TYPE_INVALID (-2131753982)
 #define mtBCD_ERR_DISTURB_MODEL_INVALID (-1058012146)
 #define mtBCD_ERR_NOISEREDUCTION_INVALID (-1058012147)
 #define mtBCD_ERR_TRANSFER_FCN_INVALID (-1058012148)
 #define mtBCD_ERR_FILTER_WINDOW_INVALID (-1058012149)
 #define mtBCD_ERR_DAMPING_DEN_INVALID (-1058012150)
 #define mtBCD_ERR_FREQ_DEN_INVALID (-1058012151)
 #define mtBCD_ERR_DAMPING_NUM_INVALID (-1058012152)
 #define mtBCD_ERR_FREQ_NUM_INVALID (-1058012153)
 #define mtBCD_ERR_FILTER_BANDWIDTH (-1058012154)
 #define mtBCD_ERR_CENTER_FREQ_INVALID (-1058012155)
 #define mtBCD_ERR_CUTOFF_FREQ_INVALID (-1058012156)
 #define mtBCD_ERR_FILTER_ORDER_INVALID (-1058012157)
 #define mtBCD_ERR_FILTER_TYPE_INVALID (-1058012158)
#else
 _GLOBAL_CONST signed long mtBCD_WRN_DISTURB_MODEL_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_NOISEREDUCTION_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_TRANSFER_FCN_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FILTER_WINDOW_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_DAMPING_DEN_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FREQ_DEN_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_DAMPING_NUM_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FREQ_NUM_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FILTER_BANDWIDTH;
 _GLOBAL_CONST signed long mtBCD_WRN_CENTER_FREQ_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_CUTOFF_FREQ_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FILTER_ORDER_INVALID;
 _GLOBAL_CONST signed long mtBCD_WRN_FILTER_TYPE_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_DISTURB_MODEL_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_NOISEREDUCTION_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_TRANSFER_FCN_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FILTER_WINDOW_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_DAMPING_DEN_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FREQ_DEN_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_DAMPING_NUM_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FREQ_NUM_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FILTER_BANDWIDTH;
 _GLOBAL_CONST signed long mtBCD_ERR_CENTER_FREQ_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_CUTOFF_FREQ_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FILTER_ORDER_INVALID;
 _GLOBAL_CONST signed long mtBCD_ERR_FILTER_TYPE_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTFILTER_ */

