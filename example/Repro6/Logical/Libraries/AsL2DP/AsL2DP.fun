                                                                      
{REDUND_ERROR} FUNCTION_BLOCK L2DPSlave			(*copies output data when received to the output data buffer and sends the input data to the master*)
	VAR_INPUT
		enable	:BOOL;				(*enables execution*)
		device	:UDINT;				(*device name given as a pointer, e.g., "SLX.SSY"*)
		L2DPid	:UINT;				(*dummy input parameter*)
		outbuf	:UDINT;				(*pointer to the output data area*)
		outlen	:USINT;				(*length of the transferred output data*)
		inbuf	:UDINT;				(*pointer to the input data area*)
		inlen	:USINT;				(*length of the transferred input data*)
		outcopy	:UDINT;				(*pointer to bool, 1/0 = output copying is active/inactive*)
		incopy	:UDINT;				(*pointer to bool, 1/0 = input copying is active/inactive*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		init	:USINT;				(*internal variable*)
		byRunState	:USINT;			(*internal variable*)
		baudrate	:USINT;			(*internal variable*)
		diagflag	:USINT;			(*internal variable*)
		pCfgData	:UDINT;			(*internal variable*)
		pInData	:UDINT;				(*internal variable*)
		pDiagData	:UDINT;		    (*internal variable*)
		param0	:UDINT;				(*internal variable*)		
		param4	:UDINT;				(*internal variable*)
		param8	:UDINT;				(*internal variable*)
		param12	:UDINT;				(*internal variable*)
		param16	:UDINT;				(*internal variable*)
		param20	:UDINT;				(*internal variable*)
		base0	:UDINT;				(*internal variable*)
		base1	:UDINT;				(*internal variable*)
		base2	:UDINT;				(*internal variable*)
		base3	:UDINT;				(*internal variable*)
		base4	:UDINT;				(*internal variable*)
		base5	:UDINT;				(*internal variable*)
		base6	:UDINT;				(*internal variable*)
		base7	:UDINT;				(*internal variable*)
		base8	:UDINT;				(*internal variable*)
		base9	:UDINT;				(*internal variable*)
		base10	:UDINT;				(*internal variable*)
		base11	:UDINT;				(*internal variable*)
		base12	:UDINT;				(*internal variable*)
		base13	:UDINT;				(*internal variable*)
		base14	:UDINT;				(*internal variable*)
		base15	:UDINT;				(*internal variable*)
		base16	:UDINT;				(*internal variable*)
		base17	:UDINT;				(*internal variable*)
		base18	:UDINT;				(*internal variable*)
		base19	:UDINT;				(*internal variable*)
		base20	:UDINT;				(*internal variable*)
		base21	:UDINT;				(*internal variable*)
		base22	:UDINT;				(*internal variable*)
		base23	:UDINT;				(*internal variable*)
		base24	:UDINT;				(*internal variable*)
		base25	:UDINT;				(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK L2DPGetNode			(*gets node address of the slave*)
	VAR_INPUT
		enable	: BOOL;				(*enables execution*)
		device	: UDINT;			(*device name given as a pointer, e.g., "SLX.SSY"*)
	END_VAR
	VAR_OUTPUT
		status	: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		node	: USINT;			(*node address*)
	END_VAR
END_FUNCTION_BLOCK
