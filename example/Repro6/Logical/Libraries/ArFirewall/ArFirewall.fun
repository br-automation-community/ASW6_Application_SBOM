
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArFirewallAddRule	(*Add an IP rule to the firewall.*)
	VAR_INPUT
		Execute			: BOOL;					(*Start execution.*)
		Rule			: STRING[256];			(*The IP rule name.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution done.*)
		Busy			: BOOL;					(*Execution running.*)
		Error			: BOOL;					(*Execution failed.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	
	VAR
		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArFirewallDeleteAllRules	(*Remove all rules from the firewall.*)
	VAR_INPUT
		Execute			: BOOL;					(*Start execution.*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution done.*)
		Busy			: BOOL;					(*Execution running.*)
		Error			: BOOL;					(*Execution failed.*)
		StatusID		: DINT;  				(*Status information.*)
	END_VAR
	
	VAR
 		Internal		: ARRAY[0..31] OF UDINT; (*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 
