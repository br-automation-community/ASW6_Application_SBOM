(********************************************************************
 * COPYRIGHT (C) BERNECKER + RAINER, AUSTRIA, A-5142 EGGELSBERG
 ********************************************************************
 * Library: ViAccess
 * File:	ViAccess.fun
 ********************************************************************
 * Declaration of IEC-FBs of library ViAccess
 ********************************************************************)

FUNCTION_BLOCK ViAccessBasis (*The function block ViAccessBasis must be active to execute the function blocks ViAccessGetVfList, ViAccessGetVfParameters, ViAccessSetVfParameters, ViAccessGetVfModelList, ViAccessGetVfModelParameters and ViAccessSetVfModelParameters.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Enable : BOOL;
		KeepImage : BOOL;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Error : BOOL;
		StatusID : DINT;
		KeepImageActive : BOOL;
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessGetVfList (*This function block can be used to get the list of Vision Functions configured in the Vision Application running on the camera. (precondition: ViAccessBasis is connected and active on the cameras Vision Component).*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : BOOL;
		List : REFERENCE TO viAccessVfListEntryType; (*Reference to a memory area to which the output information will be copied.*)
		ListLen : UDINT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Busy : BOOL;
		Error : BOOL;
		StatusID : DINT;
		NrEntries : UINT;
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessGetVfModelList (*This function block can be used to get the list of models currently defined in the VF instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
		NrEntries : USINT;
		ModelIds : ARRAY[0..254] OF USINT; (*List of the IDs of all models found in the vision function instance. "0" is not a valid ID.*)
		ModelTypes : ARRAY[0..254] OF viModelTypeEnum; (*Model types of the found models, in the same order as the IDs.*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessGetVfParameters (*This function block can be used to read the acyclic parameters of the Vision Function instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		VfParameters : UDINT; (*Address to process variable. Datatype of process variable depends on the vision function type.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessSetVfParameters (*This function block can be used to write the acyclic parameters of the Vision Function instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		VfParameters : UDINT; (*Address to process variable. Datatype of process variable depends on the vision function type.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessGetVfModelParameters (*This function block can be used to read the model parameters of the specified model in the specified Vision Function instance running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		ModelId : USINT; (*ID of the model to read. Output of function block ViAccessGetVfModelList.*)
		ModelParameters : UDINT; (*Address to process variable. Datatype of process variable depends on the model type.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessSetVfModelParameters (*This function block can be used to set the values of modifiable model parameters in the specified model of the specified Vision Function instance running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		ModelId : USINT; (*ID of the model to edit. Output of function block ViAccessGetVfModelList.*)
		ModelParameters : UDINT; (*Address to process variable. Datatype of process variable depends on the model type.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK ViAccessGetVfOperations (*This function block can be used to read the Operations of the Measurement Vision Function instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		List : REFERENCE TO viVfMMOperationEntryType; (*Reference to a memory area to which the output information will be copied.*)
		ListLen : UDINT; (*Length of the memory area in bytes.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
		NrEntries : UINT; (*Total amount of operations configured for given vision function instance.*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessSetVfOperations (*This function block can be used to write the Operations of the Measurement Vision Function instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		List : REFERENCE TO viVfMMOperationEntryType; (*Reference to a memory area from which the input information will be copied.*)
		ListLen : UDINT;  (*Length of the memory area in bytes.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK ViAccessSetVfExecutionRoi (*This function block can be used to write the execution ROI of a Vision Function instance at the specified execution number in the Vision Application running on the camera.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		Type : viAccessRoiFormatTypeEnum;
		Roi : UDINT; (* Pointer to ROI Type struct*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK ViAccessGetPixelGrayValues (*This function block can be used to get the gray value of a given pixel array from the previous image.*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : {REDUND_UNREPLICABLE} BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		ExecutionNumber : USINT; (*Execution number of the vision function instance*)
		X : REFERENCE TO UINT; (*x coordinates given as pointer to Array of UINT.*)
		Y : REFERENCE TO UINT; (*y coordinates given as pointer to Array of UINT.*)
		GrayValues : REFERENCE TO USINT; (*Resulting gray values of the requested pixels given as pointer to Array of USINT. Must have the same number of elements as X and Y.*)
		Number : UDINT; (*Number of GrayValues to request.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ViAccessGetImage (*Function block ViAccessGetImage can be used to get the last acquired image or an output generated by a vision function*)
	VAR_INPUT
		MpLink : REFERENCE TO ViComponentType; (*Pointer to the vision component.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Type : ViAccessImageTypeEnum; (*Determines the image format in which the image data is provided.*)
		QualityLevel: USINT; (*JPG compression quality level. Ignored for type viACCESS_IMAGE_TYPE_BMP.*)
		ExecutionNumber: UINT; (*Execution order of the queried vision function, 0 for the raw aquired image.*)
		ImageName: REFERENCE TO STRING[50]; (*Output image name specified for each individual function, ignored for aquisition images.*)
		Buffer : UDINT; (*Pointer to a memory area to which the image data is copied.*)
		BufferSize : UDINT; (*Length of the provided data area in bytes.*)
	END_VAR
	VAR_OUTPUT
		Done : BOOL; (*Execution successful. Function block is finished.*)
		Busy : BOOL; (*The function block is active and must continue to be called.*)
		Active : BOOL; (*It is possible to acquire the next image on the camera without disturbing the Function block*)
		Error : BOOL; (*Error during execution.*)
		StatusID : DINT; (*Status information*)
		BufferLen : UDINT; (*Number of bytes actually copied.*)
		Nettime : DINT; (*Nettime image was taken*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} ViBaseInternalType;
	END_VAR
END_FUNCTION_BLOCK