/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASMBTCPS_
#define _ASMBTCPS_
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
typedef struct mbSlBoolPut
{
	/* VAR_INPUT (analog) */
	unsigned short startAddress;
	unsigned char nrOfItems;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *station;
	plcbit (*data)[128];
	/* VAR_INPUT (digital) */
	plcbit enable;
} mbSlBoolPut_typ;

typedef struct mbSlBoolGet
{
	/* VAR_INPUT (analog) */
	unsigned short startAddress;
	unsigned char nrOfItems;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *station;
	plcbit (*data)[128];
	/* VAR_INPUT (digital) */
	plcbit enable;
} mbSlBoolGet_typ;

typedef struct mbSlWordPut
{
	/* VAR_INPUT (analog) */
	unsigned short startAddress;
	unsigned char nrOfItems;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *station;
	unsigned short (*data)[128];
	/* VAR_INPUT (digital) */
	plcbit enable;
} mbSlWordPut_typ;

typedef struct mbSlWordGet
{
	/* VAR_INPUT (analog) */
	unsigned short startAddress;
	unsigned char nrOfItems;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR_IN_OUT (analog and digital) */
	plcstring *station;
	unsigned short (*data)[128];
	/* VAR_INPUT (digital) */
	plcbit enable;
} mbSlWordGet_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void mbSlBoolPut(struct mbSlBoolPut* inst);
_BUR_PUBLIC void mbSlBoolGet(struct mbSlBoolGet* inst);
_BUR_PUBLIC void mbSlWordPut(struct mbSlWordPut* inst);
_BUR_PUBLIC void mbSlWordGet(struct mbSlWordGet* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define mbSlERR_INVALID_NUMBER_OF_ITEMS 37454U
 #define mbSlERR_NULLPOINTER 37453U
 #define mbSlERR_INVALID_ADDRESS 37452U
 #define mbSlERR_INVALID_STATION 37451U
 #define mbSlERR_INVALID_CONFIG 37450U
 #define mbSlOFFSET_HOLDING_REGISTER 24576U
 #define mbSlOFFSET_INPUT_REGISTER 8192U
 #define mbSlOFFSET_COIL 16384U
 #define mbSlOFFSET_DISCRETE_INPUT 0U
#else
 _GLOBAL_CONST unsigned short mbSlERR_INVALID_NUMBER_OF_ITEMS;
 _GLOBAL_CONST unsigned short mbSlERR_NULLPOINTER;
 _GLOBAL_CONST unsigned short mbSlERR_INVALID_ADDRESS;
 _GLOBAL_CONST unsigned short mbSlERR_INVALID_STATION;
 _GLOBAL_CONST unsigned short mbSlERR_INVALID_CONFIG;
 _GLOBAL_CONST unsigned short mbSlOFFSET_HOLDING_REGISTER;
 _GLOBAL_CONST unsigned short mbSlOFFSET_INPUT_REGISTER;
 _GLOBAL_CONST unsigned short mbSlOFFSET_COIL;
 _GLOBAL_CONST unsigned short mbSlOFFSET_DISCRETE_INPUT;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASMBTCPS_ */

