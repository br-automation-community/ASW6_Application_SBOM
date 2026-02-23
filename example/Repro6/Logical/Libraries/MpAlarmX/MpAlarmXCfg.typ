TYPE
    MpAlarmXCfgEnum :
        (
        mpALARMX_CFG_QUERIES := 180, (*MpAlarmXCfgQueryType: Root element of the Query Configuration*)
        mpALARMX_CFG_MAPPINGS := 101, (*MpAlarmXCfgCoreMappingType: Alarm mappings*)
        mpALARMX_CFG_DEFAULTMAPPINGS := 103, (*MpAlarmXCfgCoreDefaultType: Default Actions*)
        mpALARMX_CFG_QUERY := 181, (*MpAlarmXCfgQuerySingleType: Single Alarm Query*)
        mpALARMX_CFG_SNIPPET := 142, (*MpAlarmXCfgListSnippetType: Single Alarm Snippet*)
        mpALARMX_CFG_DEFAULTACTION := 104, (*MpAlarmXCfgCoreMappingActionType: Single default action*)
        mpALARMX_CFG_ALARMLINK := 105, (*MpAlarmXCfgCoreListsType: Single Alarm List*)
        mpALARMX_CFG_CATEGORY := 161, (*MpAlarmXCfgCategorySingleType: Single Alarm Category*)
        mpALARMX_CFG_CORE := 100, (*MpAlarmXCfgCoreType: Root element of the Core Configuration*)
        mpALARMX_CFG_CATEGORIES := 160, (*MpAlarmXCfgCategoryType: Root element of the Category Configuration*)
        mpALARMX_CFG_ALARM := 141, (*MpAlarmXCfgListAlarmType: Single alarm configuration*)
        mpALARMX_CFG_HISTORY := 120, (*MpAlarmXCfgHistoryType: Root element of the History Configuration*)
        mpALARMX_CFG_ALARMS := 140, (*MpAlarmXCfgListType: Root element of the List Configuration*)
        mpALARMX_CFG_MAPPING := 102, (*MpAlarmXCfgCoreMappingsType: Single alarm mapping*)
        mpALARMX_CFG_CATEGORYLINK := 106 (*MpAlarmXCfgCoreCatListType: Single Alarm Category Link*)
        );
    MpAlarmXCfgCategorySeverityType : STRUCT (*Defines categories by alarm severity*)
        Severity : STRING[20]; (*Severity range that defines this category (e.g. 2...15 or 20)*)
    END_STRUCT;
    MpAlarmXCfgCategoryCodeType : STRUCT (*Defines categories by alarm code*)
        Code : STRING[20]; (*Code range that defines this category (e.g. 2...15 or 20)*)
    END_STRUCT;
    MpAlarmXCfgCategoryDefinedByEnum :
        ( (*Base property by which the categories are defined*)
        mpALARMX_CFG_CATEGORY_SEVERITY := 0, (*Defines categories by alarm severity*)
        mpALARMX_CFG_CATEGORY_CODE := 1 (*Defines categories by alarm code*)
        );
    MpAlarmXCfgCategoryDefinedByType : STRUCT (*Base property by which the categories are defined*)
        Type : MpAlarmXCfgCategoryDefinedByEnum; (*Definition of Defined by*)
        Severity : MpAlarmXCfgCategorySeverityType; (*Defines categories by alarm severity*)
        Code : MpAlarmXCfgCategoryCodeType; (*Defines categories by alarm code*)
    END_STRUCT;
    MpAlarmXCfgCategorySingleType : STRUCT (*Category*)
        Name : STRING[50]; (*Name of the category*)
        DefinedBy : MpAlarmXCfgCategoryDefinedByType; (*Base property by which the categories are defined*)
    END_STRUCT;
    MpAlarmXCfgCategoryAlarmCatType : STRUCT (*Alarm categories*)
        Category : MpBaseCfgArrayType; (*MpAlarmXCfgCategorySingleType: Category*)
    END_STRUCT;
    MpAlarmXCfgCategoryType : STRUCT (*Complete MpAlarmXCategory configuration structure.*)
        AlarmCategories : MpAlarmXCfgCategoryAlarmCatType; (*Alarm categories*)
    END_STRUCT;
    MpAlarmXCfgCoreActionParamType : STRUCT (*Action Parameter*)
        Name : STRING[100]; (*Name of the reaction*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingActionEnum :
        ( (*Defines the actions associated with a mapping.*)
        mpALARMX_CFG_CORE_NONE := 0, (*Action: None*)
        mpALARMX_CFG_CORE_REACTION := 1, (*Action Parameter*)
        mpALARMX_CFG_CORE_ESCALATE_ALARM := 2, (*Action: Escalate Alarm*)
        mpALARMX_CFG_CORE_ESC_REACTION := 3, (*Action: Escalate Reaction*)
        mpALARMX_CFG_CORE_AGGREGATE_ESC := 4, (*Action: Aggregate Alarm and Escalate*)
        mpALARMX_CFG_CORE_AGGREGATE_LOC := 5, (*Action: Aggregate Alarm locally*)
        mpALARMX_CFG_CORE_REMAIN := 6 (*Action: Remain*)
        );
    MpAlarmXCfgCoreMappingActionType : STRUCT (*Defines the actions associated with a mapping.*)
        Type : MpAlarmXCfgCoreMappingActionEnum; (*Definition of Action*)
        Data : MpAlarmXCfgCoreActionParamType; (*Action Parameter*)
    END_STRUCT;
    MpAlarmXCfgCoreTaskClassEnum :
        ( (*The task class this component runs in*)
        mpALARMX_CFG_CORE_TC_CYCLIC_1 := 1, (*Task Class #1*)
        mpALARMX_CFG_CORE_TC_CYCLIC_2 := 2, (*Task Class #2*)
        mpALARMX_CFG_CORE_TC_CYCLIC_3 := 3, (*Task Class #3*)
        mpALARMX_CFG_CORE_TC_CYCLIC_4 := 4, (*Task Class #4*)
        mpALARMX_CFG_CORE_TC_CYCLIC_5 := 5, (*Task Class #5*)
        mpALARMX_CFG_CORE_TC_CYCLIC_6 := 6, (*Task Class #6*)
        mpALARMX_CFG_CORE_TC_CYCLIC_7 := 7, (*Task Class #7*)
        mpALARMX_CFG_CORE_TC_CYCLIC_8 := 8 (*Task Class #8*)
        );
    MpAlarmXCfgCoreGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable component*)
        EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
        CyclicTaskClass : MpAlarmXCfgCoreTaskClassEnum; (*Task class in which cyclic operation will take place*)
        Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingsType : STRUCT (*Mapping 1-N*)
        Alarm : STRING[100]; (*Filter: AlarmName or [Severity]*)
        Action : MpAlarmXCfgCoreMappingActionType; (*Defined Action*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingType : STRUCT (*Mapping by alarm*)
        Mapping : MpBaseCfgArrayType; (*MpAlarmXCfgCoreMappingsType: Mapping 1-N*)
    END_STRUCT;
    MpAlarmXCfgCoreDefaultType : STRUCT (*Default action of alarm*)
        Action : MpBaseCfgArrayType; (*MpAlarmXCfgCoreMappingActionType: Defined action.*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmMappingType : STRUCT (*Definition of the alarm mapping*)
        Mapping : MpAlarmXCfgCoreMappingType; (*Mapping by alarm*)
        Default : MpAlarmXCfgCoreDefaultType; (*Default action of alarm*)
    END_STRUCT;
    MpAlarmXCfgCoreListsType : STRUCT (*Mapping 1-N*)
        List : STRING[50]; (*Definition of alarm list*)
        CodeOffset : DINT; (*Offset that is added to the alarm-codes used in the attached list*)
        NumberOfArguments : UDINT; (*Defines the number of used elements inside the array Arguments.*)
        Arguments : ARRAY[0..8] OF STRING[255]; (*Argument that can be used to replace the according place-holder ({N}) in any string within the linked configuration*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmListsType : STRUCT (*Link to alarm-list(s)*)
        Lists : MpBaseCfgArrayType; (*MpAlarmXCfgCoreListsType: Mapping 1-N*)
    END_STRUCT;
    MpAlarmXCfgCoreEnabledType : STRUCT (*Allow unconfigured alarms*)
        Alarm : STRING[100]; (*Alarm-configuration which is used for non-configured alarms (optional)*)
    END_STRUCT;
    MpAlarmXCfgCoreUnconfAlarmsEnum :
        ( (*Allow setting of not-configured alarms*)
        mpALARMX_CFG_CORE_DISABLED := 0, (*Disallow unconfigured alarms*)
        mpALARMX_CFG_CORE_ENABLED := 1 (*Allow unconfigured alarms*)
        );
    MpAlarmXCfgCoreUnconfAlarmsType : STRUCT (*Allow setting of not-configured alarms*)
        Type : MpAlarmXCfgCoreUnconfAlarmsEnum; (*Definition of Unconfigured alarms*)
        Enabled : MpAlarmXCfgCoreEnabledType; (*Allow unconfigured alarms*)
    END_STRUCT;
    MpAlarmXCfgCoreDataType : STRUCT (*UserROM + DRAM*)
        Size : UDINT; (*Memory reserved for storing the retained alarms*)
        BufferSize : UDINT; (*DRAM buffer size*)
        MaximumSaveInterval : UDINT; (*Defines after which time data is (latest) transferred from DRAM to UserROM*)
    END_STRUCT;
    MpAlarmXCfgCoreMemoryEnum :
        ( (*Location where data will be stored*)
        mpALARMX_CFG_CORE_MEM_DISABLED := 0, (*Disabled*)
        mpALARMX_CFG_CORE_ROM_DRAM := 1, (*UserROM + DRAM*)
        mpALARMX_CFG_CORE_ROM_RAM := 2, (*UserROM + UserRAM*)
        mpALARMX_CFG_CORE_RAM := 3 (*UserRAM*)
        );
    MpAlarmXCfgCoreMemoryType : STRUCT (*Location where data will be stored*)
        Type : MpAlarmXCfgCoreMemoryEnum; (*Definition of Memory*)
        Data : MpAlarmXCfgCoreDataType; (*UserROM + DRAM*)
    END_STRUCT;
    MpAlarmXCfgCoreRetainType : STRUCT (*Configuration for storing retain alarms*)
        Memory : MpAlarmXCfgCoreMemoryType; (*Location where data will be stored*)
    END_STRUCT;
    MpAlarmXCfgCoreCatListType : STRUCT (*Alarm categories*)
        List : STRING[50]; (*Definition of alarm category*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmCatType : STRUCT (*List of alarm categories*)
        NumberOfCategories : UDINT; (*Defines the number of used elements inside the array Categories.*)
        Categories : ARRAY[0..9] OF MpAlarmXCfgCoreCatListType; (*Alarm categories*)
    END_STRUCT;
    MpAlarmXCfgCoreType : STRUCT (*Complete MpAlarmXCore configuration structure.*)
        General : MpAlarmXCfgCoreGeneralType; (*General Settings*)
        AlarmMapping : MpAlarmXCfgCoreAlarmMappingType; (*Definition of the alarm mapping*)
        AlarmLists : MpAlarmXCfgCoreAlarmListsType; (*Link to alarm-list(s)*)
        UnconfiguredAlarms : MpAlarmXCfgCoreUnconfAlarmsType; (*Allow setting of not-configured alarms*)
        Retain : MpAlarmXCfgCoreRetainType; (*Configuration for storing retain alarms*)
        AlarmCategories : MpAlarmXCfgCoreAlarmCatType; (*List of alarm categories*)
    END_STRUCT;
    MpAlarmXCfgHistoryGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable/Disable of component*)
        EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
        EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
        Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
    END_STRUCT;
    MpAlarmXCfgHistoryExportType : STRUCT (*Export settings.*)
        TimestampPattern : STRING[50]; (*Timestamp pattern in the alarm history export. This format can be changed.*)
        AutoFileExtension : BOOL; (*Automatically adds a file extension if not specified in the file name*)
        ColumnSeparator : STRING[1]; (*Delimiter used to separate columns in the CSV file*)
    END_STRUCT;
    MpAlarmXCfgHistoryDataType : STRUCT (*Memory Parameter*)
        Size : UDINT; (*Memory reserved for storing the history*)
        BufferSize : UDINT; (*DRAM buffer size*)
        MaximumSaveInterval : UDINT; (*Defines after which time data is (latest) transferred from DRAM to UserROM*)
    END_STRUCT;
    MpAlarmXCfgHistoryMemoryEnum :
        ( (*Location where data will be stored*)
        mpALARMX_CFG_HISTORY_ROM_DRAM := 0, (*Memory Parameter*)
        mpALARMX_CFG_HISTORY_ROM_RAM := 1, (*UserROM + UserRAM*)
        mpALARMX_CFG_HISTORY_RAM := 2 (*UserRAM*)
        );
    MpAlarmXCfgHistoryMemoryType : STRUCT (*Location where data will be stored*)
        Type : MpAlarmXCfgHistoryMemoryEnum; (*Definition of Memory*)
        Data : MpAlarmXCfgHistoryDataType; (*Memory Parameter*)
    END_STRUCT;
    MpAlarmXCfgHistoryScopeEnum :
        ( (*Definition of scope*)
        mpALARMX_CFG_HISTORY_COMPONENT := 0, (*Includes only alarms on the same level*)
        mpALARMX_CFG_HISTORY_BRANCH := 1 (*Include all alarms within the same component branch*)
        );
    MpAlarmXCfgHistorySettingsType : STRUCT (*Alarm history settings.*)
        Export : MpAlarmXCfgHistoryExportType; (*Export settings.*)
        Memory : MpAlarmXCfgHistoryMemoryType; (*Location where data will be stored*)
        Scope : MpAlarmXCfgHistoryScopeEnum; (*Definition of scope*)
    END_STRUCT;
    MpAlarmXCfgHistoryType : STRUCT (*Complete MpAlarmXHistory configuration structure.*)
        General : MpAlarmXCfgHistoryGeneralType; (*General Settings*)
        AlarmHistory : MpAlarmXCfgHistorySettingsType; (*Alarm history settings.*)
    END_STRUCT;
    MpAlarmXCfgListStaticType : STRUCT (*Static*)
        Limit : LREAL; (*Limit as static numeric input*)
        LimitText : STRING[100]; (*Contents of snippet {&LimitText} to be integrated in the alarm message. A raw text or text ID can be entered, e.g. "LowLow" or {$MyText}.*)
    END_STRUCT;
    MpAlarmXCfgListDynamicType : STRUCT (*Dynamic*)
        LimitPv : STRING[255]; (*Process variable that contains the limit*)
        LimitText : STRING[100]; (*Contents of snippet {&LimitText} to be integrated in the alarm message. A raw text or text ID can be entered, e.g. "LowLow" or {$MyText}.*)
    END_STRUCT;
    MpAlarmXCfgListLimitSelectorEnum :
        ( (*Defines the limits.*)
        mpALARMX_CFG_LIST_LIMIT_DISABLED := 0, (*Disabled*)
        mpALARMX_CFG_LIST_LIMIT_STATIC := 1, (*Static*)
        mpALARMX_CFG_LIST_LIMIT_DYNAMIC := 2 (*Dynamic*)
        );
    MpAlarmXCfgListLimitSelectorType : STRUCT (*Defines the limits.*)
        Type : MpAlarmXCfgListLimitSelectorEnum; (*Definition of Limit Selector*)
        LimitStatic : MpAlarmXCfgListStaticType; (*Static*)
        LimitDynamic : MpAlarmXCfgListDynamicType; (*Dynamic*)
    END_STRUCT;
    MpAlarmXCfgListAckValueListEnum :
        ( (*Acknowledge Requirements*)
        mpALARMX_CFG_LIST_ACK_DISABLED := 0, (*No acknowledge required. Inactive and acknowledged alarms disappear from the current alarm list automatically.*)
        mpALARMX_CFG_LIST_ACK_REQ := 1, (*The alarm must be acknowledged. This can be done at any time.*)
        mpALARMX_CFG_LIST_ACK_REQ_AND_RE := 3 (*The alarm must be acknowledged. This can be done at any time. The acknowledgment state is reset when the alarm is re-enabled.*)
        );
    MpAlarmXCfgListConfValueListEnum :
        ( (*Confirm Requirements*)
        mpALARMX_CFG_LIST_CFM_DISABLED := 0, (*No confirm required. Inactive alarms disappear from the current alarm list automatically.*)
        mpALARMX_CFG_LIST_CFM_REQUIRED := 1, (*The alarm must be confirmed. This can be done once the alarm is acknowledged.*)
        mpALARMX_CFG_LIST_CFM_REQ_AFT_RE := 2, (*The alarm must be confirmed. But this can only be done once the alarm is reset and acknowledged.*)
        mpALARMX_CFG_LIST_CFM_REQ_AND_RE := 3 (*The alarm must be confirmed. But this can only be done once the alarm is reset and acknoweldged. When the alarm-state changed to active again also the confirm-state is reset.*)
        );
    MpAlarmXCfgListRecordingType : STRUCT (*Defines which changes should be recorded*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        ActiveToInactive : BOOL; (*"Active" to "Inactive" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
        Update : BOOL; (*Re-activates the alarm (set while active without a state change)*)
    END_STRUCT;
    MpAlarmXCfgListLimStaticType : STRUCT (*Static Limits*)
        Delay : REAL; (*Delay time before triggering the alarm*)
        Hysteresis : LREAL; (*Hysteresis window for triggering the alarm*)
    END_STRUCT;
    MpAlarmXCfgListLimDynamicType : STRUCT (*Dynamic Limits*)
        DelayPv : STRING[255]; (*Process variable that contains the delay time*)
        HysteresisPv : STRING[255]; (*Process variable that contains the hysteresis value*)
    END_STRUCT;
    MpAlarmXCfgListLimSettingsEnum :
        ( (*Defines the limits.*)
        mpALARMX_CFG_LIST_STATIC := 0, (*Static Limits*)
        mpALARMX_CFG_LIST_DYNAMIC := 1 (*Dynamic Limits*)
        );
    MpAlarmXCfgListLimSettingsType : STRUCT (*Defines the limits.*)
        Type : MpAlarmXCfgListLimSettingsEnum; (*Definition of Settings*)
        Static : MpAlarmXCfgListLimStaticType; (*Static Limits*)
        Dynamic : MpAlarmXCfgListLimDynamicType; (*Dynamic Limits*)
    END_STRUCT;
    MpAlarmXCfgListActivationType : STRUCT (*Updates values during (re-)activation*)
        Timestamp : BOOL; (*Updates the timestamp when the alarm is re-activated*)
        Snippets : BOOL; (*Updates the snippet when the alarm is re-activated*)
    END_STRUCT;
    MpAlarmXCfgListDataUpdateType : STRUCT (*Defines which values should be updated when an alarm is re-activated.*)
        Activation : MpAlarmXCfgListActivationType; (*Updates values during (re-)activation*)
    END_STRUCT;
    MpAlarmXCfgListRecEdgeType : STRUCT (*Defines which state changes should be recorded in the history report*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
    END_STRUCT;
    MpAlarmXCfgListEdgeAlarmType : STRUCT (*Behaviour: Edge Alarm*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behavior.*)
        MultipleInstances : BOOL; (*Permits multiple instances*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListRecEdgeType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListHistoryReportType : STRUCT (*Defines which state changes should be recorded in the history report*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        ActiveToInactive : BOOL; (*"Active" to "Inactive" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
        Update : BOOL; (*Re-activates the alarm (set while active without a state change)*)
    END_STRUCT;
    MpAlarmXCfgListPersAlarmType : STRUCT (*Behaviour: Persistent Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        MultipleInstances : BOOL; (*Permits multiple instances of this alarm*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListHistoryReportType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListUserDefinedType : STRUCT (*Behaviour: Custom Alarm*)
        AutoReset : BOOL; (*Immediately resets this alarm after it is set (not necessary to call MpAlarmXReset)*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        MultipleInstances : BOOL; (*Permits multiple instances of this alarm*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListLevelMonType : STRUCT (*Defines monitoring parameters (limits, hysteresis, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low limit*)
        LowLowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSelectorType; (*Configured the high limit*)
        HighHighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListLimSettingsType; (*Internal monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListLevelType : STRUCT (*Behaviour: Level Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListLevelMonType; (*Defines monitoring parameters (limits, hysteresis, delay)*)
    END_STRUCT;
    MpAlarmXCfgListDevnMonType : STRUCT (*Monitoring parameters (limits, hysteresis, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        SetpointPv : STRING[255]; (*Process variable that contains the setpoint for monitoring*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low limit*)
        LowLowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high limit*)
        HighHighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListLimSettingsType; (*Internal monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListDeviationType : STRUCT (*Behaviour: Deviation Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListDevnMonType; (*Monitoring parameters (limits, hysteresis, delay)*)
    END_STRUCT;
    MpAlarmXCfgListTimStaticType : STRUCT (*Static setting for rate of change monitoring*)
        Delay : REAL; (*Delay time before triggering the alarm*)
        TimeConstant : REAL; (*Time constant of the first-order derivative action element (DT1)*)
    END_STRUCT;
    MpAlarmXCfgListTimDynamicType : STRUCT (*Dynamic setting for rate of change monitoring*)
        DelayPv : STRING[255]; (*Process variable that contains the delay time*)
        TimeConstantPv : STRING[255]; (*Process variable that contains the time-constant value*)
    END_STRUCT;
    MpAlarmXCfgListTimSettingsEnum :
        ( (*Internal rate-of-change monitoring settings*)
        mpALARMX_CFG_LIST_TIM_STATIC := 0, (*Static setting for rate of change monitoring*)
        mpALARMX_CFG_LIST_TIM_DYNAMIC := 1 (*Dynamic setting for rate of change monitoring*)
        );
    MpAlarmXCfgListTimSettingsType : STRUCT (*Internal rate-of-change monitoring settings*)
        Type : MpAlarmXCfgListTimSettingsEnum; (*Definition of Settings*)
        Static : MpAlarmXCfgListTimStaticType; (*Static setting for rate of change monitoring*)
        Dynamic : MpAlarmXCfgListTimDynamicType; (*Dynamic setting for rate of change monitoring*)
    END_STRUCT;
    MpAlarmXCfgListRocMonType : STRUCT (*Defines monitoring parameters (limits, filter, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low limit*)
        LowLowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high limit*)
        HighHighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListTimSettingsType; (*Internal rate-of-change monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListRocType : STRUCT (*Behaviour: Rate of Change Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListRocMonType; (*Defines monitoring parameters (limits, filter, delay)*)
    END_STRUCT;
    MpAlarmXCfgListTrgValuesType : STRUCT (*Defines the trigger values*)
        NumberOfAlarmValues : UDINT; (*Defines the number of used elements inside the array AlarmValues.*)
        AlarmValues : ARRAY[0..3] OF STRING[50]; (*Value or range of values that should trigger the alarm*)
    END_STRUCT;
    MpAlarmXCfgListDlyStaticType : STRUCT (*Static setting for discrete value monitoring*)
        Delay : REAL; (*Delay time before the alarm is triggered, e.g. to filter out contact bouncing*)
    END_STRUCT;
    MpAlarmXCfgListDlyDynamicType : STRUCT (*Dynamic setting for discrete value monitoring*)
        DelayPv : STRING[255]; (*Process variable that contains the delay time*)
    END_STRUCT;
    MpAlarmXCfgListDlySettingsEnum :
        ( (*Internal discrete value monitoring settings*)
        mpALARMX_CFG_LIST_DLY_STATIC := 0, (*Static setting for discrete value monitoring*)
        mpALARMX_CFG_LIST_DLY_DYNAMIC := 1 (*Dynamic setting for discrete value monitoring*)
        );
    MpAlarmXCfgListDlySettingsType : STRUCT (*Internal discrete value monitoring settings*)
        Type : MpAlarmXCfgListDlySettingsEnum; (*Definition of Settings*)
        Static : MpAlarmXCfgListDlyStaticType; (*Static setting for discrete value monitoring*)
        Dynamic : MpAlarmXCfgListDlyDynamicType; (*Dynamic setting for discrete value monitoring*)
    END_STRUCT;
    MpAlarmXCfgListDiscMonType : STRUCT (*Defines monitoring settings*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        Trigger : MpAlarmXCfgListTrgValuesType; (*Defines the trigger values*)
        Settings : MpAlarmXCfgListDlySettingsType; (*Internal discrete value monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListDiscretType : STRUCT (*Behaviour: Discreet Value Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListDiscMonType; (*Defines monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListBehaviorEnum :
        ( (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        mpALARMX_CFG_LIST_EDGE := 0, (*Behaviour: Edge Alarm*)
        mpALARMX_CFG_LIST_PERSISTENT := 1, (*Behaviour: Persistent Alarm*)
        mpALARMX_CFG_LIST_USER_DEFINED := 2, (*Behaviour: Custom Alarm*)
        mpALARMX_CFG_LIST_LEVEL_MON := 3, (*Behaviour: Level Monitoring Alarm*)
        mpALARMX_CFG_LIST_DEVN_MON := 4, (*Behaviour: Deviation Monitoring Alarm*)
        mpALARMX_CFG_LIST_ROC_MON := 5, (*Behaviour: Rate of Change Monitoring Alarm*)
        mpALARMX_CFG_LIST_DISCRETE_MON := 6 (*Behaviour: Discreet Value Monitoring Alarm*)
        );
    MpAlarmXCfgListBehaviorType : STRUCT (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        Type : MpAlarmXCfgListBehaviorEnum; (*Definition of Behavior*)
        Edge : MpAlarmXCfgListEdgeAlarmType; (*Behaviour: Edge Alarm*)
        Persistent : MpAlarmXCfgListPersAlarmType; (*Behaviour: Persistent Alarm*)
        UserDefined : MpAlarmXCfgListUserDefinedType; (*Behaviour: Custom Alarm*)
        Level : MpAlarmXCfgListLevelType; (*Behaviour: Level Monitoring Alarm*)
        Deviation : MpAlarmXCfgListDeviationType; (*Behaviour: Deviation Monitoring Alarm*)
        RateOfChange : MpAlarmXCfgListRocType; (*Behaviour: Rate of Change Monitoring Alarm*)
        Discrete : MpAlarmXCfgListDiscretType; (*Behaviour: Discreet Value Monitoring Alarm*)
    END_STRUCT;
    MpAlarmXCfgListAlarmType : STRUCT (*Alarm 1-N*)
        Name : STRING[100]; (*Unique identifier for this alarm in the current context (alarm core, mapp component)*)
        Message : STRING[255]; (*Description text that the operator sees on the screen. This can include format items and text system references.*)
        Code : UDINT; (*Numeric alarm code*)
        Severity : UDINT; (*Indicates the urgency of an alarm (often referred to as "priority")*)
        Behavior : MpAlarmXCfgListBehaviorType; (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        Disable : BOOL; (*Permanently disables this alarm*)
        InhibitPv : STRING[255]; (*Boolean process variable for dynamically disable monitoring*)
        AdditionalInformation1 : STRING[255]; (*Can be used to display a cause/solution page or instructional video, for example (text can include format items and text system references)*)
        AdditionalInformation2 : STRING[255]; (*Can be used to display a cause/solution page or instructional video, for example (text can include format items and text system references)*)
    END_STRUCT;
    MpAlarmXCfgListAlarmListType : STRUCT (*List of user defined alarms*)
        Alarm : MpBaseCfgArrayType; (*MpAlarmXCfgListAlarmType: Alarm 1-N*)
    END_STRUCT;
    MpAlarmXCfgListEnabledType : STRUCT (*Auto-Detect: Enabled*)
        Language : STRING[20]; (*Language to use for auto-detect*)
    END_STRUCT;
    MpAlarmXCfgListAutoDetectEnum :
        ( (*Automatically detects used snippets based on the alarm message*)
        mpALARMX_CFG_LIST_DISABLED := 0, (*Auto-Detect: Disabled*)
        mpALARMX_CFG_LIST_ENABLED := 1 (*Auto-Detect: Enabled*)
        );
    MpAlarmXCfgListAutoDetectType : STRUCT (*Automatically detects used snippets based on the alarm message*)
        Type : MpAlarmXCfgListAutoDetectEnum; (*Definition of Auto detect*)
        Enabled : MpAlarmXCfgListEnabledType; (*Auto-Detect: Enabled*)
    END_STRUCT;
    MpAlarmXCfgListSnippetPvType : STRUCT (*The snippet value comes from a Process Variable*)
        ProcessVariable : STRING[255]; (*Variable from which data should be added to the alarm text*)
    END_STRUCT;
    MpAlarmXCfgListValueEnum :
        ( (*Data source for the snippet data*)
        mpALARMX_CFG_LIST_SNIPPET_PV := 0 (*The snippet value comes from a Process Variable*)
        );
    MpAlarmXCfgListValueType : STRUCT (*Data source for the snippet data*)
        Type : MpAlarmXCfgListValueEnum; (*Definition of Value*)
        SnippetPv : MpAlarmXCfgListSnippetPvType; (*The snippet value comes from a Process Variable*)
    END_STRUCT;
    MpAlarmXCfgListSnippetType : STRUCT (*Alarm text snippet.*)
        Key : STRING[100]; (*Unique key of an alarm text snippet. This can be used to add application data to the alarm text (text system or alarm message).*)
        Value : MpAlarmXCfgListValueType; (*Data source for the snippet data*)
        Alarm : STRING[100]; (*Alarm name (pattern) of the session to which this snippet is attached (optional)*)
    END_STRUCT;
    MpAlarmXCfgListTextSnippetsType : STRUCT (*List of alarm text snippets*)
        AutoDetect : MpAlarmXCfgListAutoDetectType; (*Automatically detects used snippets based on the alarm message*)
        Snippet : MpBaseCfgArrayType; (*MpAlarmXCfgListSnippetType: Alarm text snippet.*)
    END_STRUCT;
    MpAlarmXCfgListType : STRUCT (*Complete MpAlarmXList configuration structure.*)
        AlarmList : MpAlarmXCfgListAlarmListType; (*List of user defined alarms*)
        TextSnippets : MpAlarmXCfgListTextSnippetsType; (*List of alarm text snippets*)
    END_STRUCT;
    MpAlarmXCfgQueryHistColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_INSTANCEID := 2, (*Instance ID column*)
        mpALARMX_CFG_QUERY_CODE := 3, (*Code column*)
        mpALARMX_CFG_QUERY_SEVERITY := 4, (*Severity column*)
        mpALARMX_CFG_QUERY_SCOPE := 5, (*Scope column*)
        mpALARMX_CFG_QUERY_STATECHANGE := 6, (*State change column*)
        mpALARMX_CFG_QUERY_TIMESTAMP := 7, (*Timestamp column*)
        mpALARMX_CFG_QUERY_ADDINFO1 := 8, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_ADDINFO2 := 9 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryOperatorsEnum :
        ( (*Available operators for query conditions*)
        mpALARMX_CFG_QUERY_LT := 0, (*Less Than*)
        mpALARMX_CFG_QUERY_LE := 0, (*Less Than or Equal*)
        mpALARMX_CFG_QUERY_GT := 0, (*Greater Than*)
        mpALARMX_CFG_QUERY_GE := 0, (*Greater Than or Equal*)
        mpALARMX_CFG_QUERY_EQ := 0, (*Equal*)
        mpALARMX_CFG_QUERY_NE := 0, (*Not Equal*)
        mpALARMX_CFG_QUERY_LIKE := 0 (*Like*)
        );
    MpAlarmXCfgQueryPendColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_PEND_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_PEND_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_PEND_INST_ID := 2, (*Instance ID column*)
        mpALARMX_CFG_QUERY_PEND_CODE := 3, (*Code column*)
        mpALARMX_CFG_QUERY_PEND_SEVERITY := 4, (*Severity column*)
        mpALARMX_CFG_QUERY_PEND_SCOPE := 5, (*Scope column*)
        mpALARMX_CFG_QUERY_PEND_STATEACT := 6, (*State active column*)
        mpALARMX_CFG_QUERY_PEND_STATEACK := 7, (*State acknowledged column*)
        mpALARMX_CFG_QUERY_PEND_STATECFM := 8, (*State confirmed column*)
        mpALARMX_CFG_QUERY_PEND_TIME := 9, (*Timestamp column*)
        mpALARMX_CFG_QUERY_PEND_TIME_ACK := 10, (*Timestamp acknowledge column*)
        mpALARMX_CFG_QUERY_PEND_ADDINFO1 := 11, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_PEND_ADDINFO2 := 12 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryConfColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_CONF_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_CONF_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_CONF_CODE := 2, (*Code column*)
        mpALARMX_CFG_QUERY_CONF_SEVERITY := 3, (*Severity column*)
        mpALARMX_CFG_QUERY_CONF_ADDINFO1 := 4, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_CONF_ADDINFO2 := 5 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryUpdateModeEnum :
        ( (*Defines when to update*)
        mpALARMX_CFG_QUERY_ON_CHANGE := 0, (*On every change*)
        mpALARMX_CFG_QUERY_ON_NEWREMOVED := 1 (*On new/removed alarms only*)
        );
    MpAlarmXCfgQueryPendColType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryPendColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryPendSelectType : STRUCT (*SELECT values to copy*)
        NumberOfColumns : UDINT; (*Defines the number of used elements inside the array Columns.*)
        Columns : ARRAY[0..14] OF MpAlarmXCfgQueryPendColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryValueType : STRUCT (*Compares against a defined value*)
        Value : STRING[255]; (**)
    END_STRUCT;
    MpAlarmXCfgQueryCompareToEnum :
        ( (*Type of comparison*)
        mpALARMX_CFG_QUERY_VALUE := 0, (*Compares against a defined value*)
        mpALARMX_CFG_QUERY_PV := 1 (*Compares against the value of a specified process variable*)
        );
    MpAlarmXCfgQueryCompareToType : STRUCT (*Type of comparison*)
        Type : MpAlarmXCfgQueryCompareToEnum; (*Definition of Compare To*)
        Value : MpAlarmXCfgQueryValueType; (*Compares against a defined value*)
    END_STRUCT;
    MpAlarmXCfgQueryPendCondType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryPendColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryPendWhereType : STRUCT (*Filter to be applied*)
        Connect : STRING[255]; (*Filter by logical operator*)
        NumberOfWhereFilter : UDINT; (*Defines the number of used elements inside the array WhereFilter.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryPendCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryPendingType : STRUCT (*Permits the query to return data from the current list of pending alarms*)
        Component : STRING[50]; (*The MpLink of the core component*)
        Select : MpAlarmXCfgQueryPendSelectType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryPendWhereType; (*Filter to be applied*)
    END_STRUCT;
    MpAlarmXCfgQueryConfColType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryConfColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryConfSelectType : STRUCT (*SELECT values to copy*)
        NumberOfColumns : UDINT; (*Defines the number of used elements inside the array Columns.*)
        Columns : ARRAY[0..9] OF MpAlarmXCfgQueryConfColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryConfCondType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryConfColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryConfWhereType : STRUCT (*Filter to be applied.*)
        Connect : STRING[255]; (*Filter by logical operator*)
        NumberOfWhereFilter : UDINT; (*Defines the number of used elements inside the array WhereFilter.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryConfCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryConfiguredType : STRUCT (*Data of all configured alarms returned by the query*)
        Component : STRING[50]; (*The MpLink of the core component*)
        Select : MpAlarmXCfgQueryConfSelectType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryConfWhereType; (*Filter to be applied.*)
    END_STRUCT;
    MpAlarmXCfgQueryHistColType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryHistColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryHistSelectType : STRUCT (*SELECT values to copy*)
        NumberOfColumns : UDINT; (*Defines the number of used elements inside the array Columns.*)
        Columns : ARRAY[0..14] OF MpAlarmXCfgQueryHistColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryHistCondType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryHistColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryHistWhereType : STRUCT (*Filter to be applied*)
        Connect : STRING[255]; (*Filter by logical operator*)
        NumberOfWhereFilter : UDINT; (*Defines the number of used elements inside the array WhereFilter.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryHistCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryHistoricalType : STRUCT (*Permits the query to return data from the current list of stored alarms*)
        Component : STRING[50]; (*The MpLink of the history component*)
        Select : MpAlarmXCfgQueryHistSelectType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryHistWhereType; (*Filter to be applied*)
    END_STRUCT;
    MpAlarmXCfgQuerySourceEnum :
        ( (*Data source that is queried*)
        mpALARMX_CFG_QUERY_PENDING := 0, (*Permits the query to return data from the current list of pending alarms*)
        mpALARMX_CFG_QUERY_CONFIGURED := 1, (*Data of all configured alarms returned by the query*)
        mpALARMX_CFG_QUERY_HISTORICAL := 2 (*Permits the query to return data from the current list of stored alarms*)
        );
    MpAlarmXCfgQuerySourceType : STRUCT (*Data source that is queried*)
        Type : MpAlarmXCfgQuerySourceEnum; (*Definition of Query source*)
        Pending : MpAlarmXCfgQueryPendingType; (*Permits the query to return data from the current list of pending alarms*)
        Configured : MpAlarmXCfgQueryConfiguredType; (*Data of all configured alarms returned by the query*)
        Historical : MpAlarmXCfgQueryHistoricalType; (*Permits the query to return data from the current list of stored alarms*)
    END_STRUCT;
    MpAlarmXCfgQuerySingleType : STRUCT (*User-defined queries*)
        Name : STRING[100]; (*Unique name for the query*)
        UpdateCount : STRING[255]; (*PV to which the update count for the query is written (increased whenever new data is available)*)
        UpdateMode : MpAlarmXCfgQueryUpdateModeEnum; (*Definition of update mode*)
        QuerySource : MpAlarmXCfgQuerySourceType; (*Data source that is queried*)
    END_STRUCT;
    MpAlarmXCfgQueryDataQueriesType : STRUCT (*List of queries*)
        Query : MpBaseCfgArrayType; (*MpAlarmXCfgQuerySingleType: User-defined queries*)
    END_STRUCT;
    MpAlarmXCfgQueryType : STRUCT (*Complete MpAlarmXQuery configuration structure.*)
        DataQueries : MpAlarmXCfgQueryDataQueriesType; (*List of queries*)
    END_STRUCT;
END_TYPE
