TYPE	
    ARUnitTextTypeEnum : 
	(
		arUNITTEXT_SYMBOL		:= 0,
		arUNITTEXT_NAME			:= 1,
		arUNITTEXT_DESCRIPTION	:= 2
	);
	
	ArUnitTextAsyncInternalType : STRUCT
        FBStateCtx		: ArFBStateInternalType;
		AsyFuMaCtx		: ArFBAsyFuMaInternalType;
	END_STRUCT;

	ArUnitTextGetSymbolInternalType : STRUCT		
	    Done					: BOOL;
		Active					: BOOL;
		Busy					: BOOL;
		Error					: BOOL;
		StatusID				: DINT;
		UnitID					: DINT;						(*UnitID of Unit*)
		Namespace				: UDINT;					(*Pointer to String with Namespace of Unit*)
		TextType				: ARUnitTextTypeEnum;		(*Type of Text (Symbol, Name, ...)*)
		ResultText				: UDINT;					(*Pointer to String with resulting Unit Symbol*)
		ResultSize				: UDINT;					(*Max Length of SymbolString*)
		UseBRText				: BOOL;						(*Use text from B&R as default*)
		LanguageCode			: STRING[18];				(*LanguageCode*)
		TextSize				: UDINT;					(*Length of text in result-buffer*)
		ExecuteOld				: BOOL;
	END_STRUCT;

	
	ArUnitTextCCToUIDInternalType : STRUCT	
		Done					: BOOL;
		Active					: BOOL;
		Busy					: BOOL;
		Error					: BOOL;
		ErrorID					: DINT;	
		CommonCode				: STRING[3];	(*CommonCode*)	
		UnitID					: DINT;	
		ExecuteOld				: BOOL;
	END_STRUCT;

END_TYPE
