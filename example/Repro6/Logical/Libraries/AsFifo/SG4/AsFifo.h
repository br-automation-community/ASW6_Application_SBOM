/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASFIFO_
#define _ASFIFO_
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
typedef struct fifoCreate
{
	/* VAR_INPUT (analog) */
	unsigned long pFifo;
	unsigned long size;
	unsigned short mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoCreate_typ;

typedef struct fifoDelete
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoDelete_typ;

typedef struct fifoWrite
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned long pData;
	unsigned long size;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoWrite_typ;

typedef struct fifoRead
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned long pData;
	unsigned long size;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoRead_typ;

typedef struct fifoClear
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoClear_typ;

typedef struct fifoGetInfo
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long fifoFree;
	unsigned long fifoUsed;
	/* VAR_INPUT (digital) */
	plcbit enable;
} fifoGetInfo_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fifoCreate(struct fifoCreate* inst);
_BUR_PUBLIC void fifoDelete(struct fifoDelete* inst);
_BUR_PUBLIC void fifoWrite(struct fifoWrite* inst);
_BUR_PUBLIC void fifoRead(struct fifoRead* inst);
_BUR_PUBLIC void fifoClear(struct fifoClear* inst);
_BUR_PUBLIC void fifoGetInfo(struct fifoGetInfo* inst);
_BUR_PUBLIC unsigned long fifoGetIdent(unsigned long pFifo, unsigned long pIdent);


/* Constants */
#ifdef _REPLACE_CONST
 #define fifoMODE_WRITE_ALWAYS 2U
 #define fifoMODE_WRITE_UNTIL_FULL 1U
 #define fifoERR_SYSTEM 36788U
 #define fifoERR_BUFFER_EMPTY 36787U
 #define fifoERR_BUFFER_FULL 36786U
 #define fifoERR_FIFO_LIST_FULL 36785U
 #define fifoERR_FIFO_NOT_EXIST 36784U
 #define fifoERR_FIFO_ALREADY_EXISTS 36783U
 #define fifoERR_INVALID_MODE 36782U
 #define fifoERR_INVALID_IDENT 36781U
 #define fifoERR_INVALID_PARAM 36780U
#else
 _GLOBAL_CONST unsigned short fifoMODE_WRITE_ALWAYS;
 _GLOBAL_CONST unsigned short fifoMODE_WRITE_UNTIL_FULL;
 _GLOBAL_CONST unsigned short fifoERR_SYSTEM;
 _GLOBAL_CONST unsigned short fifoERR_BUFFER_EMPTY;
 _GLOBAL_CONST unsigned short fifoERR_BUFFER_FULL;
 _GLOBAL_CONST unsigned short fifoERR_FIFO_LIST_FULL;
 _GLOBAL_CONST unsigned short fifoERR_FIFO_NOT_EXIST;
 _GLOBAL_CONST unsigned short fifoERR_FIFO_ALREADY_EXISTS;
 _GLOBAL_CONST unsigned short fifoERR_INVALID_MODE;
 _GLOBAL_CONST unsigned short fifoERR_INVALID_IDENT;
 _GLOBAL_CONST unsigned short fifoERR_INVALID_PARAM;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASFIFO_ */

