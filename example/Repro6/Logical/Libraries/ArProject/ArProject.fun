
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArProjectGetInfo	(*Reads the ConfigurationID and ConfigurationVersion of the current project on the target*)
	VAR_INPUT
		Execute			: BOOL;					(*Start execution.*)
	END_VAR
	
	VAR_OUTPUT
		Done					: BOOL;					(*Execution done.*)
		Busy					: BOOL;					(*Execution running.*)
		Error					: BOOL;					(*Execution failed.*)
		StatusID				: DINT;  				(*Execution error: see help.*)
		ConfigurationID			: STRING[255];			(*ConfigurationID of the current project on the target*)
		ConfigurationVersion	: STRING[32];			(*ConfigurationVersion of the current project on the target*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT;(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArProjectGetPackageInfo	(*Reads the ConfigurationID and ConfigurationVersion from a project-installation-package*)
	VAR_INPUT
		Execute			: BOOL;					(*Start execution.*)
		DeviceName		: STRING[128];			(*Device (configured in AS or created with FileIO devLin) where the project-installation-package is located.*)
		FilePath		: STRING[256];			(*Path to the til.xml file of the project-installation-package (relative to the provided device).*)
	END_VAR
	
	VAR_OUTPUT
		Done					: BOOL;					(*Execution done.*)
		Busy					: BOOL;					(*Execution running.*)
		Error					: BOOL;					(*Execution failed.*)
		StatusID				: DINT;  				(*Execution error: see help.*)
		ConfigurationID			: STRING[255];			(*ConfigurationID of the project contained in the project-installation-package*)
		ConfigurationVersion	: STRING[32];			(*ConfigurationVersion of the project contained in the project-installation-package*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT;(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArProjectInstallPackage	(*Installs the referenced project-installation-package*)
	VAR_INPUT
		Execute			: BOOL;					(*Start execution.*)
		DeviceName		: STRING[128];			(*Device (configured in AS or created with FileIO devLin) where the project-installation-package is located.*)
		FilePath		: STRING[256];			(*Path to the til.xml file of the project-installation-package (relative to the provided device).*)
	END_VAR
	
	VAR_OUTPUT
		Done			: BOOL;					(*Execution done.*)
		Busy			: BOOL;					(*Execution running.*)
		Error			: BOOL;					(*Execution failed.*)
		StatusID		: DINT;  				(*Execution error: see help.*)
	END_VAR
	
	VAR
        Internal		: ARRAY[0..31] OF UDINT;(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK 
