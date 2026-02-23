/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _AROBJDICT_
#define _AROBJDICT_
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
typedef enum ArObjDictObjectCodeEnum
{	arOBJDICT_OBJECT_CODE_ARRAY = 8,
	arOBJDICT_OBJECT_CODE_RECORD = 9
} ArObjDictObjectCodeEnum;

typedef enum ArObjDictDatatypeEnum
{	arOBJDICT_DATATYPE_BOOL = 1,
	arOBJDICT_DATATYPE_INTEGER8 = 2,
	arOBJDICT_DATATYPE_INTEGER16 = 3,
	arOBJDICT_DATATYPE_INTEGER32 = 4,
	arOBJDICT_DATATYPE_UNSIGNED8 = 5,
	arOBJDICT_DATATYPE_UNSIGNED16 = 6,
	arOBJDICT_DATATYPE_UNSIGNED32 = 7,
	arOBJDICT_DATATYPE_REAL = 8,
	arOBJDICT_DATATYPE_VISIBLE_STR = 9,
	arOBJDICT_DATATYPE_DOMAIN = 15
} ArObjDictDatatypeEnum;

typedef enum ArObjDictAccessRightsEnum
{	arOBJDICT_ACCESS_RIGHTS_RO = 1,
	arOBJDICT_ACCESS_RIGHTS_WO = 2,
	arOBJDICT_ACCESS_RIGHTS_RW = 4
} ArObjDictAccessRightsEnum;

typedef struct ArObjDictCreateSimpleObject
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short Index;
	enum ArObjDictDatatypeEnum Datatype;
	enum ArObjDictAccessRightsEnum AccessRights;
	unsigned long MaxFieldUnits;
	plcstring Name[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArObjDictCreateSimpleObject_typ;

typedef struct ArObjDictCreateParentObject
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short Index;
	unsigned char MaxNumOfSubObjects;
	enum ArObjDictObjectCodeEnum ObjectCode;
	plcstring Name[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArObjDictCreateParentObject_typ;

typedef struct ArObjDictCreateSubObject
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short Index;
	unsigned char SubIndex;
	enum ArObjDictAccessRightsEnum AccessRights;
	enum ArObjDictDatatypeEnum Datatype;
	unsigned long MaxFieldUnits;
	plcstring Name[128];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArObjDictCreateSubObject_typ;

typedef struct ArObjDictReadData
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short Index;
	unsigned char SubIndex;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long TotalDataBytes;
	unsigned char Data[1024];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArObjDictReadData_typ;

typedef struct ArObjDictWriteData
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[128];
	unsigned short Index;
	unsigned char SubIndex;
	unsigned long TotalDataBytes;
	unsigned char Data[1024];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArObjDictWriteData_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArObjDictCreateSimpleObject(struct ArObjDictCreateSimpleObject* inst);
_BUR_PUBLIC void ArObjDictCreateParentObject(struct ArObjDictCreateParentObject* inst);
_BUR_PUBLIC void ArObjDictCreateSubObject(struct ArObjDictCreateSubObject* inst);
_BUR_PUBLIC void ArObjDictReadData(struct ArObjDictReadData* inst);
_BUR_PUBLIC void ArObjDictWriteData(struct ArObjDictWriteData* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arOBJDICT_ERR_INTERNAL_ERROR (-1070582629)
 #define arOBJDICT_ERR_SUBOBJ_NOT_EXISTS (-1070582634)
 #define arOBJDICT_ERR_SUBOBJECT_EXISTS (-1070582635)
 #define arOBJDICT_ERR_OBJECT_NOT_EXISTS (-1070582636)
 #define arOBJDICT_ERR_OBJECT_EXISTS (-1070582637)
 #define arOBJDICT_ERR_MAX_NUM_SUBOBJS (-1070582639)
 #define arOBJDICT_ERR_TOTAL_DATA_BYTES (-1070582640)
 #define arOBJDICT_ERR_DATATYPE (-1070582641)
 #define arOBJDICT_ERR_MAX_FIELD_UNITS (-1070582642)
 #define arOBJDICT_ERR_OBJECT_CODE (-1070582643)
 #define arOBJDICT_ERR_ACCESS_RIGHTS (-1070582644)
 #define arOBJDICT_ERR_INDEX (-1070582645)
 #define arOBJDICT_ERR_INVALID_DEVICE (-1070582646)
#else
 _GLOBAL_CONST signed long arOBJDICT_ERR_INTERNAL_ERROR;
 _GLOBAL_CONST signed long arOBJDICT_ERR_SUBOBJ_NOT_EXISTS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_SUBOBJECT_EXISTS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_OBJECT_NOT_EXISTS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_OBJECT_EXISTS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_MAX_NUM_SUBOBJS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_TOTAL_DATA_BYTES;
 _GLOBAL_CONST signed long arOBJDICT_ERR_DATATYPE;
 _GLOBAL_CONST signed long arOBJDICT_ERR_MAX_FIELD_UNITS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_OBJECT_CODE;
 _GLOBAL_CONST signed long arOBJDICT_ERR_ACCESS_RIGHTS;
 _GLOBAL_CONST signed long arOBJDICT_ERR_INDEX;
 _GLOBAL_CONST signed long arOBJDICT_ERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _AROBJDICT_ */

