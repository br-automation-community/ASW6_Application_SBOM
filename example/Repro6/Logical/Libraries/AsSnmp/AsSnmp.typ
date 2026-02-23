                                                                      
TYPE
	snmpV1Var_t	: STRUCT							(*an SNMP Variable*)
		pOid			: UDINT;					(*pointer to the object ID of the variable*)
		type			: UDINT;					(*SNMP variable data type*)
		pValue			: UDINT;					(*pointer to buffer for the SNMP variable*)
		lenValue		: UDINT;					(*length of the buffer for the SNMP variable*)
	END_STRUCT;
END_TYPE
