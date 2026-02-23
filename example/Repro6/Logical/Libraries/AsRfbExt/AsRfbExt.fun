
FUNCTION RfbExtInit : UINT (*init the library*) 
	VAR_INPUT
		pLib : UDINT; (*instance of the library*)
		uiTimeOut : UDINT; (*maximum age in ms of the data from the client for which a valid value can be read.*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtConnect : UINT (*connect to client*) 
	VAR_INPUT
		pLib : UDINT; (*instance of the library*)
		pName : UDINT; (*pointer to STRING containing the name of the visualization*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtSetClientCaption : UINT (*set client caption*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		pClientCaption : UDINT; (*pointer to STRING containing the new title*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtSetPassword : UINT (*set vnc password*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		mode : USINT; (*defines which password to set. 0 = view only, 1 = view and control*)
		pPassword : UDINT; (*pointer to STRING which contains the new password*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtKeyState  : UINT (*get the state of a key*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the key*)
		pValue : UDINT; (*pointer to USINT variable containing the value of the key*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtReconnect : UINT (*terminate current connection and let client connect to new ip address*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		pTargetIp : UDINT; (*pointer to STRING containing the ip-address of the target*)
	END_VAR
END_FUNCTION


FUNCTION RfbExtStartProcess : UINT (*start a process on the client side*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		pcmdLine : UDINT; (*pointer to STRING containing the name of the command line*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtProcessState : UINT (*get the state of a process running on the client side*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		piProcessState : UDINT; (*pointer to DINT variable containing the state of process*)
	END_VAR
END_FUNCTION


FUNCTION RfbExtNrClientsConnected : UINT (*get the number of clients connected*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtServerTimeout : UINT (*set the server timeout*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		timeout : UDINT; (*timeout in ms*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtDisableClientLogin : UINT (*disable all clients from login*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtDisconnectAllClients : UINT (*disconnect all clients*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtEnableClientLogin : UINT (*enable client login*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtSetMaxClients : UINT (*set the max number of clients allowed*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		maxClients : USINT; (*maximum number of clients to be allowed (max = 10)*)
	END_VAR
END_FUNCTION


FUNCTION RfbExtDataAge : UINT (*get the age of the client data*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		pAge : UDINT; (*age of last refresh of client window*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtJoystickValue : UINT (*get joystick value*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the joystick (0 = first joystick)*)
		pValueX : UDINT; (*pointer to DINT variable containing the x value*)
		pValueY : UDINT; (*pointer to DINT variable containing the y value*)
		pValueZ : UDINT; (*pointer to DINT variable containing the z value*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtResetHandwheelValue : UINT (*reset handwheel value*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the handwheel (0 = first handwheel)*)
		value : DINT; (*new value for the handwheel*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtHandwheelValue : UINT (*get the handwheel value*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the handwheel (0 = first handwheel)*)
		pValue : UDINT; (*pointer to UDINT variable containing the value of the handwheel*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtPotiValue : UINT (*get the value of the potentiometer*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the potentiometer (0 = first potentiometer)*)
		pValue : UDINT; (*pointer to UDINT variable containing the value of the potentiometer*)
	END_VAR
END_FUNCTION

FUNCTION RfbExtTemperatureValue : UINT (*get the temperature value*) 
	VAR_INPUT
		pLib : AsRfbExt_typ; (*pointer to the instance of the library*)
		index : USINT; (*index of the temperature (0 = first temperature)*)
		pValue : UDINT; (*pointer to DINT variable containing the temperature value*)
	END_VAR
END_FUNCTION
