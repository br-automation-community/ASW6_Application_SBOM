
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoCreate (*creates a fifo; asynchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		pFifo : UDINT; (*fifo name given as a pointer. Max. 32 charachter are allowed*)
		size : UDINT; (*size of the fifo in bytes*)
		mode : UINT; (*write mode (fifoMODE_WRITE_UNTIL_FULL,  fifoMODE_WRITE_UNTIL_FULL)*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ident : UDINT; (*identifier of the fifo*)
	END_VAR
	VAR
		i_state : UINT; (*internal variable*)
		i_result : UINT; (*internal variable*)
		i_tmp : UDINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoDelete (*deletes a  fifo; asynchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*fifo ident*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
	VAR
		i_state : UINT; (*internal variable*)
		i_result : UINT; (*internal variable*)
		i_tmp : UDINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoWrite (*writes data into fifo; synchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*fifo ident*)
		pData : UDINT; (*fifo data source given as a pointer*)
		size : UDINT; (*size of fifo data in bytes*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE 0xXXXX = see help*)
	END_VAR
	VAR
		i_tmp : UDINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoRead (*reads data from fifo; synchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*fifo ident*)
		pData : UDINT; (*fifo data source given as a pointer*)
		size : UDINT; (*size of fifo data in bytes*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE  0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoClear (*clears all data of fifo; asynchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*fifo ident*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
	VAR
		i_state : UINT; (*internal variable*)
		i_result : UINT; (*internal variable*)
		i_tmp : UDINT; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fifoGetInfo (*gets fifo info; synchronous execution*)
	VAR_INPUT
		enable : BOOL; (*enables execution*)
		ident : UDINT; (*fifo ident*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		fifoFree : UDINT; (*value of free bytes*)
		fifoUsed : UDINT; (*value of used bytes*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION fifoGetIdent : UDINT (*status: ERR_OK,  0xXXXX = see help*)
	VAR_INPUT
		pFifo : UDINT; (*fifo name given as a pointer*)
		pIdent : UDINT; (*fifo ident*)
	END_VAR
END_FUNCTION
