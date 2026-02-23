
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK hartOpen (*open a device*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		pDev : UDINT; (*device name given as a pointer to string*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident : UDINT; (*ident of the device*)
	END_VAR
	VAR
		_statemachine : hartIntState_t; (*internal variable*)
		_state : UINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK hartPutCmd (*put a command to a device*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*ident of the device*)
		pCmd : UDINT; (*pointer to the command buffer*)
		cmdSize : UINT; (*size of command buffer*)
		pReply : UDINT; (*pointer to the reply buffer*)
		replySize : UINT; (*size of reply buffer*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		usedSize : UINT; (*used bytes in the read buffer*)
	END_VAR
	VAR
		_statemachine : hartIntState_t; (*internal variable*)
		_state : UINT; (*internal variable*)
		_pCmd : UDINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK hartClose (*close the device*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*ident of the device*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		_statemachine : hartIntState_t; (*internal variable*)
		_state : UINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
