(********************************************************************
 * COPYRIGHT (C) BERNECKER + RAINER, AUSTRIA, A-5142 EGGELSBERG
 ********************************************************************
 * Library: VncServ
 * File: VncServ.fun
 * Created: 11.11.2003
 ********************************************************************
 * Functions and function blocks of library VncServ
 ********************************************************************)
FUNCTION VNC_Start : UINT (*start vnc server *)
	VAR_INPUT
		Resolution	:USINT; (*screen resolution*)
		Port	:UINT; (*port*)
		RefreshTime	:USINT; (*refresh time in ms*)
		Interpreter	:STRING[80]; (*name of visualization*)
		TargetHW	:USINT; (*type of hardware*)
	END_VAR
END_FUNCTION
FUNCTION VNC_Stop : UINT (*stop vnc server *)
END_FUNCTION
FUNCTION VNC_Quit : UINT (*shut down vnc server *)
END_FUNCTION
