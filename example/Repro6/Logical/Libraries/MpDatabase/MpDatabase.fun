
FUNCTION_BLOCK MpDatabaseQuery (*Connect and run preconfigured queries on a database*) (* $GROUP=mapp Services,$CAT=Database Handling,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpDatabase.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		Name : REFERENCE TO STRING[50]; (*Reference to the configured query*) (* *) (*#CMD#; *)
		Execute : BOOL; (*Execute the configured query*) (* *) (*#CMD#; *)
		Next : BOOL; (*Fetch next rows (in case more rows are available than fit into the PV)*) (* *) (*#CMD#; *)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command successfully executed by function block*) (* *) (*#CMD#; *)
		Info : MpDatabaseQueryInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : USINT; (*Internal*)
		InternalData : ARRAY[0..13] OF UDINT; (*Internal*)
	END_VAR
END_FUNCTION_BLOCK
