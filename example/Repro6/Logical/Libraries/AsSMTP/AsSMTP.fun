                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK SmtpSend					(*sends email; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to the ip address of mail server*)
		pUser			: UDINT;		(*pointer to the user name for authentication*)
		pPassword		: UDINT;		(*pointer to the password for authentication*)
		pSender			: UDINT;		(*pointer to the name of sender*)
		pReceiver		: UDINT;		(*pointer to the ip addresses of receiver*)
		pSubject		: UDINT;		(*pointer to the subject string*)
		pText			: UDINT;		(*pointer to the text string*)
		pDomain			: UDINT;		(*pointer to the sender domain*)
		pAttachment		: UDINT;		(*pointer to the attachment structure field*)
		pSecurity		: UDINT;		(*reserved for future use*)
		timeout			: UDINT;		(*response timeout for connection establishment with smtp server*)
		port			: UINT;			(*port of mail server*)
		attcnt			: USINT;		(*number of attachments*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
        i_tmp			: UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK SmtpsSend					(*sends email; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to the ip address of mail server*)
		pUser			: UDINT;		(*pointer to the user name for authentication*)
		pPassword		: UDINT;		(*pointer to the password for authentication*)
		pSender			: UDINT;		(*pointer to the name of sender*)
		pReceiver		: UDINT;		(*pointer to the ip addresses of receiver*)
		pSubject		: UDINT;		(*pointer to the subject string*)
		pText			: UDINT;		(*pointer to the text string*)
		pDomain			: UDINT;		(*pointer to the sender domain*)
		pAttachment		: UDINT;		(*pointer to the attachment structure field*)
		sslCfgIdent		: UDINT;		(*identifier of the SSL configuration*)
		timeout			: UDINT;		(*response timeout for connection establishment with smtp server*)
		port			: UINT;			(*port of mail server*)
		attcnt			: USINT;		(*number of attachments*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
		i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
		i_tmp			: UDINT;		(*internal variable*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK SmtpSendMcs					(*sends email securely using MCS; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;			(*enables execution*)
		pHost				: UDINT;		(*pointer to the ip address of mail server*)
		pUser				: UDINT;		(*pointer to the user name for authentication*)
		pPassword			: UDINT;		(*pointer to the password for authentication*)
		pSender				: UDINT;		(*pointer to the name of sender*)
		pReceiver			: UDINT;		(*pointer to the ip addresses of receiver*)
		pSubject			: UDINT;		(*pointer to the subject string*)
		pText				: UDINT;		(*pointer to the text string*)
		pDomain				: UDINT;		(*pointer to the sender domain*)
		pAttachment			: UDINT;		(*pointer to the attachment structure field*)
        mcsStore            : AsSmtpMcsType;   (*Managed Certificate Store Struct*)
		timeout				: UDINT;		(*response timeout for connection establishment with smtp server*)
		port				: UINT;			(*port of mail server*)
		attcnt				: USINT;		(*number of attachments*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
		i_state				: UINT;			(*internal variable*)
		i_result			: UINT;			(*internal variable*)
		i_tmp				: UDINT;		(*internal variable*)
	END_VAR	
END_FUNCTION_BLOCK
