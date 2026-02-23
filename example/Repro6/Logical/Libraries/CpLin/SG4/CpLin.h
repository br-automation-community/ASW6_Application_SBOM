/* Automation Studio generated header file */
/* Do not edit ! */
/* CpLin 1.1.1 */

#ifndef _CPLIN_
#define _CPLIN_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _CpLin_VERSION
#define _CpLin_VERSION 1.1.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "dvframe.h"
		#include "brsystem.h"
#endif
#ifdef _SG4
		#include "dvframe.h"
		#include "brsystem.h"
#endif
#ifdef _SGC
		#include "dvframe.h"
		#include "brsystem.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum CpLinBusStateEnum
{	cpLIN_BS_SLEEP,
	cpLIN_BS_WAKING_UP,
	cpLIN_BS_ACTIVE
} CpLinBusStateEnum;

typedef enum CpLinChecksumEnum
{	cpLIN_CS_AUTO,
	cpLIN_CS_CLASSIC,
	cpLIN_CS_ENHANCED
} CpLinChecksumEnum;

typedef enum CpLinErrorEnum
{	cpLIN_NO_ERROR = 0,
	cpLIN_ERR_MAX_PORTS_REACHED = -1070582446,
	cpLIN_ERR_ILLEGAL_FRAME_LENGTH = -1070582445,
	cpLIN_ERR_ILLEGAL_FRAME_ID = -1070582444,
	cpLIN_ERR_MULTIPLE_INSTANCES = -1070582443,
	cpLIN_ERR_NO_SCHEDULE = -1070582442,
	cpLIN_ERR_ASSERT = -1070582441,
	cpLIN_WRN_STOPPED = -2144324270,
	cpLIN_SUC_STARTED = 3159378,
	cpLIN_INF_DEBUG = 1076901202
} CpLinErrorEnum;

typedef enum CpLinErrorFlagsEnum
{	cpLIN_EF_NO_ERROR = 0,
	cpLIN_EF_INCONSISTENT_SYNC = 1,
	cpLIN_EF_ID_PARITY_BIT6 = 2,
	cpLIN_EF_ID_PARITY_BIT7 = 4,
	cpLIN_EF_CHECKSUM = 8,
	cpLIN_EF_ILLEGAL_LENGTH = 16,
	cpLIN_EF_NO_RESPONSE = 32
} CpLinErrorFlagsEnum;

typedef enum CpLinFubStateEnum
{	cpLIN_FS_DISABLED,
	cpLIN_FS_INIT,
	cpLIN_FS_ACTIVE,
	cpLIN_FS_DEINIT,
	cpLIN_FS_ERROR
} CpLinFubStateEnum;

typedef enum CpLinLogLevelEnum
{	cpLIN_LOG_LEVEL_INFO,
	cpLIN_LOG_LEVEL_SUCCESS,
	cpLIN_LOG_LEVEL_WARNING,
	cpLIN_LOG_LEVEL_ERROR,
	cpLIN_LOG_LEVEL_DEBUG
} CpLinLogLevelEnum;

typedef enum CpLinRunEnum
{	cpLIN_RUN_OFF,
	cpLIN_RUN_CYCLIC,
	cpLIN_RUN_ONCE
} CpLinRunEnum;

typedef struct CpLinReceiveFrameType
{	unsigned char FrameId;
	unsigned char Length;
	unsigned char Data[8];
	enum CpLinChecksumEnum ChecksumType;
	unsigned char Checksum;
	enum CpLinErrorFlagsEnum ErrorFlags;
} CpLinReceiveFrameType;

typedef struct CpLinReceiveInternalType
{	enum CpLinFubStateEnum FubState;
	unsigned long PortData;
} CpLinReceiveInternalType;

typedef struct CpLinSendFrameType
{	unsigned char FrameId;
	unsigned char Length;
	unsigned char Data[8];
	enum CpLinChecksumEnum ChecksumType;
} CpLinSendFrameType;

typedef struct CpLinScheduleItemType
{	unsigned short Duration;
	struct CpLinSendFrameType Frame;
} CpLinScheduleItemType;

typedef struct CpLinReceive
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[81];
	/* VAR_OUTPUT (analog) */
	enum CpLinErrorEnum ErrorID;
	struct CpLinReceiveFrameType Frame;
	/* VAR (analog) */
	struct CpLinReceiveInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit FrameReceived;
} CpLinReceive_typ;

typedef struct CpLinSendInternalType
{	enum CpLinFubStateEnum FubState;
	unsigned long PortData;
} CpLinSendInternalType;

typedef struct CpLinSend
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[81];
	struct CpLinSendFrameType Frame;
	/* VAR_OUTPUT (analog) */
	enum CpLinErrorEnum ErrorID;
	/* VAR (analog) */
	struct CpLinSendInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit SendFrame;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
} CpLinSend_typ;

typedef struct CpLinSchedulerInternalType
{	enum CpLinFubStateEnum FubState;
	unsigned long PortData;
	unsigned short CycleTime;
	signed long SlotTimer;
	signed long InitTimer;
	signed long WakeupTimer;
	signed long BusInactivityTimer;
	struct CpLinReceive CpLinReceive_0;
	struct CpLinSend CpLinSend_0;
} CpLinSchedulerInternalType;

typedef struct CpLinScheduler
{
	/* VAR_INPUT (analog) */
	plcstring DeviceName[81];
	struct CpLinScheduleItemType* Schedule;
	unsigned char ScheduleLength;
	enum CpLinRunEnum Run;
	enum CpLinLogLevelEnum LogLevel;
	/* VAR_OUTPUT (analog) */
	enum CpLinErrorEnum ErrorID;
	enum CpLinBusStateEnum BusState;
	struct CpLinReceiveFrameType Frame;
	unsigned char SlotIndex;
	unsigned long CycleCounter;
	/* VAR (analog) */
	struct CpLinSchedulerInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Error;
	plcbit FrameReceived;
	plcbit FrameSent;
} CpLinScheduler_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CpLinReceive(struct CpLinReceive* inst);
_BUR_PUBLIC void CpLinSend(struct CpLinSend* inst);
_BUR_PUBLIC void CpLinScheduler(struct CpLinScheduler* inst);


#ifdef __cplusplus
};
#endif
#endif /* _CPLIN_ */

