                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK snmpV1Get				(*requests one or more parameters of a network participant; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to IP address or host name of a network participant*)
		pCommunity		: UDINT;		(*pointer to the community name for authentication*)
		pVariables		: UDINT;		(*pointer to the array of variables*)
		numVariables	: UDINT;		(*number of variables*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		snmpError		: UDINT;		(*SNMP response error status*)
		snmpErrorIdx	: UDINT;		(*index of the first variable with an error*)
	END_VAR

	VAR
        _statemachine	: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK snmpV1Set				(*sets one or more parameters of a network participant; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to IP address or host name of a network participant*)
		pCommunity		: UDINT;		(*pointer to the community name for authentication*)
		pVariables		: UDINT;		(*pointer to the array of variables*)
		numVariables	: UDINT;		(*number of variables*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		snmpError		: UDINT;		(*SNMP response error status*)
		snmpErrorIdx		: UDINT;		(*index of the first variable with an error*)
	END_VAR

	VAR
        _statemachine	: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK snmpV1SendTrap			(*sends a snmp trap; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pHost			: UDINT;		(*pointer to IP address or host name of a network participant*)
		pCommunity		: UDINT;		(*pointer to the community name for authentication*)
		pOid			: UDINT;		(*pointer to the object id*)
		genTrapId		: UDINT;		(*general trap id*)
		specTrapId		: UDINT;		(*enterprise specific trap id*)
		timeStamp		: UDINT;		(*timeStamp*)
		pVariables		: UDINT;		(*pointer to the array of variables*)
		numVariables	: UDINT;		(*number of variables*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        _statemachine	: UINT;			(*internal variable*)
		_result			: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
