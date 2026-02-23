                                                                      
TYPE
	INFO_typ : STRUCT				(*CAN statistic data*)
		received	: UDINT ;		(*the sum of all received CAN frames*)
		transmit	: UDINT ;		(*the sum of all sent CAN frames*)
		error	: UDINT ;			(*the sum of all error messages from the CAN device*)
		busoff	: UDINT ;			(*the sum of all CAN BusOff errors*)
		warning	: UDINT ;			(*the sum of all CAN warning errors*)
		other	: UDINT ;			(*the sum of other errors*)
		lost	: UDINT ;			(*the sum of all overwritten CAN frames*)
		stufferror	: UDINT ;		(*the sum of stuff errors*)
		formerror	: UDINT ;		(*the sum of form errors*)
		ackerror	: UDINT ;		(*the sum of ack errors*)
		bit1error	: UDINT ;		(*the sum of bit1 errors*)
		bit0error	: UDINT ;		(*the sum of bit0 errors*)
		crcerror	: UDINT ;		(*the sum of crc errors*)
		lec0	: UDINT ;			(*the sum of all errors with Last Error Code=0*)
		rxirq	: UDINT ;			(*the sum of all received interrupts*)
		txirq	: UDINT ;			(*the sum of all sent interrupts*)
	END_STRUCT;
	DevParam : STRUCT				(*points to the DeviceParameter structure*)
		baudrate	: USINT ;		(*baud rate for the CAN controller to be opened*)
		cob_nr	: UINT ;			(*number of communication objects*)
		pError	: UDINT ;			(*address of / pointer to the error variable*)
		pDevice	: UDINT ;			(*address of / pointer to the DeviceString*)
		info	: UINT ;			(*bit 7 = 1 enables extended mode for the controller*)
	END_STRUCT;
END_TYPE
