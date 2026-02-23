
{REDUND_ERROR} FUNCTION_BLOCK ASMcDcsEventDigitalCamSwitch (*function block for a event triggered digital cam switch functionality with X20DS4389*)
	VAR_INPUT
		Enable : BOOL; (*enables the execution of the function block*)
		Switches : ASMcDcsSwitchesType; (*configuration of the switching data*)
		InitSwitches : BOOL; (*initialize new switching data*)
		TrackOptions : ASMcDcsEdcsTrackType; (*configuration of the track related parameters*)
		InitTrackOptions : BOOL; (*initialize new track options*)
		FilterOptions : ASMcDcsFilterType; (*configuration of the position filter*)
		InitFilterOptions : BOOL; (*initialize new filter options*)
		Mode : UINT; (*start mode*)
		PositionConfig : ASMcDcsPositionConfigType; (*configuration how the input "Position" is handled*)
		Position : ASMcDcsPositionType; (*position value which is used for the calculation of the timestamps*)
		HwInput : ASMcDcsHwInputType; (*input data of a channel of a X20DS4389 module with activated edge generator function*)
		EventInput : ASMcDcsEventInputType; (*input data of a channel of a X20DS4389 module with activated edge detection function*)
		ForceEventInput : BOOL; (*input to force the start of the calculations*)
	END_VAR
	VAR_OUTPUT
		InOperation : BOOL; (*timestamps are calculated and forwarded to the X20DS4389 module*)
		Busy : BOOL; (*the FB is enabled and needs to be called*)
		Error : BOOL; (*an error occurred in the FB*)
		ErrorID : UINT; (*error number*)
		SwitchesInitialized : BOOL; (*switching data is successfully initialized*)
		TrackOptionsInitialized : BOOL; (*track related parameters are successfully initialized*)
		FilterOptionsInitialized : BOOL; (*filter parameters are successfully initialized*)
		WaitingForEvent : BOOL; (*the FB accepts new start events if set*)
		HwOutput : ASMcDcsHwOutputType; (*output data for a channel of a X20DS4389 module*)
		AdditionalInfo : ASMcDcsAdditionalInfoType; (*additional information*)
	END_VAR
	VAR
		Internal : ASMcDcsEdcsInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ASMcDcsGeneralDigitalCamSwitch (*function block for a periodic digital cam switch functionality with a standard DO module*)
	VAR_INPUT
		Enable : BOOL; (*enables the execution of the function block*)
		Switches : ASMcDcsSwitchesType; (*configuration of the switching data*)
		InitSwitches : BOOL; (*initialize new switching data*)
		TrackOptions : ASMcDcsGdcsTrackType; (*configuration of the track related parameters*)
		InitTrackOptions : BOOL; (*initialize new track options*)
		Mode : UINT; (*start mode*)
		PositionConfig : ASMcDcsPositionConfigType; (*configuration how the input "Position" is handled*)
		Position : ASMcDcsPositionType; (*position value which is used for the calculation of the timestamps*)
		EnableTrack : BOOL; (*enables the usage of the calculated timestamps*)
	END_VAR
	VAR_OUTPUT
		InOperation : BOOL; (*switches are calculated and output*)
		Busy : BOOL; (*the FB is enabled and needs to be called*)
		Error : BOOL; (*an error occurred in the FB*)
		ErrorID : UINT; (*error number*)
		SwitchesInitialized : BOOL; (*switching data is successfully initialized*)
		TrackOptionsInitialized : BOOL; (*track related parameters are successfully initialized*)
		Value : BOOL; (*status of cam*)
		AdditionalInfo : ASMcDcsAdditionalInfoType; (*additional information*)
	END_VAR
	VAR
		Internal : ASMcDcsGdcsInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ASMcDcsPrecisionDigitalCamSwitch (*function block for a periodic digital cam switch functionality with X20DS4389*)
	VAR_INPUT
		Enable : BOOL; (*enables the execution of the function block*)
		Switches : ASMcDcsSwitchesType; (*configuration of the switching data*)
		InitSwitches : BOOL; (*initialize new switching data*)
		TrackOptions : ASMcDcsPdcsTrackType; (*configuration of the track related parameters*)
		InitTrackOptions : BOOL; (*initialize new track options*)
		FilterOptions : ASMcDcsFilterType; (*configuration of the position filter*)
		InitFilterOptions : BOOL; (*initialize new filter options*)
		Mode : UINT; (*start mode*)
		PositionConfig : ASMcDcsPositionConfigType; (*configuration how the input "Position" is handled*)
		Position : ASMcDcsPositionType; (*position value which is used for the calculation of the timestamps*)
		HwInput : ASMcDcsHwInputType; (*input data of a channel of a X20DS4389 module*)
		EnableTrack : BOOL; (*enables the usage of the calculated timestamps*)
	END_VAR
	VAR_OUTPUT
		InOperation : BOOL; (*timestamps are calculated and forwarded to the X20DS4389 module*)
		Busy : BOOL; (*the FB is enabled and needs to be called*)
		Error : BOOL; (*an error occurred in the FB*)
		ErrorID : UINT; (*error number*)
		SwitchesInitialized : BOOL; (*switching data is successfully initialized*)
		TrackOptionsInitialized : BOOL; (*track related parameters are successfully initialized*)
		FilterOptionsInitialized : BOOL; (*filter parameters are successfully initialized*)
		HwOutput : ASMcDcsHwOutputType; (*output data for a channel of a X20DS4389 module*)
		AdditionalInfo : ASMcDcsAdditionalInfoType; (*additional information*)
	END_VAR
	VAR
		Internal : ASMcDcsPdcsInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ASMcDcsThresholdDigitalCamSwitch (*function block for a threshold triggered digital cam switch functionality with X20DS4389*)
	VAR_INPUT
		Enable : BOOL; (*enables the execution of the function block*)
		Switch : ASMcDcsTdcsSwitchType; (*configuration of the switching data*)
		InitSwitch : BOOL; (*initialize new switching data*)
		TrackOptions : ASMcDcsTdcsTrackType; (*configuration of the track related parameters*)
		InitTrackOptions : BOOL; (*initialize new track options*)
		FilterOptions : ASMcDcsFilterType; (*configuration of the position filter*)
		InitFilterOptions : BOOL; (*initialize new filter options*)
		Mode : UINT; (*start mode*)
		PositionConfig : ASMcDcsPositionConfigType; (*configuration how the input "Position" is handled*)
		Position : ASMcDcsPositionType; (*position value which is used for the calculation of the timestamps*)
		HwInput : ASMcDcsHwInputType; (*input data of a channel of a X20DS4389 module with activated edge generator function*)
		ForceOutputStatus : BOOL; (*status of the digital output after the input ForceOutput is set*)
		ForceOutput : BOOL; (*set the digital output to level of the input ForceOutputStatus*)
	END_VAR
	VAR_OUTPUT
		InOperation : BOOL; (*timestamps are calculated and forwarded to the X20DS4389 module*)
		Busy : BOOL; (*the FB is enabled and needs to be called*)
		Error : BOOL; (*an error occurred in the FB*)
		ErrorID : UINT; (*error number*)
		SwitchInitialized : BOOL; (*switching data is successfully initialized*)
		TrackOptionsInitialized : BOOL; (*track related parameters are successfully initialized*)
		FilterOptionsInitialized : BOOL; (*filter parameters are successfully initialized*)
		SwitchPositionUsed : BOOL; (*the currently specified Switch.Position was used to generate a switching timestamp*)
		CommandedValue : BOOL; (*information about the next status of the used channel of a X20DS4389 module*)
		HwOutput : ASMcDcsHwOutputType; (*output data for a channel of a X20DS4389 module*)
		AdditionalInfo : ASMcDcsTdcsAdditionalInfoType; (*additional information*)
	END_VAR
	VAR
		Internal : ASMcDcsTdcsInternalType; (*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
{REDUND_ERROR} FUNCTION_BLOCK ASMcDcsTimedDigitalCamSwitch (*function block for a periodic digital cam switch functionality with X20DS4389*)
    VAR_INPUT
        Enable : BOOL; (*enables the execution of the function block*)
        Switches : ASMcDcsTidcsSwitchesType; (*configuration of the switching data*)
        InitSwitches : BOOL; (*initialize new switching data*)
        TrackOptions : ASMcDcsTidcsTrackType; (*configuration of the track related parameters*)
        InitTrackOptions : BOOL; (*initialize new track options*)
        FilterOptions : ASMcDcsFilterType; (*configuration of the position filter*)
        InitFilterOptions : BOOL; (*initialize new filter options*)
        Mode : UINT; (*start mode*)
        PositionConfig : ASMcDcsPositionConfigType; (*configuration how the input "Position" is handled*)
        Position : ASMcDcsPositionType; (*position value which is used for the calculation of the timestamps*)
        HwInput : ASMcDcsHwInputType; (*input data of a channel of a X20DS4389 module*)
        EnableTrack : BOOL; (*enables the usage of the calculated timestamps*)
	ForceOutputStatus : BOOL; (*status of the digital output after the input ForceOutput is set*)
        ForceOutput : BOOL; (*set the digital output to level of the input ForceOutputStatus*)   
    END_VAR
    VAR_OUTPUT
        InOperation : BOOL; (*timestamps are calculated and forwarded to the X20DS4389 module*)
        Busy : BOOL; (*the FB is enabled and needs to be called*)
        Error : BOOL; (*an error occurred in the FB*)
        ErrorID : UINT; (*error number*)
        SwitchesInitialized : BOOL; (*switching data is successfully initialized*)
        TrackOptionsInitialized : BOOL; (*track related parameters are successfully initialized*)
        FilterOptionsInitialized : BOOL; (*filter parameters are successfully initialized*)
        HwOutput : ASMcDcsHwOutputType; (*output data for a channel of a X20DS4389 module*)
        AdditionalInfo : ASMcDcsTidcsAdditionalInfoType; (*additional information*)
    END_VAR
    VAR
        Internal : ASMcDcsTidcsInternalType; (*internal variable*)
    END_VAR
END_FUNCTION_BLOCK
