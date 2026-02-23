/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _CAN_LIB_
#define _CAN_LIB_
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
typedef struct INFO_typ
{	unsigned long received;
	unsigned long transmit;
	unsigned long error;
	unsigned long busoff;
	unsigned long warning;
	unsigned long other;
	unsigned long lost;
	unsigned long stufferror;
	unsigned long formerror;
	unsigned long ackerror;
	unsigned long bit1error;
	unsigned long bit0error;
	unsigned long crcerror;
	unsigned long lec0;
	unsigned long rxirq;
	unsigned long txirq;
} INFO_typ;

typedef struct DevParam
{	unsigned char baudrate;
	unsigned short cob_nr;
	unsigned long pError;
	unsigned long pDevice;
	unsigned short info;
} DevParam;

typedef struct CANinfo
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long info_adr;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANinfo_typ;

typedef struct CANMulQueue
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long pCAN_id;
	unsigned char ID_nr;
	unsigned short size;
	/* VAR_OUTPUT (analog) */
	unsigned long q_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANMulQueue_typ;

typedef struct CANxMulQueue
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long pCAN_id;
	unsigned long ID_nr;
	unsigned short size;
	/* VAR_OUTPUT (analog) */
	unsigned long q_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANxMulQueue_typ;

typedef struct CANMulOpen
{
	/* VAR_INPUT (analog) */
	unsigned long pDevParam;
	unsigned char dev_nr;
	/* VAR_OUTPUT (analog) */
	unsigned long us_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANMulOpen_typ;

typedef struct CANMulrd
{
	/* VAR_INPUT (analog) */
	unsigned long q_ident;
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned short size;
	unsigned long ID;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANMulrd_typ;

typedef struct CANTime
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long pSystemTick;
	unsigned long pSystemStamp;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long old_id;
	unsigned long cob_handle;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANTime_typ;

typedef struct CANquwr
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long data_adr;
	unsigned char data_lng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANquwr_typ;

typedef struct CMSexit
{
	/* VAR_INPUT (analog) */
	unsigned long cms_ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CMSexit_typ;

typedef struct CMSmain
{
	/* VAR_INPUT (analog) */
	unsigned long cms_ident;
	unsigned long cms_mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CMSmain_typ;

typedef struct CMSinit
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned char user_type;
	unsigned short queue_cnt;
	unsigned long modul_name;
	/* VAR_OUTPUT (analog) */
	unsigned short cms_entry;
	unsigned long cms_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CMSinit_typ;

typedef struct CMSattach
{
	/* VAR_INPUT (analog) */
	unsigned long cms_ident;
	/* VAR_OUTPUT (analog) */
	unsigned long attachCount;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CMSattach_typ;

typedef struct CMSdetach
{
	/* VAR_INPUT (analog) */
	unsigned long cms_ident;
	/* VAR_OUTPUT (analog) */
	unsigned long attachCount;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CMSdetach_typ;

typedef struct CMSdlreq
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long client_id;
	unsigned long server_id;
	unsigned long mult;
	unsigned long data_adr;
	unsigned long data_len;
	/* VAR_OUTPUT (analog) */
	unsigned short add_code;
	unsigned char err_class;
	unsigned char err_code;
	unsigned long dl_len;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit initiate;
	/* VAR (digital) */
	plcbit old_enable;
} CMSdlreq_typ;

typedef struct CMSdlcon
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long client_id;
	unsigned long server_id;
	unsigned long data_adr;
	unsigned long data_len;
	/* VAR_OUTPUT (analog) */
	unsigned short add_code;
	unsigned char err_class;
	unsigned char err_code;
	unsigned long mult;
	unsigned long dl_len;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit initiate;
	/* VAR (digital) */
	plcbit old_enable;
} CMSdlcon_typ;

typedef struct CANwrite
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long data_adr;
	unsigned char data_lng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long old_id;
	unsigned long cob_handle;
	unsigned long init_cnt;
	unsigned char wr_order;
	unsigned char align_byte;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANwrite_typ;

typedef struct CANupd
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long data_adr;
	unsigned char data_lng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long old_id;
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANupd_typ;

typedef struct CANngp
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned char nd_state;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long old_id;
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANngp_typ;

typedef struct CANrwtab
{
	/* VAR_INPUT (analog) */
	unsigned long tab_ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANrwtab_typ;

typedef struct CANrtr
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned char data_lng;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit request;
	/* VAR (digital) */
	plcbit old_enable;
} CANrtr_typ;

typedef struct CANread
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned char data_lng;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANread_typ;

typedef struct CANrd
{
	/* VAR_INPUT (analog) */
	unsigned long q_ident;
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned short size;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANrd_typ;

typedef struct CANxrd
{
	/* VAR_INPUT (analog) */
	unsigned long q_ident;
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned long can_id;
	unsigned short size;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANxrd_typ;

typedef struct CANqueue
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned short size;
	/* VAR_OUTPUT (analog) */
	unsigned long q_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long cob_handle;
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANqueue_typ;

typedef struct CANopen
{
	/* VAR_INPUT (analog) */
	unsigned char baud_rate;
	unsigned short cob_anz;
	unsigned long error_adr;
	unsigned long device;
	unsigned short info;
	/* VAR_OUTPUT (analog) */
	unsigned long us_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANopen_typ;

typedef struct CANgetid
{
	/* VAR_INPUT (analog) */
	unsigned long data_adr;
	/* VAR_OUTPUT (analog) */
	unsigned char data_lng;
	unsigned long can_id;
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANgetid_typ;

typedef struct CANexcep
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long can_id;
	unsigned char exc_nr;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	unsigned long cob_handle;
	unsigned long ex_p;
	unsigned long ex_maxtask;
	unsigned long ss_irqvw_p;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANexcep_typ;

typedef struct CANdftab
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long table_adr;
	unsigned short tab_num;
	/* VAR_OUTPUT (analog) */
	unsigned long tab_ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned long init_cnt;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit old_enable;
} CANdftab_typ;

typedef struct CANbtreg
{
	/* VAR_INPUT (analog) */
	unsigned long us_ident;
	unsigned long treg0;
	unsigned long treg1;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CANbtreg_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CANinfo(struct CANinfo* inst);
_BUR_PUBLIC void CANMulQueue(struct CANMulQueue* inst);
_BUR_PUBLIC void CANxMulQueue(struct CANxMulQueue* inst);
_BUR_PUBLIC void CANMulOpen(struct CANMulOpen* inst);
_BUR_PUBLIC void CANMulrd(struct CANMulrd* inst);
_BUR_PUBLIC void CANTime(struct CANTime* inst);
_BUR_PUBLIC void CANquwr(struct CANquwr* inst);
_BUR_PUBLIC void CMSexit(struct CMSexit* inst);
_BUR_PUBLIC void CMSmain(struct CMSmain* inst);
_BUR_PUBLIC void CMSinit(struct CMSinit* inst);
_BUR_PUBLIC void CMSattach(struct CMSattach* inst);
_BUR_PUBLIC void CMSdetach(struct CMSdetach* inst);
_BUR_PUBLIC void CMSdlreq(struct CMSdlreq* inst);
_BUR_PUBLIC void CMSdlcon(struct CMSdlcon* inst);
_BUR_PUBLIC void CANwrite(struct CANwrite* inst);
_BUR_PUBLIC void CANupd(struct CANupd* inst);
_BUR_PUBLIC void CANngp(struct CANngp* inst);
_BUR_PUBLIC void CANrwtab(struct CANrwtab* inst);
_BUR_PUBLIC void CANrtr(struct CANrtr* inst);
_BUR_PUBLIC void CANread(struct CANread* inst);
_BUR_PUBLIC void CANrd(struct CANrd* inst);
_BUR_PUBLIC void CANxrd(struct CANxrd* inst);
_BUR_PUBLIC void CANqueue(struct CANqueue* inst);
_BUR_PUBLIC void CANopen(struct CANopen* inst);
_BUR_PUBLIC void CANgetid(struct CANgetid* inst);
_BUR_PUBLIC void CANexcep(struct CANexcep* inst);
_BUR_PUBLIC void CANdftab(struct CANdftab* inst);
_BUR_PUBLIC void CANbtreg(struct CANbtreg* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define canERR_NO_DATA 8877U
 #define canERR_NO_OBJ_FREE 8876U
 #define canERR_DATEN_INKONSISTENT 8875U
 #define canERR_MAX_RETRY_CNT 8874U
 #define canERR_MAXRETRY_DATENINKONSIST 8873U
 #define canERR_MSG_LOST 8872U
 #define canERR_STATUS 8871U
 #define canERR_NORMAL_NOT_POSIBLE 8870U
 #define canERR_NO_STATE_BON 8869U
 #define canERR_NO_STATE_INIT 8868U
 #define canERR_NO_STATE_BOFF 8867U
 #define canERR_NO_WR_MODE 8866U
 #define canERR_NO_RD_MODE 8865U
 #define canERR_WRONG_CAN_ID 8864U
 #define canERR_RXIE_ALLOWED 8863U
 #define canERR_RXIE_NOT_ALLOWED 8862U
 #define canERR_TXIE_ALLOWED 8861U
 #define canERR_TXIE_NOT_ALLOWED 8860U
 #define canERR_WRONG_MSG_LEN 8859U
 #define canERR_WRONG_CAN_MODE 8858U
 #define canERR_READ_ONLY_OBJ 8857U
 #define canERR_OBJ_ACTIVE 8856U
 #define canERR_CPU_UPDATE 8855U
 #define canERR_HW_RESET_ACTIVE 8854U
 #define canERR_NO_BUFFER_CFG 8853U
 #define canERR_NO_BUSOFF_STATE 8852U
 #define canERR_NO_INIT_STATE 8851U
 #define canERR_WRONG_OBJNR 8850U
 #define canERR_CAN_CRC 8846U
 #define canERR_CAN_BIT0 8845U
 #define canERR_CAN_BIT1 8844U
 #define canERR_CAN_ACK 8843U
 #define canERR_CAN_FORM 8842U
 #define canERR_CAN_STUFF 8841U
 #define canERR_FBCAN_RXBUF 8840U
 #define canERR_FBCAN_HANDLE 8839U
 #define canERR_FBCAN_NODENR 8838U
 #define canERR_FBCAN_COB 8837U
 #define canERR_CAN_BITMODE 8834U
 #define canERR_CAN_WROBJ 8833U
 #define canERR_CMS_MULTIPLEX 8832U
 #define canERR_CAN_EXTENDED 8831U
 #define canERR_CAN_FBHANDLE 8830U
 #define canERR_CAN_ABORTRECEIV 8829U
 #define canERR_CAN_ABORTED 8828U
 #define canERR_CAN_IRQHANDLE 8827U
 #define canERR_CAN_NILPTR 8826U
 #define canERR_CAN_NO_NODE 8825U
 #define canERR_CAN_WRMODE 8824U
 #define canERR_CAN_WRSTRUCT 8823U
 #define canERR_WRCMSOBJ 8822U
 #define canERR_CAN_WRUSRTYP 8821U
 #define canERR_CAN_NOFUNC 8820U
 #define canERR_CAN_HTLQUIT 8819U
 #define canERR_CAN_HTLXINF 8818U
 #define canERR_CAN_NOCONTR 8817U
 #define canERR_CAN_COBANZ 8816U
 #define canERR_CAN_BDRATE 8815U
 #define canERR_CAN_WRLNG 8814U
 #define canERR_CAN_NOTINST 8813U
 #define canERR_CAN_NOHIGH 8812U
 #define canERR_CAN_BUSOFF 8811U
 #define canERR_CAN_QFULL 8810U
 #define canERR_CAN_BUSY 8809U
 #define canERR_CAN_WRHDLE 8808U
 #define canERR_CAN_WRDEF 8807U
 #define canERR_CAN_COBDEF 8806U
 #define canERR_CAN_WRUSERID 8805U
 #define canERR_CAN_WRCANID 8804U
 #define canERR_CAN_COBUSED 8803U
 #define canERR_CAN_WRIDENT 8802U
 #define canERR_CAN_NOMEM 8801U
 #define canERR_CAN_NOENTRY 8800U
#else
 _GLOBAL_CONST unsigned short canERR_NO_DATA;
 _GLOBAL_CONST unsigned short canERR_NO_OBJ_FREE;
 _GLOBAL_CONST unsigned short canERR_DATEN_INKONSISTENT;
 _GLOBAL_CONST unsigned short canERR_MAX_RETRY_CNT;
 _GLOBAL_CONST unsigned short canERR_MAXRETRY_DATENINKONSIST;
 _GLOBAL_CONST unsigned short canERR_MSG_LOST;
 _GLOBAL_CONST unsigned short canERR_STATUS;
 _GLOBAL_CONST unsigned short canERR_NORMAL_NOT_POSIBLE;
 _GLOBAL_CONST unsigned short canERR_NO_STATE_BON;
 _GLOBAL_CONST unsigned short canERR_NO_STATE_INIT;
 _GLOBAL_CONST unsigned short canERR_NO_STATE_BOFF;
 _GLOBAL_CONST unsigned short canERR_NO_WR_MODE;
 _GLOBAL_CONST unsigned short canERR_NO_RD_MODE;
 _GLOBAL_CONST unsigned short canERR_WRONG_CAN_ID;
 _GLOBAL_CONST unsigned short canERR_RXIE_ALLOWED;
 _GLOBAL_CONST unsigned short canERR_RXIE_NOT_ALLOWED;
 _GLOBAL_CONST unsigned short canERR_TXIE_ALLOWED;
 _GLOBAL_CONST unsigned short canERR_TXIE_NOT_ALLOWED;
 _GLOBAL_CONST unsigned short canERR_WRONG_MSG_LEN;
 _GLOBAL_CONST unsigned short canERR_WRONG_CAN_MODE;
 _GLOBAL_CONST unsigned short canERR_READ_ONLY_OBJ;
 _GLOBAL_CONST unsigned short canERR_OBJ_ACTIVE;
 _GLOBAL_CONST unsigned short canERR_CPU_UPDATE;
 _GLOBAL_CONST unsigned short canERR_HW_RESET_ACTIVE;
 _GLOBAL_CONST unsigned short canERR_NO_BUFFER_CFG;
 _GLOBAL_CONST unsigned short canERR_NO_BUSOFF_STATE;
 _GLOBAL_CONST unsigned short canERR_NO_INIT_STATE;
 _GLOBAL_CONST unsigned short canERR_WRONG_OBJNR;
 _GLOBAL_CONST unsigned short canERR_CAN_CRC;
 _GLOBAL_CONST unsigned short canERR_CAN_BIT0;
 _GLOBAL_CONST unsigned short canERR_CAN_BIT1;
 _GLOBAL_CONST unsigned short canERR_CAN_ACK;
 _GLOBAL_CONST unsigned short canERR_CAN_FORM;
 _GLOBAL_CONST unsigned short canERR_CAN_STUFF;
 _GLOBAL_CONST unsigned short canERR_FBCAN_RXBUF;
 _GLOBAL_CONST unsigned short canERR_FBCAN_HANDLE;
 _GLOBAL_CONST unsigned short canERR_FBCAN_NODENR;
 _GLOBAL_CONST unsigned short canERR_FBCAN_COB;
 _GLOBAL_CONST unsigned short canERR_CAN_BITMODE;
 _GLOBAL_CONST unsigned short canERR_CAN_WROBJ;
 _GLOBAL_CONST unsigned short canERR_CMS_MULTIPLEX;
 _GLOBAL_CONST unsigned short canERR_CAN_EXTENDED;
 _GLOBAL_CONST unsigned short canERR_CAN_FBHANDLE;
 _GLOBAL_CONST unsigned short canERR_CAN_ABORTRECEIV;
 _GLOBAL_CONST unsigned short canERR_CAN_ABORTED;
 _GLOBAL_CONST unsigned short canERR_CAN_IRQHANDLE;
 _GLOBAL_CONST unsigned short canERR_CAN_NILPTR;
 _GLOBAL_CONST unsigned short canERR_CAN_NO_NODE;
 _GLOBAL_CONST unsigned short canERR_CAN_WRMODE;
 _GLOBAL_CONST unsigned short canERR_CAN_WRSTRUCT;
 _GLOBAL_CONST unsigned short canERR_WRCMSOBJ;
 _GLOBAL_CONST unsigned short canERR_CAN_WRUSRTYP;
 _GLOBAL_CONST unsigned short canERR_CAN_NOFUNC;
 _GLOBAL_CONST unsigned short canERR_CAN_HTLQUIT;
 _GLOBAL_CONST unsigned short canERR_CAN_HTLXINF;
 _GLOBAL_CONST unsigned short canERR_CAN_NOCONTR;
 _GLOBAL_CONST unsigned short canERR_CAN_COBANZ;
 _GLOBAL_CONST unsigned short canERR_CAN_BDRATE;
 _GLOBAL_CONST unsigned short canERR_CAN_WRLNG;
 _GLOBAL_CONST unsigned short canERR_CAN_NOTINST;
 _GLOBAL_CONST unsigned short canERR_CAN_NOHIGH;
 _GLOBAL_CONST unsigned short canERR_CAN_BUSOFF;
 _GLOBAL_CONST unsigned short canERR_CAN_QFULL;
 _GLOBAL_CONST unsigned short canERR_CAN_BUSY;
 _GLOBAL_CONST unsigned short canERR_CAN_WRHDLE;
 _GLOBAL_CONST unsigned short canERR_CAN_WRDEF;
 _GLOBAL_CONST unsigned short canERR_CAN_COBDEF;
 _GLOBAL_CONST unsigned short canERR_CAN_WRUSERID;
 _GLOBAL_CONST unsigned short canERR_CAN_WRCANID;
 _GLOBAL_CONST unsigned short canERR_CAN_COBUSED;
 _GLOBAL_CONST unsigned short canERR_CAN_WRIDENT;
 _GLOBAL_CONST unsigned short canERR_CAN_NOMEM;
 _GLOBAL_CONST unsigned short canERR_CAN_NOENTRY;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _CAN_LIB_ */

