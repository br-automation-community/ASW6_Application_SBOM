
FUNCTION InitScreenShot : UDINT (*initialization*)
	VAR_INPUT
		bEnable	:BOOL; (*enables execution*)
		pHandle	:UDINT; (*handle of visualization object*)
		pFileName	:UDINT; (*pointer to STRING containing the name of the graphic file to be created*)
		pDeviceName	:UDINT; (*pointer to STRING containing the name of the file device*)
		pDisplName	:UDINT; (*pointer to STRING containing the name of the visualization*)
	END_VAR
END_FUNCTION

FUNCTION DeInitScreenShot : UDINT (*deinitialisation*)
	VAR_INPUT
		bEnable	:BOOL; (*enables execution*)
		pHandle	:UDINT; (*handle of visualization object*)
	END_VAR
END_FUNCTION

FUNCTION ScreenShot : UDINT (*create screenshot*)
	VAR_INPUT
		bEnable	:BOOL; (*enables execution*)
		pHandle	:UDINT; (*handle of visualization object*)
	END_VAR
END_FUNCTION
