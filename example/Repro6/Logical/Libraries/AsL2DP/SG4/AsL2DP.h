/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASL2DP_
#define _ASL2DP_
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
typedef struct L2DPSlave
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	unsigned short L2DPid;
	unsigned long outbuf;
	unsigned char outlen;
	unsigned long inbuf;
	unsigned char inlen;
	unsigned long outcopy;
	unsigned long incopy;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned char init;
	unsigned char byRunState;
	unsigned char baudrate;
	unsigned char diagflag;
	unsigned long pCfgData;
	unsigned long pInData;
	unsigned long pDiagData;
	unsigned long param0;
	unsigned long param4;
	unsigned long param8;
	unsigned long param12;
	unsigned long param16;
	unsigned long param20;
	unsigned long base0;
	unsigned long base1;
	unsigned long base2;
	unsigned long base3;
	unsigned long base4;
	unsigned long base5;
	unsigned long base6;
	unsigned long base7;
	unsigned long base8;
	unsigned long base9;
	unsigned long base10;
	unsigned long base11;
	unsigned long base12;
	unsigned long base13;
	unsigned long base14;
	unsigned long base15;
	unsigned long base16;
	unsigned long base17;
	unsigned long base18;
	unsigned long base19;
	unsigned long base20;
	unsigned long base21;
	unsigned long base22;
	unsigned long base23;
	unsigned long base24;
	unsigned long base25;
	/* VAR_INPUT (digital) */
	plcbit enable;
} L2DPSlave_typ;

typedef struct L2DPGetNode
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char node;
	/* VAR_INPUT (digital) */
	plcbit enable;
} L2DPGetNode_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void L2DPSlave(struct L2DPSlave* inst);
_BUR_PUBLIC void L2DPGetNode(struct L2DPGetNode* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ASL2DP_VPC3_MAX_OUTPUTLENGTH 244U
 #define ASL2DP_VPC3_MAX_IN_OUT_LENGTH 488U
 #define ASL2DP_VPC3_MAX_INPUTLENGTH 244U
 #define ASL2DP_MAX_OUTPUTLENGTH 240U
 #define ASL2DP_MAX_IN_OUT_LENGTH 368U
 #define ASL2DP_MAX_INPUTLENGTH 240U
 #define ERR_ASL2DP_WRONG_NODENR 28829U
 #define ERR_ASL2DP_OUTDATA_TOOLONG 28830U
 #define ERR_ASL2DP_IO_DATA_TOOLONG 28832U
 #define ERR_ASL2DP_INDATA_TOOLONG 28831U
 #define ERR_ASL2DP_DP_STATE 28828U
 #define ERR_ASL2DP_WRONG_SLOTNR 28824U
 #define ERR_ASL2DP_INIT_LESS_MEM 28827U
 #define ERR_ASL2DP_WRONG_MODULTYP 28825U
 #define ERR_ASL2DP_WRONG_INDATAPTR 28823U
 #define ERR_ASL2DP_WRONG_SUBSLOTNR 28822U
 #define ERR_ASL2DP_WRONG_DESCRIPTOR 28820U
 #define ERR_ASL2DP_WRONG_OUTDATAPTR 28821U
 #define ERR_ASL2DP_WAIT_FOR_DATAMODE 28826U
#else
 _GLOBAL_CONST unsigned char ASL2DP_VPC3_MAX_OUTPUTLENGTH;
 _GLOBAL_CONST unsigned short ASL2DP_VPC3_MAX_IN_OUT_LENGTH;
 _GLOBAL_CONST unsigned char ASL2DP_VPC3_MAX_INPUTLENGTH;
 _GLOBAL_CONST unsigned char ASL2DP_MAX_OUTPUTLENGTH;
 _GLOBAL_CONST unsigned short ASL2DP_MAX_IN_OUT_LENGTH;
 _GLOBAL_CONST unsigned char ASL2DP_MAX_INPUTLENGTH;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_NODENR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_OUTDATA_TOOLONG;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_IO_DATA_TOOLONG;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_INDATA_TOOLONG;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_DP_STATE;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_SLOTNR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_INIT_LESS_MEM;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_MODULTYP;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_INDATAPTR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_SUBSLOTNR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_DESCRIPTOR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WRONG_OUTDATAPTR;
 _GLOBAL_CONST unsigned short ERR_ASL2DP_WAIT_FOR_DATAMODE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASL2DP_ */

