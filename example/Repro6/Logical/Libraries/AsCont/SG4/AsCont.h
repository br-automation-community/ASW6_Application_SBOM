/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASCONT_
#define _ASCONT_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct AO_4_20
{
	/* VAR_INPUT (analog) */
	signed short IN;
	/* VAR_OUTPUT (analog) */
	signed short OUT;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AO_4_20_typ;

typedef struct AI_4_20
{
	/* VAR_INPUT (analog) */
	signed short IN;
	/* VAR_OUTPUT (analog) */
	signed short OUT;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AI_4_20_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void AO_4_20(struct AO_4_20* inst);
_BUR_PUBLIC void AI_4_20(struct AI_4_20* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ASCONT_ */

