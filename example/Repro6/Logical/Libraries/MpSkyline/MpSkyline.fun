
FUNCTION MpSkylineSetModuleState : DINT (*Set state function for modules*) (* $GROUP=mapp Services,$CAT=Machine skyline Services,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSkyline.png*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*)
		Module : STRING[50]; (*Name of the module or group to be set a module state*)
		State : STRING[50]; (*State ID of the state to be set*)
	END_VAR
END_FUNCTION

FUNCTION MpSkylineSetNotification : DINT (*Set notification function for modules*) (* $GROUP=mapp Services,$CAT=Machine skyline Services,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSkyline.png*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*)
		Module : STRING[50]; (*Name of the module or group to be set a notification*)
		Notification : STRING[50]; (*State ID of the notification to be set*)
	END_VAR
END_FUNCTION

FUNCTION MpSkylineResetNotification : DINT (*Reset notification function for modules*) (* $GROUP=mapp Services,$CAT=Machine skyline Services,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSkyline.png*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*)
		Module : STRING[50]; (*Name of the module or group to be reset a notification*)
		Notification : STRING[50]; (*Notification ID of the notification to be set*)
	END_VAR
END_FUNCTION

FUNCTION MpSkylineSetOptionState : DINT (*Set option state function for modules*) (* $GROUP=mapp Services,$CAT=Machine skyline Services,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSkyline.png*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Module : STRING[50]; (*Name of the module to be set a option state*) (* *) (*#PAR#;*)
		Option : STRING[50]; (*Option ID of the option state to be set*) (* *) (*#PAR#;*)
		State : STRING[50]; (*State ID of the state to be set*) (* *) (*#PAR#;*)
	END_VAR
END_FUNCTION

FUNCTION MpSkylineCheckOptionState : DINT (*Check option state function for modules*) (*$GROUP=mapp Services,$CAT=Machine skyline Services,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpSkyline.png*)
	VAR_INPUT
		MpLink : MpComIdentType; (*Connection to mapp*) (* *) (*#PAR#;*)
		Module : STRING[50]; (*Name of the module to be set a option state*) (* *) (*#PAR#;*)
		Option : STRING[50]; (*Option ID of the option state to be set*) (* *) (*#PAR#;*)
		CurrentState : STRING[50]; (*Current option state*) (* *) (*#PAR#;*)
		CurrentStateSize : UDINT; (*Size of string of variable connected to the state parameter*) (* *) (*#PAR#;*)
	END_VAR
END_FUNCTION
