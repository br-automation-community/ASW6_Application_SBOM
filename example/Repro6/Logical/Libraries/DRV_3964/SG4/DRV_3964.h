/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _DRV_3964_
#define _DRV_3964_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <dvframe.h>
#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct S39SRk512
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned char mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short exec;
	unsigned short type;
	unsigned short cmd;
	unsigned char db;
	unsigned char dw;
	unsigned short len;
	unsigned short coinf;
	/* VAR_INPUT (digital) */
	plcbit enable;
} S39SRk512_typ;

typedef struct S39SClose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned char InitCount;
	/* VAR_INPUT (digital) */
	plcbit enable;
} S39SClose_typ;

typedef struct S39Slave
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned char mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short exec;
	/* VAR_INPUT (digital) */
	plcbit enable;
} S39Slave_typ;

typedef struct S39SOpen
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pMode;
	unsigned short buflen;
	unsigned short timeout;
	unsigned char retry;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	unsigned long tx_buf;
	unsigned long rx_buf;
	/* VAR (analog) */
	unsigned char InitCount;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit rk512;
} S39SOpen_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void S39SRk512(struct S39SRk512* inst);
_BUR_PUBLIC void S39SClose(struct S39SClose* inst);
_BUR_PUBLIC void S39Slave(struct S39Slave* inst);
_BUR_PUBLIC void S39SOpen(struct S39SOpen* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define s39ERR_RX_LEN 25752U
 #define s39ERR_SYSMEM 25780U
 #define s39ERR_TX_LEN 25750U
 #define s39MODE_DISABLE 0U
 #define s39ERR_ILLG_MODE 25760U
 #define s39ERR_L2_RX_BCC 25712U
 #define s39ERR_RK512_REQ 25728U
 #define s39ERR_RXBUF_LEN 25753U
 #define s39ERR_S3964R_DB 25820U
 #define s39ERR_S39_RXBUF 25787U
 #define s39ERR_S39_RXLEN 25788U
 #define s39ERR_S39_TXBUF 25789U
 #define s39ERR_S39_TXLEN 25790U
 #define s39ERR_TXBUF_LEN 25751U
 #define s39ERR_L2_RX_CHAR 25713U
 #define s39ERR_S3964R_CPU 25812U
 #define s39ERR_S3964R_TEL 25854U
 #define s39MODE_RECV_ONLY 1U
 #define s39MODE_SEND_ONLY 2U
 #define s39MODE_SEND_RECV 3U
 #define s39ERR_S3964R_BASE 25800U
 #define s39ERR_S3964R_COMM 25822U
 #define s39ERR_S3964R_KOOR 25850U
 #define s39ERR_L2_RX_TIMEOUT 25701U
 #define s39ERR_L2_STX_NO_DLE 25703U
 #define s39ERR_S3964R_DB_LEN 25852U
 #define s39ERR_L2_RX_NACK_STX 25714U
 #define s39ERR_L2_STX_INV_DLE 25702U
 #define s39ERR_L2_RX_NACK_DATA 25715U
 #define s39ERR_S3964R_TEL_TYPE 25816U
 #define s39ERR_ILLG_IDENT_SLAVE 25740U
 #define s39ERR_ILLG_IDENT_SOPEN 25742U
 #define s39ERR_ILLG_IDENT_SCLOSE 25741U
#else
 _GLOBAL_CONST unsigned short s39ERR_RX_LEN;
 _GLOBAL_CONST unsigned short s39ERR_SYSMEM;
 _GLOBAL_CONST unsigned short s39ERR_TX_LEN;
 _GLOBAL_CONST unsigned char s39MODE_DISABLE;
 _GLOBAL_CONST unsigned short s39ERR_ILLG_MODE;
 _GLOBAL_CONST unsigned short s39ERR_L2_RX_BCC;
 _GLOBAL_CONST unsigned short s39ERR_RK512_REQ;
 _GLOBAL_CONST unsigned short s39ERR_RXBUF_LEN;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_DB;
 _GLOBAL_CONST unsigned short s39ERR_S39_RXBUF;
 _GLOBAL_CONST unsigned short s39ERR_S39_RXLEN;
 _GLOBAL_CONST unsigned short s39ERR_S39_TXBUF;
 _GLOBAL_CONST unsigned short s39ERR_S39_TXLEN;
 _GLOBAL_CONST unsigned short s39ERR_TXBUF_LEN;
 _GLOBAL_CONST unsigned short s39ERR_L2_RX_CHAR;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_CPU;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_TEL;
 _GLOBAL_CONST unsigned char s39MODE_RECV_ONLY;
 _GLOBAL_CONST unsigned char s39MODE_SEND_ONLY;
 _GLOBAL_CONST unsigned char s39MODE_SEND_RECV;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_BASE;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_COMM;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_KOOR;
 _GLOBAL_CONST unsigned short s39ERR_L2_RX_TIMEOUT;
 _GLOBAL_CONST unsigned short s39ERR_L2_STX_NO_DLE;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_DB_LEN;
 _GLOBAL_CONST unsigned short s39ERR_L2_RX_NACK_STX;
 _GLOBAL_CONST unsigned short s39ERR_L2_STX_INV_DLE;
 _GLOBAL_CONST unsigned short s39ERR_L2_RX_NACK_DATA;
 _GLOBAL_CONST unsigned short s39ERR_S3964R_TEL_TYPE;
 _GLOBAL_CONST unsigned short s39ERR_ILLG_IDENT_SLAVE;
 _GLOBAL_CONST unsigned short s39ERR_ILLG_IDENT_SOPEN;
 _GLOBAL_CONST unsigned short s39ERR_ILLG_IDENT_SCLOSE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _DRV_3964_ */

