          
TYPE
	ArSslCipherVersionEnum :  
		(
			arSSL_TLS_1_2 := 1,				(*TLS 1.2*) (**) (*#PAR*)
			arSSL_TLS_1_3 := 2				(*TLS 1.3*) (**) (*#PAR*)
		);

	ArSslCfgOwnCertificateType : STRUCT	
		Certificate		: STRING[255]; 			(*name of the own certificate*) (**) (*#PAR*)
		PrivateKey		: STRING[255]; 			(*name of the private key of the own certificate*) (**) (*#PAR*)
		Password		: STRING[255];			(*password of the private key*) 	(**) (*#PAR*)
	END_STRUCT;

	ArSslCfgOwnCertDetailsType : STRUCT	
		Certificate		: STRING[255]; 			(*name of the own certificate*) (**) (*#PAR*)
		PrivateKey		: STRING[255]; 			(*name of the private key of the own certificate*) (**) (*#PAR*)
	END_STRUCT;
	
	ArSslCfgType : STRUCT		(*details of an SSL configuration*)
		OwnCertificate		: ArSslCfgOwnCertificateType; 	(*the own certificate*) (**) (*#PAR*)
		SslVersion		: ArSslCipherVersionEnum;	(*SSL version*)		 	(**) (*#PAR*)
		TrustedCertificates 	: UDINT;			(*pointer to the trusted certificates (given as pointer to ARRAY OF STRING[255]) *)
		TrustedCertificateCount	: UDINT;			(*number of trusted certificates*)
		CRLs	 		: UDINT;			(*pointer to the certificate revocation lists (given as pointer to ARRAY OF STRING[255]) *) 	(**) (*#PAR*)
		CRLCount		: UDINT;			(*number of certificate revocation lists*) 	(**) (*#PAR*)
	END_STRUCT;

	ArSslCfgDetailsType : STRUCT	(*details of an SSL configuration*)
		Name				: STRING[255];			(*name of the SSL configuration*)
		OwnCertificate		: ArSslCfgOwnCertDetailsType; 	(*name of the own certificate*) (**) (*#PAR*)
		SslVersion			: ArSslCipherVersionEnum;	(*SSL cipher version*)		 	(**) (*#PAR*)
		CipherCount			: UDINT;			(*number of ciphers*)	(**) (*#PAR*)
		TrustedCertificateCount		: UDINT;			(*number of trusted certificates*)	(**) (*#PAR*)
		CRLCount 			: UDINT;			(*number of CRLs*) 	(**) (*#PAR*)
	END_STRUCT;

	ArSslAsyncInternalType : STRUCT
		FBStateCtx		: ArFBStateInternalType;
		AsyFuMaCtx		: ArFBAsyFuMaInternalType;
	END_STRUCT;
END_TYPE
