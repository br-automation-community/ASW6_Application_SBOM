/* Automation Studio generated header file */
/* Do not edit ! */
/* MTSystem 6.0.0 */

#ifndef _MTSYSTEM_
#define _MTSYSTEM_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTSystem_VERSION
#define _MTSystem_VERSION 6.0.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "brsystem.h"
		#include "MTTypes.h"
#endif
#ifdef _SG4
		#include "brsystem.h"
		#include "MTTypes.h"
#endif
#ifdef _SGC
		#include "brsystem.h"
		#include "MTTypes.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef struct MTSystemBodeInternalType
{	unsigned char NbValidExtSystemReferences;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit ParametersValid;
	plcbit CalcPlotData;
	plcbit CalcPlotDataOld;
	plcbit CalcFrequencyData;
	plcbit CalcFrequencyDataOld;
	plcbit RunCalculation;
	float MinFrequency;
	float MaxFrequency;
	float Frequency;
} MTSystemBodeInternalType;

typedef struct MTSystemBode2InternalType
{	unsigned char NbValidExtSystemReferences;
	plcbit CalcPlotData;
	plcbit CalcPlotDataOld;
	plcbit EnableOld;
} MTSystemBode2InternalType;

typedef struct MTSystemTransferFcnInternalType
{	float CycleTime;
	plcbit UpdateOld;
	plcbit EnableOld;
	plcbit EnableDone;
	unsigned char DisabledBusy;
	plcbit ParametersValid;
	float SampleTime;
	plcbit SysRefParaNew;
	unsigned long CounterOld;
	unsigned char Order;
	plcbit PresetOK;
	double PresetCoefficients;
	double BVector[6];
	double AVector[6];
	double XVector[5];
	float OutPresetValue;
	plcbit SetOut;
	plcbit SetOutOld;
	struct MTTransferFcnType SystemReference;
} MTSystemTransferFcnInternalType;

typedef struct MTSystemTransferFcn
{
	/* VAR_INPUT (analog) */
	float Numerator[6];
	float Denominator[6];
	float SampleTime;
	float In;
	float OutPresetValue;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	float Out;
	unsigned long SystemReference;
	/* VAR (analog) */
	struct MTSystemTransferFcnInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Update;
	plcbit SetOut;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit UpdateDone;
} MTSystemTransferFcn_typ;

typedef struct MTSystemBode
{
	/* VAR_INPUT (analog) */
	unsigned long SystemReference[3];
	float MinFrequency;
	float Frequency;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MTBodeType PlotData;
	float Magnitude;
	float Phase;
	/* VAR (analog) */
	struct MTSystemBodeInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit CalcPlotData;
	plcbit CalcFrequencyData;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CalcPlotDataDone;
	plcbit CalcFrequencyDataDone;
} MTSystemBode_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTSystemTransferFcn(struct MTSystemTransferFcn* inst);
_BUR_PUBLIC void MTSystemBode(struct MTSystemBode* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtACD_WRN_FREQ_RANGE_INVALID (-2131753003)
 #define mtACD_WRN_DENOM_COEFF_INVALID (-2131753005)
 #define mtACD_WRN_TF_PRESET_INVALID (-2131753006)
 #define mtACD_WRN_TF_ORDER_NOT_MINIMAL (-2131753007)
 #define mtACD_WRN_DISCR_SAMPLE_TIME_NEG (-2131753008)
 #define mtACD_WRN_OTHER_FB_USES_SYSREF (-2131755008)
 #define mtACD_ERR_NO_COMMON_FREQ_ZONE (-1058011178)
 #define mtACD_ERR_INVALID_SYSREF (-1058011179)
 #define mtACD_ERR_FREQUENCY_INVALID (-1058011180)
 #define mtACD_ERR_DENOM_COEFF_INVALID (-1058011181)
 #define mtACD_ERR_WRONG_TASK_CLASS (-1058011182)
 #define mtACD_ERR_TF_ORDER_NOT_MINIMAL (-1058011183)
 #define mtACD_ERR_DISCR_SAMPLE_TIME_NEG (-1058011184)
 #define mtACD_ERR_SYSTEM_TYPE_INVALID (-1058013182)
 #define mtACD_ERR_DATA_NOT_AVAILABLE (-1058013183)
#else
 _GLOBAL_CONST signed long mtACD_WRN_FREQ_RANGE_INVALID;
 _GLOBAL_CONST signed long mtACD_WRN_DENOM_COEFF_INVALID;
 _GLOBAL_CONST signed long mtACD_WRN_TF_PRESET_INVALID;
 _GLOBAL_CONST signed long mtACD_WRN_TF_ORDER_NOT_MINIMAL;
 _GLOBAL_CONST signed long mtACD_WRN_DISCR_SAMPLE_TIME_NEG;
 _GLOBAL_CONST signed long mtACD_WRN_OTHER_FB_USES_SYSREF;
 _GLOBAL_CONST signed long mtACD_ERR_NO_COMMON_FREQ_ZONE;
 _GLOBAL_CONST signed long mtACD_ERR_INVALID_SYSREF;
 _GLOBAL_CONST signed long mtACD_ERR_FREQUENCY_INVALID;
 _GLOBAL_CONST signed long mtACD_ERR_DENOM_COEFF_INVALID;
 _GLOBAL_CONST signed long mtACD_ERR_WRONG_TASK_CLASS;
 _GLOBAL_CONST signed long mtACD_ERR_TF_ORDER_NOT_MINIMAL;
 _GLOBAL_CONST signed long mtACD_ERR_DISCR_SAMPLE_TIME_NEG;
 _GLOBAL_CONST signed long mtACD_ERR_SYSTEM_TYPE_INVALID;
 _GLOBAL_CONST signed long mtACD_ERR_DATA_NOT_AVAILABLE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTSYSTEM_ */

