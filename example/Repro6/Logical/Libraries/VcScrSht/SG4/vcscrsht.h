/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _VCSCRSHT_
#define _VCSCRSHT_
#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <visapi.h>
#include <fileio.h>




/* Prototyping of functions and function blocks */
_BUR_PUBLIC unsigned long InitScreenShot(plcbit bEnable, unsigned long pHandle, unsigned long pFileName, unsigned long pDeviceName, unsigned long pDisplName);
_BUR_PUBLIC unsigned long DeInitScreenShot(plcbit bEnable, unsigned long pHandle);
_BUR_PUBLIC unsigned long ScreenShot(plcbit bEnable, unsigned long pHandle);


#ifdef __cplusplus
};
#endif
#endif /* _VCSCRSHT_ */

