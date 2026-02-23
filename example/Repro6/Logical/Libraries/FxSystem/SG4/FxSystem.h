/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _FXSYSTEM_
#define _FXSYSTEM_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum FxSystemState
{	fxSYSTEM_STATE_PRE_OPERATIONAL,
	fxSYSTEM_STATE_OPERATIONAL,
	fxSYSTEM_STATE_ERROR
} FxSystemState;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC FxSystemState FxSystemGetState(void);


#ifdef __cplusplus
};
#endif
#endif /* _FXSYSTEM_ */

