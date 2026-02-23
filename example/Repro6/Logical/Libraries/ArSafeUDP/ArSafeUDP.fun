
{REDUND_CONTEXT} FUNCTION ArSafeUDPEnable  : DINT (*Enable an openSAFETY-over-UDP tunnel.*)
	VAR_INPUT
		DeviceName	: STRING[127]; (*Device name (syntax: SL<a>.SS<b>.IF<c>.ST<d>) of the openSAFETY-over-UDP tunnel.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION ArSafeUDPDisable : DINT (*Disable an openSAFETY-over-UDP tunnel.*)
	VAR_INPUT
		DeviceName	: STRING[127]; (*Device name (syntax: SL<a>.SS<b>.IF<c>.ST<d>) of the openSAFETY-over-UDP tunnel.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION ArSafeUDPSetIP   : DINT (*Change the IP for an openSAFETY-over-UDP tunnel.*)
	VAR_INPUT
		DeviceName	: STRING[127]; (*Device name (syntax: SL<a>.SS<b>.IF<c>.ST<d>) of the openSAFETY-over-UDP tunnel.*)
		IPAddress	: STRING[15]; (*IP address, valid range "1.0.0.1" - "247.255.255.255".*)
	END_VAR
END_FUNCTION
