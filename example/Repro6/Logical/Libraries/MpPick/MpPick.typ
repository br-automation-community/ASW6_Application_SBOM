
TYPE
	MpPickRegObjPosIdType :UDINT;
 (*Identifier for a position in a pick register (object or placeholder)*)	MpPickObjectTypeIdentType :UDINT;
 (*Represents an object type defined in a PickObjectList configuration*)	MpPickCoreComponentStateEnum :
		(
		mcPICK_CORE_STARTUP, (*Component is in startup state*)
		mcPICK_CORE_DISABLED, (*Component is in disabled state*)
		mcPICK_CORE_STANDBY, (*Component is in standby state*)
		mcPICK_CORE_STARTED, (*Component is in started state*)
		mcPICK_CORE_ERRORSTOP, (*Component is in error stop state*)
		mcPICK_CORE_INVALID_CONFIG (*Component is in invalid configuration state*)
		);
    (*Represents the evolution of the pick and place process*)
    MpPickCoreProcessStateEnum:
    	(
    	mpPICK_PROCSTAT_NOT_RUNNING, (*Process is not started*)
		mpPICK_PROCSTAT_STARTING, (*Process is starting and preparing for pick-and-place*)
		mpPICK_PROCSTAT_WAIT_OBJ, (*Waiting for object (future extension only)*)
		mpPICK_PROCSTAT_WAIT_PLACEH, (*Waiting for placeholder (future extension only)*)
		mpPICK_PROCSTAT_WAIT_OBJ_PLACEH, (*Waiting for object and placeholder*)
		mpPICK_PROCSTAT_PICK_AND_PLACE, (*Pick-and-place jobs running*)
		mpPICK_PROCSTAT_STOPPING (*ProcessStop was triggered, the process is leaving production state*)
    	);
    (*Represents the evolution of the robot's movements along the pick and place process*)
    MpPickCoreMovementStateEnum:
    	(
    	mpPICK_MOVESTAT_NONE, (*The PickCore does not control the robot movement*)
		mpPICK_MOVESTAT_TO_PICK, (*The robot moves to an object to be picked up*)
		mpPICK_MOVESTAT_PICK_IN_SYNC, (*The robot TCP is synchronous to the object to be picked*)
		mpPICK_MOVESTAT_TO_PLACE, (*The robot moves to a placeholder to place the picked object*)
		mpPICK_MOVESTAT_PLACE_IN_SYNC, (*The robot TCP is synchronous to the placeholder (object is being placed)*)
		mpPICK_MOVESTAT_TO_WAIT_POS, (*The robot moves to the waiting position*)
		mpPICK_MOVESTAT_ON_WAIT_POS (*The robot arrived the waiting position*)
    	);
	MpPickCoreInfoType : 	STRUCT
		ComponentState : MpPickCoreComponentStateEnum; (*Current PickCore component state*)
		ProcessState : MpPickCoreProcessStateEnum; (*Information concerning ongoing pick and place process*)
		MovementState : MpPickCoreMovementStateEnum; (*Information concerning ongoing robot movements*)
		ProcessedObjects : UDINT; (*Number of object successfully picked and placed since last ProcessEnable command*)
		Diag : MpPickDiagType; (*Internal information*)
	END_STRUCT;
	MpPickCoreParType : 	STRUCT
		OperationMode : STRING[80]; (*Name of the operation mode in which the PickCore component is to be started*)
	END_STRUCT;
	MpPickDiagType : 	STRUCT
		StatusID : MpPickStatusIDType; (*StatusID evaluation (internal)*)
	END_STRUCT;
	MpPickErrorEnum :
		(
		mcPICK_NO_ERROR := 0, (* No error *)
		mcPICK_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
		mcPICK_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
		mcPICK_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
		mcPICK_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
		mcPICK_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
		mcPICK_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
		mcPICK_ERR_COMMAND_FAILED := -1066334208, (* Command failed [Error: 7, 0xc0710800] *)
		mcPICK_ERR_PROCESS_FAILED := -1066334203 (* A component error occurred during operation [Error: 8, 0xc0710805] *)
		);
	MpPickObjLatchedConvType : 	STRUCT
		Position : LREAL; (*Latched conveyor position at the time the translation and orientation was determined. This parameter is ignored on 'Static' PickRegisters*)
	END_STRUCT;
	MpPickObjPosAddInfoEnum :
	(
		mpPICK_INFO_SINGLEITEM, (*Single item object*)
		mpPICK_INFO_SINGLEITEM_PLACEH, (*Single item placeholder*)
		mpPICK_INFO_CONTAINER_EMPTY, (*Empty container object*)
		mpPICK_INFO_CONTAINER_FULL, (*Fully filled container object*)
		mpPICK_INFO_CONTAINER_PART_FULL, (*Partially filled container object*)
		mpPICK_INFO_CONTAINER_PLACEH, (*Container placeholder*)
		mpPICK_INFO_CONTAINED_OBJECT,(*Single item object in a container*)
		mpPICK_INFO_CONTAINED_PLACEH(*Single item placeholder in a container*)
	);
	MpPickObjPosInfoType : 	STRUCT
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		Translation : McPosType; (*Translation of current position to the specified frame*)
		Orientation : McOrientType; (*Orientation of current position to the specified frame*)
		ObjectTypeIdent : MpPickObjectTypeIdentType; (*Defines the object type which can be picked or placed from/on the object position*)
		ObjectAttachment : UDINT; (*Attachment of the object assigned to this object position*)
		ObjectPositionInfo : MpPickObjPosAddInfoEnum; (*Additional information of the object position*)
	END_STRUCT;
	MpPickRegCreateObjectsParType : 	STRUCT
		DataAddress : UDINT; (*Address of MpPickRegCreateObjectParType array*)
		NumberOfObjects : UINT; (*Maximum number of objects to be created. NumberOfObjects <= number of objects in DataAddress array*)
	END_STRUCT;
	MpPickRegCreateObjectParType : 	STRUCT
		Mode : MpPickRegCreateObjModeEnum; (*Object creation mode*)
		ObjectTypeName : STRING[250]; (*Name of the object type (specified in PickObjectList configuration) which can be picked or placed from/on the object position*)
		LatchedConveyor : MpPickObjLatchedConvType; (*Parameters for latched conveyor position*)
		Translation : McPosType; (*Translation of the object position to the PickRegister frame*)
		Orientation : McOrientType; (*Orientation of the object position to the PickRegister frame*)
		ObjectAttachment : UDINT; (*Attachment for the object created on this object position. This property will be ignored, when only a placeholder is to be created*)
	END_STRUCT;
	MpPickRegCreateObjModeEnum :
		(
		mpPICK_CREATE_SINGLEITEM, (*Creates a single item position with a single item object (placeholder and object of a certain type)*)
		mpPICK_CREATE_CONTAINER_FULL, (*Creates a container position with a filled container object (placeholder, object (of container type) and content of a certain single item type)*)
		mpPICK_CREATE_CONTAINER_EMPTY, (*Creates a container position with an empty container object (placeholder and object of a certain type)*)
		mpPICK_CREATE_CONTAINER_PLACEH, (*Creates a container position only. Placeholder for a certain container type to be placed*)
		mpPICK_CREATE_SINGLEITEM_PLACEH (*Creates a single item position only. Placeholder for a certain single item type to be placed*)
		);
	MpPickRegDeleteObjectsParType : 	STRUCT
		Mode : MpPickRegDeleteObjModeEnum; (*Object deletion mode*)
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister. Optional depending on parameter Mode*)
		ObjectTypeName : STRING[250]; (*Name of the object type which can be picked or placed from/on the object position. Optional depending on parameter Mode*)
	END_STRUCT;
	MpPickRegDeleteObjModeEnum :
		(
		mpPICK_DEL_ALL, (*Deletes all items (objects and placeholders)*)
		mpPICK_DEL_ALL_OBJECTS_OF_TYPE, (*Deletes all objects of the type specified at parameter ObjectTypeName*)
		mpPICK_DEL_ALL_PLACEH_OF_TYPE, (*Deletes all placeholders of the type specified at parameter ObjectTypeName*)
		mpPICK_DEL_ALL_SINGLEITEMS, (*Deletes all single items*)
		mpPICK_DEL_ALL_SINGLEITEM_PLACEH, (*Deletes all single item placeholders*)
		mpPICK_DEL_ALL_CONTAINERS, (*Deletes all containers*)
		mpPICK_DEL_ALL_CONTAINER_PLACEH, (*Deletes all container placeholders*)
		mpPICK_DEL_ALL_OBJECTS, (*Deletes all single items and containers*)
		mpPICK_DEL_ALL_PLACEHOLDERS, (*Deletes all single item or container placeholders*)
		mpPICK_DEL_ALL_FULL_CONTAINERS, (*Deletes all full containers*)
		mpPICK_DEL_ALL_EMPTY_CONTAINERS, (*Deletes all empty containers*)
		mpPICK_DEL_SPECIFIC_ITEM, (*Deletes a single item or container with the ID specified at parameter ObjectPositionId (objects and placeholders)*)
		mpPICK_DEL_CONTAINER_CONTENT (*Deletes the content of a container with the ID specified at parameter ObjectPositionId*)
		);
	MpPickRegGetObjectsParType : 	STRUCT
		GetMode : MpPickRegGetObjModeEnum; (*Mode for getting objects*)
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister. Optional depending on parameter GetMode*)
		ObjectTypeName : STRING[250]; (*Name of the object type which can be picked or placed from/on the object position. Optional depending on parameter GetMode*)
		CoordSystem : UDINT; (*Frame in which translation and orientation of the object positions is to be determined. 0 specifies the PickRegister frame*)
		DataAddress : UDINT; (*Address to MpPickObjPosInfoType array*)
		NumberOfObjectPositions : UINT; (*Maximum number of objects to be read. NumberOfObjects <= number of objects in DataAddress array*)
	END_STRUCT;
	MpPickRegGetObjModeEnum :
		(
		mpPICK_GET_ALL, (*Get all items (objects and placeholders)*)
		mpPICK_GET_ALL_OBJECTS_OF_TYPE, (*Get all objects of the type specified at parameter ObjectTypeName*)
		mpPICK_GET_ALL_PLACEH_OF_TYPE, (*Get all placeholders of the type specified at parameter ObjectTypeName*)
		mpPICK_GET_ALL_SINGLEITEMS, (*Get all single items*)
		mpPICK_GET_ALL_SINGLEITEM_PLACEH, (*Get all single item placeholders*)
		mpPICK_GET_ALL_CONTAINERS, (*Get all containers*)
		mpPICK_GET_ALL_CONTAINER_PLACEH, (*Get all container placeholders*)
		mpPICK_GET_ALL_OBJECTS, (*Get all single items and containers*)
		mpPICK_GET_ALL_PLACEHOLDERS, (*Get all single item or container placeholders*)
		mpPICK_GET_ALL_FULL_CONTAINERS, (*Get all full containers*)
		mpPICK_GET_ALL_EMPTY_CONTAINERS, (*Get all empty containers*)
		mpPICK_GET_SPECIFIC_ITEM, (*Get an item with the ID specified at parameter ObjectPositionId*)
		mpPICK_GET_CONTAINER_CONTENT (*Get the content of a container with the ID specified at parameter ObjectPositionId*)
		);
	MpPickRegisterComponentStateEnum :
		(
		mcPICK_REGISTER_STARTUP, (*Component is in startup state*)
		mcPICK_REGISTER_DISABLED, (*Component is in disabled state*)
		mcPICK_REGISTER_READY, (*Component is in ready state*)
		mcPICK_REGISTER_ERRORSTOP, (*Component is in error stop state*)
		mcPICK_REGISTER_INVALID_CONFIG (*Component is in invalid configuration state*)
		);
	MpPickRegisterInfoType : 	STRUCT
		ComponentState : MpPickRegisterComponentStateEnum; (*Current PickRegister component state*)
		NumberOfObjects : UINT; (*Current number of created objects (A full container is considered as one created object)*)
		Diag : MpPickDiagType; (*Internal information*)
	END_STRUCT;
	MpPickRegSetObjectParType : 	STRUCT
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		ObjectAttachment : UDINT; (*Data to be attached to the object assigned to the specified object position*)
	END_STRUCT;
	MpPickStatusIDType : 	STRUCT
		ID : MpPickErrorEnum; (*Message ID*)
		Severity : MpComSeveritiesEnum; (*Message severity*)
	END_STRUCT;
	MpPickRegisterType : 	STRUCT
		controlif : REFERENCE TO MpInternalPickRegisterIfType;
		mappLinkInternal : McInternalMappLinkType;
	END_STRUCT;
	MpPickCoreType : 	STRUCT
		controlif : REFERENCE TO MpInternalPickCoreIfType;
		mappLinkInternal : McInternalMappLinkType;
	END_STRUCT;
	MpPickObjectListType : 	STRUCT
		controlif : REFERENCE TO MpInternalPickObjectListIfType;
		mappLinkInternal : McInternalMappLinkType;
	END_STRUCT;
	MpInternalPickCoreIfType : 	STRUCT
		vtable : DWORD;
	END_STRUCT;
	MpInternalPickRegisterIfType : 	STRUCT
		vtable : DWORD;
	END_STRUCT;
	MpInternalPickObjectListIfType : 	STRUCT
		vtable : DWORD;
	END_STRUCT;
END_TYPE
