                                                                      
{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientStart			(*starts an ANSL client which read and write PVs from other controllers based on the configuration; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientStop		(*stops an ANSL client which read and write PVs from other controllers based on the configuration; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiag			(*reads diagnostic infos from an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;							(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagInfo	: AsANSLClientDiagInfoType;		(*client info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagAll		(*reads diagnostic infos from an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		index			: UDINT;						(*index to iterate the clients*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagInfo	: AsANSLClientDiagInfoType;		(*client info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagConn	(*reads diagnostic infos of a connection of an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
		connName		: STRING[64];					(*connection name*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;								(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagConnInfo	: AsANSLClientDiagConnInfoType;		(*client connection info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagConnAll	(*reads diagnostic infos of a connection of an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
		index			: UDINT;						(*index to iterate the connections*)
		filterOption	: UDINT;						(*options: asANSL_OPTION_FILTER_ALL, asANSL_OPTION_FILTER_NOERROR, asANSL_OPTION_FILTER_ERROR*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;								(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagConnInfo	: AsANSLClientDiagConnInfoType;		(*client connection info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagRedConn	(*reads diagnostic infos of a redundancy connection of an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
		connName		: STRING[64];					(*connection name*)
	END_VAR

	VAR_OUTPUT
		status					: UINT;									(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagRedConnInfo	: AsANSLClientDiagRedConnInfoType;		(*client redundancy connection info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagPv		(*reads diagnostic infos of a pv connection of an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
		connName		: STRING[64];					(*connection name*)
		localPvName		: STRING[512];					(*local pv name given as pointer*)
		remotePvName	: STRING[512];					(*remote pv name given as pointer*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;								(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagPvInfo	: AsANSLClientDiagPvInfoType;		(*client pv info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLClientDiagPvAll	(*reads diagnostic infos of a pv connection of an ANSL client; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;							(*enables execution*)
		dataObjName		: STRING[256];					(*datamodul name*)
		connName		: STRING[64];					(*connection name*)
		index			: UDINT;						(*index to iterate the connections*)
		filterOption	: UDINT;						(*options: asANSL_OPTION_FILTER_ALL, asANSL_OPTION_FILTER_NOERROR, asANSL_OPTION_FILTER_ERROR*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;								(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ClientDiagPvInfo	: AsANSLClientDiagPvInfoType;		(*client pv info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
	
{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLServerRRInfo	(*reads infos of the redundancy relevant connections of an ANSL Server; asynchronous execution*)
	VAR_INPUT
		enable					: BOOL;					(*enables execution*)
		pConnList				: UDINT;				(*names of all redundancy relevant connections given as pointer*)
		maxConnListLenght		: UDINT;				(*maximum length of the string (pConnList)*)
		cpuOption				: UDINT;				(*options: asANSL_OPTION_CPU_LOCAL, asANSL_OPTION_CPU_PARTNER*)
	END_VAR

	VAR_OUTPUT
		status						: UINT;				(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		connListLenght  			: UDINT;			(*data length of the string (pConnList)*)
		rrConnCount					: UDINT;			(*number of redundancy relevant connections*)
		rrConnIndicator				: UDINT;			(*priority of all redundancy relevant connections*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION AsANSLServerConnCount : UDINT	(*return the number of activ connections of an ANSL Server*)
END_FUNCTION

{REDUND_OK} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsANSLServerDiagConnAll	(*reads diagnostic infos of an ANSL server connection; asynchronous execution*)
	VAR_INPUT
		enable				: BOOL;						(*enables execution*)
		index				: UDINT;					(*index to iterate the connections*)
		filterClientIpAddr	: STRING[64];				(*filter to list only connections with the same ClientIpAddr*)
	END_VAR

	VAR_OUTPUT
		status				: UINT;								(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ServerDiagConnInfo	: AsANSLServerDiagConnInfoType;		(*server connection info struct*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
