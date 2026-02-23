{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImGetDeviceIm0 (*Gets the I&M0 data set for this device*)
	VAR_INPUT
		Execute		: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		Device		: STRING[127];			(*Name of the profinet device e.g. SS1.IF1.*)
	END_VAR
	VAR_OUTPUT
		Done		: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 		: BOOL;					(*The function block must continue to be called.*)
		Error		: BOOL;					(*Error occurred during operation.*)
		StatusID	: DINT;  				(*Status information.*)
		Im0 		: ArPnImIm0Type;		(*I&M0 data*)
	END_VAR
	VAR
		Internal	: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImSetDeviceIdentification (*Sets the device ID and the device type for this device*)
	VAR_INPUT
		Execute		: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		Device		: STRING[127];			(*Name of the profinet device e.g. SS1.IF1.*)
		DeviceID	: UINT;					(*Device identification*)
		DeviceType	: ARRAY[0..24]OF USINT;	(*Device type*)
		Im0 		: ArPnImIm0Type;		(*I&M0 data to set*)
	END_VAR
	VAR_OUTPUT
		Done		: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 		: BOOL;					(*The function block must continue to be called.*)
		Error		: BOOL;					(*Error occurred during operation.*)
		StatusID	: DINT;  				(*Status information.*)
	END_VAR
	VAR
		Internal	: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImSetDeviceIm5 (*Sets the I&M5 data for this device*)
	VAR_INPUT
		Execute		: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)	
		Device		: STRING[127];			(*Name of the profinet device e.g. SS1.IF1.*)
		Im5 		: ArPnImIm5Type;		(*I&M5 data to set*)
	END_VAR
	VAR_OUTPUT
		Done		: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 		: BOOL;					(*The function block must continue to be called.*)
		Error		: BOOL;					(*Error occurred during operation.*)
		StatusID	: DINT;  				(*Status information.*)
	END_VAR
	VAR
		Internal	: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImSetAssets (*Sets asset data for this device*)
	VAR_INPUT
		Execute		: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		Device		: STRING[127];			(*Name of the profinet device e.g. SS1.IF1.*)
		AssetArray	: UDINT;				(*Pointer to the asset array.*)
		AssetCount	: UDINT;				(*Number of assets.*)
	END_VAR
	VAR_OUTPUT
		Done		: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 		: BOOL;					(*The function block must continue to be called.*)
		Error		: BOOL;					(*Error occurred during operation.*)
		StatusID	: DINT;  				(*Status information.*)
	END_VAR
	VAR
		Internal	: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImRemoveAssets (*Removes asset data for this device*)
	VAR_INPUT
		Execute		: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		Device		: STRING[127];			(*Name of the profinet device e.g. SS1.IF1.*)
	END_VAR
	VAR_OUTPUT
		Done		: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 		: BOOL;					(*The function block must continue to be called.*)
		Error		: BOOL;					(*Error occurred during operation.*)
		StatusID	: DINT;  				(*Status information.*)
	END_VAR
	VAR
		Internal	: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImGenerateAssets (*Delivers system-possible assets.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		AssetArray		: UDINT;				(*Pointer to the asset array.*)
		AssetArrayLen	: UDINT;				(*Length of the asset array.*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		AssetCount		: UDINT;				(*Number of automatically generated assets.*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImGenerateAssetLevels (*Generates the level-tree location information for an array of assets.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		AssetArray		: UDINT;				(*Pointer to the asset array.*)
		AssetCount		: UDINT;				(*Length of the asset array.*)
		StartAsset		: STRING[127];			(*Name of the start asset*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
		InvalidElementIndex : UDINT;			(*Index of the AssetArray element which caused an error.*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArPnImGenerateAssetUuids (*Generates the UUIDs for an array of assets.*)
	VAR_INPUT
		Execute			: BOOL;					(*Execution of the function block begins on a rising edge of this input.*)
		AssetArray		: UDINT;				(*Pointer to the asset array.*)
		AssetCount		: UDINT;				(*Length of the asset array.*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;					(*Execution successful. Function block is finished.*)
		Busy 			: BOOL;					(*The function block must continue to be called.*)
		Error			: BOOL;					(*Error occurred during operation.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR	
END_FUNCTION_BLOCK
