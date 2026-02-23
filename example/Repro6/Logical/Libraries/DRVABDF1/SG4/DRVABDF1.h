/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _DRVABDF1_
#define _DRVABDF1_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <DataObj.h>
#include <dvframe.h>
#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct ABDF1Master
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short recordnum;
	unsigned char sts;
	unsigned char ext_sts;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit execute;
} ABDF1Master_typ;

typedef struct ABDF1MOpen
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pMode;
	unsigned long pConfig;
	unsigned char own_ID;
	unsigned char checksum;
	unsigned short timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ABDF1MOpen_typ;

typedef struct ABDF1SOpen
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pMode;
	unsigned long pConfig;
	unsigned char own_ID;
	unsigned char checksum;
	unsigned short timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ABDF1SOpen_typ;

typedef struct ABDF1Slave
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short exec;
	unsigned char cmd;
	unsigned char fct;
	unsigned long len;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ABDF1Slave_typ;

typedef struct ABDF1SClose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ABDF1SClose_typ;

typedef struct ABDF1MClose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ABDF1MClose_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ABDF1Master(struct ABDF1Master* inst);
_BUR_PUBLIC void ABDF1MOpen(struct ABDF1MOpen* inst);
_BUR_PUBLIC void ABDF1SOpen(struct ABDF1SOpen* inst);
_BUR_PUBLIC void ABDF1Slave(struct ABDF1Slave* inst);
_BUR_PUBLIC void ABDF1SClose(struct ABDF1SClose* inst);
_BUR_PUBLIC void ABDF1MClose(struct ABDF1MClose* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define df1ERR_ENQ 30084U
 #define df1ERR_NAK 30083U
 #define df1ERR_REPLY 30082U
 #define df1ERR_MEMORY 30085U
 #define df1ERR_CFG_CMD 30062U
 #define df1ERR_CFG_STN 30063U
 #define df1ERR_COMMAND 30081U
 #define df1ERR_ILG_CFG 30050U
 #define df1ERR_TIMEOUT 30052U
 #define df1CHECKSUM_BCC 1U
 #define df1CHECKSUM_CRC 0U
 #define df1ERR_CHECKSUM 30053U
 #define df1ERR_FRM_GBUF 30072U
 #define df1ERR_FRM_RBUF 30071U
 #define df1ERR_FRM_READ 30070U
 #define df1ERR_CFG_ENTRY 30060U
 #define df1ERR_FRM_CLOSE 30074U
 #define df1ERR_FRM_WRITE 30073U
 #define df1ERR_ILG_FRAME 30080U
 #define df1ERR_ILG_IDENT 30054U
 #define df1ERR_CFG_LENGTH 30066U
 #define df1ERR_CFG_REMOTE 30065U
 #define df1ERR_ILG_DEVICE 30055U
 #define df1ERR_ILG_OWN_ID 30051U
 #define df1ERR_CFG_EVENTPV 30061U
 #define df1ERR_CFG_LOCALPV 30064U
#else
 _GLOBAL_CONST unsigned short df1ERR_ENQ;
 _GLOBAL_CONST unsigned short df1ERR_NAK;
 _GLOBAL_CONST unsigned short df1ERR_REPLY;
 _GLOBAL_CONST unsigned short df1ERR_MEMORY;
 _GLOBAL_CONST unsigned short df1ERR_CFG_CMD;
 _GLOBAL_CONST unsigned short df1ERR_CFG_STN;
 _GLOBAL_CONST unsigned short df1ERR_COMMAND;
 _GLOBAL_CONST unsigned short df1ERR_ILG_CFG;
 _GLOBAL_CONST unsigned short df1ERR_TIMEOUT;
 _GLOBAL_CONST unsigned char df1CHECKSUM_BCC;
 _GLOBAL_CONST unsigned char df1CHECKSUM_CRC;
 _GLOBAL_CONST unsigned short df1ERR_CHECKSUM;
 _GLOBAL_CONST unsigned short df1ERR_FRM_GBUF;
 _GLOBAL_CONST unsigned short df1ERR_FRM_RBUF;
 _GLOBAL_CONST unsigned short df1ERR_FRM_READ;
 _GLOBAL_CONST unsigned short df1ERR_CFG_ENTRY;
 _GLOBAL_CONST unsigned short df1ERR_FRM_CLOSE;
 _GLOBAL_CONST unsigned short df1ERR_FRM_WRITE;
 _GLOBAL_CONST unsigned short df1ERR_ILG_FRAME;
 _GLOBAL_CONST unsigned short df1ERR_ILG_IDENT;
 _GLOBAL_CONST unsigned short df1ERR_CFG_LENGTH;
 _GLOBAL_CONST unsigned short df1ERR_CFG_REMOTE;
 _GLOBAL_CONST unsigned short df1ERR_ILG_DEVICE;
 _GLOBAL_CONST unsigned short df1ERR_ILG_OWN_ID;
 _GLOBAL_CONST unsigned short df1ERR_CFG_EVENTPV;
 _GLOBAL_CONST unsigned short df1ERR_CFG_LOCALPV;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _DRVABDF1_ */

