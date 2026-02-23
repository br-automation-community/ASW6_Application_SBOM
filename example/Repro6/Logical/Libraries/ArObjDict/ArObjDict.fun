
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArObjDictCreateSimpleObject (* Create a new object of type VAR in object dictionary. *)
	VAR_INPUT
		Execute 			: BOOL; 						(* Start execution *)
		DeviceName 			: STRING[127]; 					(* Name of the netX device e.g. 'IF1.SS3' *)
		Index				: UINT;							(* Index of object container to be created. *)
		Datatype			: ArObjDictDatatypeEnum;		(* Data type. *)
		AccessRights		: ArObjDictAccessRightsEnum;	(* Access rights. Defined with access rights constants. *)
		MaxFieldUnits		: UDINT;						(* Maximum field units. *)
		Name	 			: STRING[127]; 					(* Name of the object. This is optional parameter. *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution done *)
		Busy 				: BOOL; 		(* Execution running *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: see help *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArObjDictCreateParentObject (* Create a new object, which will contatin subobjects, in object dictionary. *)
	VAR_INPUT
		Execute 			: BOOL; 						(* Start execution *)
		DeviceName 			: STRING[127]; 					(* Name of the netX device e.g. 'IF1.SS3' *)
		Index				: UINT;							(* Index of object container to be created. *)
		MaxNumOfSubObjects	: USINT;						(* Maximum number of subobjects to be contained in object container to be created. *)
		ObjectCode 			: ArObjDictObjectCodeEnum;		(* Defined with object code constants. *)
		Name	 			: STRING[127]; 					(* Name of the object. This is optional parameter. *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution done *)
		Busy 				: BOOL; 		(* Execution running *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: see help *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArObjDictCreateSubObject (* Create a new subobject on an existing object in the object dictionary. *)
	VAR_INPUT
		Execute 			: BOOL; 						(* Start execution *)
		DeviceName 			: STRING[127]; 					(* Name of the netX device e.g. 'IF1.SS3' *)
		Index				: UINT;							(* Index of object container to be created. *)
		SubIndex			: USINT;						(* Subindex of newly created subobject. *)
		AccessRights		: ArObjDictAccessRightsEnum;	(* Access rights. Defined with access rights constants. *)
		Datatype			: ArObjDictDatatypeEnum;		(* Data type. *)
		MaxFieldUnits		: UDINT;						(* Maximum field units. *)
		Name	 			: STRING[127]; 					(* Name of the subobject. This is optional parameter. *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution done *)
		Busy 				: BOOL; 		(* Execution running *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: see help *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArObjDictReadData (* Read data from an object identified by its index and subindex from the object dictionary. *)
	VAR_INPUT
		Execute 			: BOOL; 		(* Start execution *)
		DeviceName 			: STRING[127]; 	(* Name of the netX device e.g. 'IF1.SS3' *)
		Index				: UINT;			(* Index of object to be read. *)
		SubIndex			: USINT;		(* Subindex of object to be read. *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution done *)
		Busy 				: BOOL; 		(* Execution running *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: see help *)
		TotalDataBytes		: UDINT;		(* Total number of data bytes having been read. *)
		Data				: ARRAY[0..1023] OF USINT;	(* Data having been read. *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArObjDictWriteData (* Write data to an object identified by its index and subindex from the object dictionary. *)
	VAR_INPUT
		Execute 			: BOOL; 		(* Start execution *)
		DeviceName 			: STRING[127]; 	(* Name of the netX device e.g. 'IF1.SS3' *)
		Index				: UINT;			(* Index of object to be written. *)
		SubIndex			: USINT;		(* Subindex of object to be written. *)
		TotalDataBytes		: UDINT;		(* Total number of data bytes to be written. *)
		Data 				: ARRAY[0..1023] OF USINT;	(* Data to be written. *)
	END_VAR
	
	VAR_OUTPUT
		Done 				: BOOL; 		(* Execution done *)
		Busy 				: BOOL; 		(* Execution running *)
		Error 				: BOOL; 		(* Execution failed *)
		StatusID 			: DINT; 		(* Status information: see help *)
	END_VAR
	
	VAR
        Internal			: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

