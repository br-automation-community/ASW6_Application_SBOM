/* Automation Studio generated header file */
/* Do not edit ! */
/* MTAdvanced 6.0.0 */

#ifndef _MTADVANCED_
#define _MTADVANCED_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MTAdvanced_VERSION
#define _MTAdvanced_VERSION 6.0.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MTTypes.h"
#endif
#ifdef _SG4
		#include "MTTypes.h"
#endif
#ifdef _SGC
		#include "MTTypes.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum MTAdvancedControllerEnum
{	mtPROPORTIONAL,
	mtPROPORTIONAL_INTEGRAL
} MTAdvancedControllerEnum;

typedef struct MTAdvancedLoopShapingIntType
{	unsigned char NbValidExtSystemReferences;
	float RiseTimeMin;
	float RiseTimeMax;
	float CrossOverMagnitude;
	float CrossOverPhase;
	plcbit CalculateController;
	plcbit CalculateControllerOld;
	plcbit EnableOld;
} MTAdvancedLoopShapingIntType;

typedef struct MTAdvancedLoopShaping
{
	/* VAR_INPUT (analog) */
	unsigned long SystemReference[3];
	float RiseTime;
	float OverShoot;
	float MinFrequency;
	float SampleTimeController;
	enum MTAdvancedControllerEnum ControllerType;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MTBodeType PlotDataOpenLoop;
	float Gain;
	float IntegrationTime;
	float CrossOverFrequency;
	float PhaseMargin;
	/* VAR (analog) */
	struct MTAdvancedLoopShapingIntType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit CalculateController;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CalculationDone;
} MTAdvancedLoopShaping_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MTAdvancedLoopShaping(struct MTAdvancedLoopShaping* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mtACD_WRN_RISETIME_TOO_HIGH (-2131752997)
 #define mtACD_WRN_RISETIME_TOO_LOW (-2131752998)
 #define mtACD_ERR_PHASE_MARGIN_TOO_HIGH (-1058011166)
 #define mtACD_ERR_PHASE_MARGIN_TOO_LOW (-1058011167)
 #define mtACD_ERR_PHASE_MARGIN_BELOW_20 (-1058011168)
 #define mtACD_ERR_COMMON_FREQUENCY_AREA (-1058011169)
 #define mtACD_ERR_WRONG_CTRL_TYPE (-1058011170)
 #define mtACD_ERR_SAMPLE_TIME_CTRL_NEG (-1058011171)
 #define mtACD_ERR_ILLEGAL_OVERSHOOT (-1058011172)
 #define mtACD_ERR_RISETIME_NEG_ZERO (-1058011173)
 #define mtACD_ERR_SYSTEM_REF_INVALID (-1058011174)
#else
 _GLOBAL_CONST signed long mtACD_WRN_RISETIME_TOO_HIGH;
 _GLOBAL_CONST signed long mtACD_WRN_RISETIME_TOO_LOW;
 _GLOBAL_CONST signed long mtACD_ERR_PHASE_MARGIN_TOO_HIGH;
 _GLOBAL_CONST signed long mtACD_ERR_PHASE_MARGIN_TOO_LOW;
 _GLOBAL_CONST signed long mtACD_ERR_PHASE_MARGIN_BELOW_20;
 _GLOBAL_CONST signed long mtACD_ERR_COMMON_FREQUENCY_AREA;
 _GLOBAL_CONST signed long mtACD_ERR_WRONG_CTRL_TYPE;
 _GLOBAL_CONST signed long mtACD_ERR_SAMPLE_TIME_CTRL_NEG;
 _GLOBAL_CONST signed long mtACD_ERR_ILLEGAL_OVERSHOOT;
 _GLOBAL_CONST signed long mtACD_ERR_RISETIME_NEG_ZERO;
 _GLOBAL_CONST signed long mtACD_ERR_SYSTEM_REF_INVALID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _MTADVANCED_ */

