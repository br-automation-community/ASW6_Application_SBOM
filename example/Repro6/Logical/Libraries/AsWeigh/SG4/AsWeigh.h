/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASWEIGH_
#define _ASWEIGH_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>
#include <standard.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct WGHscalePara_typ
{	signed long tare_std;
	signed long ref1_raw;
	signed long ref1_std;
	signed long ref2_raw;
	signed long ref2_std;
} WGHscalePara_typ;

typedef struct WGHscale
{
	/* VAR_INPUT (analog) */
	signed long raw_value;
	plctime t_measure;
	struct WGHscalePara_typ* pWGHscalePara;
	/* VAR_OUTPUT (analog) */
	signed long std_value;
	unsigned short status;
	/* VAR (analog) */
	struct TON TON_measure;
	unsigned long cntMeasure;
	unsigned short step;
	unsigned short errCnt;
	signed long sumDat[2];
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit doTare;
	plcbit doStandardize1;
	plcbit doStandardize2;
	/* VAR_OUTPUT (digital) */
	plcbit doneTare;
	plcbit doneStandardize1;
	plcbit doneStandardize2;
} WGHscale_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void WGHscale(struct WGHscale* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ASWEIGH_ */

