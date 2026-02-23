/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARSTORAGE_
#define _ARSTORAGE_
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
typedef struct ArStorageGetInfo
{
	/* VAR_INPUT (analog) */
	unsigned long Storage;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcstring MaterialNumber[81];
	plcstring SerialNumber[81];
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArStorageGetInfo_typ;

typedef struct ArStorageGetWear
{
	/* VAR_INPUT (analog) */
	unsigned long Storage;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short WearPercentage;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArStorageGetWear_typ;

typedef struct ArStorageGetHealthData
{
	/* VAR_INPUT (analog) */
	unsigned long Storage;
	unsigned long Buffer;
	unsigned long BufferSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long MinBufferSize;
	/* VAR (analog) */
	unsigned long Internal[32];
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArStorageGetHealthData_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArStorageGetInfo(struct ArStorageGetInfo* inst);
_BUR_PUBLIC void ArStorageGetWear(struct ArStorageGetWear* inst);
_BUR_PUBLIC void ArStorageGetHealthData(struct ArStorageGetHealthData* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arSTORAGE_ERR_INVALID_PARAMETER (-1070583192)
 #define arSTORAGE_ERR_BUFFER_SIZE (-1070583193)
 #define arSTORAGE_ERR_NOT_SUPPORTED (-1070583194)
 #define arSTORAGE_ERR_NO_DATA (-1070583195)
 #define arSTORAGE_ERR_INVALID_STORAGE (-1070583196)
#else
 _GLOBAL_CONST signed long arSTORAGE_ERR_INVALID_PARAMETER;
 _GLOBAL_CONST signed long arSTORAGE_ERR_BUFFER_SIZE;
 _GLOBAL_CONST signed long arSTORAGE_ERR_NOT_SUPPORTED;
 _GLOBAL_CONST signed long arSTORAGE_ERR_NO_DATA;
 _GLOBAL_CONST signed long arSTORAGE_ERR_INVALID_STORAGE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARSTORAGE_ */

