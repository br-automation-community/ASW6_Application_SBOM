
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK vbioCM4810 (*This function block can be used to access the data of X20CM4810 modules.*)
	VAR_INPUT
		enable : BOOL; (*Enable function block.*)
		paramMain : vbioParamMain_t; (*Main parameter structure.*)
		paramBufferUpload : vbioParamBufferUpload_t; (*Parameter structure for the module buffer upload.*)
		requestBufferLock : BOOL; (*Requests the module buffer lock.*)
		uploadBuffer : BOOL; (*Starts the upload of the raw sensor data (rising edge).*)
		uploadModuleCfg : BOOL; (*Starts the upload of the module configuration (rising edge).*)
		acknowledgeError : BOOL; (*Resets the value of the status output (rising edge).*)
		ioMapping : vbioIoMapping_t; (*All members of this structure have to be connected directly to the IO mapping of the X20CM4810 module.*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*Function block status message.*)
		bufferLockValid : BOOL; (*Requested module buffer lock is active.*)
		bufferUploadLength : UDINT; (*Actual number of uploaded XY value pairs (stored in the arrays pArrayXaxis and pArrayYaxis).*)
		bufferUploadDone : BOOL; (*True if the buffer was uploaded successfully.*)
		moduleCfg : vbioModuleCfg_t; (*This structure contains the complete module configuration.*)
		moduleCfgUploadDone : BOOL; (*The flag is true if the X20CM4810 module configuration has been uploaded successfully.*)
		initDone : BOOL; (*True if the function block is initialized and the outputs can be used.*)
	END_VAR
	VAR
		_mode : UINT; (*Data for internal use.*)
		_internal : vbioInternal_t; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK vbioCtrlCM4810 (*This function block can be used to access the data of X20CM4810 modules.*)
	VAR_INPUT
		enable : BOOL; (*Enable function block.*)
		paramMain : vbioParamMain_t; (*Main parameter structure.*)
		paramBufferUpload : vbioParamBufferUpload_t; (*Parameter structure for the module buffer upload.*)
		requestBufferLock : BOOL; (*Requests the module buffer lock.*)
		uploadBuffer : BOOL; (*Starts the upload of the raw sensor data (rising edge).*)
		uploadModuleCfg : BOOL; (*Starts the upload of the module configuration (rising edge).*)
		acknowledgeError : BOOL; (*Resets the value of the status output (rising edge).*)
		ioMapping : vbioIoMapping_t; (*All members of this structure have to be connected directly to the IO mapping of the X20CM4810 module.*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*Function block status message.*)
		bufferLockValid : BOOL; (*Requested module buffer lock is active.*)
		bufferUploadLength : UDINT; (*Actual number of uploaded XY value pairs (stored in the arrays pArrayXaxis and pArrayYaxis).*)
		bufferUploadDone : BOOL; (*True if the buffer was uploaded successfully.*)
		moduleCfg : vbioModuleCfgEx_t; (*This structure contains the complete module configuration.*)
		moduleCfgUploadDone : BOOL; (*The flag is true if the X20CM4810 module configuration has been uploaded successfully.*)
		initDone : BOOL; (*True if the function block is initialized and the outputs can be used.*)
	END_VAR
	VAR
		_mode : UINT; (*Data for internal use.*)
		_flags : UDINT;	(*Data for internal use.*)
		_buffer : ARRAY[0..31]OF USINT; (*Data for internal use.*)
		_internal : vbioInternal_t; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK vbioCtrlCM4810Ex1 (*This function block can be used to access the data of X20CM4810 modules.*)
	VAR_INPUT
		enable : BOOL; (*Enable function block.*)
		paramMain : vbioParamMain_t; (*Main parameter structure.*)
		paramBufferUpload : vbioParamBufferUpload_t; (*Parameter structure for the module buffer upload.*)
		requestBufferLock : BOOL; (*Requests the module buffer lock.*)
		uploadBuffer : BOOL; (*Starts the upload of the raw sensor data (rising edge).*)
		cancelBufferUpload : BOOL; (*Cancels a started upload of the raw sensor data (rising edge).*)
		uploadModuleCfg : BOOL; (*Starts the upload of the module configuration (rising edge).*)
		acknowledgeError : BOOL; (*Resets the value of the status output (rising edge).*)
		ioMapping : vbioIoMapping_t; (*All members of this structure have to be connected directly to the IO mapping of the X20CM4810 module.*)
	END_VAR
	VAR_OUTPUT
		status : UINT; (*Function block status message.*)
		bufferLockValid : BOOL; (*Requested module buffer lock is active.*)
		bufferUploadLength : UDINT; (*Actual number of uploaded XY value pairs (stored in the arrays pArrayXaxis and pArrayYaxis).*)
		bufferUploadDone : BOOL; (*True if the buffer was uploaded successfully.*)
		cancelBufferUploadDone : BOOL; (*True if the buffer uploaded canceled successfully.*)
		moduleCfg : vbioModuleCfgEx1_t; (*This structure contains the complete module configuration.*)
		moduleCfgUploadDone : BOOL; (*The flag is true if the X20CM4810 module configuration has been uploaded successfully.*)
		initDone : BOOL; (*True if the function block is initialized and the outputs can be used.*)
	END_VAR
	VAR
		_mode : UINT; (*Data for internal use.*)
		_internal : vbioInternalEx1_t; (*Data for internal use.*)
	END_VAR
END_FUNCTION_BLOCK
