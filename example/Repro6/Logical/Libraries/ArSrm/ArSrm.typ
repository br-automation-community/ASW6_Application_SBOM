
TYPE
	ArSrmSiteManagerParType : 	STRUCT 
		Name : STRING[80]; (*Parameter name of the SiteManager parameter*)
		Value : STRING[255]; (*Set/Get value of the parameter*)
		Null : BOOL; (*TRUE means the parameter value is empty. If this flag is TRUE when ArSrmSetSiteManagerPar is executed, the parameter will be set to the default value (value from ArConfig).*)
	END_STRUCT;
END_TYPE
