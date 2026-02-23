                                                                      
TYPE
    smtpATTACHMENT_typ	: STRUCT		(*attachments*)
		type			: UDINT;		(*type of attachment (file, module or memory area)*)
		pData			: UDINT;		(*pointer to the data (depends on attachment type: filename, modulename or memory address)*)
		length			: UDINT;		(*length of memory (only for memory attachments)*)
		pName			: UDINT;		(*name of attachment (optional, default: filename, modulename or mematt_<# of attachment>)*)
	END_STRUCT;

    AsSmtpCipherVersionEnum :  
        (
            asSMTP_TLS_1_3 := 2                (*TLS 1.3*) (**) (*#PAR*)
        );
        
    AsSmtpMcsType : STRUCT
        name                : STRING[255];                 (*Managed Certificate Store name*)
        tlsVersion          : AsSmtpCipherVersionEnum;     (*TLS version*)
        trustListValidation : BOOL;                        (*Enables/disables trust list validation*)
    END_STRUCT;
END_TYPE
