/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASSMTP_
#define _ASSMTP_
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
typedef enum AsSmtpCipherVersionEnum
{	asSMTP_TLS_1_3 = 2
} AsSmtpCipherVersionEnum;

typedef struct smtpATTACHMENT_typ
{	unsigned long type;
	unsigned long pData;
	unsigned long length;
	unsigned long pName;
} smtpATTACHMENT_typ;

typedef struct AsSmtpMcsType
{	plcstring name[256];
	enum AsSmtpCipherVersionEnum tlsVersion;
	plcbit trustListValidation;
} AsSmtpMcsType;

typedef struct SmtpSend
{
	/* VAR_INPUT (analog) */
	unsigned long pHost;
	unsigned long pUser;
	unsigned long pPassword;
	unsigned long pSender;
	unsigned long pReceiver;
	unsigned long pSubject;
	unsigned long pText;
	unsigned long pDomain;
	unsigned long pAttachment;
	unsigned long pSecurity;
	unsigned long timeout;
	unsigned short port;
	unsigned char attcnt;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} SmtpSend_typ;

typedef struct SmtpsSend
{
	/* VAR_INPUT (analog) */
	unsigned long pHost;
	unsigned long pUser;
	unsigned long pPassword;
	unsigned long pSender;
	unsigned long pReceiver;
	unsigned long pSubject;
	unsigned long pText;
	unsigned long pDomain;
	unsigned long pAttachment;
	unsigned long sslCfgIdent;
	unsigned long timeout;
	unsigned short port;
	unsigned char attcnt;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} SmtpsSend_typ;

typedef struct SmtpSendMcs
{
	/* VAR_INPUT (analog) */
	unsigned long pHost;
	unsigned long pUser;
	unsigned long pPassword;
	unsigned long pSender;
	unsigned long pReceiver;
	unsigned long pSubject;
	unsigned long pText;
	unsigned long pDomain;
	unsigned long pAttachment;
	struct AsSmtpMcsType mcsStore;
	unsigned long timeout;
	unsigned short port;
	unsigned char attcnt;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} SmtpSendMcs_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void SmtpSend(struct SmtpSend* inst);
_BUR_PUBLIC void SmtpsSend(struct SmtpsSend* inst);
_BUR_PUBLIC void SmtpSendMcs(struct SmtpSendMcs* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define smtpATT_TYPE_MEMORY 3U
 #define smtpATT_TYPE_DATMOD 2U
 #define smtpATT_TYPE_FILE 1U
 #define smtpERR_SYSTEM 32749U
 #define smtpERR_INVALID_MCS_CONFIG 32711U
 #define smtpERR_INVALID_SSL_CONFIG 32710U
 #define smtpERR_HANDSHAKE 32709U
 #define smtpERR_SSL 32708U
 #define smtpERR_ATTACHMENT_INVALID 32707U
 #define smtpERR_AUTHENTICATION_FAILED 32706U
 #define smtpERR_AUTHENTICATION_METHOD 32705U
 #define smtpERR_RESPONSE_UNEXPECTED 32704U
 #define smtpERR_RESPONSE_TIMEOUT 32703U
 #define smtpERR_SOCKET_CONNECT 32702U
 #define smtpERR_SOCKET_CREATE 32701U
 #define smtpERR_PARAMETER 32700U
#else
 _GLOBAL_CONST unsigned char smtpATT_TYPE_MEMORY;
 _GLOBAL_CONST unsigned char smtpATT_TYPE_DATMOD;
 _GLOBAL_CONST unsigned char smtpATT_TYPE_FILE;
 _GLOBAL_CONST unsigned short smtpERR_SYSTEM;
 _GLOBAL_CONST unsigned short smtpERR_INVALID_MCS_CONFIG;
 _GLOBAL_CONST unsigned short smtpERR_INVALID_SSL_CONFIG;
 _GLOBAL_CONST unsigned short smtpERR_HANDSHAKE;
 _GLOBAL_CONST unsigned short smtpERR_SSL;
 _GLOBAL_CONST unsigned short smtpERR_ATTACHMENT_INVALID;
 _GLOBAL_CONST unsigned short smtpERR_AUTHENTICATION_FAILED;
 _GLOBAL_CONST unsigned short smtpERR_AUTHENTICATION_METHOD;
 _GLOBAL_CONST unsigned short smtpERR_RESPONSE_UNEXPECTED;
 _GLOBAL_CONST unsigned short smtpERR_RESPONSE_TIMEOUT;
 _GLOBAL_CONST unsigned short smtpERR_SOCKET_CONNECT;
 _GLOBAL_CONST unsigned short smtpERR_SOCKET_CREATE;
 _GLOBAL_CONST unsigned short smtpERR_PARAMETER;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASSMTP_ */

