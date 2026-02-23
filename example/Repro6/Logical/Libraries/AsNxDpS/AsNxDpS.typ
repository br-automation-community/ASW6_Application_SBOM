                                                                      
TYPE
	nxdpsAddAdrParam_t		: STRUCT			(*additional address parameter*)
		srcType				: USINT;
		srcSize				: USINT;
		destType			: USINT;
		destSize			: USINT;
		addParam			: ARRAY[0..227] OF USINT;
	END_STRUCT;
	
	nxdpsIm0_t				: STRUCT			(*I&M0 parameter*)
		manufactor			: ARRAY[0..9] OF USINT;
		manufactorId		: UINT;
		orderId				: ARRAY[0..19] OF USINT;
		serialNumber		: ARRAY[0..15] OF USINT;
		hwRevision			: UINT;
		swRevision			: ARRAY[0..3] OF USINT;
		revisionCounter		: UINT;
		profileId			: UINT;
		profileSpecType		: UINT;
		imVersion			: UINT;
		imSupported			: UINT;
	END_STRUCT;
END_TYPE
