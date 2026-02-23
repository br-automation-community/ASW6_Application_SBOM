/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ETHERNET_
#define _ETHERNET_
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
typedef struct ETHattachment_typ
{	unsigned char type;
	unsigned long len;
	unsigned long pName;
	unsigned long pData;
} ETHattachment_typ;

typedef struct ETHstatSG3_typ
{	unsigned long l_int;
	unsigned long l_rint;
	unsigned long l_tint;
	unsigned short l_babl;
	unsigned short l_cerr;
	unsigned short l_miss;
	unsigned short l_memr;
	unsigned short r_fram;
	unsigned short r_oflo;
	unsigned short r_crc;
	unsigned short r_buff;
	unsigned short t_buff;
	unsigned short t_uflo;
	unsigned short t_lcol;
	unsigned short t_lcar;
	unsigned short t_rtry;
	unsigned short ni_anno;
	unsigned short ni_init;
	unsigned short ni_send;
	unsigned short ni_getp;
	unsigned short ni_retp;
	unsigned short ni_bcst;
	unsigned short ni_poll;
	unsigned short irq_mean;
	unsigned short irq_min;
	unsigned short irq_max;
	unsigned short irq_t1;
	unsigned short irq_timena;
	unsigned short errgtnobuf;
	unsigned short err_1_1;
	unsigned short err_1_2;
	unsigned short err_1_3;
	unsigned short errxmtnull;
	unsigned short errsndown;
	unsigned short errsndsize;
	unsigned short lancerrnobuf;
	unsigned short lanceinit;
	unsigned short terr;
	unsigned short ni_gtbuf;
	unsigned short brcast_cnt;
	unsigned short brcastmax_cnt;
	unsigned short brcast_stop;
	unsigned short brcast_tick;
} ETHstatSG3_typ;

typedef struct ETHstatSG4_typ
{	unsigned long p_recv;
	unsigned long e_recv;
	unsigned long p_send;
	unsigned long e_send;
	unsigned long collisions;
	unsigned long b_recv;
	unsigned long b_send;
	unsigned long p_recv_mc;
	unsigned long p_send_mc;
	unsigned long iqdrops;
	unsigned long noproto;
	unsigned long lastchange;
} ETHstatSG4_typ;

typedef struct TCPQ_dcmd_typ
{	unsigned short response;
	unsigned long error;
	unsigned long buffer;
	unsigned long buflng;
	unsigned long ipaddr;
	unsigned long socket;
	unsigned short port;
	unsigned short wreserve;
	unsigned long reserve[8];
} TCPQ_dcmd_typ;

typedef struct ETHinfo
{
	/* VAR_OUTPUT (analog) */
	unsigned long statadr;
	unsigned long ethadr;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} ETHinfo_typ;

typedef struct SMTPxsendmail
{
	/* VAR_INPUT (analog) */
	unsigned long pReceiver;
	unsigned long pSender;
	unsigned long pIpaddr;
	unsigned long pSubject;
	unsigned long pText;
	unsigned long pAttachment;
	unsigned char AttachmentCount;
	unsigned short timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} SMTPxsendmail_typ;

typedef struct ETHxinfo
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned long statadr;
	unsigned long ethadr;
	unsigned short status;
	/* VAR (analog) */
	unsigned char mac[6];
	/* VAR_INPUT (digital) */
	plcbit enable;
} ETHxinfo_typ;

typedef struct TCPclose
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} TCPclose_typ;

typedef struct TCPrecv
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	unsigned long buffer;
	unsigned long mxbuflng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long rxbuflng;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} TCPrecv_typ;

typedef struct TCPsend
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	unsigned long buffer;
	unsigned long buflng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} TCPsend_typ;

typedef struct TCPclient
{
	/* VAR_INPUT (analog) */
	unsigned short porta;
	unsigned long ipaddr;
	unsigned short portb;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long cident;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} TCPclient_typ;

typedef struct TCPserv
{
	/* VAR_INPUT (analog) */
	unsigned short porta;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ipaddr;
	unsigned short portb;
	unsigned long cident;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} TCPserv_typ;

typedef struct ICMPping
{
	/* VAR_INPUT (analog) */
	unsigned long ipaddr;
	unsigned short timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} ICMPping_typ;

typedef struct SMTPsendmail
{
	/* VAR_INPUT (analog) */
	unsigned long pReceiver;
	unsigned long pSender;
	unsigned long pIpaddr;
	unsigned long pSubject;
	unsigned long pText;
	unsigned short timeout;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} SMTPsendmail_typ;

typedef struct UDPclose
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} UDPclose_typ;

typedef struct UDPopen
{
	/* VAR_INPUT (analog) */
	unsigned short port;
	unsigned long pvpolladr;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long cident;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} UDPopen_typ;

typedef struct UDPrecv
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	unsigned long buffer;
	unsigned short buflng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ipaddr;
	unsigned short rxbuflng;
	unsigned short port;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} UDPrecv_typ;

typedef struct UDPsend
{
	/* VAR_INPUT (analog) */
	unsigned long cident;
	unsigned long ipaddr;
	unsigned long buffer;
	unsigned short buflng;
	unsigned short port;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short state;
	unsigned long tickcount;
	unsigned long initcount;
	struct TCPQ_dcmd_typ dcmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit pna_ok;
} UDPsend_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ETHinfo(struct ETHinfo* inst);
_BUR_PUBLIC void SMTPxsendmail(struct SMTPxsendmail* inst);
_BUR_PUBLIC void ETHxinfo(struct ETHxinfo* inst);
_BUR_PUBLIC void TCPclose(struct TCPclose* inst);
_BUR_PUBLIC void TCPrecv(struct TCPrecv* inst);
_BUR_PUBLIC void TCPsend(struct TCPsend* inst);
_BUR_PUBLIC void TCPclient(struct TCPclient* inst);
_BUR_PUBLIC void TCPserv(struct TCPserv* inst);
_BUR_PUBLIC void ICMPping(struct ICMPping* inst);
_BUR_PUBLIC void SMTPsendmail(struct SMTPsendmail* inst);
_BUR_PUBLIC void UDPclose(struct UDPclose* inst);
_BUR_PUBLIC void UDPopen(struct UDPopen* inst);
_BUR_PUBLIC void UDPrecv(struct UDPrecv* inst);
_BUR_PUBLIC void UDPsend(struct UDPsend* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ERR_ETH_NO_DATA 27211U
 #define ERR_ETH_NET_SLOW 27210U
 #define ETH_ATT_TYPE_MEM 0U
 #define ETH_ATT_TYPE_FILE 1U
 #define ERR_ETH_PING_NORESP 27220U
 #define ERR_ETH_DEVICE_ERROR 27247U
 #define ERR_ETH_PING_TIMEOUT 27221U
 #define ERR_ETH_SMTP_TIMEOUT 27231U
 #define ERR_ETH_INVALID_ATTACHMENT 27240U
 #define ERR_ETH_SMTP_MAIL_CANNOT_DELIVER 27235U
 #define ERR_ETH_SMTP_PARSE_NO_SEMI_COLON 27233U
 #define ERR_ETH_SMTP_RECEIVER_NOT_ACCEPT 27234U
 #define ERR_ETH_SMTP_SERVER_NOTAVAILABLE 27230U
 #define ERR_ETH_SMTP_UNEXPECTED_RESPONSE 27232U
#else
 _GLOBAL_CONST unsigned short ERR_ETH_NO_DATA;
 _GLOBAL_CONST unsigned short ERR_ETH_NET_SLOW;
 _GLOBAL_CONST unsigned char ETH_ATT_TYPE_MEM;
 _GLOBAL_CONST unsigned char ETH_ATT_TYPE_FILE;
 _GLOBAL_CONST unsigned short ERR_ETH_PING_NORESP;
 _GLOBAL_CONST unsigned short ERR_ETH_DEVICE_ERROR;
 _GLOBAL_CONST unsigned short ERR_ETH_PING_TIMEOUT;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_TIMEOUT;
 _GLOBAL_CONST unsigned short ERR_ETH_INVALID_ATTACHMENT;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_MAIL_CANNOT_DELIVER;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_PARSE_NO_SEMI_COLON;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_RECEIVER_NOT_ACCEPT;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_SERVER_NOTAVAILABLE;
 _GLOBAL_CONST unsigned short ERR_ETH_SMTP_UNEXPECTED_RESPONSE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ETHERNET_ */

