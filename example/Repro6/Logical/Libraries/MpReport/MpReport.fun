
FUNCTION_BLOCK MpReportCore (*Component provides the functionality to enerate pdf reports*) (* $GROUP=mapp Services,$CAT=PDF Report,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpReport.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets  function block errors*) (* *) (*#PAR#;*)
		ReportID : REFERENCE TO STRING[255]; (*Name of Report*) (* *) (*#CMD#;*)
		DeviceName : REFERENCE TO STRING[50]; (*File device (data storage medium) where the files are stored*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of created PDF file*) (* *) (*#CMD#;*)
		Overwrite : BOOL; (*Overwrite existing file when necessary*) (* *) (*#CMD#;*)
		Language : REFERENCE TO STRING[20]; (*Report language*) (* *) (*#CMD#;*)
		MeasurementSystem : MpReportMeasurementSystemEnum; (*Measurement-system that should be used in the generated PDF*) (* *) (*#CMD#;*)
		Generate : BOOL; (*Create Report as PDF*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly *) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block *) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Optional: Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Create report as PDF is finished*) (* *) (*#CMD#;*)
		Info : MpReportCoreInfoType; (*Additional information about the component*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		InternalState : USINT; (*Internal stucture*)
		InternalData : ARRAY[0..21] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
