/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASRTCONT_
#define _ASRTCONT_
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
typedef struct RT_I_TYPE
{	unsigned long init;
	unsigned long hdl;
	unsigned long state;
	unsigned long errNo;
	plcstring dev[81];
	plcstring brModule[81];
	unsigned char stationNo;
	unsigned long tid;
	unsigned long res1;
	unsigned long res2;
	unsigned long res3;
	unsigned long res4;
} RT_I_TYPE;

typedef struct rtUpdate
{
	/* VAR_INPUT (analog) */
	plcstring *pDevice;
	plcstring *pRtObject;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct RT_I_TYPE intern;
	/* VAR_INPUT (digital) */
	plcbit enable;
} rtUpdate_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void rtUpdate(struct rtUpdate* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ERR_RT_RESOURCES 37784U
 #define ERR_RT_DOWNLOAD_IN_WORK 37783U
 #define ERR_RT_DL_NOT_SUPPORTED 37782U
 #define ERR_RT_PROGCHECKSUM 37777U
 #define ERR_RT_PROGDATE 37776U
 #define ERR_RT_IOMODULE_STATE 37775U
 #define ERR_RT_DOWNLOAD 37774U
 #define ERR_RT_BRMODULE_PTR 37773U
 #define ERR_RT_BRMODULE_OFFSET 37772U
 #define ERR_RT_FILE_ID 37771U
 #define ERR_RT_XML_HEADER_OFF 37770U
 #define ERR_RT_NO_BRMODULE 37769U
 #define ERR_RT_NOT_IN_RUN 37768U
 #define ERR_RT_NO_FILEIDS 37767U
 #define ERR_RT_NO_FILEID_RAM 37766U
 #define ERR_RT_AUTO_DOWNLOAD 37765U
 #define ERR_RT_ARNOTHOOK 37764U
 #define ERR_RT_NO_STATION 37763U
 #define ERR_RT_NO_NAME 37762U
 #define ERR_RT_WRONG_DEVICE 37761U
 #define ERR_RT_BASE 37760U
#else
 _GLOBAL_CONST unsigned short ERR_RT_RESOURCES;
 _GLOBAL_CONST unsigned short ERR_RT_DOWNLOAD_IN_WORK;
 _GLOBAL_CONST unsigned short ERR_RT_DL_NOT_SUPPORTED;
 _GLOBAL_CONST unsigned short ERR_RT_PROGCHECKSUM;
 _GLOBAL_CONST unsigned short ERR_RT_PROGDATE;
 _GLOBAL_CONST unsigned short ERR_RT_IOMODULE_STATE;
 _GLOBAL_CONST unsigned short ERR_RT_DOWNLOAD;
 _GLOBAL_CONST unsigned short ERR_RT_BRMODULE_PTR;
 _GLOBAL_CONST unsigned short ERR_RT_BRMODULE_OFFSET;
 _GLOBAL_CONST unsigned short ERR_RT_FILE_ID;
 _GLOBAL_CONST unsigned short ERR_RT_XML_HEADER_OFF;
 _GLOBAL_CONST unsigned short ERR_RT_NO_BRMODULE;
 _GLOBAL_CONST unsigned short ERR_RT_NOT_IN_RUN;
 _GLOBAL_CONST unsigned short ERR_RT_NO_FILEIDS;
 _GLOBAL_CONST unsigned short ERR_RT_NO_FILEID_RAM;
 _GLOBAL_CONST unsigned short ERR_RT_AUTO_DOWNLOAD;
 _GLOBAL_CONST unsigned short ERR_RT_ARNOTHOOK;
 _GLOBAL_CONST unsigned short ERR_RT_NO_STATION;
 _GLOBAL_CONST unsigned short ERR_RT_NO_NAME;
 _GLOBAL_CONST unsigned short ERR_RT_WRONG_DEVICE;
 _GLOBAL_CONST unsigned short ERR_RT_BASE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASRTCONT_ */

