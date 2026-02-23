
FUNCTION MpAuditWStringChange : DINT (*Detects the change of a unicode string and creates an event for audit trail*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Old : WSTRING[100]; (*Entered when creating the entry under %old*) (* *) (*#CMD#;*)
		New : WSTRING[100]; (*Entered when creating the entry under %new*) (* *) (*#CMD#;*)
		Identifier : STRING[100]; (*Entered when creating the entry under %dpid *) (* *) (*#CMD#;*)
	END_VAR
END_FUNCTION

FUNCTION MpAuditStringChange : DINT (*Detects the change of a string and creates an event for audit trail*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Old : STRING[100]; (*Entered when creating the entry under %old *) (* *) (*#CMD#;*)
		New : STRING[100]; (*Entered when creating the entry under %new*) (* *) (*#CMD#;*)
		Identifier : STRING[100]; (*Entered when creating the entry under %dpid *) (* *) (*#CMD#;*)
	END_VAR
END_FUNCTION

FUNCTION MpAuditCustomEvent : DINT (*Sets a user-defined event*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Type : WSTRING[100]; (*Entered when creating the entry under %typ*) (* *) (*#CMD#;*)
		Message : WSTRING[100]; (*Entered when creating the entry under %msg*) (* *) (*#CMD#;*)
		Comment : WSTRING[100]; (*Entered when creating the entry under %cmt *) (* *) (*#CMD#;*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MpAuditTrailUI (*UI connection to a VC4 audit trail page*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*File device (data storage medium) where the files are stored*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of the file to be stored*) (* *) (*#CMD#;*)
		UISetup : MpAuditTrailUISetupType; (*Used to configure the elements connected to the HMI application*) (* *) (*#PAR#;*)
		Language : REFERENCE TO STRING[20]; (*Language ID that should be used when displaying data*) (* *) (*#CMD#;*)
		MeasurementSystem : MpAuditMeasurementSystemEnum; (*Measurement system that shoule be used when displaying data*) (* *) (*#CMD#;*)
		UIConnect : REFERENCE TO MpAuditTrailUIConnectType; (*This structure contains the parameters needed for the connection to the HMI application*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		Info : MpAuditTrailUIInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT;
		InternalData : ARRAY[0..29] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpAuditTrail (*Centralized event audit trail*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*File device (data storage medium) where the files are stored*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of the file to be stored*) (* *) (*#CMD#;*)
		Overwrite : BOOL; (*Overwrite existing file when necessary*) (* *) (*#CMD#;*)
		Language : REFERENCE TO STRING[20]; (*Language ID that should be used when displaying data*) (* *) (*#CMD#;*)
		MeasurementSystem : MpAuditMeasurementSystemEnum; (*Measurement-system that should be used when exporting data*) (* *) (*#CMD#;*)
		Export : BOOL; (*Saves the currently logged from memory to a file on the specified data storage medium ("DeviceName")*) (* *) (*#CMD#;*)
		ExportArchive : BOOL; (*Exports the oldest archive to the specified data storage medium ("DeviceName")*) (* *) (*#CMD#;*)
		Clear : BOOL; (*Clears the audit buffer (archives are not effected)*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#;*)
		CurrentRecord : UDINT; (*Counts all events*) (* *) (*#CMD#;*)
		NumberEntries : UDINT; (*Counts all events that are covered by the buffer*) (* *) (*#CMD#;*)
		ArchiveAvailable : BOOL; (*Indicates that an archive is currently available and can be exported*) (* *) (*#CMD#;*)
		Info : MpAuditTrailInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} UDINT;
		InternalData : {REDUND_UNREPLICABLE} ARRAY[0..22] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION MpAuditValueChange : DINT (*Detects the change of a value and creates an event for audit trail*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Old : LREAL; (*Entered when creating the entry under %old*) (* *) (*#CMD#;*)
		New : LREAL; (*Entered when creating the entry under %new*) (* *) (*#CMD#;*)
		Identifier : STRING[100]; (*Entered when creating the entry under %dpid*) (* *) (*#CMD#;*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MpAuditVC4Event (*Collects events from VC4 for the audit trail*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Localize : BOOL; (*Defines whether the user ID or description of the user ID is used to create an entry*) (* *) (*#CMD#;*)
		MinUserID : UINT; (*First ID from VC4 for which events are logged*) (* *) (*#CMD#;*)
		MaxUserID : UINT; (*Last ID from VC4 for which events are logged*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpAuditVC4EventInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpAuditRegPar (*Register and monitor a PV*)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*The parameter is registered on a positive edge on this input and unregistered on a negative edge*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		PVName : REFERENCE TO STRING[100]; (*Name of PV that should be monitored*) (* *) (*#CMD#;*)
		Identifier : REFERENCE TO STRING[100]; (*Identifier for given PV used in MpAudit (optional). If no separate identifier is given than the PV-name will be used*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		Info : MpAuditRegParInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT;
		InternalData : ARRAY[0..22] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION MpAuditStartBatch : DINT (*Creates a event marking the start of a new batch*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Name : WSTRING[50]; (*Name (unique identifier) of batch*) (* *) (*#CMD#;*)
	END_VAR
END_FUNCTION

FUNCTION_BLOCK MpAuditExport (*Advanced export function*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Filter : REFERENCE TO MpAuditExportFilterType; (*Filter-settings to be applied for data to export*) (* *) (*#CMD#;*)
		ToRecord : UDINT; (*Record-number up to which (and excluding) data is exported*) (* *) (*#CMD#;*)
		DeviceName : REFERENCE TO STRING[50]; (*File device (data storage medium) where the files are stored*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of the file to be stored*) (* *) (*#CMD#;*)
		Overwrite : BOOL; (*Overwrite existing file when necessary*) (* *) (*#CMD#;*)
		Language : REFERENCE TO STRING[20]; (*Language ID that should be used when displaying data*) (* *) (*#CMD#;*)
		MeasurementSystem : MpAuditMeasurementSystemEnum; (*Measurement-system that should be used when exporting data*) (* *) (*#CMD#;*)
		Export : BOOL; (*Execute export*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#;*)
		Record : UDINT; (*Record-number of last exported record (set after export)*) (* *) (*#CMD#;*)
		Info : MpAuditExportInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} UDINT;
		InternalData : {REDUND_UNREPLICABLE} ARRAY[0..19] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpAuditQuery (*Query Data function*) (* $GROUP=mapp Services,$CAT=Audit Trail,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpAudit.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Mode : MpAuditQueryModeEnum; (*Kind of query*) (* *) (*#CMD#;*)
		Name : REFERENCE TO STRING[50]; (*Name of query to execute*) (* *) (*#CMD#;*)
		Language : REFERENCE TO STRING[20]; (*Language ID that should be used when displaying data*) (* *) (*#CMD#;*)
		MeasurementSystem : MpAuditMeasurementSystemEnum; (*Measurement-system that should be used when exporting data*) (* *) (*#CMD#;*)
		Execute : BOOL; (*Execute query*) (* *) (*#CMD#;*)
		Next : BOOL; (*Execute query - get next entries*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#;*)
		Info : MpAuditQueryInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : {REDUND_UNREPLICABLE} UDINT;
		InternalData : ARRAY[0..22] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
