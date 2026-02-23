/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _DRV_MN_
#define _DRV_MN_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <dvframe.h>
#include <DataObj.h>
#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct MNMclose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNMclose_typ;

typedef struct MNMclien
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned char exec;
	unsigned short rec;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNMclien_typ;

typedef struct MNMopen
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	unsigned long mode;
	unsigned long vars;
	unsigned short frmtout;
	unsigned short chartout;
	unsigned char retry;
	/* VAR_OUTPUT (analog) */
	unsigned long ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned char FirstInit;
	unsigned long InitCount;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNMopen_typ;

typedef struct MNSclose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNSclose_typ;

typedef struct MNSservr
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned char exec;
	unsigned char cmd;
	unsigned short cmd_addr;
	unsigned char cmd_len;
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNSservr_typ;

typedef struct MNSopen
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	unsigned long mode;
	unsigned char node;
	/* VAR_OUTPUT (analog) */
	unsigned long ident;
	unsigned short status;
	/* VAR (analog) */
	unsigned char FirstInit;
	unsigned long InitCount;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MNSopen_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MNMclose(struct MNMclose* inst);
_BUR_PUBLIC void MNMclien(struct MNMclien* inst);
_BUR_PUBLIC void MNMopen(struct MNMopen* inst);
_BUR_PUBLIC void MNSclose(struct MNSclose* inst);
_BUR_PUBLIC void MNSservr(struct MNSservr* inst);
_BUR_PUBLIC void MNSopen(struct MNSopen* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mnERR_INDEX 20405U
 #define mnERR_MININET 20300U
 #define mnERR_NODE_ID 20377U
 #define mnERR_NO_LIST 20427U
 #define mnERR_SYSMEM1 20301U
 #define mnERR_SYSMEM2 20302U
 #define mnERR_INV_CMD1 20363U
 #define mnERR_INV_CMD2 20364U
 #define mnERR_NO_PVAR5 20429U
 #define mnERR_PV_NAME1 20375U
 #define mnERR_PV_NAME2 20376U
 #define mnERR_DATENTRY1 20418U
 #define mnERR_DATENTRY2 20419U
 #define mnERR_DATENTRY3 20420U
 #define mnERR_DATENTRY4 20421U
 #define mnERR_DATENTRY5 20424U
 #define mnERR_DATENTRY6 20425U
 #define mnERR_DATENTRY7 20426U
 #define mnERR_FRAME_BCC 20310U
 #define mnERR_ILLG_VARS 20411U
 #define mnERR_INIT_NODE 20428U
 #define mnERR_NO_ENTRY1 20416U
 #define mnERR_NO_ENTRY2 20417U
 #define mnERR_ENFLAG_LEN 20422U
 #define mnERR_INV_INDEX1 20402U
 #define mnERR_INV_INDEX2 20403U
 #define mnERR_L2_RX_CHAR 20306U
 #define mnERR_PV_LENGTH1 20372U
 #define mnERR_PV_LENGTH2 20373U
 #define mnERR_PV_LENGTH3 20374U
 #define mnERR_CMD_LENGTH1 20378U
 #define mnERR_CMD_LENGTH2 20379U
 #define mnERR_CMD_LENGTH3 20380U
 #define mnERR_CMD_LENGTH4 20381U
 #define mnERR_CMD_LENGTH5 20382U
 #define mnERR_CMD_LENGTH6 20383U
 #define mnERR_CMD_LENGTH7 20384U
 #define mnERR_CMD_LENGTH8 20385U
 #define mnERR_ILLG_IDENT1 20408U
 #define mnERR_ILLG_IDENT2 20409U
 #define mnERR_ILLG_IDENT3 20410U
 #define mnERR_INV_RD_RESP 20407U
 #define mnERR_INV_WR_RESP 20406U
 #define mnERR_INX_INVALID 20318U
 #define mnERR_NO_IN_PVAR1 20337U
 #define mnERR_NO_IN_PVAR2 20338U
 #define mnERR_NO_IN_PVAR3 20339U
 #define mnERR_NO_IN_PVAR4 20340U
 #define mnERR_NO_IN_PVAR5 20341U
 #define mnERR_NO_IN_PVAR6 20342U
 #define mnERR_RESET_INDEX 20404U
 #define mnERR_INVALID_CMD1 20394U
 #define mnERR_INVALID_CMD2 20395U
 #define mnERR_INVALID_CMD3 20396U
 #define mnERR_INVALID_CMD4 20397U
 #define mnERR_INVALID_CMD5 20398U
 #define mnERR_INVALID_CMD6 20399U
 #define mnERR_INVALID_CMD7 20400U
 #define mnERR_INVALID_CMD8 20401U
 #define mnERR_L2_INDEX_INV 20307U
 #define mnERR_L2_RX_TIMOUT 20305U
 #define mnERR_NO_OUT_PVAR1 20349U
 #define mnERR_NO_OUT_PVAR2 20350U
 #define mnERR_NO_OUT_PVAR3 20351U
 #define mnERR_NO_OUT_PVAR4 20352U
 #define mnERR_NO_OUT_PVAR5 20353U
 #define mnERR_NO_OUT_PVAR6 20354U
 #define mnERR_NO_REG_PVAR1 20319U
 #define mnERR_NO_REG_PVAR2 20320U
 #define mnERR_NO_REG_PVAR3 20321U
 #define mnERR_PV_LEN_DATM1 20412U
 #define mnERR_PV_LEN_DATM2 20413U
 #define mnERR_PV_LEN_DATM3 20414U
 #define mnERR_PV_LEN_DATM4 20415U
 #define mnERR_STX_IN_FRAME 20308U
 #define mnERR_INV_CMD_PARA1 20314U
 #define mnERR_INV_CMD_PARA2 20315U
 #define mnERR_INV_CMD_PARA3 20316U
 #define mnERR_INV_CMD_PARA4 20317U
 #define mnERR_L2_FRAME_LEN1 20311U
 #define mnERR_L2_FRAME_LEN2 20309U
 #define mnERR_L2_INV_FRAME1 20303U
 #define mnERR_L2_INV_FRAME2 20304U
 #define mnERR_NO_FLAG_PVAR1 20325U
 #define mnERR_NO_FLAG_PVAR2 20326U
 #define mnERR_NO_FLAG_PVAR3 20327U
 #define mnERR_NO_FLAG_PVAR4 20328U
 #define mnERR_NO_FLAG_PVAR5 20329U
 #define mnERR_NO_FLAG_PVAR6 20330U
 #define mnERR_WARNING_NO_PV 20423U
 #define mnERR_BRDC_READ_CMD1 20365U
 #define mnERR_BRDC_READ_CMD2 20366U
 #define mnERR_BRDC_READ_CMD3 20367U
 #define mnERR_BRDC_READ_CMD4 20368U
 #define mnERR_BRDC_READ_CMD5 20369U
 #define mnERR_BRDC_READ_CMD6 20370U
 #define mnERR_BRDC_READ_CMD7 20371U
 #define mnERR_CMD_INDEX_CONTR 20362U
 #define mnERR_INFO_SLAVE_RESP 20313U
 #define mnERR_CMD_ALREADY_EXEC 20361U
 #define mnERR_INFO_OTHER_SLAVE 20312U
 #define mnERR_IN_PVAR_ADDR_LEN1 20343U
 #define mnERR_IN_PVAR_ADDR_LEN2 20344U
 #define mnERR_IN_PVAR_ADDR_LEN3 20345U
 #define mnERR_IN_PVAR_ADDR_LEN4 20346U
 #define mnERR_IN_PVAR_ADDR_LEN5 20347U
 #define mnERR_IN_PVAR_ADDR_LEN6 20348U
 #define mnERR_OUT_PVAR_ADDR_LEN1 20355U
 #define mnERR_OUT_PVAR_ADDR_LEN2 20356U
 #define mnERR_OUT_PVAR_ADDR_LEN3 20357U
 #define mnERR_OUT_PVAR_ADDR_LEN4 20358U
 #define mnERR_OUT_PVAR_ADDR_LEN5 20359U
 #define mnERR_OUT_PVAR_ADDR_LEN6 20360U
 #define mnERR_REG_PVAR_ADDR_LEN1 20322U
 #define mnERR_REG_PVAR_ADDR_LEN2 20323U
 #define mnERR_REG_PVAR_ADDR_LEN3 20324U
 #define mnERR_SLAVE_ADDR_LENGTH1 20386U
 #define mnERR_SLAVE_ADDR_LENGTH2 20387U
 #define mnERR_SLAVE_ADDR_LENGTH3 20388U
 #define mnERR_SLAVE_ADDR_LENGTH4 20389U
 #define mnERR_SLAVE_ADDR_LENGTH5 20390U
 #define mnERR_SLAVE_ADDR_LENGTH6 20391U
 #define mnERR_SLAVE_ADDR_LENGTH7 20392U
 #define mnERR_SLAVE_ADDR_LENGTH8 20393U
 #define mnERR_FLAG_PVAR_ADDR_LEN1 20331U
 #define mnERR_FLAG_PVAR_ADDR_LEN2 20332U
 #define mnERR_FLAG_PVAR_ADDR_LEN3 20333U
 #define mnERR_FLAG_PVAR_ADDR_LEN4 20334U
 #define mnERR_FLAG_PVAR_ADDR_LEN5 20335U
 #define mnERR_FLAG_PVAR_ADDR_LEN6 20336U
#else
 _GLOBAL_CONST unsigned short mnERR_INDEX;
 _GLOBAL_CONST unsigned short mnERR_MININET;
 _GLOBAL_CONST unsigned short mnERR_NODE_ID;
 _GLOBAL_CONST unsigned short mnERR_NO_LIST;
 _GLOBAL_CONST unsigned short mnERR_SYSMEM1;
 _GLOBAL_CONST unsigned short mnERR_SYSMEM2;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD1;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD2;
 _GLOBAL_CONST unsigned short mnERR_NO_PVAR5;
 _GLOBAL_CONST unsigned short mnERR_PV_NAME1;
 _GLOBAL_CONST unsigned short mnERR_PV_NAME2;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY1;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY2;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY3;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY4;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY5;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY6;
 _GLOBAL_CONST unsigned short mnERR_DATENTRY7;
 _GLOBAL_CONST unsigned short mnERR_FRAME_BCC;
 _GLOBAL_CONST unsigned short mnERR_ILLG_VARS;
 _GLOBAL_CONST unsigned short mnERR_INIT_NODE;
 _GLOBAL_CONST unsigned short mnERR_NO_ENTRY1;
 _GLOBAL_CONST unsigned short mnERR_NO_ENTRY2;
 _GLOBAL_CONST unsigned short mnERR_ENFLAG_LEN;
 _GLOBAL_CONST unsigned short mnERR_INV_INDEX1;
 _GLOBAL_CONST unsigned short mnERR_INV_INDEX2;
 _GLOBAL_CONST unsigned short mnERR_L2_RX_CHAR;
 _GLOBAL_CONST unsigned short mnERR_PV_LENGTH1;
 _GLOBAL_CONST unsigned short mnERR_PV_LENGTH2;
 _GLOBAL_CONST unsigned short mnERR_PV_LENGTH3;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH1;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH2;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH3;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH4;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH5;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH6;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH7;
 _GLOBAL_CONST unsigned short mnERR_CMD_LENGTH8;
 _GLOBAL_CONST unsigned short mnERR_ILLG_IDENT1;
 _GLOBAL_CONST unsigned short mnERR_ILLG_IDENT2;
 _GLOBAL_CONST unsigned short mnERR_ILLG_IDENT3;
 _GLOBAL_CONST unsigned short mnERR_INV_RD_RESP;
 _GLOBAL_CONST unsigned short mnERR_INV_WR_RESP;
 _GLOBAL_CONST unsigned short mnERR_INX_INVALID;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR1;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR2;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR3;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR4;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR5;
 _GLOBAL_CONST unsigned short mnERR_NO_IN_PVAR6;
 _GLOBAL_CONST unsigned short mnERR_RESET_INDEX;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD1;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD2;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD3;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD4;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD5;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD6;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD7;
 _GLOBAL_CONST unsigned short mnERR_INVALID_CMD8;
 _GLOBAL_CONST unsigned short mnERR_L2_INDEX_INV;
 _GLOBAL_CONST unsigned short mnERR_L2_RX_TIMOUT;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR1;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR2;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR3;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR4;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR5;
 _GLOBAL_CONST unsigned short mnERR_NO_OUT_PVAR6;
 _GLOBAL_CONST unsigned short mnERR_NO_REG_PVAR1;
 _GLOBAL_CONST unsigned short mnERR_NO_REG_PVAR2;
 _GLOBAL_CONST unsigned short mnERR_NO_REG_PVAR3;
 _GLOBAL_CONST unsigned short mnERR_PV_LEN_DATM1;
 _GLOBAL_CONST unsigned short mnERR_PV_LEN_DATM2;
 _GLOBAL_CONST unsigned short mnERR_PV_LEN_DATM3;
 _GLOBAL_CONST unsigned short mnERR_PV_LEN_DATM4;
 _GLOBAL_CONST unsigned short mnERR_STX_IN_FRAME;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD_PARA1;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD_PARA2;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD_PARA3;
 _GLOBAL_CONST unsigned short mnERR_INV_CMD_PARA4;
 _GLOBAL_CONST unsigned short mnERR_L2_FRAME_LEN1;
 _GLOBAL_CONST unsigned short mnERR_L2_FRAME_LEN2;
 _GLOBAL_CONST unsigned short mnERR_L2_INV_FRAME1;
 _GLOBAL_CONST unsigned short mnERR_L2_INV_FRAME2;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR1;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR2;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR3;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR4;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR5;
 _GLOBAL_CONST unsigned short mnERR_NO_FLAG_PVAR6;
 _GLOBAL_CONST unsigned short mnERR_WARNING_NO_PV;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD1;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD2;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD3;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD4;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD5;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD6;
 _GLOBAL_CONST unsigned short mnERR_BRDC_READ_CMD7;
 _GLOBAL_CONST unsigned short mnERR_CMD_INDEX_CONTR;
 _GLOBAL_CONST unsigned short mnERR_INFO_SLAVE_RESP;
 _GLOBAL_CONST unsigned short mnERR_CMD_ALREADY_EXEC;
 _GLOBAL_CONST unsigned short mnERR_INFO_OTHER_SLAVE;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN1;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN2;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN3;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN4;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN5;
 _GLOBAL_CONST unsigned short mnERR_IN_PVAR_ADDR_LEN6;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN1;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN2;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN3;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN4;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN5;
 _GLOBAL_CONST unsigned short mnERR_OUT_PVAR_ADDR_LEN6;
 _GLOBAL_CONST unsigned short mnERR_REG_PVAR_ADDR_LEN1;
 _GLOBAL_CONST unsigned short mnERR_REG_PVAR_ADDR_LEN2;
 _GLOBAL_CONST unsigned short mnERR_REG_PVAR_ADDR_LEN3;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH1;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH2;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH3;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH4;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH5;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH6;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH7;
 _GLOBAL_CONST unsigned short mnERR_SLAVE_ADDR_LENGTH8;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN1;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN2;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN3;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN4;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN5;
 _GLOBAL_CONST unsigned short mnERR_FLAG_PVAR_ADDR_LEN6;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _DRV_MN_ */

