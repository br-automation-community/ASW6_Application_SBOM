TYPE
    MpAuditCfgEnum :
        (
        mpAUDIT_CFG_QUERIES := 190, (*MpAuditCfgQueryType: Root element of the Query configuration.*)
        mpAUDIT_CFG_TRAIL := 100 (*MpAuditCfgTrailType: Root of the MpAuditTrail configuration.*)
        );
    MpAuditCfgQueryColumnsType : STRUCT  (*MpAudit Query Columns*)
        EventIdentifier : STRING[3] := 'ev'; (*Event identifier*)
        EventTime : STRING[7] := 'evtime'; (*Event time*)
        EntryIndex : STRING[4] := 'idx'; (*Entry index*)
        EventDescription : STRING[5] := 'desc'; (*Event description*)
        OperatorName : STRING[3] := 'op'; (*Operator-Name who triggered event*)
        MappComponent : STRING[4] := 'map'; (*Related mapp component*)
        OldValue : STRING[4] := 'old'; (*Old value/state*)
        NewValue : STRING[4] := 'new'; (*New value/state*)
        Name : STRING[5] := 'name'; (*Alarm/File/Program name*)
        DeviceName : STRING[4] := 'dev'; (*DeviceName*)
        Path : STRING[5] := 'path'; (*Path to file*)
        Message : STRING[4] := 'msg'; (*CustomEvent / Alarm state change message*)
        Comment : STRING[4] := 'cmt'; (*Comment for custom/signature event*)
        ErrorNumber : STRING[4] := 'err'; (*Error number*)
        DatapointIdentifier : STRING[5] := 'dpid'; (*Data point identifier*)
        Time : STRING[5] := 'time'; (*Alarm time / Opc source event time*)
        AlarmCode : STRING[5] := 'code'; (*Alarm code*)
        Severity : STRING[4] := 'sev'; (*Alarm severity*)
        Object : STRING[4] := 'obj'; (*Object (role/user) that is affected*)
        Attribute : STRING[5] := 'attr'; (*User/Role Attribute, that was changed*)
        VC4Unit : STRING[5] := 'unit'; (*VC4 unit ID*)
        VC4UnitText : STRING[6] := 'utext'; (*VC4 unit text*)
        VC4SelectionTextgroup : STRING[4] := 'sel'; (*VC4 text group selection*)
        VisualisationName : STRING[4] := 'vis'; (*Visualization name*)
        CustomEventType : STRING[4] := 'typ'; (*Type of custom event*)
        OpcClientId : STRING[5] := 'clid'; (*OPC client ID*)
        OpcNodeName : STRING[9] := 'nodename'; (*OPC UA - Display name*)
        OpcNodeDescription : STRING[9] := 'nodedesc'; (*OPC UA - Description*)
        PackMLState : STRING[6] := 'state'; (*Current PackML - state*)
        PackMLMode : STRING[5] := 'mode'; (*PackML mode*)
        PackMLInfo : STRING[5] := 'info'; (*PackML description for synchronized mode*)
        FileSource : STRING[3] := 'src'; (*MpFile old file/folder path*)
        FileDest : STRING[4] := 'dest'; (*MpFile new file/folder path*)
        EventText : STRING[5] := 'text'; (*Rendered event text*)
        DisplayEventText : STRING[6] := 'dtext'; (*Rendered display text*)
    END_STRUCT;
    MpAuditCfgQueryOperatorsEnum :
        ( (*Available operators for query conditions*)
        mpAUDIT_CFG_QUERY_LT := 0, (*Less than*)
        mpAUDIT_CFG_QUERY_LE := 1, (*Less than or equal*)
        mpAUDIT_CFG_QUERY_GT := 2, (*Greater than*)
        mpAUDIT_CFG_QUERY_GE := 3, (*Greater than or equal*)
        mpAUDIT_CFG_QUERY_EQ := 4, (*Equal*)
        mpAUDIT_CFG_QUERY_NE := 5, (*Not equal*)
        mpAUDIT_CFG_QUERY_LIKE := 6 (*Like*)
        );
    MpAuditCfgQueryValueType : STRUCT (*Comparison value*)
        Value : STRING[255]; (*Comparison value*)
    END_STRUCT;
    MpAuditCfgQueryCompareToEnum :
        ( (*Comparison value*)
        mpAUDIT_CFG_QUERY_VALUE := 0, (*Comparison value*)
        mpAUDIT_CFG_QUERY_PV := 1 (*PV to Compare*)
        );
    MpAuditCfgQueryCompareToType : STRUCT (*Comparison value*)
        Type : MpAuditCfgQueryCompareToEnum; (*Definition of PvOrValue*)
        Value : MpAuditCfgQueryValueType; (*Comparison value*)
    END_STRUCT;
    MpAuditCfgQuerySelectColType : STRUCT (*A single select element in this query*)
        Column : STRING[255]; (*Name of a column to copy to a PV*)
        Pv : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAuditCfgQuerySelectType : STRUCT (*SELECT values to copy*)
        NumberOfColumns : UDINT; (*Defines the number of used elements inside the array Columns.*)
        Columns : ARRAY[0..19] OF MpAuditCfgQuerySelectColType; (*A single select element in this query*)
    END_STRUCT;
    MpAuditCfgQueryWhereFilterType : STRUCT (*Filter to use*)
        Column : STRING[255]; (*Name of the column to check*)
        Operator : MpAuditCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAuditCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAuditCfgQueryWhereType : STRUCT (*Filter to be applied*)
        Connect : STRING[255]; (*Filter by logical operator*)
        Filter : MpBaseCfgArrayType; (*MpAuditCfgQueryWhereFilterType: Filter to use*)
    END_STRUCT;
    MpAuditCfgQuerySingleType : STRUCT (*Query settings*)
        Name : STRING[100]; (*Unique name for the query*)
        UpdateCount : STRING[255]; (*PV to which the update count for the query is written (increased whenever new data is available)*)
        Component : STRING[50]; (*Mapp Component*)
        Select : MpAuditCfgQuerySelectType; (*SELECT values to copy*)
        Where : MpAuditCfgQueryWhereType; (*Filter to be applied*)
    END_STRUCT;
    MpAuditCfgQueryDataQueriesType : STRUCT (*Defines queries for accessing audit trail data*)
        Query : MpBaseCfgArrayType; (*MpAuditCfgQuerySingleType: Query settings*)
    END_STRUCT;
    MpAuditCfgQueryType : STRUCT (*MpAudit query configuration.*)
        DataQueries : MpAuditCfgQueryDataQueriesType; (*Defines queries for accessing audit trail data*)
    END_STRUCT;
    MpAuditCfgTrailArchiveModeEnum :
        ( (*List of possible archive modes*)
        mpAUDIT_CFG_TRAIL_ARCH_DAILY := 0, (*Archive daily*)
        mpAUDIT_CFG_TRAIL_ARCH_MO_TO_FR := 1, (*Archive monday through friday*)
        mpAUDIT_CFG_TRAIL_ARCH_BY_BATCH := 2 (*Archive by batch*)
        );
    MpAuditCfgTrailFileTypeEnum :
        ( (*List of possible file types*)
        mpAUDIT_CFG_TRAIL_TXT := 0, (*Store file as .txt*)
        mpAUDIT_CFG_TRAIL_XML := 1 (*Store file as .xml*)
        );
    MpAuditCfgTrailTaskClassEnum :
        ( (*The task class this component runs in*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_1 := 1, (*Task Class #1*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_2 := 2, (*Task Class #2*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_3 := 3, (*Task Class #3*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_4 := 4, (*Task Class #4*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_5 := 5, (*Task Class #5*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_6 := 6, (*Task Class #6*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_7 := 7, (*Task Class #7*)
        mpAUDIT_CFG_TRAIL_TC_CYCLIC_8 := 8 (*Task Class #8*)
        );
    MpAuditCfgTrailGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable/Disable of component*)
        EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
        CyclicTaskClass : MpAuditCfgTrailTaskClassEnum; (*Cyclic task class in which operation will take place*)
        Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
    END_STRUCT;
    MpAuditCfgTrailEventsType : STRUCT (*Defines which events will be logged*)
        Event : MpBaseCfgArrayType; (*UINT: Event that should be recorded*)
    END_STRUCT;
    MpAuditCfgTrailDataType : STRUCT (*UserRom with Dram memory configuration*)
        Size : UDINT; (*Memory reserved for storing audit events*)
        MaximumSaveInterval : UDINT; (*Defines after which time data is (latest) transferred from DRAM to UserROM*)
        BufferSize : UDINT; (*DRAM buffer size*)
    END_STRUCT;
    MpAuditCfgTrailMemoryEnum :
        ( (*Location where data will be stored*)
        mpAUDIT_CFG_TRAIL_ROM_DRAM := 0, (*UserRom with Dram memory configuration*)
        mpAUDIT_CFG_TRAIL_ROM_RAM := 1, (*UserRom with UserRam memory configuration*)
        mpAUDIT_CFG_TRAIL_RAM := 2 (*UserRam memory configuration*)
        );
    MpAuditCfgTrailMemoryType : STRUCT (*Location where data will be stored*)
        Type : MpAuditCfgTrailMemoryEnum; (*Definition of Memory*)
        Data : MpAuditCfgTrailDataType; (*UserRom with Dram memory configuration*)
    END_STRUCT;
    MpAuditCfgTrailTextSourceType : STRUCT (*Origin of the description text for the various events*)
        Display : STRING[255]; (*Describes, how the event - text should be displayed.*)
        Export : STRING[255]; (*Defines how the event text should look like when exporting. If the parameter is empty or "Same", the component uses the display text.*)
    END_STRUCT;
    MpAuditCfgTrailArchiveOnType : STRUCT (*Enables archiving*)
        Mode : MpAuditCfgTrailArchiveModeEnum; (*Defines how archiving takes place*)
        Time : UDINT; (*Defines when archiving takes place*)
        MaximumSize : UDINT; (*Size at which an archive is created regardless of the day/time*)
    END_STRUCT;
    MpAuditCfgTrailArchiveEnum :
        ( (*Enables/Disables the archive function*)
        mpAUDIT_CFG_TRAIL_ARCHIVE_OFF := 0, (*Disables archiving*)
        mpAUDIT_CFG_TRAIL_ARCHIVE_ON := 1 (*Enables archiving*)
        );
    MpAuditCfgTrailArchiveType : STRUCT (*Enables/Disables the archive function*)
        Type : MpAuditCfgTrailArchiveEnum; (*Definition of Archive*)
        On : MpAuditCfgTrailArchiveOnType; (*Enables archiving*)
    END_STRUCT;
    MpAuditCfgTrailExportType : STRUCT (*Specifies how the export takes place*)
        RawData : BOOL; (*Attaches raw data to the export file*)
        FileType : MpAuditCfgTrailFileTypeEnum; (*File type of the export file*)
        Encrypt : BOOL; (*Encrypts the export files*)
    END_STRUCT;
    MpAuditCfgTrailAuditType : STRUCT (*Audit specific configuration group*)
        EventList : MpAuditCfgTrailEventsType; (*Defines which events will be logged*)
        Memory : MpAuditCfgTrailMemoryType; (*Location where data will be stored*)
        Text : MpAuditCfgTrailTextSourceType; (*Origin of the description text for the various events*)
        Archive : MpAuditCfgTrailArchiveType; (*Enables/Disables the archive function*)
        Export : MpAuditCfgTrailExportType; (*Specifies how the export takes place*)
    END_STRUCT;
    MpAuditCfgTrailPvListType : STRUCT (*PV value to monitor*)
        Pv : STRING[255]; (*Fully qualified name of the PV to monitor (Scope::Task:Name)*)
        Identifier : STRING[255]; (*Identifier for this PV (if no identifier is specified, the PV name is used)*)
    END_STRUCT;
    MpAuditCfgTrailPvMonitorType : STRUCT (*List of process varaibles to monitor for value changes*)
        PvList : MpBaseCfgArrayType; (*MpAuditCfgTrailPvListType: PV value to monitor*)
    END_STRUCT;
    MpAuditCfgTrailType : STRUCT (*MpAuditTrail configuration*)
        General : MpAuditCfgTrailGeneralType; (*General Settings*)
        Audit : MpAuditCfgTrailAuditType; (*Audit specific configuration group*)
        VariableMonitor : MpAuditCfgTrailPvMonitorType; (*List of process varaibles to monitor for value changes*)
    END_STRUCT;
END_TYPE
