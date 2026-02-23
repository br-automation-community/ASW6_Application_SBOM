/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARRTDL_
#define _ARRTDL_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef unsigned long ArRtdlPvIdentType;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC ArRtdlPvIdentType ArAddPvToRtdl(plcstring* PvName);
_BUR_PUBLIC plcbit ArReadFromRtdl(ArRtdlPvIdentType PvID);
_BUR_PUBLIC plcbit ArWriteToRtdl(ArRtdlPvIdentType PvID);
_BUR_PUBLIC plcbit ArRemoveFromRtdl(ArRtdlPvIdentType PvID);


#ifdef __cplusplus
};
#endif
#endif /* _ARRTDL_ */

