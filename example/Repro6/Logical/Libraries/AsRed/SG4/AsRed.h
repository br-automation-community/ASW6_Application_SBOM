/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASRED_
#define _ASRED_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif



/* Prototyping of functions and function blocks */
_BUR_PUBLIC plcbit redAvailable(void);
_BUR_PUBLIC plcbyte redGetRIFModeSwitch(plcbyte cpu);
_BUR_PUBLIC plcbyte redGetCPUProcessCtrlState(plcbyte cpu);
_BUR_PUBLIC plcbyte redGetSwitchoverLevel(void);
_BUR_PUBLIC plcbyte redGetRRADMapping(void);
_BUR_PUBLIC plcbyte redGetRRADState(void);
_BUR_PUBLIC plcbit redIsRIFLinkActive(void);
_BUR_PUBLIC plcbit redSwitchover(plcbit force);
_BUR_PUBLIC plcbit redPrjUpdate(void);


/* Constants */
#ifdef _REPLACE_CONST
 #define redRRAD_STATE_RUN 2U
 #define redRRAD_STATE_TRANSIENT 1U
 #define redRRAD_STATE_STOPPED 0U
 #define redRRAD_MAPPING_COMPLETE 2U
 #define redRRAD_MAPPING_PARTIAL 1U
 #define redRRAD_MAPPING_EMPTY 0U
 #define redMODE_SECONDARY 2U
 #define redMODE_PRIMARY 1U
 #define redMODE_INVALID 0U
 #define redSTATE_ACTIVE 255U
 #define redSTATE_STANDBY 32U
 #define redSTATE_PASSIVE 16U
 #define redSTATE_ERROR 0U
 #define redSWITCH_LEVEL_BUMPLESS 255U
 #define redSWITCH_LEVEL_MINOR_BUMP 32U
 #define redSWITCH_LEVEL_MAJOR_BUMP 16U
 #define redSWITCH_LEVEL_IMPOSSIBLE 0U
 #define redCPU_PARTNER 1U
 #define redCPU_THIS 0U
#else
 _GLOBAL_CONST plcbyte redRRAD_STATE_RUN;
 _GLOBAL_CONST plcbyte redRRAD_STATE_TRANSIENT;
 _GLOBAL_CONST plcbyte redRRAD_STATE_STOPPED;
 _GLOBAL_CONST plcbyte redRRAD_MAPPING_COMPLETE;
 _GLOBAL_CONST plcbyte redRRAD_MAPPING_PARTIAL;
 _GLOBAL_CONST plcbyte redRRAD_MAPPING_EMPTY;
 _GLOBAL_CONST plcbyte redMODE_SECONDARY;
 _GLOBAL_CONST plcbyte redMODE_PRIMARY;
 _GLOBAL_CONST plcbyte redMODE_INVALID;
 _GLOBAL_CONST plcbyte redSTATE_ACTIVE;
 _GLOBAL_CONST plcbyte redSTATE_STANDBY;
 _GLOBAL_CONST plcbyte redSTATE_PASSIVE;
 _GLOBAL_CONST plcbyte redSTATE_ERROR;
 _GLOBAL_CONST plcbyte redSWITCH_LEVEL_BUMPLESS;
 _GLOBAL_CONST plcbyte redSWITCH_LEVEL_MINOR_BUMP;
 _GLOBAL_CONST plcbyte redSWITCH_LEVEL_MAJOR_BUMP;
 _GLOBAL_CONST plcbyte redSWITCH_LEVEL_IMPOSSIBLE;
 _GLOBAL_CONST plcbyte redCPU_PARTNER;
 _GLOBAL_CONST plcbyte redCPU_THIS;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASRED_ */

