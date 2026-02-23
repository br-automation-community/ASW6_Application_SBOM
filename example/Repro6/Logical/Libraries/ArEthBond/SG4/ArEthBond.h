/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARETHBOND_
#define _ARETHBOND_
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
typedef struct ArEthBondStateType
{	plcstring ActiveDevice[129];
	unsigned long PrimaryLinkStatus;
	unsigned long SecondaryLinkStatus;
	unsigned long NumberArpReachedTargets;
} ArEthBondStateType;

typedef struct ArEthBondStatisticsType
{	unsigned long SwitchCount;
	unsigned long PrimaryLinkErrorCount;
	unsigned long SecondaryLinkErrorCount;
	unsigned long PrimaryArpErrorCount;
	unsigned long SecondaryArpErrorCount;
	unsigned long LastErrorUtcTimeStampSeconds;
	unsigned long LastErrorUtcTimeStampNanoSeconds;
} ArEthBondStatisticsType;

typedef struct ArEthBondConfigurationType
{	unsigned long ArpMonitorPeriodMs;
	unsigned long NumberArpConfiguredTargets;
} ArEthBondConfigurationType;

typedef struct ArEthBondInternalType
{	struct ArFBStateInternalType FBStateCtx;
} ArEthBondInternalType;

typedef struct ArEthBondGetData
{
	/* VAR_INPUT (analog) */
	plcstring Name[129];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct ArEthBondConfigurationType Configuration;
	struct ArEthBondStateType State;
	struct ArEthBondStatisticsType Statistics;
	/* VAR (analog) */
	struct ArEthBondInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} ArEthBondGetData_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArEthBondGetData(struct ArEthBondGetData* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define arETHBOND_ERR_INVALID_NAME (-1070585906)
#else
 _GLOBAL_CONST signed long arETHBOND_ERR_INVALID_NAME;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ARETHBOND_ */

