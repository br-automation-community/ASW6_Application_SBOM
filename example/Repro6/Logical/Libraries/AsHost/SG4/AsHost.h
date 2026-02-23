/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASHOST_
#define _ASHOST_
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
typedef struct ASHOST_LOCAL_OBJ
{	unsigned short StateMan;
	unsigned short ErrMan;
	unsigned long Init;
} ASHOST_LOCAL_OBJ;

typedef struct HostByName
{
	/* VAR_INPUT (analog) */
	unsigned long pName;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long address;
	/* VAR (analog) */
	struct ASHOST_LOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HostByName_typ;

typedef struct HostByAddress
{
	/* VAR_INPUT (analog) */
	unsigned long address;
	unsigned long pName;
	unsigned long buflng;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	struct ASHOST_LOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HostByAddress_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HostByName(struct HostByName* inst);
_BUR_PUBLIC void HostByAddress(struct HostByAddress* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define ERR_ASHOST_RESOLV_NAME 29755U
 #define ERR_ASHOST_RESOLV_ADDR 29754U
 #define ERR_ASHOST_PARAM_NAME 29753U
 #define ERR_ASHOST_PARAM_BUFLNG 29752U
 #define ERR_ASHOST_PARAM_ADDR 29751U
 #define ERR_ASHOST_MANAGER 29750U
#else
 _GLOBAL_CONST unsigned short ERR_ASHOST_RESOLV_NAME;
 _GLOBAL_CONST unsigned short ERR_ASHOST_RESOLV_ADDR;
 _GLOBAL_CONST unsigned short ERR_ASHOST_PARAM_NAME;
 _GLOBAL_CONST unsigned short ERR_ASHOST_PARAM_BUFLNG;
 _GLOBAL_CONST unsigned short ERR_ASHOST_PARAM_ADDR;
 _GLOBAL_CONST unsigned short ERR_ASHOST_MANAGER;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASHOST_ */

