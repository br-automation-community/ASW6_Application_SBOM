/* Automation Studio generated header file */
/* Do not edit ! */
/* MpUserX 6.5.1 */

#ifndef _MPUSERX_
#define _MPUSERX_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpUserX_VERSION
#define _MpUserX_VERSION 6.5.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "MpBase.h"
#endif

#ifdef _SG4
		#include "MpBase.h"
#endif

#ifdef _SGC
		#include "MpBase.h"
#endif



/* Datatypes and datatypes of function blocks */
typedef enum MpUserXUIMessageEnum
{	mpUSERX_UI_MSG_NONE = 0,
	mpUSERX_UI_MSG_WARNING = 1,
	mpUSERX_UI_MSG_ERROR = 2,
	mpUSERX_UI_MSG_CONFIRM_DELETE = 3,
	mpUSERX_UI_MSG_CONFIRM_LOCK = 4,
	mpUSERX_UI_MSG_CONFIRM_UNLOCK = 5,
	mpUSERX_UI_MSG_CONFIRM_ROLE_DEL = 6
} MpUserXUIMessageEnum;

typedef enum MpUserXMgrUIImportConfirmEnum
{	mpUSERX_CONFIRM_USER = 0,
	mpUSERX_CONFIRM_ROLE = 1
} MpUserXMgrUIImportConfirmEnum;

typedef enum MpUserXUIStatusEnum
{	mpUSERX_UI_STATUS_IDLE = 0,
	mpUSERX_UI_STATUS_WAIT_DLG = 1,
	mpUSERX_UI_STATUS_EXECUTE = 2,
	mpUSERX_UI_STATUS_WARNING = 98,
	mpUSERX_UI_STATUS_ERROR = 99
} MpUserXUIStatusEnum;

typedef enum MpUserXUserTypeEnum
{	mpUSERX_USER_LOCAL = 0,
	mpUSERX_USER_CENTRAL = 1
} MpUserXUserTypeEnum;

typedef enum MpUserXMeasurementSystemEnum
{	mpUSERX_ENGINEERING_UNITS = 0,
	mpUSERX_METRIC = 1,
	mpUSERX_IMPERIAL = 2,
	mpUSERX_IMPERIAL_US = 3
} MpUserXMeasurementSystemEnum;

typedef enum MpUserXUIPasswordCriteriaEnum
{	mpUSERX_PASSWORD_CRIT_NONE = 0,
	mpUSERX_PASSWORD_CRIT_LENGTH = 1,
	mpUSERX_PASSWORD_CRIT_ALPHA = 2,
	mpUSERX_PASSWORD_CRIT_CASE = 3,
	mpUSERX_PASSWORD_CRIT_SPECIAL = 4
} MpUserXUIPasswordCriteriaEnum;

typedef enum MpUserXErrorEnum
{	mpUSERX_NO_ERROR = 0,
	mpUSERX_ERR_ACTIVATION = -1064239103,
	mpUSERX_ERR_MPLINK_NULL = -1064239102,
	mpUSERX_ERR_MPLINK_INVALID = -1064239101,
	mpUSERX_ERR_MPLINK_CHANGED = -1064239100,
	mpUSERX_ERR_MPLINK_CORRUPT = -1064239099,
	mpUSERX_ERR_MPLINK_IN_USE = -1064239098,
	mpUSERX_ERR_PAR_NULL = -1064239097,
	mpUSERX_ERR_CONFIG_NULL = -1064239096,
	mpUSERX_ERR_CONFIG_NO_PV = -1064239095,
	mpUSERX_ERR_CONFIG_LOAD = -1064239094,
	mpUSERX_WRN_CONFIG_LOAD = -2137980917,
	mpUSERX_ERR_CONFIG_SAVE = -1064239092,
	mpUSERX_ERR_CONFIG_INVALID = -1064239091,
	mpUSERX_ERR_USER_NOT_EXISTING = -1064144895,
	mpUSERX_ERR_USER_EXISTS = -1064144894,
	mpUSERX_ERR_INSUFFICIENT_RIGHTS = -1064144891,
	mpUSERX_ERR_ROLE_NOT_EXISTING = -1064144890,
	mpUSERX_ERR_USER_IS_LOCKED = -1064144888,
	mpUSERX_ERR_PASSWORD_CHANGE_REQ = -1064144887,
	mpUSERX_ERR_NO_ADMIN_RIGHTS = -1064144885,
	mpUSERX_ERR_LOGIN_INST_EXISTS = -1064144884,
	mpUSERX_ERR_NOT_LOGGED_IN = -1064144883,
	mpUSERX_WRN_PASSWORD_CHANGE_REQ = -2137886702,
	mpUSERX_ERR_ROLE_INDEX_NOT_OK = -1064144877,
	mpUSERX_ERR_NO_ROLENAME = -1064144876,
	mpUSERX_ERR_LOGGED_IN = -1064144875,
	mpUSERX_ERR_MISSING_UICONNECT = -1064144874,
	mpUSERX_ERR_NO_USERNAME = -1064144873,
	mpUSERX_ERR_NO_PASSWORD = -1064144872,
	mpUSERX_ERR_PASSWORD_CONFIRM = -1064144870,
	mpUSERX_ERR_IMPORT_DATA = -1064144868,
	mpUSERX_ERR_LOAD_IMPORT_FILE = -1064144867,
	mpUSERX_ERR_SAVE_EXPORT_FILE = -1064144866,
	mpUSERX_ERR_USERNAME_TOO_SHORT = -1064144861,
	mpUSERX_ERR_ROLE_EXISTS = -1064144860,
	mpUSERX_ERR_FAILED_SIGNATURES = -1064144858,
	mpUSERX_ERR_SIGNATURE_BUSY = -1064144857,
	mpUSERX_ERR_IMPORT_FILE_FORMAT = -1064144855,
	mpUSERX_WRN_KEY_DUPLICATE = -2137886678,
	mpUSERX_ERR_INFO_NOT_FOUND = -1064144853,
	mpUSERX_ERR_EMPTY_KEY = -1064144852,
	mpUSERX_ERR_BUFFER_TOO_SMALL = -1064144851,
	mpUSERX_ERR_LDAP_ERROR = -1064144850,
	mpUSERX_ERR_NO_SERVER_CONNECTION = -1064144849,
	mpUSERX_ERR_INVALID_CREDENTIALS = -1064144848,
	mpUSERX_ERR_ACTION_NOT_ALLOWED = -1064144847,
	mpUSERX_WRN_LDAP_WARNING = -2137886670,
	mpUSERX_ERR_PASSWORD_RESTRICTION = -1064144845,
	mpUSERX_ERR_FUNCTION_UNAVAILABLE = -1064144844,
	mpUSERX_WRN_PASSWORD_WILL_EXPIRE = -2137886667,
	mpUSERX_WRN_INVALID_DISPLAY_NAME = -2137886666,
	mpUSERX_ERR_REQUEST_LIMIT = -1064144841,
	mpUSERX_ERR_SESSION_LIMIT = -1064144840,
	mpUSERX_ERR_DELETE_BR_ROLE = -1064144839,
	mpUSERX_WRN_IMPORT_FILE_FORMAT = -2137886662,
	mpUSERX_WRN_IMPORT_DATA = -2137886661
} MpUserXErrorEnum;

typedef enum MpUserXCfgEnum
{	mpUSERX_CFG_CORE = 100,
	mpUSERX_CFG_LOGIN = 120,
	mpUSERX_CFG_MAPPING = 140,
	mpUSERX_CFG_SIGN = 160
} MpUserXCfgEnum;

typedef enum MpUserXCfgImportModesEnum
{	mpUSERX_CFG_IMPORT_SKIP = 0,
	mpUSERX_CFG_IMPORT_IGN_EXISTING = 1,
	mpUSERX_CFG_IMPORT_OVR_EXISTING = 2,
	mpUSERX_CFG_IMPORT_OVR_ONLY = 4,
	mpUSERX_CFG_IMPORT_RMV_EXISTING = 5
} MpUserXCfgImportModesEnum;

typedef enum MpUserXCfgUserMgmtSystemEnum
{	mpUSERX_CFG_LOCAL = 0,
	mpUSERX_CFG_CENTRAL = 1,
	mpUSERX_CFG_CENTRAL_THEN_LOCAL = 2,
	mpUSERX_CFG_LOCAL_THEN_CENTRAL = 3
} MpUserXCfgUserMgmtSystemEnum;

typedef enum MpUserXCfgAuthMethodEnum
{	mpUSERX_CFG_LDAPS = 0,
	mpUSERX_CFG_LDAPSTARTTLS = 1,
	mpUSERX_CFG_LDAP = 2
} MpUserXCfgAuthMethodEnum;

typedef enum MpUserXCfgServerTypeEnum
{	mpUSERX_CFG_ACTIVE_DIRECTORY = 0,
	mpUSERX_CFG_389_DIRECTORY_SERVER = 1
} MpUserXCfgServerTypeEnum;

typedef enum MpUserXCfgEditSameLevelEnum
{	mpUSERX_CFG_EDIT_SAME_LEVEL_NONE = 0,
	mpUSERX_CFG_EDIT_SAME_LEVEL_SELF = 1,
	mpUSERX_CFG_EDIT_SAME_LEVEL_ALL = 2
} MpUserXCfgEditSameLevelEnum;

typedef enum MpUserXCfgFileChecksumEnum
{	mpUSERX_CFG_CHECKSUM_IGNORE = 0,
	mpUSERX_CFG_CHECKSUM_WARNING = 1,
	mpUSERX_CFG_CHECKSUM_ERROR = 2
} MpUserXCfgFileChecksumEnum;

typedef struct MpUserXUIMessageBoxType
{	unsigned short LayerStatus;
	enum MpUserXUIMessageEnum Type;
	unsigned short ErrorNumber;
	signed long StatusID;
	plcbit Confirm;
	plcbit Cancel;
} MpUserXUIMessageBoxType;

typedef struct MpUserXMgrUIUserListType
{	plcwstring UserNames[20][101];
	unsigned short MaxSelection;
	unsigned short SelectedIndex;
	plcbit PageUp;
	plcbit StepUp;
	plcbit PageDown;
	plcbit StepDown;
	float RangeStart;
	float RangeEnd;
} MpUserXMgrUIUserListType;

typedef struct MpUserXMgrUIAdditionalDataType
{	plcwstring Key[101];
	plcwstring Value[256];
} MpUserXMgrUIAdditionalDataType;

typedef struct MpUserXMgrUIUserInfoType
{	plcwstring UserName[101];
	plcwstring FullName[101];
	unsigned short Roles[30];
	plcbit Locked;
	plcbit Expired;
	unsigned char RemainingAttempts;
	plcstring Language[21];
	enum MpUserXMeasurementSystemEnum MeasurementSystem;
	plcdt Creation;
	plcdt FirstLogin;
	plcdt LastLogin;
	plcdt PasswordExpired;
	struct MpUserXMgrUIAdditionalDataType AdditionalData[10];
	enum MpUserXUserTypeEnum UserType;
} MpUserXMgrUIUserInfoType;

typedef struct MpUserXMgrUIRoleListType
{	plcwstring Names[20][101];
	unsigned short SelectedIndex;
	unsigned short MaxSelection;
	plcbit PageUp;
	plcbit StepUp;
	plcbit PageDown;
	plcbit StepDown;
	float RangeStart;
	float RangeEnd;
} MpUserXMgrUIRoleListType;

typedef struct MpUserXMgrUIRoleInfoType
{	plcwstring Name[101];
	unsigned short Index;
	signed long Level;
	plcbit Admin;
} MpUserXMgrUIRoleInfoType;

typedef struct MpUserXMgrUIRoleDlgType
{	unsigned short LayerStatus;
	plcwstring Name[101];
	unsigned short Index;
	signed long Level;
	signed long LevelLimit;
	plcbit Admin;
	plcbit Confirm;
	plcbit Cancel;
} MpUserXMgrUIRoleDlgType;

typedef struct MpUserXMgrUIRoleCreateDlgType
{	unsigned short LayerStatus;
	plcwstring Name[101];
	signed long Level;
	signed long LevelLimit;
	plcbit Admin;
	plcbit Confirm;
	plcbit Cancel;
} MpUserXMgrUIRoleCreateDlgType;

typedef struct MpUserXMgrUIRoleCreateType
{	plcbit ShowDialog;
	plcbit Lock;
	struct MpUserXMgrUIRoleCreateDlgType Dialog;
} MpUserXMgrUIRoleCreateType;

typedef struct MpUserXMgrUIRoleEditType
{	plcbit ShowDialog;
	plcbit Lock;
	struct MpUserXMgrUIRoleDlgType Dialog;
} MpUserXMgrUIRoleEditType;

typedef struct MpUserXMgrUICreateDlgType
{	unsigned short LayerStatus;
	plcwstring UserName[101];
	plcwstring FullName[101];
	unsigned short Roles[30];
	unsigned char RoleOption[30];
	plcwstring NewPassword[101];
	plcwstring ConfirmPassword[101];
	plcstring Language[21];
	enum MpUserXMeasurementSystemEnum MeasurementSystem;
	enum MpUserXUIPasswordCriteriaEnum CriteriaNotMet;
	unsigned short NewPasswordOk;
	unsigned short ConfirmPasswordOk;
	unsigned short UserNameOk;
	plcbit Confirm;
	plcbit Cancel;
	struct MpUserXMgrUIAdditionalDataType AdditionalData[10];
} MpUserXMgrUICreateDlgType;

typedef struct MpUserXMgrUICreateType
{	plcbit ShowDialog;
	plcbit Lock;
	struct MpUserXMgrUICreateDlgType Dialog;
} MpUserXMgrUICreateType;

typedef struct MpUserXMgrUIExportDlgType
{	unsigned short LayerStatus;
	plcstring FileName[256];
	plcbit Confirm;
	plcbit Cancel;
} MpUserXMgrUIExportDlgType;

typedef struct MpUserXMgrUIExportType
{	plcbit ShowDialog;
	struct MpUserXMgrUIExportDlgType Dialog;
} MpUserXMgrUIExportType;

typedef struct MpUserXMgrUISetupConfirmType
{	plcbit OverwriteUser;
	plcbit OverwriteRole;
} MpUserXMgrUISetupConfirmType;

typedef struct MpUserXMgrUISetupType
{	unsigned short UserListSize;
	unsigned char ScrollWindow;
	plcstring FileDevice[21];
	plcstring FileExtension[21];
	unsigned short RoleListSize;
	struct MpUserXMgrUISetupConfirmType Confirmation;
} MpUserXMgrUISetupType;

typedef struct MpUserXMgrUIImportListType
{	plcstring FileNames[5][256];
	unsigned short SelectedIndex;
	unsigned short MaxSelection;
} MpUserXMgrUIImportListType;

typedef struct MpUserXMgrUIImportDlgType
{	unsigned short LayerStatus;
	struct MpUserXMgrUIImportListType List;
	plcstring FileName[256];
	plcbit Users;
	plcbit Roles;
	plcbit Confirm;
	plcbit Cancel;
} MpUserXMgrUIImportDlgType;

typedef struct MpUserXMgrUIImportConfirmType
{	unsigned short LayerStatus;
	enum MpUserXMgrUIImportConfirmEnum Type;
	plcwstring Name[101];
	unsigned short NumberOfConflicts;
	plcbit ApplyForAll;
	plcbit Confirm;
	plcbit Cancel;
} MpUserXMgrUIImportConfirmType;

typedef struct MpUserXMgrUIImportType
{	plcbit ShowDialog;
	struct MpUserXMgrUIImportDlgType Dialog;
	struct MpUserXMgrUIImportConfirmType ConfirmDialog;
} MpUserXMgrUIImportType;

typedef struct MpUserXMgrUIUserType
{	struct MpUserXMgrUIUserListType List;
	struct MpUserXMgrUIUserInfoType Info;
	struct MpUserXMgrUICreateType Create;
	struct MpUserXMgrUICreateType Edit;
	plcbit Remove;
	plcbit Lock;
} MpUserXMgrUIUserType;

typedef struct MpUserXMgrUIRoleSelectType
{	plcwstring Names[30][101];
	unsigned short MaxSelection;
} MpUserXMgrUIRoleSelectType;

typedef struct MpUserXMgrUIRoleType
{	struct MpUserXMgrUIRoleListType List;
	struct MpUserXMgrUIRoleInfoType Info;
	struct MpUserXMgrUIRoleEditType Edit;
	struct MpUserXMgrUIRoleCreateType Create;
	plcbit Remove;
	struct MpUserXMgrUIRoleSelectType SelectList;
} MpUserXMgrUIRoleType;

typedef struct MpUserXMgrUIConnectType
{	unsigned short DefaultLayerStatus;
	enum MpUserXUIStatusEnum Status;
	struct MpUserXMgrUIUserType User;
	struct MpUserXMgrUIRoleType Role;
	struct MpUserXUIMessageBoxType MessageBox;
	struct MpUserXMgrUIExportType Export;
	struct MpUserXMgrUIImportType Import;
} MpUserXMgrUIConnectType;

typedef struct MpUserXLoginUIPwdDlgType
{	plcwstring OldPassword[101];
	plcwstring NewPassword[101];
	plcwstring ConfirmPassword[101];
	unsigned short LayerStatus;
	plcbit Confirm;
	plcbit Cancel;
	enum MpUserXUIPasswordCriteriaEnum CriteriaNotMet;
	unsigned short NewPasswordOk;
	unsigned short ConfirmPasswordOk;
} MpUserXLoginUIPwdDlgType;

typedef struct MpUserXLoginUIPwdType
{	plcbit ShowDialog;
	struct MpUserXLoginUIPwdDlgType Dialog;
} MpUserXLoginUIPwdType;

typedef struct MpUserXLoginUILoginType
{	plcbit Login;
	plcbit Logout;
	plcwstring UserName[101];
	plcwstring Password[101];
} MpUserXLoginUILoginType;

typedef struct MpUserXLoginUIConnectType
{	enum MpUserXUIStatusEnum Status;
	plcwstring CurrentUser[101];
	plcstring Language[21];
	enum MpUserXMeasurementSystemEnum MeasurementSystem;
	plcbit LoggedIn;
	signed long UserLevel;
	struct MpUserXLoginUILoginType Login;
	struct MpUserXLoginUIPwdType ChangePassword;
	struct MpUserXUIMessageBoxType MessageBox;
	unsigned short DefaultLayerStatus;
	enum MpUserXUserTypeEnum UserType;
} MpUserXLoginUIConnectType;

typedef struct MpUserXSignatureUIDlgType
{	unsigned short LayerStatus;
	plcwstring UserName[101];
	plcwstring Password[101];
	plcwstring Comment[101];
	plcbit Confirm;
	plcbit Cancel;
} MpUserXSignatureUIDlgType;

typedef struct MpUserXSignatureUIConnectType
{	enum MpUserXUIStatusEnum Status;
	struct MpUserXSignatureUIDlgType Dialog;
	struct MpUserXUIMessageBoxType MessageBox;
	unsigned short DefaultLayerStatus;
} MpUserXSignatureUIConnectType;

typedef struct MpUserXStatusIDType
{	enum MpUserXErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpUserXStatusIDType;

typedef struct MpUserXDiagType
{	struct MpUserXStatusIDType StatusID;
} MpUserXDiagType;

typedef struct MpUserXLoginInfoType
{	plctime AutoLogoutRemain;
	struct MpUserXDiagType Diag;
	signed long DaysUntilPasswordExpiration;
	enum MpUserXUserTypeEnum UserType;
} MpUserXLoginInfoType;

typedef struct MpUserXManagerUIInfoType
{	struct MpUserXDiagType Diag;
} MpUserXManagerUIInfoType;

typedef struct MpUserXLoginUIInfoType
{	struct MpUserXDiagType Diag;
} MpUserXLoginUIInfoType;

typedef struct MpUserXSignatureUIInfoType
{	struct MpUserXDiagType Diag;
} MpUserXSignatureUIInfoType;

typedef struct MpUserXSignatureInfoType
{	struct MpUserXDiagType Diag;
} MpUserXSignatureInfoType;

typedef struct MpUserXInternalType
{	unsigned long pObject;
	unsigned long pInstance;
	signed long State;
} MpUserXInternalType;

typedef struct MpUserXCfgGeneralType
{	plcbit EnableAuditing;
} MpUserXCfgGeneralType;

typedef struct MpUserXCfgUserMgmtType
{	enum MpUserXCfgUserMgmtSystemEnum Type;
} MpUserXCfgUserMgmtType;

typedef struct MpUserXCfgHostType
{	plcstring Host[254];
	enum MpUserXCfgAuthMethodEnum AuthMethod;
	signed long Port;
	plcstring Certificate[256];
	plcstring BaseDN[256];
} MpUserXCfgHostType;

typedef struct MpUserXCfgHostsType
{	unsigned long NumberOfHosts;
	struct MpUserXCfgHostType Hosts[1];
} MpUserXCfgHostsType;

typedef struct MpUserXCfgGroupToRoleMappingType
{	plcstring MappingTableName[33];
} MpUserXCfgGroupToRoleMappingType;

typedef struct MpUserXCfgAddUserDataType
{	unsigned long NumberOfAttributeName;
	plcstring AttributeName[10][101];
} MpUserXCfgAddUserDataType;

typedef struct MpUserXCfgServerType
{	struct MpUserXCfgHostsType Hosts;
	signed long Timeout;
	struct MpUserXCfgGroupToRoleMappingType GroupToRoleMapping;
	plcstring DisplayName[101];
	struct MpUserXCfgAddUserDataType AddUserData;
} MpUserXCfgServerType;

typedef struct MpUserXCfgServerTypeType
{	enum MpUserXCfgServerTypeEnum Type;
	struct MpUserXCfgServerType Server;
} MpUserXCfgServerTypeType;

typedef struct MpUserXCfgServerSettingsType
{	struct MpUserXCfgServerTypeType Server;
} MpUserXCfgServerSettingsType;

typedef struct MpUserXCfgPasswordPolicyType
{	signed long MaxAge;
	signed long ExpirationNotification;
	unsigned short HistorySize;
	plcbit ChangeRequired;
	plcbit RequireMixedCaseCharacters;
	plcbit RequireAlphanumericCharacters;
	plcbit RequireSpecialCharacters;
	unsigned short MinLength;
} MpUserXCfgPasswordPolicyType;

typedef struct MpUserXCfgUserAccountType
{	unsigned short InvalidPasswordAttempts;
	signed long UserExpirationTime;
	signed long AutoLogoutTime;
	unsigned short MinUsernameLength;
	plcbit PreventUsernameReuse;
	signed long AdminUnlockTime;
	enum MpUserXCfgEditSameLevelEnum EditSameLevel;
} MpUserXCfgUserAccountType;

typedef struct MpUserXCfgImportExportType
{	enum MpUserXCfgImportModesEnum UserImportMode;
	enum MpUserXCfgImportModesEnum RoleImportMode;
	plcbit UncheckedImport;
	enum MpUserXCfgFileChecksumEnum FileChecksum;
} MpUserXCfgImportExportType;

typedef struct MpUserXCfgType
{	struct MpUserXCfgGeneralType General;
	struct MpUserXCfgUserMgmtType UserMgmt;
	struct MpUserXCfgServerSettingsType Server;
	struct MpUserXCfgPasswordPolicyType PasswordPolicy;
	struct MpUserXCfgUserAccountType UserAccount;
	struct MpUserXCfgImportExportType ImportExport;
} MpUserXCfgType;

typedef struct MpUserXCfgLoginGeneralType
{	plcbit Enable;
	plcbit EnableCockpit;
	plcbit EnableAuditing;
	plcstring Parent[51];
} MpUserXCfgLoginGeneralType;

typedef struct MpUserXCfgLoginType
{	struct MpUserXCfgLoginGeneralType General;
} MpUserXCfgLoginType;

typedef struct MpUserXCfgMappingEntryType
{	plcstring LocalRole[101];
	plcstring ServerGroup[256];
} MpUserXCfgMappingEntryType;

typedef struct MpUserXCfgMappingType
{	struct MpBaseCfgArrayType Mappings;
} MpUserXCfgMappingType;

typedef struct MpUserXCfgSignGeneralType
{	plcbit Enable;
	plcbit EnableCockpit;
	plcbit EnableAuditing;
	plcstring Parent[51];
} MpUserXCfgSignGeneralType;

typedef struct MpUserXCfgSignActionType
{	signed long ActionID;
	signed long UserLevel;
} MpUserXCfgSignActionType;

typedef struct MpUserXCfgSignActionsType
{	struct MpBaseCfgArrayType Actions;
} MpUserXCfgSignActionsType;

typedef struct MpUserXCfgSignSignatureType
{	unsigned short MaxAttempts;
	signed long MinUserLevel;
	plcstring Identifier[101];
	struct MpUserXCfgSignActionsType Actions;
} MpUserXCfgSignSignatureType;

typedef struct MpUserXCfgSignType
{	struct MpUserXCfgSignGeneralType General;
	struct MpUserXCfgSignSignatureType Signature;
} MpUserXCfgSignType;

typedef struct MpUserXLogin
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	signed long LifeSign;
	plcwstring *UserName;
	plcwstring *Password;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	plcwstring CurrentUser[101];
	signed long CurrentLevel;
	struct MpUserXLoginInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[23];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Login;
	plcbit Logout;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpUserXLogin_typ;

typedef struct MpUserXManagerUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpUserXMgrUISetupType UISetup;
	struct MpUserXMgrUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpUserXManagerUIInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[57];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpUserXManagerUI_typ;

typedef struct MpUserXLoginUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	struct MpUserXLoginUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpUserXLoginUIInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[24];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpUserXLoginUI_typ;

typedef struct MpUserXSignatureUI
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	signed long SignAction;
	struct MpUserXSignatureUIConnectType* UIConnect;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpUserXSignatureUIInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[24];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} MpUserXSignatureUI_typ;

typedef struct MpUserXSignature
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	signed long ActionID;
	struct MpUserXSignatureInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[9];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit Released;
	plcbit Rejected;
} MpUserXSignature_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpUserXLogin(struct MpUserXLogin* inst);
_BUR_PUBLIC void MpUserXManagerUI(struct MpUserXManagerUI* inst);
_BUR_PUBLIC void MpUserXLoginUI(struct MpUserXLoginUI* inst);
_BUR_PUBLIC void MpUserXSignatureUI(struct MpUserXSignatureUI* inst);
_BUR_PUBLIC void MpUserXSignature(struct MpUserXSignature* inst);
_BUR_PUBLIC signed long MpUserXLevel(struct MpComIdentType* MpLink);
_BUR_PUBLIC plcbit MpUserXHasRole(struct MpComIdentType* MpLink, plcwstring* Role);
_BUR_PUBLIC signed long MpUserXGetData(plcwstring* UserName, plcwstring* Key, plcwstring* Value, unsigned long ValueSize);


#ifdef __cplusplus
};
#endif
#endif /* _MPUSERX_ */

