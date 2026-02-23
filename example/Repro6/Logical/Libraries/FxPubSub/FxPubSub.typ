
TYPE
    FxPubSubCtlStateEnum : (fxPUBSUB_CTL_STATE_STOPPED := 0,
                            fxPUBSUB_CTL_STATE_RUNNING := 1,
                            fxPUBSUB_CTL_STATE_UNINITIALIZED := 2);

    FxPubSubPublisherId64 : STRUCT              (* PubSub 64 bit publisher ID *)
        High        : UDINT;                    (* High part of the 64 bit publisher ID *)
        Low	        : UDINT;                    (* Low part of the 64 bit publisher ID *)
    END_STRUCT;

    FxPubSubConfigurationHandleType : DINT;

    FxPubSubConnectionHandleType : DINT;

    FxPubSubWriterGroupHandleType : DINT;

    FxPubSubDataSetWriterHandleType : DINT;

    FxPubSubReaderGroupHandleType : DINT;

    FxPubSubDataSetReaderHandleType : DINT;

END_TYPE
