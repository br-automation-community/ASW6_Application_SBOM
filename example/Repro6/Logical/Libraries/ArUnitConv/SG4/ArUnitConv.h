/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARUNITCONV_
#define _ARUNITCONV_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct ArUnitConvAsyncInternalType
{	struct ArFBStateInternalType FBStateCtx;
	struct ArFBAsyFuMaInternalType AsyFuMaCtx;
} ArUnitConvAsyncInternalType;

typedef struct ArUnitConvIsConvertible
{
	/* VAR_INPUT (analog) */
	unsigned long InputUnitID;
	unsigned long InputUnitNamespaceID;
	unsigned long OutputUnitID;
	unsigned long OutputUnitNamespaceID;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArUnitConvAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
	plcbit Convertible;
} ArUnitConvIsConvertible_typ;

typedef struct ArUnitConvConvert
{
	/* VAR_INPUT (analog) */
	unsigned long InputUnitID;
	unsigned long InputUnitNamespaceID;
	unsigned long OutputUnitID;
	unsigned long OutputUnitNamespaceID;
	double InputValue;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	double OutputValue;
	/* VAR (analog) */
	struct ArUnitConvAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArUnitConvConvert_typ;

typedef struct ArUnitConvCommonCodeToUnitID
{
	/* VAR_INPUT (analog) */
	plcstring CommonCode[4];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long UnitID;
	/* VAR (analog) */
	struct ArUnitConvAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArUnitConvCommonCodeToUnitID_typ;

typedef struct ArUnitConvGetNamespaceID
{
	/* VAR_INPUT (analog) */
	unsigned long Namespace;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned char NamespaceID;
	/* VAR (analog) */
	struct ArUnitConvAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArUnitConvGetNamespaceID_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArUnitConvIsConvertible(struct ArUnitConvIsConvertible* inst);
_BUR_PUBLIC void ArUnitConvConvert(struct ArUnitConvConvert* inst);
_BUR_PUBLIC void ArUnitConvCommonCodeToUnitID(struct ArUnitConvCommonCodeToUnitID* inst);
_BUR_PUBLIC void ArUnitConvGetNamespaceID(struct ArUnitConvGetNamespaceID* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arUNITCONV_ERR_INTERNAL (-1070585689)
 #define arUNITCONV_ERR_NO_DB (-1070585690)
 #define arUNITCONV_ERR_WRONG_DB (-1070585691)
 #define arUNITCONV_ERR_NOT_CONVERTIBLE (-1070585692)
 #define arUNITCONV_ERR_INVALID_NSID (-1070585693)
 #define arUNITCONV_ERR_INVALID_NS (-1070585694)
 #define arUNITCONV_ERR_INVALID_CC (-1070585695)
 #define arUNITCONV_ERR_INVALID_UNITID (-1070585696)
#else
 _GLOBAL_CONST signed long arUNITCONV_ERR_INTERNAL;
 _GLOBAL_CONST signed long arUNITCONV_ERR_NO_DB;
 _GLOBAL_CONST signed long arUNITCONV_ERR_WRONG_DB;
 _GLOBAL_CONST signed long arUNITCONV_ERR_NOT_CONVERTIBLE;
 _GLOBAL_CONST signed long arUNITCONV_ERR_INVALID_NSID;
 _GLOBAL_CONST signed long arUNITCONV_ERR_INVALID_NS;
 _GLOBAL_CONST signed long arUNITCONV_ERR_INVALID_CC;
 _GLOBAL_CONST signed long arUNITCONV_ERR_INVALID_UNITID;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARUNITCONV_ */

