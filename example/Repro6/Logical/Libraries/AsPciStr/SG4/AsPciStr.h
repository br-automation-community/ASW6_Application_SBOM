/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASPCISTR_
#define _ASPCISTR_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif



/* Prototyping of functions and function blocks */
_BUR_PUBLIC unsigned long pciMemSet(unsigned long pDest, unsigned char value, unsigned long length);
_BUR_PUBLIC unsigned long pciMemCpy(unsigned long pDest, unsigned long pSrc, unsigned long length);
_BUR_PUBLIC unsigned long pciMemMove(unsigned long pDest, unsigned long pSrc, unsigned long length);
_BUR_PUBLIC signed long pciMemCmp(unsigned long pMem1, unsigned long pMem2, unsigned long length);
_BUR_PUBLIC unsigned long pciStrCat(unsigned long pDest, unsigned long pSrc);
_BUR_PUBLIC unsigned long pciStrCpy(unsigned long pDest, unsigned long pSrc);
_BUR_PUBLIC signed long pciStrCmp(unsigned long pString1, unsigned long pString2);


#ifdef __cplusplus
};
#endif
#endif /* _ASPCISTR_ */

