                                                                      
TYPE
    pppPARAMETER_typ	: STRUCT		(*ppp parameter*)
		pHostAddr		: UDINT;		(*pointer to the host ip address (string format)*)
		pPeerAddr		: UDINT;		(*pointer to the peer ip address (string format)*)
		pOptions		: UDINT;		(*pointer to the ppp otions struct (optional)*)
		pSecrets		: UDINT;		(*pointer to the secret table (optional)*)
		sectablen		: UDINT;		(*number of entries in the secrets table*)
	END_STRUCT;
END_TYPE
