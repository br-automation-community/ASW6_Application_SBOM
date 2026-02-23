
{REDUND_CONTEXT} FUNCTION FxPubSubMessagesSent : UDINT (*Returns the amount of NetworkMessages sent for all PubSub connections.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubMessagesSentFailed : UDINT (*Returns the amount of failed NetworkMessages on transmission for all PubSub connections.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubMessagesReceived : UDINT (*Returns the amount of received and processed NetworkMessages for all PubSub connections.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubMessagesReceivedInvalid : UDINT (*Returns the amount NetworkMessages with an invalid format.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubDataSetWriterFailed : UDINT (*Returns the amount of erroneous publisher datasets being processed. A dataset is erroneous if at least one of the dataset fields is erroneous.*)
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubDataSetReaderFailed : UDINT (*Returns the amount of erroneous subscriber dataset being processed. A dataset is erroneous if at least one of the dataset fields is erroneous.*)
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION FxPubSubWriterGrpSentMsgs : DINT (*Retrieves the count of NetworkMessages sent for the specified WriterGroup.  Returns 0 if successful, otherwise returns an error code.*)
	VAR_INPUT
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to the PubSub WriterGroup.*)
		Count					: REFERENCE TO UDINT;				(*Pointer to the count of NetworkMessages sent for the specified WriterGroup.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION FxPubSubWriterGrpSentMsgsFailed : DINT (*Retrieves the count of failed NetworkMessages on transmission for the specified WriterGroup.  Returns 0 if successful, otherwise returns an error code.*)
	VAR_INPUT
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to the PubSub WriterGroup.*)
		Count					: REFERENCE TO UDINT;				(*Pointer to the count of failed NetworkMessages on transmission for the specified WriterGroup.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION FxPubSubReaderGrpRcvdMsgs : DINT (*Retrieves the count of received and processed NetworkMessages for the specified ReaderGroup.  Returns 0 if successful, otherwise returns an error code.*)
	VAR_INPUT
		ReaderGroupHandle		: FxPubSubReaderGroupHandleType;	(*A reference to the PubSub ReaderGroup.*)
		Count					: REFERENCE TO UDINT;				(*Pointer to the count of received and processed NetworkMessages for the specified ReaderGroup.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION FxPubSubReaderGrpRcvdInvalidMsgs : DINT (*Retrieves the count of NetworkMessages with an invalid format for the specified ReaderGroup.  Returns 0 if successful, otherwise returns an error code.*)
	VAR_INPUT
		ReaderGroupHandle		: FxPubSubReaderGroupHandleType;	(*A reference to the PubSub ReaderGroup.*)
		Count					: REFERENCE TO UDINT;				(*Pointer to the count of NetworkMessages with an invalid format for the specified ReaderGroup.*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} FUNCTION FxPubSubControlGetState : FxPubSubCtlStateEnum (*Returns the current state of PubSub.*)
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubControlStart (*Starts the stopped PubSub.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubControlStop (*Stops the running PubSub.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigIsInitial (*Returns whether the initial PubSub configuration is used.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
	END_VAR

	VAR_OUTPUT
		IsInitial				: BOOL;								(*TRUE, if initial PubSub configuration is used, FALSE otherwise.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigRestoreInitial (*Restore PubSub configuration to initial configuration and apply it.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigApply (*Apply the working copy of the PubSub configuration. Memory allocated from FxPubSubConfigGetActive() is freed automatically on success. On error, memory must be freed with FxPubSubConfigFreeMemory().*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConfigurationHandle		: FxPubSubConfigurationHandleType;	(*A reference to a PubSub configuration.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetActive (*Get a working copy of the currently active PubSub configuration. This function block allocates memory, which is freed by a successful call of FxPubSubConfigApply(). Otherwise, it must be freed with FxPubSubConfigFreeMemory().*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
		ConfigurationHandle		: FxPubSubConfigurationHandleType;	(*A reference to a PubSub configuration.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigFreeMemory (*Free the memory of the PubSub configuration's working copy.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConfigurationHandle		: FxPubSubConfigurationHandleType;	(*A reference to a PubSub configuration.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK


{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetConnection (*Get a connection by name from the given configuration.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConfigurationHandle		: FxPubSubConfigurationHandleType;	(*A reference to a PubSub configuration.*)
		Name					: REFERENCE TO STRING[255];			(*The name of the PubSub connection.*)
	END_VAR

	VAR_OUTPUT
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*PubSub connection handle.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetWriterGroup (*Get a WriterGroup by name from a given connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection.*)
		Name					: REFERENCE TO STRING[255];			(*The name of the PubSub WriterGroup.*)
	END_VAR

	VAR_OUTPUT
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to the PubSub WriterGroup.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetDataSetWriter (*Get a DataSetWriter by name from a given WriterGroup.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to the PubSub WriterGroup.*)
		Name					: REFERENCE TO STRING[255];			(*The name of the PubSub DataSetWriter.*)
	END_VAR

	VAR_OUTPUT
		DataSetWriterHandle	 	: FxPubSubDataSetWriterHandleType;	(*A reference to the PubSub DataSetWriter.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetReaderGroup (*Get a ReaderGroup by name from a given connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection.*)
		Name					: REFERENCE TO STRING[255];			(*The name of the PubSub ReaderGroup.*)
	END_VAR

	VAR_OUTPUT
		ReaderGroupHandle		: FxPubSubReaderGroupHandleType;	(*A reference to the PubSub ReaderGroup.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConfigGetDataSetReader (*Get a DataSetReader by name from a given ReaderGroup.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ReaderGroupHandle		: FxPubSubReaderGroupHandleType;	(*A reference to the PubSub ReaderGroup.*)
		Name					: REFERENCE TO STRING[255];			(*The name of the PubSub DataSetReader.*)
	END_VAR

	VAR_OUTPUT
		DataSetReaderHandle 	: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConnectionSetEnabled (*Set the enabled flag for a connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection*)
		Enabled					: BOOL;								(*TRUE for enable; FALSE for disable*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConnectionSetPubId16 (*Set the publisher ID for a connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection.*)
		PublisherID	 			: UINT;								(*The new publisher ID.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConnectionSetPubId64 (*Set the publisher ID for a connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection.*)
		PublisherID				: FxPubSubPublisherId64;			(*The new publisher ID.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubConnectionSetAddress (*Set the address (URL) for a connection.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ConnectionHandle		: FxPubSubConnectionHandleType;		(*A reference to a PubSub connection.*)
		Address					: REFERENCE TO STRING[255];	(*The address (URL), e.g. "opc.udp://<IP address>"*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubWriterGroupSetEnabled (*Set the enabled flag for a WriterGroup.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to a PubSub WriterGroup.*)
		Enabled					: BOOL;								(*TRUE for enable; FALSE for disable.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubWriterGroupSetInterval (*Set the publishing interval for a writer group.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to a PubSub writer group.*)
		PubInterval				: LREAL;							(*The new publishing interval in milliseconds.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubWriterGroupSetId (*Set the ID of a WriterGroup.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		WriterGroupHandle		: FxPubSubWriterGroupHandleType;	(*A reference to a PubSub WriterGroup.*)
		WriterGroupID 			: UINT;							(*The new ID for the WriterGroup.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubWriterSetEnabled (*Set the enabled flag for a DataSetWriter.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetWriterHandle		: FxPubSubDataSetWriterHandleType;	(*A reference to the PubSub DataSetWriter.*)
		Enabled					: BOOL;								(*TRUE for enable; FALSE for disable.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderGroupSetEnabled (*Set the enabled flag for a ReaderGroup.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		ReaderGroupHandle		: FxPubSubReaderGroupHandleType;	(*A reference to a PubSub ReaderGroup.*)
		Enabled					: BOOL;								(*TRUE for enable; FALSE for disable.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderSetEnabled (*Set the enabled flag for a DataSetReader.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetReaderHandle		: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		Enabled					: BOOL;								(*TRUE for enable; FALSE for disable.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;										(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderSetPubId16 (*Set the publisher ID of a DataSetReader.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetReaderHandle 	: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		PublisherID	 			: UINT;								(*The new publisher ID.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderSetPubId64 (*Set the publisher ID of a DataSetReader.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetReaderHandle 	: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		PublisherID	 			: FxPubSubPublisherId64;			(*The new publisher ID.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderSetWriterGroupId (*Set the WriterGroup ID of a DataSetReader.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetReaderHandle		: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		WriterGroupID			: UINT;								(*The new WriterGroup ID.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK FxPubSubReaderSetInterval (*Set the publishing interval of a DataSetReader.*)
	VAR_INPUT
		Execute					: BOOL;								(*Execution of the function block begins on a rising edge of this input.*)
		DataSetReaderHandle 	: FxPubSubDataSetReaderHandleType;	(*A reference to the PubSub DataSetReader.*)
		PubInterval	 			: LREAL;							(*The new publishing interval in milliseconds.*)
	END_VAR

	VAR_OUTPUT
		Done					: BOOL;								(*Execution successful. Function block is finished.*)
		Busy					: BOOL;								(*The function block must continue to be called.*)
		Error					: BOOL;								(*Error occurred during operation.*)
		StatusID				: DINT;								(*Status information.*)
	END_VAR

	VAR
		Internal				: ARRAY[0..31] OF UDINT;			(*Internal variable.*)
	END_VAR
END_FUNCTION_BLOCK
