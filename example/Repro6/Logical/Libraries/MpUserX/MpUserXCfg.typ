TYPE
    MpUserXCfgEnum :
        (
        mpUSERX_CFG_CORE := 100, (*MpUserXCfgType: Root element of the Core Configuration*)
        mpUSERX_CFG_LOGIN := 120, (*MpUserXCfgLoginType: Root element of the Login Configuration*)
        mpUSERX_CFG_MAPPING := 140, (*MpUserXCfgMappingType: Root element of the Mapping Configuration*)
        mpUSERX_CFG_SIGN := 160 (*MpUserXCfgSignType: Root element of the Sign Configuration*)
        );
    MpUserXCfgImportModesEnum :
        ( (*Import modes*)
        mpUSERX_CFG_IMPORT_SKIP := 0, (*Skip*)
        mpUSERX_CFG_IMPORT_IGN_EXISTING := 1, (*Ignore existing items*)
        mpUSERX_CFG_IMPORT_OVR_EXISTING := 2, (*Overwrite existing items*)
        mpUSERX_CFG_IMPORT_OVR_ONLY := 4, (*Overwrite items only*)
        mpUSERX_CFG_IMPORT_RMV_EXISTING := 5 (*Remove existing items*)
        );
    MpUserXCfgGeneralType : STRUCT (*General Settings*)
        EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
    END_STRUCT;
    MpUserXCfgUserMgmtSystemEnum :
        ( (*User management system types*)
        mpUSERX_CFG_LOCAL := 0, (*Local user management system. Users are managed locally on the machine.*)
        mpUSERX_CFG_CENTRAL := 1, (*Central user management system. Users are managed centrally on a directory server.*)
        mpUSERX_CFG_CENTRAL_THEN_LOCAL := 2, (*Local and central user management system. Users can be managed locally on the machine and centrally on the directory server. The central user management system has priority.*)
        mpUSERX_CFG_LOCAL_THEN_CENTRAL := 3 (*Local and central user management system. Users can be managed locally on the machine and centrally on the directory server. The local user management system has priority.*)
        );
    MpUserXCfgUserMgmtType : STRUCT (*General settings to define which user management system is used*)
        Type : MpUserXCfgUserMgmtSystemEnum; (*Defines the type of user management system*)
    END_STRUCT;
    MpUserXCfgAuthMethodEnum :
        ( (*Authentication method*)
        mpUSERX_CFG_LDAPS := 0, (*Secure connection via LDAP over SSL/ TLS*)
        mpUSERX_CFG_LDAPSTARTTLS := 1, (*Secure connection via LDAP + StartTLS*)
        mpUSERX_CFG_LDAP := 2 (*Insecure connection via LDAP*)
        );
    MpUserXCfgHostType : STRUCT (*Host information*)
        Host : STRING[253]; (*Enter server's DNS name*)
        AuthMethod : MpUserXCfgAuthMethodEnum; (*Defines the connection that is used for server requests*)
        Port : DINT; (*Port*)
        Certificate : STRING[255]; (*Server certificate name*)
        BaseDN : STRING[255]; (*Base distinguished name. Point from where the server will start its search for user data.*)
    END_STRUCT;
    MpUserXCfgHostsType : STRUCT (*Settings of the host*)
        NumberOfHosts : UDINT; (*Defines the number of used elements inside the array Hosts.*)
        Hosts : ARRAY[0..0] OF MpUserXCfgHostType; (*Host information*)
    END_STRUCT;
    MpUserXCfgGroupToRoleMappingType : STRUCT (*Group to role mapping*)
        MappingTableName : STRING[32]; (*Name of mapping table that should be used*)
    END_STRUCT;
    MpUserXCfgAddUserDataType : STRUCT (*Additional user data (Active Directory attributes)*)
        NumberOfAttributeName : UDINT; (*Defines the number of used elements inside the array AttributeName.*)
        AttributeName : ARRAY[0..9] OF STRING[100]; (*Attribute's common name on the AD server in LDAP readable format*)
    END_STRUCT;
    MpUserXCfgServerType : STRUCT (*Active Directory*)
        Hosts : MpUserXCfgHostsType; (*Settings of the host*)
        Timeout : DINT; (*Server request will be dropped after specified time when connection to server is lost.*)
        GroupToRoleMapping : MpUserXCfgGroupToRoleMappingType; (*Group to role mapping*)
        DisplayName : STRING[100]; (*Defines the attribute that will be used as display name*)
        AddUserData : MpUserXCfgAddUserDataType; (*Additional user data (Active Directory attributes)*)
    END_STRUCT;
    MpUserXCfgServerTypeEnum :
        ( (*Server Type*)
        mpUSERX_CFG_ACTIVE_DIRECTORY := 0, (*Active Directory*)
        mpUSERX_CFG_389_DIRECTORY_SERVER := 1 (*389 Directory Server*)
        );
    MpUserXCfgServerTypeType : STRUCT (*Server Type*)
        Type : MpUserXCfgServerTypeEnum; (*Definition of Server*)
        Server : MpUserXCfgServerType; (*Active Directory*)
    END_STRUCT;
    MpUserXCfgServerSettingsType : STRUCT (*Central user management system specific settings*)
        Server : MpUserXCfgServerTypeType; (*Server Type*)
    END_STRUCT;
    MpUserXCfgPasswordPolicyType : STRUCT (*Password specific settings*)
        MaxAge : DINT; (*Time until the password must be changed at the latest.*)
        ExpirationNotification : DINT; (*Defines how long before password expiration users should receive a password expiration notification.*)
        HistorySize : UINT; (*Specifies the number of previously used passwords that cannot be reused.*)
        ChangeRequired : BOOL; (*Password change is required on the first user login.*)
        RequireMixedCaseCharacters : BOOL; (*Password must have both upper- and lower case letters.*)
        RequireAlphanumericCharacters : BOOL; (*Password must have alpha-numeric characters.*)
        RequireSpecialCharacters : BOOL; (*Password must have special characters.*)
        MinLength : UINT; (*Minimum password length.*)
    END_STRUCT;
    MpUserXCfgEditSameLevelEnum :
        ( (*Specifies whether an admin-user is allowed to modify users and roles with the same user-level.*)
        mpUSERX_CFG_EDIT_SAME_LEVEL_NONE := 0, (*Admin users cannot edit users or roles with the same user-level, only users and roles with lower user-levels can be edited.*)
        mpUSERX_CFG_EDIT_SAME_LEVEL_SELF := 1, (*Admin users can only edit themselves. Other users or roles with the same user-level cannot be edited.*)
        mpUSERX_CFG_EDIT_SAME_LEVEL_ALL := 2 (*Admin users can edit users and roles with the same user-level.*)
        );
    MpUserXCfgUserAccountType : STRUCT (*User account specific settings*)
        InvalidPasswordAttempts : UINT; (*Maximum number of failed verification attempts until the user is locked.*)
        UserExpirationTime : DINT; (*Expiration time for the validity of the user account.*)
        AutoLogoutTime : DINT; (*Time after which login sessions on the system are automatically terminated in case of inactivity.*)
        MinUsernameLength : UINT; (*Minimum username length.*)
        PreventUsernameReuse : BOOL; (*Defines if a user's username may be reused after their removal.*)
        AdminUnlockTime : DINT; (*Time after which admin-users are automatically unlocked.*)
        EditSameLevel : MpUserXCfgEditSameLevelEnum; (*Specifies whether an admin-user is allowed to modify users and roles with the same user-level.*)
    END_STRUCT;
    MpUserXCfgFileChecksumEnum :
        ( (*File Checksum Behaviour*)
        mpUSERX_CFG_CHECKSUM_IGNORE := 0, (*Entries will be imported and neither warning nor error will be returned.*)
        mpUSERX_CFG_CHECKSUM_WARNING := 1, (*Entries will be imported and warning will be returned.*)
        mpUSERX_CFG_CHECKSUM_ERROR := 2 (*Entries will not be imported and error will be returned.*)
        );
    MpUserXCfgImportExportType : STRUCT (*Import- and export specific settings*)
        UserImportMode : MpUserXCfgImportModesEnum; (*Defines mode for the import of users.*)
        RoleImportMode : MpUserXCfgImportModesEnum; (*Defines mode for the import of roles.*)
        UncheckedImport : BOOL; (*Ignore check-sum for entries in input-file.*)
        FileChecksum : MpUserXCfgFileChecksumEnum; (*Defines behaviour when input-file's checksum is invalid or missing*)
    END_STRUCT;
    MpUserXCfgType : STRUCT (*MpUserX configuration*)
        General : MpUserXCfgGeneralType; (*General Settings*)
        UserMgmt : MpUserXCfgUserMgmtType; (*General settings to define which user management system is used*)
        Server : MpUserXCfgServerSettingsType; (*Central user management system specific settings*)
        PasswordPolicy : MpUserXCfgPasswordPolicyType; (*Password specific settings*)
        UserAccount : MpUserXCfgUserAccountType; (*User account specific settings*)
        ImportExport : MpUserXCfgImportExportType; (*Import- and export specific settings*)
    END_STRUCT;
    MpUserXCfgLoginGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable/Disable of component*)
        EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
        EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
        Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
    END_STRUCT;
    MpUserXCfgLoginType : STRUCT (*MpUserXLogin configuration*)
        General : MpUserXCfgLoginGeneralType; (*General Settings*)
    END_STRUCT;
    MpUserXCfgMappingEntryType : STRUCT (*Group to role mapping*)
        LocalRole : STRING[100]; (*Local role*)
        ServerGroup : STRING[255]; (*Server group*)
    END_STRUCT;
    MpUserXCfgMappingType : STRUCT (*MpUserXMapping configuration*)
        Mappings : MpBaseCfgArrayType; (*MpUserXCfgMappingEntryType: Group to role mapping*)
    END_STRUCT;
    MpUserXCfgSignGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable/Disable of component*)
        EnableCockpit : BOOL; (*Enable mapp Cockpit interface*)
        EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
        Parent : STRING[50]; (*Optional parent of this component (when grouping should be done)*)
    END_STRUCT;
    MpUserXCfgSignActionType : STRUCT (*Action*)
        ActionID : DINT; (*Action to specify a required user-level for*)
        UserLevel : DINT; (*Minimum necessary user-level required for this action*)
    END_STRUCT;
    MpUserXCfgSignActionsType : STRUCT (*Minimum necessary user-levels required for certain actions (if different to default)*)
        Actions : MpBaseCfgArrayType; (*MpUserXCfgSignActionType: Action*)
    END_STRUCT;
    MpUserXCfgSignSignatureType : STRUCT (*Signature configuration*)
        MaxAttempts : UINT; (*Maximum number of signature attempts before the signature procedure is aborted*)
        MinUserLevel : DINT; (*Minimum necessary user-level required for the signature*)
        Identifier : STRING[100]; (*Identifier used for this action (if not specified then the SysE-Name is used)*)
        Actions : MpUserXCfgSignActionsType; (*Minimum necessary user-levels required for certain actions (if different to default)*)
    END_STRUCT;
    MpUserXCfgSignType : STRUCT (*MpUserXSign configuration*)
        General : MpUserXCfgSignGeneralType; (*General Settings*)
        Signature : MpUserXCfgSignSignatureType; (*Signature configuration*)
    END_STRUCT;
END_TYPE
