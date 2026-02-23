/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARUNITTEXT_
#define _ARUNITTEXT_
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
typedef enum ARUnitTextTypeEnum
{	arUNITTEXT_SYMBOL = 0,
	arUNITTEXT_NAME = 1,
	arUNITTEXT_DESCRIPTION = 2
} ARUnitTextTypeEnum;

typedef struct ArUnitTextAsyncInternalType
{	struct ArFBStateInternalType FBStateCtx;
	struct ArFBAsyFuMaInternalType AsyFuMaCtx;
} ArUnitTextAsyncInternalType;

typedef struct ArUnitTextGetSymbolInternalType
{	plcbit Done;
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	signed long StatusID;
	signed long UnitID;
	unsigned long Namespace;
	enum ARUnitTextTypeEnum TextType;
	unsigned long ResultText;
	unsigned long ResultSize;
	plcbit UseBRText;
	plcstring LanguageCode[19];
	unsigned long TextSize;
	plcbit ExecuteOld;
} ArUnitTextGetSymbolInternalType;

typedef struct ArUnitTextCCToUIDInternalType
{	plcbit Done;
	plcbit Active;
	plcbit Busy;
	plcbit Error;
	signed long ErrorID;
	plcstring CommonCode[4];
	signed long UnitID;
	plcbit ExecuteOld;
} ArUnitTextCCToUIDInternalType;

typedef struct ArUnitTextGetText
{
	/* VAR_INPUT (analog) */
	signed long UnitID;
	unsigned long Namespace;
	enum ARUnitTextTypeEnum TextType;
	unsigned long ResultText;
	unsigned long ResultSize;
	plcstring LanguageCode[19];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long TextSize;
	/* VAR (analog) */
	struct ArUnitTextAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit UseBRText;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArUnitTextGetText_typ;

typedef struct ArUnitTextCommonCodeToUnitID
{
	/* VAR_INPUT (analog) */
	plcstring CommonCode[4];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	signed long UnitID;
	/* VAR (analog) */
	struct ArUnitTextAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArUnitTextCommonCodeToUnitID_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArUnitTextGetText(struct ArUnitTextGetText* inst);
_BUR_PUBLIC void ArUnitTextCommonCodeToUnitID(struct ArUnitTextCommonCodeToUnitID* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arUNITTEXT_OK_BR_TEXT 3156179
 #define arUNITTEXT_OK_USER_TEXT 3156178
 #define arUNITTEXT_ERR_INTERNAL (-1070585643)
 #define arUNITTEXT_ERR_INVALID_PARAM (-1070585644)
 #define arUNITTEXT_ERR_INVALID_CC (-1070585645)
 #define arUNITTEXT_ERR_NO_TEXT_FOUND (-1070585646)
#else
 _GLOBAL_CONST signed long arUNITTEXT_OK_BR_TEXT;
 _GLOBAL_CONST signed long arUNITTEXT_OK_USER_TEXT;
 _GLOBAL_CONST signed long arUNITTEXT_ERR_INTERNAL;
 _GLOBAL_CONST signed long arUNITTEXT_ERR_INVALID_PARAM;
 _GLOBAL_CONST signed long arUNITTEXT_ERR_INVALID_CC;
 _GLOBAL_CONST signed long arUNITTEXT_ERR_NO_TEXT_FOUND;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARUNITTEXT_ */

