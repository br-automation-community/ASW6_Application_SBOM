/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASHART_
#define _ASHART_
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
typedef enum hartIntState_t
{	STATE_WAIT,
	STATE_WORK,
	STATE_FINISHED
} hartIntState_t;

typedef struct hartOpen
{
	/* VAR_INPUT (analog) */
	unsigned long pDev;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	/* VAR (analog) */
	enum hartIntState_t _statemachine;
	unsigned short _state;
	/* VAR_INPUT (digital) */
	plcbit enable;
} hartOpen_typ;

typedef struct hartPutCmd
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned long pCmd;
	unsigned short cmdSize;
	unsigned long pReply;
	unsigned short replySize;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short usedSize;
	/* VAR (analog) */
	enum hartIntState_t _statemachine;
	unsigned short _state;
	unsigned long _pCmd;
	/* VAR_INPUT (digital) */
	plcbit enable;
} hartPutCmd_typ;

typedef struct hartClose
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	enum hartIntState_t _statemachine;
	unsigned short _state;
	/* VAR_INPUT (digital) */
	plcbit enable;
} hartClose_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void hartOpen(struct hartOpen* inst);
_BUR_PUBLIC void hartPutCmd(struct hartPutCmd* inst);
_BUR_PUBLIC void hartClose(struct hartClose* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define hartERR_CMD_REPLY_BUFFER_SMALL 35462U
 #define hartERR_CMD_NODE_INACTIVE 35461U
 #define hartERR_CMD_NODE_TIMEOUT 35460U
 #define hartERR_CMD_MODEM_TIMEOUT 35459U
 #define hartERR_DEVICE_CLOSE 35588U
 #define hartERR_QUEUE_FULL 35587U
 #define hartERR_PUT_CMD_IOCTL 35586U
 #define hartERR_INVALID_BUFFER 35585U
 #define hartERR_INVALID_IDENT 35584U
 #define hartERR_DEVICE_OPEN 35583U
 #define hartERR_ALREADY_OPENED 35582U
 #define hartERR_MODULE_DOESNT_EXIST 35581U
 #define hartERR_INVALID_DEVICE 35580U
#else
 _GLOBAL_CONST unsigned short hartERR_CMD_REPLY_BUFFER_SMALL;
 _GLOBAL_CONST unsigned short hartERR_CMD_NODE_INACTIVE;
 _GLOBAL_CONST unsigned short hartERR_CMD_NODE_TIMEOUT;
 _GLOBAL_CONST unsigned short hartERR_CMD_MODEM_TIMEOUT;
 _GLOBAL_CONST unsigned short hartERR_DEVICE_CLOSE;
 _GLOBAL_CONST unsigned short hartERR_QUEUE_FULL;
 _GLOBAL_CONST unsigned short hartERR_PUT_CMD_IOCTL;
 _GLOBAL_CONST unsigned short hartERR_INVALID_BUFFER;
 _GLOBAL_CONST unsigned short hartERR_INVALID_IDENT;
 _GLOBAL_CONST unsigned short hartERR_DEVICE_OPEN;
 _GLOBAL_CONST unsigned short hartERR_ALREADY_OPENED;
 _GLOBAL_CONST unsigned short hartERR_MODULE_DOESNT_EXIST;
 _GLOBAL_CONST unsigned short hartERR_INVALID_DEVICE;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASHART_ */

