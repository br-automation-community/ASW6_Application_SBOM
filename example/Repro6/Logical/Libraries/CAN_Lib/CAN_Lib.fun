                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANinfo			(*reads the statistical data from a CAN device*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*us_ident identifier from CANopen*)
		info_adr	:UDINT;		(*pointer to the CANinfo structure INFO_typ*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANMulQueue		(*installs a queue for multiple CAN identifiers in the read direction*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*us_ident from CANopen / CANMulOpen*)
		pCAN_id	:UDINT;			(*pointer to an array of CAN identifiers*)
		ID_nr	:USINT;			(*number of CAN identifiers*)
		size	:UINT;			(*number of telegrams in the queue*)
	END_VAR
	VAR_OUTPUT
		q_ident	:UDINT;			(*identifier for CANmulrd*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANxMulQueue		(*installs a queue for multiple CAN identifiers in the read direction*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*us_ident from CANopen / CANMulOpen*)
		pCAN_id	:UDINT;			(*pointer to an array of CAN identifiers*)
		ID_nr	:UDINT;			(*number of CAN identifiers*)
		size	:UINT;			(*number of telegrams in the queue*)
	END_VAR
	VAR_OUTPUT
		q_ident	:UDINT;			(*identifier for CANmulrd*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANMulOpen		(*initializes numerous CAN controllers and allocates the appropriate resources*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		pDevParam	:UDINT;		(*pointer to the DeviceParameter structure*)
		dev_nr	:USINT;			(*number of CAN controllers to be opened*)
	END_VAR
	VAR_OUTPUT
		us_ident	:UDINT;		(*identifier for all additional CAN function blocks*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANMulrd			(*copies data from the queue to the buffer or sends an error in the status*)
	VAR_INPUT	
		enable	:BOOL;			(*enables execution*)
		q_ident	:UDINT;			(*identifier q_ident from CANMulQueue*)
		data_adr	:UDINT;		(*CAN data*)
	END_VAR
	VAR_OUTPUT
		size	:UINT;			(*length of the data*)
		ID	:UDINT;				(*CAN identifier which received the data*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANTime			(*reads the time stamp for a CAN object*)
	VAR_INPUT	
		enable		:BOOL;		(*enables execution*)
		us_ident	:UDINT;		(*user ident from CANopen() / CANMulOpen()*)
		can_id	:UDINT;			(*CAN identifier*)
		pSystemTick	:UDINT;		(*pointer to the SystemTick counter*)
		pSystemStamp	:UDINT;	(*pointer to the SystemStamp*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		old_id	:UDINT;			(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANquwr			(*sends a CAN message with the given CAN identifier to the CAN controller for transmission*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident number from the CANopen() function*)
		can_id	:UDINT;			(*CAN identifier*)
		data_adr	:UDINT;		(*address of the CAN data (max. 8 bytes)*)
		data_lng	:USINT;		(*length of the data (max. 8 bytes)*)
	END_VAR	
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSexit			(*free the ressources of the list of CMS objects defined with the CMSinit() function*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		cms_ident	:UDINT;		(*CMS identifier from CMSinit()*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSmain			(*edits the list of CMS objects defined with the CMSinit() function*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		cms_ident	:UDINT;		(*CMS identifier from CMSinit()*)
		cms_mode	:UDINT;		(*2 ... WRITE, send/update data*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSinit			(*sends and receives CMS objects*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident from CANopen()*)
		user_type	:USINT;		(*0 CLIENT node type, 1 SERVER node type*)
		queue_cnt	:UINT;		(*1 enables the CMSattach/CMSdetach function*)
		modul_name	:UDINT;		(*pointer to the string containing the name of the data object*)
	END_VAR
	VAR_OUTPUT
		cms_entry	:UINT;		(*error entry number or number of CMS objects in the CMS data object*)
		cms_ident	:UDINT;		(*CMS identifier is needed for CMSmain()*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSattach			(*attach CMS objects*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		cms_ident	:UDINT;		(*CMS identifier from CMSinit()*)
	END_VAR
	VAR_OUTPUT
		attachCount	:UDINT;		(*CMS attach count*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSdetach			(*detach CMS objects*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		cms_ident	:UDINT;		(*CMS identifier from CMSinit()*)
	END_VAR
	VAR_OUTPUT
		attachCount	:UDINT;		(*CMS attach count*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSdlreq			(*transfers a "multiplexed domain" object of any data size from the client to the server*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		initiate	:BOOL;		(*pos. edge (0->1) ... Initiate new domain*)
		us_ident	:UDINT;		(*user ID from CANopen()*)
		client_id	:UDINT;		(*CAN identifier for the send COB from client to server*)
		server_id	:UDINT;		(*CAN identifier for the send COB from server to client*)
		mult	:UDINT;			(*multiplexer for multiplexed domain*)
		data_adr	:UDINT;		(*address of the download data*)
		data_len	:UDINT;		(*length of the download data*)
	END_VAR
	VAR_OUTPUT
		add_code	:UINT;		(*additional error information in the event of abnormal termination*)
		err_class	:USINT;		(*error class according to CANopen()*)
		err_code	:USINT;		(*error according to CANopen()*)
		dl_len	:UDINT;			(*size of the download data sent*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
		old_enable	:BOOL;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CMSdlcon			(*enables a "multiplexed domain" object of any data length to be received by the server*)
	VAR_INPUT	
		enable	:BOOL;			(*enables execution*)
		initiate	:BOOL;		(*1 ... startpulse, activation receiving the domain*)
		us_ident	:UDINT;		(*user ID from CANopen()*)
		client_id	:UDINT;		(*CAN identifier for the send COB from client to server*)
		server_id	:UDINT;		(*CAN identifier for the send COB from server to client*)
		data_adr	:UDINT;		(*address of the download data*)
		data_len	:UDINT;		(*length of the download data in bytes*)
	END_VAR
	VAR_OUTPUT
		add_code	:UINT;		(*additional error information in the event of abnormal termination*)
		err_class	:USINT;		(*error class according to CANopen()*)
		err_code	:USINT;		(*error according to CANopen()*)
		mult	:UDINT;			(*multiplexer for multiplexed domain*)
		dl_len	:UDINT;			(*size of the data already downloaded*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANwrite			(*sends a CAN message with the given CAN identifier to the CAN controller for transmission*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident number from the CANopen() function*)
		can_id	:UDINT;			(*CAN identifier*)
		data_adr	:UDINT;		(*address of the CAN data (max. 8 bytes)*)
		data_lng	:USINT;		(*length of the data (max. 8 bytes)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		old_id	:UDINT;			(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
		wr_order	:USINT;		(*internal variable*)
		align_byte	:USINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANupd			(*gives the response to an RTR request telegram to the send node*)
	VAR_INPUT					
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident from CANopen()*)
		can_id	:UDINT;			(*CAN identifier*)
		data_adr	:UDINT;		(*address of the data area in which the update data is stored*)
		data_lng	:USINT;		(*length of the update data in bytes*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		old_id	:UDINT;			(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANngp			(*handles the Node Guarding Protocol according to CAL on the NMT slave*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident from CANopen()*)
		can_id	:UDINT;			(*CAN identifier*)
		nd_state	:USINT;		(*node status*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		old_id	:UDINT;			(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANrwtab			(*edits the list of variables (variables table) defined with the CANdftab()*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		tab_ident	:UDINT;		(*table identifier from CANdftab()*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANrtr			(*sends an RTR request frame on the CAN bus*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		request	:BOOL;			(*0 poll data buffer, 1 send RTR request*)
		us_ident	:UDINT;		(*user ident from CANopen()*)
		can_id	:UDINT;			(*CAN identifier*)
		data_adr	:UDINT;		(*address of the data area in which the data received is stored*)
	END_VAR
	VAR_OUTPUT
		data_lng	:USINT;		(*length of the received data in bytes*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR	
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANread			(*reads CAN messages from the CAN controller*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident number from the CANopen() function*)
		can_id	:UDINT;			(*CAN identifier*)
		data_adr	:UDINT;		(*address where the read data is stored (max. 8 bytes)*)
	END_VAR
	VAR_OUTPUT
		data_lng	:USINT;		(*length of the data*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANrd			(*copies data from the queue to the buffer or sends an error in the status*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		q_ident	:UDINT;			(*queue identifier from CANqueue()*)
		data_adr	:UDINT;		(*address of the data area where CAN data from the receive queue is stored*)
	END_VAR
	VAR_OUTPUT
		size	:UINT;			(*length of the CAN data in bytes*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANxrd			(*copies data from the queue to the buffer or sends an error in the status*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		q_ident	:UDINT;			(*queue identifier from CANqueue()*)
		data_adr	:UDINT;		(*address of the data area where CAN data from the receive queue is stored*)
	END_VAR
	VAR_OUTPUT
		can_id	:UDINT;			(*CAN identifier*)
		size	:UINT;			(*length of the CAN data in bytes*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANqueue			(*installs a queue for a CAN identifier in the read direction*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user Ident from CANopen()*)
		can_id	:UDINT;			(*CAN identifier for the queue*)
		size	:UINT;			(*number of telegrams in the queue*)
	END_VAR
	VAR_OUTPUT
		q_ident	:UDINT;			(*queue identifier for the CANrd()*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANopen			(*initializes the CAN controller and requests the necessary resources (e.g. memory)*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		baud_rate	:USINT;		(*baud rate at which the CAN interface should be operated*)
		cob_anz	:UINT;			(*max. permissible number of COBs (communication objects)*)
		error_adr	:UDINT;		(*pointer to an error variable, e.g. Bit 15 = 1 the CAN bus is in the BusOff state*)
		device	:UDINT;			(*address of a string which clearly describes the CAN interface*)
		info	:UINT;			(*enables/disables extended mode for the CAN controller*)
	END_VAR
	VAR_OUTPUT
		us_ident	:UDINT;		(*is required for the other functions of the CAN_Lib library in order to identify a CAN interface clearly*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANgetid			(*confirms the CAN identifier which the exception trigged in the context of an exception object*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		data_adr	:UDINT;		(*address of the data area in which the data received is stored*)
	END_VAR
	VAR_OUTPUT
		data_lng	:USINT;		(*length of the received data in bytes*)
		can_id	:UDINT;			(*CAN identifier for the exception*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANexcep			(*activates a pre-installed exception object with the exception number exc_no*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user Ident from CANopen()*)
		can_id	:UDINT;			(*CAN identifier*)
		exc_nr	:USINT;			(*number of the exception (exception numbers 208 to 223 are reserved for CAN)*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
		cob_handle	:UDINT;		(*internal variable*)
		ex_p	:UDINT;			(*internal variable*)
		ex_maxtask	:UDINT;		(*internal variable*)
		ss_irqvw_p	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANdftab			(*supplies a variables list (variables table) defined by the user with data about the CAN bus*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user ident number from the CANopen() function*)
		table_adr	:UDINT;		(*address of the variables table*)
		tab_num	:UINT;			(*number of entries in the variables table*)
	END_VAR
	VAR_OUTPUT
		tab_ident	:UDINT;		(*table identifier for CANrwtab()*)
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
	VAR
		old_enable	:BOOL;		(*internal variable*)
		init_cnt	:UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK CANbtreg			(*configures a special bit timing register values for the CAN controller (Intel 82527)*)
	VAR_INPUT
		enable	:BOOL;			(*enables execution*)
		us_ident	:UDINT;		(*user Ident from CANopen()*)
		treg0	:UDINT;			(*bit timing register 0*)
		treg1	:UDINT;			(*bit timing Register 1*)
	END_VAR
	VAR_OUTPUT
		status	:UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK
