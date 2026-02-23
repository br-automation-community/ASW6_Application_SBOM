
FUNCTION_BLOCK MpScalePulse (*Scaling for pulse inputs*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		CountingDirection : MpScalePulseDirectionEnum; (*Count from negative direction*) (* *) (*#CYC#*)
		Pulse : BOOL; (*Digital pulse input*) (* *) (*#CYC#*)
		Counter2Bytes : UINT; (*2Bytes external counter module input*) (* *) (*#CYC#OPT#;*)
		Counter4Bytes : DINT; (*4Bytes external counter module input*) (* *) (*#CYC#OPT#;*)
		DynamicOffset : REAL; (*Dynamic position offset *) (* *) (*#CMD#OPT#;*)
		SetDynamicOffset : BOOL; (*Set dynamic offset to current position*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		Position : REAL; (*Actual position [mm]*) (* *) (*#CYC#*)
		Info : MpScalePulseInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePoti (*Scaling for potentiometers*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		AnalogInput : INT; (*Analog input from potentiometer [Units]*) (* *) (*#CYC#*)
		CalibrateNegative : BOOL; (*Start calibration in negative direction*) (* *) (*#CMD#OPT#;*)
		CalibratePositive : BOOL; (*Start calibration in negative direction*) (* *) (*#CMD#OPT#;*)
		SaveCalibration : BOOL; (*All "ready" calibration values will be saved on rising edge*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		Position : REAL; (*Current position in scaled format [mm]*) (* *) (*#CYC#*)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#*)
		CalibrationNegativeReady : BOOL; (*Calibration in negative direction is ready for saving*) (* *) (*#CMD#OPT#;*)
		CalibrationPositiveReady : BOOL; (*Calibration in negative direction is ready for saving*) (* *) (*#CMD#OPT#;*)
		SaveCalibrationNegativeDone : BOOL; (*Calibration in negative direction has been done*) (* *) (*#CMD#OPT#;*)
		SaveCalibrationPositiveDone : BOOL; (*Calibration in positive direction has been done*) (* *) (*#CMD#OPT#;*)
		Info : MpScalePotiInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScaleABR (*Scaling for AB(R) encoders*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		PositionINT : INT; (*Input from encoder card reader [Units]*) (* *) (*#CYC#*)
		PositionDINT : DINT; (*Input from encoder card reader [Units]*) (* *) (*#CYC#*)
		Calibrate : BOOL; (*Start calibration *) (* *) (*#CMD#OPT#;*)
		SaveCalibration : BOOL; (*All "ready" calibration values will be saved on rising edge*) (* *) (*#CMD#OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		Position : REAL; (*Current position in scaled format [mm]*) (* *) (*#CYC#*)
		CalibrationReady : BOOL; (*Calibration in negative direction is ready for saving*) (* *) (*#CMD#OPT#;*)
		SaveCalibrationDone : BOOL; (*Calibration in negative direction has been done*) (* *) (*#CMD#OPT#;*)
		Info : MpScaleABRInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePump (*Scaling velocity to pump flow*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Velocity : REAL; (*Velocity input (set profile)*) (* *) (*#CYC#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#;*)
		PumpFlow : REAL; (*Scaled pump flow [lpm]*) (* *) (*#CYC#*)
		Info : MpScalePumpInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePressure (*Scaling for pressure*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		AnalogInput : INT; (*Analog input from pressure sensor*) (* *) (*#CYC#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		Pressure : REAL; (*Current pressure in scaled format [bar]*) (* *) (*#CYC#*)
		Info : MpScaleInfoType; (*Provide any further useful information as function block output.*) (* *) (*#CMD#; *)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePumpConfig (*Configuration for pump scaling*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpScalePumpConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpScaleInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePulseConfig (*Configuration for pulse counter scaling*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpScalePulseConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpScaleInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePotiConfig (*Configuration for potentiometer scaling*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpScalePotiConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpScaleInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScaleABRConfig (*Configuration for AB(R) encoder scaling*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpScaleABRConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#; *)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpScaleInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpScalePressureConfig (*Configuration for pressure scaling*) (* $GROUP=mapp Control,$CAT=Plastics,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpPlastics.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors*) (* *) (*#PAR#;*)
		Configuration : REFERENCE TO MpScalePressureConfigType; (*Configuration parameters*) (* *) (*#PAR#*)
		Load : BOOL; (*Read configuration*) (* *) (*#CMD#*)
		Save : BOOL; (*Write configuration*) (* *) (*#CMD#*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#*)
		Info : MpScaleInfoType; (*Additional information*) (* *) (*#CMD#*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK
