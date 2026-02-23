{REDUND_ERROR}  FUNCTION_BLOCK ETHinfo
	VAR_INPUT
		enable	:BOOL;
	END_VAR
	VAR_OUTPUT
		statadr	:UDINT;
		ethadr	:UDINT;
		status	:UINT;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK SMTPxsendmail
	VAR_INPUT
		enable	:BOOL;
		pReceiver	:UDINT;
		pSender	:UDINT;
		pIpaddr	:UDINT;
		pSubject	:UDINT;
		pText	:UDINT;
		pAttachment	:UDINT;
		AttachmentCount	:USINT;
		timeout	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK ETHxinfo
	VAR_INPUT
		enable	:BOOL;
		pDevice	:UDINT;
	END_VAR
	VAR_OUTPUT
		statadr	:UDINT;
		ethadr	:UDINT;
		status	:UINT;
	END_VAR
	VAR
		mac	:ARRAY[0..5] OF USINT;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK TCPclose
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK TCPrecv
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
		buffer	:UDINT;
		mxbuflng	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
		rxbuflng	:UDINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK TCPsend
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
		buffer	:UDINT;
		buflng	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK TCPclient
	VAR_INPUT
		enable	:BOOL;
		porta	:UINT;
		ipaddr	:UDINT;
		portb	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
		cident	:UDINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK TCPserv
	VAR_INPUT
		enable	:BOOL;
		porta	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
		ipaddr	:UDINT;
		portb	:UINT;
		cident	:UDINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK ICMPping
	VAR_INPUT
		enable	:BOOL;
		ipaddr	:UDINT;
		timeout	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK SMTPsendmail
	VAR_INPUT
		enable	:BOOL;
		pReceiver	:UDINT;
		pSender	:UDINT;
		pIpaddr	:UDINT;
		pSubject	:UDINT;
		pText	:UDINT;
		timeout	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK UDPclose
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK UDPopen
	VAR_INPUT
		enable	:BOOL;
		port	:UINT;
		pvpolladr	:UDINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
		cident	:UDINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK UDPrecv
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
		buffer	:UDINT;
		buflng	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
		ipaddr	:UDINT;
		rxbuflng	:UINT;
		port	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR}  FUNCTION_BLOCK UDPsend
	VAR_INPUT
		enable	:BOOL;
		cident	:UDINT;
		ipaddr	:UDINT;
		buffer	:UDINT;
		buflng	:UINT;
		port	:UINT;
	END_VAR
	VAR_OUTPUT
		status	:UINT;
	END_VAR
	VAR
		pna_ok	:BOOL;
		state	:UINT;
		tickcount	:UDINT;
		initcount	:UDINT;
		dcmd	:TCPQ_dcmd_typ;
	END_VAR
END_FUNCTION_BLOCK

