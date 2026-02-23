
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxecmSdoRead (* Read a SDO object by using CoE *)
	VAR_INPUT
		Execute 			: BOOL; 		(* Start execution *)
		DeviceName 			: STRING[127]; 	(* Name of the EtherCAT master device, e.g. "IF1.SS3" *)
		SlaveAdr 			: UINT;			(* Address of the EtherCAT slave *)
		Index				: UINT;			(* Index of the object to be read *)
		SubIndex			: USINT;		(* Subindex of the object to be read *)
		Timeout             : TIME;			(* Time limit after which SDO access will be canceled *)
		CompleteAccess 		: BOOL; 		(* Read the data of the chosen index and all its subindexes *)
		Data				: UDINT;		(* Read data buffer (given as pointer) *)
		DataLength			: UDINT;		(* Length of the read data buffer *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution completed *)
		Busy 				: BOOL; 		(* Execution in progress *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: See help documentation *)
		EcAddStatusInfo		: UDINT;		(* Additional EtherCAT communication error status information *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (* Internal variable *)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK nxecmSdoWrite (* Write a SDO by using CoE *)
	VAR_INPUT
		Execute 			: BOOL; 		(* Start execution *)
		DeviceName 			: STRING[127]; 	(* Name of the master device, e.g. "IF1.SS3" *)
		SlaveAdr 			: UINT;			(* Address of the EtherCAT slave *)
		Index				: UINT;			(* Index of the object to be written *)
		SubIndex			: USINT;		(* Subindex of the object to be written *)
		Timeout             : TIME;			(* Time limit after which SDO access will be canceled *)
		CompleteAccess 		: BOOL; 		(* Write the data of the chosen index and all its subindexes *)
		Data				: UDINT;		(* Write data buffer (given as pointer) *)
		DataLength			: UDINT;		(* Length of the write data buffer *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution completed  *)
		Busy 				: BOOL; 		(* Execution in progress  *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: See help documentation *)
		EcAddStatusInfo		: UDINT;		(* Additional EtherCAT communication error status information *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (* Internal variable *)
	END_VAR
END_FUNCTION_BLOCK

