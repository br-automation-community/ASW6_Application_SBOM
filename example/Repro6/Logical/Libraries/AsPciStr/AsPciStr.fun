                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciMemSet : UDINT		(*fills the memory area with specific values*)
	VAR_INPUT
		pDest	:UDINT;		(*pointer to the destination memory*)
		value	:USINT;		(*initialization value*)
		length	:UDINT;		(*number of bytes to be initialized*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciMemCpy : UDINT		(*copies the memory area*)
	VAR_INPUT
		pDest	:UDINT;		(*pointer to the destination memory*)
		pSrc	:UDINT;		(*pointer to the data to be copied*)
		length	:UDINT;		(*size of bytes to be copied*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciMemMove : UDINT	(*copies the memory area (even if the memory areas overlap)*)
	VAR_INPUT
		pDest	:UDINT;		(*pointer to the destination memory*)
		pSrc	:UDINT;		(*pointer to the data to be copied*)
		length	:UDINT;		(*size of bytes to be copied*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciMemCmp : DINT		(*compares memory areas*)
	VAR_INPUT
		pMem1	:UDINT;		(*pointer to the memory area 1*)
		pMem2	:UDINT;		(*pointer to the memory area 2*)
		length	:UDINT;		(*size of bytes to be checked*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciStrCat : UDINT		(*attaches character strings to one another*)
	VAR_INPUT
		pDest	:UDINT;		(*pointer to the destination character string*)
		pSrc	:UDINT;		(*pointer to the source character string*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciStrCpy : UDINT		(*copies one character string into another*)
	VAR_INPUT
		pDest	:UDINT;		(*pointer to the destination character string*)
		pSrc	:UDINT;		(*pointer to the source character string*)
	END_VAR
END_FUNCTION
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION pciStrCmp : DINT		(*compares two character strings*)
	VAR_INPUT
		pString1	:UDINT;	(*pointer to the first character string*)
		pString2	:UDINT;	(*pointer to the second character string*)
	END_VAR
END_FUNCTION
