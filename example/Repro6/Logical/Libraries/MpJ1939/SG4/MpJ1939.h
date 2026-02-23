/* Automation Studio generated header file */
/* Do not edit ! */
/* MpJ1939 6.5.1 */

#ifndef _MPJ1939_
#define _MPJ1939_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpJ1939_VERSION
#define _MpJ1939_VERSION 6.5.1
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
typedef enum MpJ1939ACCRSEnum
{	mpJ1939_ACCRS_NOT_AVAILABLE = 3,
	mpJ1939_ACCRS_ERROR_CONDITION = 2,
	mpJ1939_ACCRS_ON = 1,
	mpJ1939_ACCRS_OFF = 0
} MpJ1939ACCRSEnum;

typedef enum MpJ1939ACHPFSEnum
{	mpJ1939_ACHPFS_NOT_AVAILABLE = 3,
	mpJ1939_ACHPFS_ERROR = 2,
	mpJ1939_ACHPFS_PRESSURE_HIGH = 1,
	mpJ1939_ACHPFS_PRESSURE_NORMAL = 0
} MpJ1939ACHPFSEnum;

typedef enum MpJ1939AEBSRSEnum
{	mpJ1939_AEBSRS_NOT_AVAILABLE = 3,
	mpJ1939_AEBSRS_ERROR = 2,
	mpJ1939_AEBSRS_ON = 1,
	mpJ1939_AEBSRS_OFF = 0
} MpJ1939AEBSRSEnum;

typedef enum MpJ1939AEPTHREnum
{	mpJ1939_AEPTHR_0875 = 7,
	mpJ1939_AEPTHR_0125 = 1,
	mpJ1939_AEPTHR_0000 = 0
} MpJ1939AEPTHREnum;

typedef enum MpJ1939AFT1DPFCNMFAREnum
{	mpJ1939_AFT1DPFCNMFAR_NOT_AVAILA = 3,
	mpJ1939_AFT1DPFCNMFAR_RESERVED = 2,
	mpJ1939_AFT1DPFCNMFAR_INHIBIT = 1,
	mpJ1939_AFT1DPFCNMFAR_NOT_INHIBI = 0
} MpJ1939AFT1DPFCNMFAREnum;

typedef enum MpJ1939AFT1EDPEnum
{	mpJ1939_AFT1EDP_NOT_AVAILABLE = 3,
	mpJ1939_AFT1EDP_ERROR = 2,
	mpJ1939_AFT1EDP_EXCEEDED = 1,
	mpJ1939_AFT1EDP_NOT_EXCEED = 0
} MpJ1939AFT1EDPEnum;

typedef enum MpJ1939AFT1IDPEnum
{	mpJ1939_AFT1IDP_NOT_AVAILABLE = 3,
	mpJ1939_AFT1IDP_ERROR = 2,
	mpJ1939_AFT1IDP_EXCEEDED = 1,
	mpJ1939_AFT1IDP_NOT_EXCEED = 0
} MpJ1939AFT1IDPEnum;

typedef enum MpJ1939AFT2EDPEnum
{	mpJ1939_AFT2EDP_NOT_AVAILABLE = 3,
	mpJ1939_AFT2EDP_ERROR = 2,
	mpJ1939_AFT2EDP_EXCEEDED = 1,
	mpJ1939_AFT2EDP_NOT_EXCEED = 0
} MpJ1939AFT2EDPEnum;

typedef enum MpJ1939AFT2IDPEnum
{	mpJ1939_AFT2IDP_NOT_AVAILABLE = 3,
	mpJ1939_AFT2IDP_ERROR = 2,
	mpJ1939_AFT2IDP_EXCEEDED = 1,
	mpJ1939_AFT2IDP_NOT_EXCEED = 0
} MpJ1939AFT2IDPEnum;

typedef enum MpJ1939AFTDPFARSEnum
{	mpJ1939_AFTDPFARS_NOT_AVAILABLE = 3,
	mpJ1939_AFTDPFARS_NEEDED = 2,
	mpJ1939_AFTDPFARS_ACTIVE = 1,
	mpJ1939_AFTDPFARS_NOT_ACTIVE = 0
} MpJ1939AFTDPFARSEnum;

typedef enum MpJ1939AFTDPFPRSEnum
{	mpJ1939_AFTDPFPRS_NOT_AVAILABLE = 3,
	mpJ1939_AFTDPFPRS_RESERVED = 2,
	mpJ1939_AFTDPFPRS_ACTIVE = 1,
	mpJ1939_AFTDPFPRS_NOT_ACTIVE = 0
} MpJ1939AFTDPFPRSEnum;

typedef enum MpJ1939AFTDPFSEnum
{	mpJ1939_AFTDPFS_NOT_AVAILABLE = 7,
	mpJ1939_AFTDPFS_RESERVED6 = 6,
	mpJ1939_AFTDPFS_RESERVED5 = 5,
	mpJ1939_AFTDPFS_RESERVED4 = 4,
	mpJ1939_AFTDPFS_HIGHEST_LEVEL = 3,
	mpJ1939_AFTDPFS_MODERATE_LEVEL = 2,
	mpJ1939_AFTDPFS_LOWEST_LEVEL = 1,
	mpJ1939_AFTDPFS_NOT_NEEDED = 0
} MpJ1939AFTDPFSEnum;

typedef enum MpJ1939AFTRFSEnum
{	mpJ1939_AFTRFS_NOT_AVAILABLE = 3,
	mpJ1939_AFTRFS_ERROR = 2,
	mpJ1939_AFTRFS_ACTIVE = 1,
	mpJ1939_AFTRFS_NOT_ACTIVE = 0
} MpJ1939AFTRFSEnum;

typedef enum MpJ1939AFTRISEnum
{	mpJ1939_AFTRIS_NOT_AVAILABLE = 3,
	mpJ1939_AFTRIS_ERROR = 2,
	mpJ1939_AFTRIS_ACTIVE = 1,
	mpJ1939_AFTRIS_NOT_ACTIVE = 0
} MpJ1939AFTRISEnum;

typedef enum MpJ1939AGSESEnum
{	mpJ1939_AGSES_NOT_AVAILABLE = 3,
	mpJ1939_AGSES_ERROR = 2,
	mpJ1939_AGSES_AUTO_ENABLED = 1,
	mpJ1939_AGSES_AUTO_DISABLED = 0
} MpJ1939AGSESEnum;

typedef enum MpJ1939AHCPREnum
{	mpJ1939_AHCPR_DONT_CARE = 3,
	mpJ1939_AHCPR_RESERVED = 2,
	mpJ1939_AHCPR_ACTIVATE = 1,
	mpJ1939_AHCPR_DEACTIVATE = 0
} MpJ1939AHCPREnum;

typedef enum MpJ1939AHMREnum
{	mpJ1939_AHMR_DONT_CARE = 15,
	mpJ1939_AHMR_RESERVED = 14,
	mpJ1939_AHMR_HEATER_PUMP_UPKEEP = 4,
	mpJ1939_AHMR_NORMAL_MODE = 3,
	mpJ1939_AHMR_ECONOMY_MODE = 2,
	mpJ1939_AHMR_OFF_HAZARDOUS = 1,
	mpJ1939_AHMR_DEACTIVATE_AUX = 0
} MpJ1939AHMREnum;

typedef enum MpJ1939AP1LISEnum
{	mpJ1939_AP1LIS_NOT_AVAILABLE = 3,
	mpJ1939_AP1LIS_ERROR = 2,
	mpJ1939_AP1LIS_IN_LOW_IDLE = 1,
	mpJ1939_AP1LIS_NOT_IN_LOW_IDLE = 0
} MpJ1939AP1LISEnum;

typedef enum MpJ1939AP2LISEnum
{	mpJ1939_AP2LIS_NOT_AVAILABLE = 3,
	mpJ1939_AP2LIS_ERROR = 2,
	mpJ1939_AP2LIS_IN_LOW_IDLE = 1,
	mpJ1939_AP2LIS_NOT_IN_LOW_IDLE = 0
} MpJ1939AP2LISEnum;

typedef enum MpJ1939APKSEnum
{	mpJ1939_APKS_NOT_AVAILABLE = 3,
	mpJ1939_APKS_ERROR = 2,
	mpJ1939_APKS_KICKDOWN_ACTIVE = 1,
	mpJ1939_APKS_KICKDOWN_PASSIVE = 0
} MpJ1939APKSEnum;

typedef enum MpJ1939AWLSEnum
{	mpJ1939_AWLS_NOT_AVAILABLE = 3,
	mpJ1939_AWLS_RESERVED = 2,
	mpJ1939_AWLS_LAMP_ON = 1,
	mpJ1939_AWLS_LAMP_OFF = 0
} MpJ1939AWLSEnum;

typedef enum MpJ1939BMSHREnum
{	mpJ1939_BMSHR_DONT_CARE = 3,
	mpJ1939_BMSHR_UNDEFINED = 2,
	mpJ1939_BMSHR_HOLD_BATTERY = 1,
	mpJ1939_BMSHR_RELEASE_BATTERY = 0
} MpJ1939BMSHREnum;

typedef enum MpJ1939BSEnum
{	mpJ1939_BS_NOT_AVAILABLE = 3,
	mpJ1939_BS_ERROR = 2,
	mpJ1939_BS_DEPRESSED = 1,
	mpJ1939_BS_RELEASED = 0
} MpJ1939BSEnum;

typedef enum MpJ1939CCAEnum
{	mpJ1939_CCA_NOT_AVAILABLE = 3,
	mpJ1939_CCA_ERROR = 2,
	mpJ1939_CCA_ON = 1,
	mpJ1939_CCA_OFF = 0
} MpJ1939CCAEnum;

typedef enum MpJ1939CCASEnum
{	mpJ1939_CCAS_NOT_AVAILABLE = 3,
	mpJ1939_CCAS_ERROR = 2,
	mpJ1939_CCAS_IN_POS_ACCEL = 1,
	mpJ1939_CCAS_NOT_IN_POS_ACCEL = 0
} MpJ1939CCASEnum;

typedef enum MpJ1939CCCSEnum
{	mpJ1939_CCCS_NOT_AVAILABLE = 3,
	mpJ1939_CCCS_ERROR = 2,
	mpJ1939_CCCS_IN_POS_COAST = 1,
	mpJ1939_CCCS_NOT_IN_POS_COAST = 0
} MpJ1939CCCSEnum;

typedef enum MpJ1939CCDCEnum
{	mpJ1939_CCDC_DONT_CARE = 3,
	mpJ1939_CCDC_RESERVED = 2,
	mpJ1939_CCDC_NOT_ALLOWED = 1,
	mpJ1939_CCDC_IS_ALLOWED = 0
} MpJ1939CCDCEnum;

typedef enum MpJ1939CCESEnum
{	mpJ1939_CCES_NOT_AVAILABLE = 3,
	mpJ1939_CCES_ERROR = 2,
	mpJ1939_CCES_ENABLED = 1,
	mpJ1939_CCES_DISABLED = 0
} MpJ1939CCESEnum;

typedef enum MpJ1939CCPCEnum
{	mpJ1939_CCPC_DONT_CARE = 3,
	mpJ1939_CCPC_RESERVED = 2,
	mpJ1939_CCPC_NOT_ALLOWED = 1,
	mpJ1939_CCPC_ALLOWED = 0
} MpJ1939CCPCEnum;

typedef enum MpJ1939CCPSEnum
{	mpJ1939_CCPS_TAKE_NO_ACTION = 3,
	mpJ1939_CCPS_ERROR_INDICATOR = 2,
	mpJ1939_CCPS_ON = 1,
	mpJ1939_CCPS_OFF = 0
} MpJ1939CCPSEnum;

typedef enum MpJ1939CCRCEnum
{	mpJ1939_CCRC_DONT_CARE = 3,
	mpJ1939_CCRC_RESERVED = 2,
	mpJ1939_CCRC_REQUESTED = 1,
	mpJ1939_CCRC_NOT_REQUESTED = 0
} MpJ1939CCRCEnum;

typedef enum MpJ1939CCRSEnum
{	mpJ1939_CCRS_NOT_AVAILABLE = 3,
	mpJ1939_CCRS_ERROR = 2,
	mpJ1939_CCRS_IN_POS_RESUME = 1,
	mpJ1939_CCRS_NOT_IN_POS_RESUME = 0
} MpJ1939CCRSEnum;

typedef enum MpJ1939CCSCSEnum
{	mpJ1939_CCSCS_NOT_SUPPORTED = 7,
	mpJ1939_CCSCS_RECEIVED_RESUME_CM = 4,
	mpJ1939_CCSCS_REACTIVATED_RESUME = 3,
	mpJ1939_CCSCS_PAUSE_CMD = 2,
	mpJ1939_CCSCS_DISABLED_CMD = 1,
	mpJ1939_CCSCS_NO_CMD = 0
} MpJ1939CCSCSEnum;

typedef enum MpJ1939CCSEnum
{	mpJ1939_CCS_NOT_AVAILABLE = 7,
	mpJ1939_CCS_ACCELERATOR_OVERRIDE = 6,
	mpJ1939_CCS_SET = 5,
	mpJ1939_CCS_RESUME = 4,
	mpJ1939_CCS_DECELERATE = 3,
	mpJ1939_CCS_ACCELERATE = 2,
	mpJ1939_CCS_HOLD = 1,
	mpJ1939_CCS_OFF = 0
} MpJ1939CCSEnum;

typedef enum MpJ1939CCSSEnum
{	mpJ1939_CCSS_NOT_AVAILABLE = 3,
	mpJ1939_CCSS_ERROR = 2,
	mpJ1939_CCSS_IN_POS_SET = 1,
	mpJ1939_CCSS_NOT_IN_POS_SET = 0
} MpJ1939CCSSEnum;

typedef enum MpJ1939CLEPSSEnum
{	mpJ1939_CLEPSS_NOT_AVAILABLE = 3,
	mpJ1939_CLEPSS_RESERVED = 2,
	mpJ1939_CLEPSS_ENABLED = 1,
	mpJ1939_CLEPSS_DISABLED = 0
} MpJ1939CLEPSSEnum;

typedef enum MpJ1939CSEnum
{	mpJ1939_CS_NOT_AVAILABLE = 3,
	mpJ1939_CS_ERROR = 2,
	mpJ1939_CS_DEPRESSED = 1,
	mpJ1939_CS_RELEASED = 0
} MpJ1939CSEnum;

typedef enum MpJ1939DEFTLLIEnum
{	mpJ1939_DEFTLLI_NOT_AVAILABLE = 7,
	mpJ1939_DEFTLLI_RESERVED6 = 6,
	mpJ1939_DEFTLLI_RESERVED5 = 5,
	mpJ1939_DEFTLLI_ON_FAST_BLINK = 4,
	mpJ1939_DEFTLLI_RESERVED3 = 3,
	mpJ1939_DEFTLLI_RESERVED2 = 2,
	mpJ1939_DEFTLLI_ON_SOLID = 1,
	mpJ1939_DEFTLLI_OFF = 0
} MpJ1939DEFTLLIEnum;

typedef enum MpJ1939DPFAARIEnum
{	mpJ1939_DPFAARI_NOT_AVAILABLE = 3,
	mpJ1939_DPFAARI_RESERVED = 2,
	mpJ1939_DPFAARI_ENABLED = 1,
	mpJ1939_DPFAARI_NOT_ENABLED = 0
} MpJ1939DPFAARIEnum;

typedef enum MpJ1939DPFARFSEnum
{	mpJ1939_DPFARFS_RESERVED3 = 3,
	mpJ1939_DPFARFS_SERVICE_TOOL = 2,
	mpJ1939_DPFARFS_SWITCH = 1,
	mpJ1939_DPFARFS_NOT_ACTIVE = 0,
	mpJ1939_DPFARFS_NOT_AVAILABLE = 7,
	mpJ1939_DPFARFS_RESERVED6 = 6,
	mpJ1939_DPFARFS_RESERVED5 = 5,
	mpJ1939_DPFARFS_RESERVED4 = 4
} MpJ1939DPFARFSEnum;

typedef enum MpJ1939DPFARI3710Enum
{	mpJ1939_DPFARI3710_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI3710_RESERVED = 2,
	mpJ1939_DPFARI3710_INHIBITED = 1,
	mpJ1939_DPFARI3710_NOT_INHIBITED = 0
} MpJ1939DPFARI3710Enum;

typedef enum MpJ1939DPFARI3712Enum
{	mpJ1939_DPFARI3712_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI3712_RESERVED = 2,
	mpJ1939_DPFARI3712_INHIBITED = 1,
	mpJ1939_DPFARI3712_NOT_INHIBITED = 0
} MpJ1939DPFARI3712Enum;

typedef enum MpJ1939DPFARI3713Enum
{	mpJ1939_DPFARI3713_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI3713_RESERVED = 2,
	mpJ1939_DPFARI3713_INHIBITED = 1,
	mpJ1939_DPFARI3713_NOT_INHIBITED = 0
} MpJ1939DPFARI3713Enum;

typedef enum MpJ1939DPFARI3715Enum
{	mpJ1939_DPFARI3715_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI3715_RESERVED = 2,
	mpJ1939_DPFARI3715_INHIBITED = 1,
	mpJ1939_DPFARI3715_NOT_INHIBITED = 0
} MpJ1939DPFARI3715Enum;

typedef enum MpJ1939DPFARI3717Enum
{	mpJ1939_DPFARI3717_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI3717_RESERVED = 2,
	mpJ1939_DPFARI3717_INHIBITED = 1,
	mpJ1939_DPFARI3717_NOT_INHIBITED = 0
} MpJ1939DPFARI3717Enum;

typedef enum MpJ1939DPFARI5629Enum
{	mpJ1939_DPFARI5629_NOT_AVAILABLE = 3,
	mpJ1939_DPFARI5629_RESERVED = 2,
	mpJ1939_DPFARI5629_INHIBIT = 1,
	mpJ1939_DPFARI5629_NOT_INHIBIT = 0
} MpJ1939DPFARI5629Enum;

typedef enum MpJ1939DPFARIDTAEnum
{	mpJ1939_DPFARIDTA_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTA_RESERVED = 2,
	mpJ1939_DPFARIDTA_INHIBITED = 1,
	mpJ1939_DPFARIDTA_NOT_INHIBITED = 0
} MpJ1939DPFARIDTAEnum;

typedef enum MpJ1939DPFARIDTCEnum
{	mpJ1939_DPFARIDTC_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTC_RESERVED = 2,
	mpJ1939_DPFARIDTC_INHIBITED = 1,
	mpJ1939_DPFARIDTC_NOT_INHIBITED = 0
} MpJ1939DPFARIDTCEnum;

typedef enum MpJ1939DPFARIDTEEnum
{	mpJ1939_DPFARIDTE_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTE_RESERVED = 2,
	mpJ1939_DPFARIDTE_INHIBITED = 1,
	mpJ1939_DPFARIDTE_NOT_INHIBITED = 0
} MpJ1939DPFARIDTEEnum;

typedef enum MpJ1939DPFARIDTIEnum
{	mpJ1939_DPFARIDTI_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTI_RESERVED = 2,
	mpJ1939_DPFARIDTI_INHIBITED = 1,
	mpJ1939_DPFARIDTI_NOT_INHIBITED = 0
} MpJ1939DPFARIDTIEnum;

typedef enum MpJ1939DPFARIDTLEnum
{	mpJ1939_DPFARIDTL_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTL_RESERVED = 2,
	mpJ1939_DPFARIDTL_INHIBITED = 1,
	mpJ1939_DPFARIDTL_NOT_INHIBITED = 0
} MpJ1939DPFARIDTLEnum;

typedef enum MpJ1939DPFARIDTOEnum
{	mpJ1939_DPFARIDTO_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTO_RESERVED = 2,
	mpJ1939_DPFARIDTO_INHIBITED = 1,
	mpJ1939_DPFARIDTO_NOT_INHIBITED = 0
} MpJ1939DPFARIDTOEnum;

typedef enum MpJ1939DPFARIDTPEnum
{	mpJ1939_DPFARIDTP_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTP_RESERVED = 2,
	mpJ1939_DPFARIDTP_INHIBITED = 1,
	mpJ1939_DPFARIDTP_NOT_INHIBITED = 0
} MpJ1939DPFARIDTPEnum;

typedef enum MpJ1939DPFARIDTSEnum
{	mpJ1939_DPFARIDTS_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTS_RESERVED = 2,
	mpJ1939_DPFARIDTS_INHIBITED = 1,
	mpJ1939_DPFARIDTS_NOT_INHIBITED = 0
} MpJ1939DPFARIDTSEnum;

typedef enum MpJ1939DPFARIDTTEnum
{	mpJ1939_DPFARIDTT_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTT_RESERVED = 2,
	mpJ1939_DPFARIDTT_INHIBITED = 1,
	mpJ1939_DPFARIDTT_NOT_INHIBITED = 0
} MpJ1939DPFARIDTTEnum;

typedef enum MpJ1939DPFARIDTVEnum
{	mpJ1939_DPFARIDTV_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIDTV_RESERVED = 2,
	mpJ1939_DPFARIDTV_INHIBITED = 1,
	mpJ1939_DPFARIDTV_NOT_INHIBITED = 0
} MpJ1939DPFARIDTVEnum;

typedef enum MpJ1939DPFARISEnum
{	mpJ1939_DPFARIS_NOT_AVAILABLE = 3,
	mpJ1939_DPFARIS_RESERVED = 2,
	mpJ1939_DPFARIS_INHIBITED = 1,
	mpJ1939_DPFARIS_NOT_INHIBITED = 0
} MpJ1939DPFARISEnum;

typedef enum MpJ1939DPFLCEnum
{	mpJ1939_DPFLC_NOT_AVAILABLE = 7,
	mpJ1939_DPFLC_RESERVED6 = 6,
	mpJ1939_DPFLC_RESERVED5 = 5,
	mpJ1939_DPFLC_ON_FAST_BLINK = 4,
	mpJ1939_DPFLC_RESERVED3 = 3,
	mpJ1939_DPFLC_RESERVED2 = 2,
	mpJ1939_DPFLC_ON_SOLID = 1,
	mpJ1939_DPFLC_OFF = 0
} MpJ1939DPFLCEnum;

typedef enum MpJ1939DPFTMAEnum
{	mpJ1939_DPFTMA_DONT_CARE = 3,
	mpJ1939_DPFTMA_RESERVED = 2,
	mpJ1939_DPFTMA_ACTIVE = 1,
	mpJ1939_DPFTMA_NOT_ACTIVE = 0
} MpJ1939DPFTMAEnum;

typedef enum MpJ1939EAAEnum
{	mpJ1939_EAA_NOT_AVAILABLE = 3,
	mpJ1939_EAA_ERROR = 2,
	mpJ1939_EAA_ACTIVE = 1,
	mpJ1939_EAA_NOT_ACTIVE = 0
} MpJ1939EAAEnum;

typedef enum MpJ1939EAOCSEnum
{	mpJ1939_EAOCS_NOT_AVAILABLE = 3,
	mpJ1939_EAOCS_RESERVED = 2,
	mpJ1939_EAOCS_ACTIVE = 1,
	mpJ1939_EAOCS_NOT_ACTIVE = 0
} MpJ1939EAOCSEnum;

typedef enum MpJ1939EASCSEnum
{	mpJ1939_EASCS_NOT_AVAILABLE = 3,
	mpJ1939_EASCS_RESERVED = 2,
	mpJ1939_EASCS_ENABLED = 1,
	mpJ1939_EASCS_DISABLED = 0
} MpJ1939EASCSEnum;

typedef enum MpJ1939EASESEnum
{	mpJ1939_EASES_NOT_AVAILABLE = 3,
	mpJ1939_EASES_ERROR = 2,
	mpJ1939_EASES_ON_STATE = 1,
	mpJ1939_EASES_OFF_STATE = 0
} MpJ1939EASESEnum;

typedef enum MpJ1939EASSEnum
{	mpJ1939_EASS_ERROR = 2,
	mpJ1939_EASS_RESTRICTED = 1,
	mpJ1939_EASS_ALLOWED = 0,
	mpJ1939_EASS_NOT_AVAILABLE = 3
} MpJ1939EASSEnum;

typedef enum MpJ1939EIDSEnum
{	mpJ1939_EIDS_NOT_AVAILABLE = 3,
	mpJ1939_EIDS_ERROR = 2,
	mpJ1939_EIDS_ON = 1,
	mpJ1939_EIDS_OFF = 0
} MpJ1939EIDSEnum;

typedef enum MpJ1939EIISEnum
{	mpJ1939_EIIS_NOT_AVAILABLE = 3,
	mpJ1939_EIIS_ERROR = 2,
	mpJ1939_EIIS_ON = 1,
	mpJ1939_EIIS_OFF = 0
} MpJ1939EIISEnum;

typedef enum MpJ1939EISDAMEnum
{	mpJ1939_EISDAM_NOT_AVAILABLE = 3,
	mpJ1939_EISDAM_ERROR = 2,
	mpJ1939_EISDAM_ACTIVE = 1,
	mpJ1939_EISDAM_INACTIVE = 0
} MpJ1939EISDAMEnum;

typedef enum MpJ1939EISHSEEnum
{	mpJ1939_EISHSE_NOT_AVAILABLE = 3,
	mpJ1939_EISHSE_ERROR = 2,
	mpJ1939_EISHSE_YES = 1,
	mpJ1939_EISHSE_NO = 0
} MpJ1939EISHSEEnum;

typedef enum MpJ1939EISTFEnum
{	mpJ1939_EISTF_NOT_AVAILABLE = 3,
	mpJ1939_EISTF_ERROR = 2,
	mpJ1939_EISTF_ENABLED = 1,
	mpJ1939_EISTF_DISABLED = 0
} MpJ1939EISTFEnum;

typedef enum MpJ1939EISTOEnum
{	mpJ1939_EISTO_NOT_AVAILABLE = 3,
	mpJ1939_EISTO_ERROR = 2,
	mpJ1939_EISTO_ACTIVE = 1,
	mpJ1939_EISTO_INACTIVE = 0
} MpJ1939EISTOEnum;

typedef enum MpJ1939EISTSEnum
{	mpJ1939_EISTS_NOT_AVAILABLE = 3,
	mpJ1939_EISTS_ERROR = 2,
	mpJ1939_EISTS_ACTIVE = 1,
	mpJ1939_EISTS_INACTIVE = 0
} MpJ1939EISTSEnum;

typedef enum MpJ1939EOCMEnum
{	mpJ1939_EOCM_SPEED = 3,
	mpJ1939_EOCM_TORQUE_CONTROL = 2,
	mpJ1939_EOCM_SPEED_CONTROL = 1,
	mpJ1939_EOCM_OVERRIDE_DISABLED = 0
} MpJ1939EOCMEnum;

typedef enum MpJ1939EOTEnum
{	mpJ1939_EOT_NOT_AVAILABLE = 3,
	mpJ1939_EOT_RESERVED = 2,
	mpJ1939_EOT_ACTIVE = 1,
	mpJ1939_EOT_NOT_ACTIVE = 0
} MpJ1939EOTEnum;

typedef enum MpJ1939EPSASEnum
{	mpJ1939_EPSAS_NOT_AVAILABLE = 3,
	mpJ1939_EPSAS_ERROR = 2,
	mpJ1939_EPSAS_APPROACHING = 1,
	mpJ1939_EPSAS_NOT_APPROACHING = 0
} MpJ1939EPSASEnum;

typedef enum MpJ1939EPSCEnum
{	mpJ1939_EPSC_NOT_AVAILABLE = 3,
	mpJ1939_EPSC_ERROR = 2,
	mpJ1939_EPSC_ENABLED = 1,
	mpJ1939_EPSC_DISABLED = 0
} MpJ1939EPSCEnum;

typedef enum MpJ1939EPSHSEEnum
{	mpJ1939_EPSHSE_NOT_AVAILABLE = 3,
	mpJ1939_EPSHSE_ERROR = 2,
	mpJ1939_EPSHSE_YES = 1,
	mpJ1939_EPSHSE_NO = 0
} MpJ1939EPSHSEEnum;

typedef enum MpJ1939EPSTOEnum
{	mpJ1939_EPSTO_NOT_AVAILABLE = 3,
	mpJ1939_EPSTO_ERROR = 2,
	mpJ1939_EPSTO_ACTIVE = 1,
	mpJ1939_EPSTO_INACTIVE = 0
} MpJ1939EPSTOEnum;

typedef enum MpJ1939EPSTSEnum
{	mpJ1939_EPSTS_NOT_AVAILABLE = 3,
	mpJ1939_EPSTS_ERROR = 2,
	mpJ1939_EPSTS_ACTIVE = 1,
	mpJ1939_EPSTS_INACTIVE = 0
} MpJ1939EPSTSEnum;

typedef enum MpJ1939ERSCCEnum
{	mpJ1939_ERSCC_ENGAGED_AND3 = 3,
	mpJ1939_ERSCC_ENGAGED_AND2 = 2,
	mpJ1939_ERSCC_DISENGA_NONLOCKUP1 = 1,
	mpJ1939_ERSCC_DISENGA_NONLOCKUP2 = 0
} MpJ1939ERSCCEnum;

typedef enum MpJ1939ERTHREnum
{	mpJ1939_ERTHR_0875 = 7,
	mpJ1939_ERTHR_0125 = 1,
	mpJ1939_ERTHR_0000 = 0
} MpJ1939ERTHREnum;

typedef enum MpJ1939ESHTLCEnum
{	mpJ1939_ESHTLC_NOT_AVAILABLE = 7,
	mpJ1939_ESHTLC_RESERVED6 = 6,
	mpJ1939_ESHTLC_RESERVED5 = 5,
	mpJ1939_ESHTLC_RESERVED4 = 4,
	mpJ1939_ESHTLC_RESERVED3 = 3,
	mpJ1939_ESHTLC_RESERVED2 = 2,
	mpJ1939_ESHTLC_ON = 1,
	mpJ1939_ESHTLC_OFF = 0
} MpJ1939ESHTLCEnum;

typedef enum MpJ1939ESMEnum
{	mpJ1939_ESM_INHIBIT_OVERTEMP = 8,
	mpJ1939_ESM_INHIBIT_IMMOBILIZER = 7,
	mpJ1939_ESM_INHIBIT_ENGAGED = 6,
	mpJ1939_ESM_INHIBIT_ENG_NOT_RDY = 5,
	mpJ1939_ESM_INHIBIT_ENG_RUNNING = 4,
	mpJ1939_ESM_FINISHED = 3,
	mpJ1939_ESM_ACTIVE_GEAR_ENGAGED = 2,
	mpJ1939_ESM_ACTIVE_GEAR_NOT_ENGA = 1,
	mpJ1939_ESM_NOT_REQUESTED = 0,
	mpJ1939_ESM_NOT_AVAILABLE = 15,
	mpJ1939_ESM_ERROR = 14,
	mpJ1939_ESM_ERROR_LEGACY = 13,
	mpJ1939_ESM_INHIBITED = 12,
	mpJ1939_ESM_RESERVED = 11,
	mpJ1939_ESM_INHIBIT_ACTIVE_INDUC = 10,
	mpJ1939_ESM_INHIBIT_AIR_SHT_VALV = 9
} MpJ1939ESMEnum;

typedef enum MpJ1939ESOSEnum
{	mpJ1939_ESOS_NOT_AVAILABLE = 3,
	mpJ1939_ESOS_ERROR = 2,
	mpJ1939_ESOS_ON = 1,
	mpJ1939_ESOS_OFF = 0
} MpJ1939ESOSEnum;

typedef enum MpJ1939ETMSEnum
{	mpJ1939_ETMS_NOT_AVAILABLE = 3,
	mpJ1939_ETMS_ERROR = 2,
	mpJ1939_ETMS_ON = 1,
	mpJ1939_ETMS_OFF = 0
} MpJ1939ETMSEnum;

typedef enum MpJ1939EWTSLEnum
{	mpJ1939_EWTSL_NOT_AVAILABLE = 3,
	mpJ1939_EWTSL_ERROR = 2,
	mpJ1939_EWTSL_ON = 1,
	mpJ1939_EWTSL_OFF = 0
} MpJ1939EWTSLEnum;

typedef enum MpJ1939FAWLEnum
{	mpJ1939_FAWL_UNAVAILABLE = 3,
	mpJ1939_FAWL_RESERVED = 2,
	mpJ1939_FAWL_FAST_FLASH = 1,
	mpJ1939_FAWL_SLOW_FLASH = 0
} MpJ1939FAWLEnum;

typedef enum MpJ1939FMILEnum
{	mpJ1939_FMIL_UNAVAILABLE = 3,
	mpJ1939_FMIL_CLASS_C_DTC = 2,
	mpJ1939_FMIL_FAST_FLASH = 1,
	mpJ1939_FMIL_SLOW_FLASH = 0
} MpJ1939FMILEnum;

typedef enum MpJ1939FPLEnum
{	mpJ1939_FPL_UNAVAILABLE = 3,
	mpJ1939_FPL_RESERVED = 2,
	mpJ1939_FPL_FAST_FLASH = 1,
	mpJ1939_FPL_SLOW_FLASH = 0
} MpJ1939FPLEnum;

typedef enum MpJ1939FRSLEnum
{	mpJ1939_FRSL_UNAVAILABLE = 3,
	mpJ1939_FRSL_RESERVED = 2,
	mpJ1939_FRSL_FAST_FLASH = 1,
	mpJ1939_FRSL_SLOW_FLASH = 0
} MpJ1939FRSLEnum;

typedef enum MpJ1939HDPEEnum
{	mpJ1939_HDPE_NOT_AVAILABLE = 3,
	mpJ1939_HDPE_URGENT = 2,
	mpJ1939_HDPE_LESS_URGENT = 1,
	mpJ1939_HDPE_NOT_ENABLED = 0
} MpJ1939HDPEEnum;

typedef enum MpJ1939MEMPEFEnum
{	mpJ1939_MEMPEF_DONT_CARE = 3,
	mpJ1939_MEMPEF_RESERVED = 2,
	mpJ1939_MEMPEF_SUPPORTED = 1,
	mpJ1939_MEMPEF_DISABLED = 0
} MpJ1939MEMPEFEnum;

typedef enum MpJ1939MILSEnum
{	mpJ1939_MILS_NOT_AVAILABLE = 3,
	mpJ1939_MILS_SHORT_FOR_WWH_OBD = 2,
	mpJ1939_MILS_LAMP_ON = 1,
	mpJ1939_MILS_LAMP_OFF = 0
} MpJ1939MILSEnum;

typedef enum MpJ1939NO1RSEnum
{	mpJ1939_NO1RS_NOT_AVAILABLE = 3,
	mpJ1939_NO1RS_ERROR = 2,
	mpJ1939_NO1RS_STABLE = 1,
	mpJ1939_NO1RS_NOT_STABLE = 0
} MpJ1939NO1RSEnum;

typedef enum MpJ1939NOS1SDSEnum
{	mpJ1939_NOS1SDS_NOT_SUPPOR = 7,
	mpJ1939_NOS1SDS_NOT_POSSIBLE = 4,
	mpJ1939_NOS1SDS_ABORTED = 3,
	mpJ1939_NOS1SDS_COMPLETE = 2,
	mpJ1939_NOS1SDS_ACTIVE = 1,
	mpJ1939_NOS1SDS_NOT_ACTIVE = 0
} MpJ1939NOS1SDSEnum;

typedef enum MpJ1939OCMPEnum
{	mpJ1939_OCMP_LOW_PRIORITY = 3,
	mpJ1939_OCMP_MEDIUM_PRIORITY = 2,
	mpJ1939_OCMP_HIGH_PRIORITY = 1,
	mpJ1939_OCMP_HIGHEST_PRIORITY = 0
} MpJ1939OCMPEnum;

typedef enum MpJ1939OSDSEnum
{	mpJ1939_OSDS_NOT_AVAILABLE = 3,
	mpJ1939_OSDS_ERROR = 2,
	mpJ1939_OSDS_FACING_FORWARD = 1,
	mpJ1939_OSDS_NOT_FACING_FORWARD = 0
} MpJ1939OSDSEnum;

typedef enum MpJ1939PBCEnum
{	mpJ1939_PBC_DONT_CARE = 3,
	mpJ1939_PBC_SAE_RESERVED = 2,
	mpJ1939_PBC_REQUESTED = 1,
	mpJ1939_PBC_NOT_REQUESTED = 0
} MpJ1939PBCEnum;

typedef enum MpJ1939PBRIREnum
{	mpJ1939_PBRIR_UNAVAILABLE = 3,
	mpJ1939_PBRIR_SAE_RESERVED = 2,
	mpJ1939_PBRIR_REQUESTED = 1,
	mpJ1939_PBRIR_NOT_REQUESTED = 0
} MpJ1939PBRIREnum;

typedef enum MpJ1939PBSEnum
{	mpJ1939_PBS_NOT_AVAILABLE = 3,
	mpJ1939_PBS_ERROR = 2,
	mpJ1939_PBS_SET = 1,
	mpJ1939_PBS_NOT_SET = 0
} MpJ1939PBSEnum;

typedef enum MpJ1939PCCSSOSEnum
{	mpJ1939_PCCSSOS_NOT_AVAILABLE = 3,
	mpJ1939_PCCSSOS_SAE_RESERVED = 2,
	mpJ1939_PCCSSOS_INCLUDES = 1,
	mpJ1939_PCCSSOS_DOES_NOT_INCLUDE = 0
} MpJ1939PCCSSOSEnum;

typedef enum MpJ1939PGNStatusEnum
{	mpJ1939_PGN_IDLE = 1,
	mpJ1939_PGN_NEW_DATA = 2,
	mpJ1939_PGN_ERROR_CYCLE_TIME = 3,
	mpJ1939_PGN_ERROR_LIMITS = 4,
	mpJ1939_PGN_ERROR_TRANSMIT = 5,
	mpJ1939_PGN_ERROR_RECEIVE = 6,
	mpJ1939_PGN_NOT_ACTIVE = 0
} MpJ1939PGNStatusEnum;

typedef enum MpJ1939PLSEnum
{	mpJ1939_PLS_NOT_AVAILABLE = 3,
	mpJ1939_PLS_RESERVED = 2,
	mpJ1939_PLS_LAMP_ON = 1,
	mpJ1939_PLS_LAMP_OFF = 0
} MpJ1939PLSEnum;

typedef enum MpJ1939PTOGSEnum
{	mpJ1939_PTOGS_NOT_AVAILABL = 31,
	mpJ1939_PTOGS_SPEED_MEMORY_2 = 19,
	mpJ1939_PTOGS_SPEED_MEMORY_1 = 18,
	mpJ1939_PTOGS_SET_SPEED_8 = 17,
	mpJ1939_PTOGS_SET_SPEED_7 = 16,
	mpJ1939_PTOGS_SET_SPEED_6 = 15,
	mpJ1939_PTOGS_SET_SPEED_5 = 14,
	mpJ1939_PTOGS_SET_SPEED_4 = 13,
	mpJ1939_PTOGS_SET_SPEED_3 = 12,
	mpJ1939_PTOGS_SET_SPEED_2 = 11,
	mpJ1939_PTOGS_SET_SPEED_1 = 10,
	mpJ1939_PTOGS_ACCEL_OVERRIDE = 9,
	mpJ1939_PTOGS_ACCELERATE = 8,
	mpJ1939_PTOGS_RESUME = 7,
	mpJ1939_PTOGS_DECELERATE = 6,
	mpJ1939_PTOGS_SET = 5,
	mpJ1939_PTOGS_REMOTE_STANDBY = 4,
	mpJ1939_PTOGS_STANDBY = 3,
	mpJ1939_PTOGS_REMOTE_HOLD = 2,
	mpJ1939_PTOGS_HOLD = 1,
	mpJ1939_PTOGS_OFF = 0
} MpJ1939PTOGSEnum;

typedef enum MpJ1939PTOSHSEEnum
{	mpJ1939_PTOSHSE_NOT_AVAILABLE = 3,
	mpJ1939_PTOSHSE_ERROR = 2,
	mpJ1939_PTOSHSE_YES = 1,
	mpJ1939_PTOSHSE_NO = 0
} MpJ1939PTOSHSEEnum;

typedef enum MpJ1939RCZHEnum
{	mpJ1939_RCZH_DONT_CARE = 3,
	mpJ1939_RCZH_RESERVED = 2,
	mpJ1939_RCZH_HEAT_CAB_ZONE = 1,
	mpJ1939_RCZH_DO_NOT_HEAT = 0
} MpJ1939RCZHEnum;

typedef enum MpJ1939REZHEnum
{	mpJ1939_REZH_DONT_CARE = 3,
	mpJ1939_REZH_RESERVED = 2,
	mpJ1939_REZH_HEAT_ENGINE_ZONE = 1,
	mpJ1939_REZH_DO_NOT_HEAT = 0
} MpJ1939REZHEnum;

typedef enum MpJ1939RHPSEnum
{	mpJ1939_RHPS_NOT_AVAILABLE = 3,
	mpJ1939_RHPS_ERROR = 2,
	mpJ1939_RHPS_PRESSURE_TOO_HIGH = 1,
	mpJ1939_RHPS_PRESSURE_NORMAL = 0
} MpJ1939RHPSEnum;

typedef enum MpJ1939RLPSEnum
{	mpJ1939_RLPS_NOT_AVAILABLE = 3,
	mpJ1939_RLPS_ERROR = 2,
	mpJ1939_RLPS_PRESSURE_TOO_LOW = 1,
	mpJ1939_RLPS_PRESSURE_NORMAL = 0
} MpJ1939RLPSEnum;

typedef enum MpJ1939RSLiSEnum
{	mpJ1939_RSLIS_NOT_AVAILABLE = 3,
	mpJ1939_RSLIS_ERROR = 2,
	mpJ1939_RSLIS_NOT_ACTIVE = 1,
	mpJ1939_RSLIS_ACTIVE = 0
} MpJ1939RSLiSEnum;

typedef enum MpJ1939RSLSEnum
{	mpJ1939_RSLS_NOT_AVAILABLE = 3,
	mpJ1939_RSLS_RESERVED = 2,
	mpJ1939_RSLS_LAMP_ON = 1,
	mpJ1939_RSLS_LAMP_OFF = 0
} MpJ1939RSLSEnum;

typedef enum MpJ1939S1ATEnum
{	mpJ1939_S1AT_NOT_AVAILABLE = 3,
	mpJ1939_S1AT_ERROR = 2,
	mpJ1939_S1AT_IN_RANGE = 1,
	mpJ1939_S1AT_NOT_IN_RANGE = 0
} MpJ1939S1ATEnum;

typedef enum MpJ1939S1HCEnum
{	mpJ1939_S1HC_HEATER_OFF = 3,
	mpJ1939_S1HC_PREHEAT_1 = 2,
	mpJ1939_S1HC_PREHEAT_2 = 1,
	mpJ1939_S1HC_AUTOMATIC = 0
} MpJ1939S1HCEnum;

typedef enum MpJ1939S1PIREnum
{	mpJ1939_S1PIR_NOT_AVAILABLE = 3,
	mpJ1939_S1PIR_ERROR = 2,
	mpJ1939_S1PIR_IN_RANGE = 1,
	mpJ1939_S1PIR_NOT_IN_RANGE = 0
} MpJ1939S1PIREnum;

typedef enum MpJ1939SBSEnum
{	mpJ1939_SBS_NOT_AVAILABLE = 3,
	mpJ1939_SBS_ERROR = 2,
	mpJ1939_SBS_OK = 1,
	mpJ1939_SBS_NOT_BUCKLED = 0
} MpJ1939SBSEnum;

typedef enum MpJ1939SCRINO1RSEnum
{	mpJ1939_SCRINO1RS_NOT_AVAILABLE = 3,
	mpJ1939_SCRINO1RS_ERROR = 2,
	mpJ1939_SCRINO1RS_STABLE = 1,
	mpJ1939_SCRINO1RS_NOT_STABLE = 0
} MpJ1939SCRINO1RSEnum;

typedef enum MpJ1939SCROISEnum
{	mpJ1939_SCROIS_NOT_AVAILABLE = 7,
	mpJ1939_SCROIS_TEMP_OVERRIDE = 6,
	mpJ1939_SCROIS_INDUCEMENT_LEVEL5 = 5,
	mpJ1939_SCROIS_INDUCEMENT_LEVEL4 = 4,
	mpJ1939_SCROIS_INDUCEMENT_LEVEL3 = 3,
	mpJ1939_SCROIS_INDUCEMENT_LEVEL2 = 2,
	mpJ1939_SCROIS_INDUCEMENT_LEVEL1 = 1,
	mpJ1939_SCROIS_DRIVER_WARNING = 0
} MpJ1939SCROISEnum;

typedef enum MpJ1939SCRTMAEnum
{	mpJ1939_SCRTMA_DONT_CARE = 3,
	mpJ1939_SCRTMA_RESERVED = 2,
	mpJ1939_SCRTMA_ACTIVE = 1,
	mpJ1939_SCRTMA_NOT_ACTIVE = 0
} MpJ1939SCRTMAEnum;

typedef enum MpJ1939EOPSEnum
{	mpJ1939_EOPS_NOT_AVAILABLE = 3,
	mpJ1939_EOPS_ERROR = 2,
	mpJ1939_EOPS_NOK = 1,
	mpJ1939_EOPS_OK = 0
} MpJ1939EOPSEnum;

typedef enum MpJ1939TSASEnum
{	mpJ1939_TSAS_NOT_AVAILABLE = 3,
	mpJ1939_TSAS_ERROR = 2,
	mpJ1939_TSAS_HIGH_SPEED_RANGE = 1,
	mpJ1939_TSAS_LOW_SPEED_RANGE = 0
} MpJ1939TSASEnum;

typedef enum MpJ1939TSC1CPEnum
{	mpJ1939_TSC1CP_P32_TEMP_PWR_CTRL = 31,
	mpJ1939_TSC1CP_P5_ENG_PROTECTION = 4,
	mpJ1939_TSC1CP_P4_ROAD_SPEED_GVN = 3,
	mpJ1939_TSC1CP_P3_PTO_GOVERNOR = 2,
	mpJ1939_TSC1CP_P2_CRUISE_CONTROL = 1,
	mpJ1939_TSC1CP_P1_ACCEL_PEDAL = 0
} MpJ1939TSC1CPEnum;

typedef enum MpJ1939TSC1TREnum
{	mpJ1939_TSC1TR_100_MS = 4,
	mpJ1939_TSC1TR_250_MS = 3,
	mpJ1939_TSC1TR_500_MS = 2,
	mpJ1939_TSC1TR_750_MS = 1,
	mpJ1939_TSC1TR_1000_MS = 0,
	mpJ1939_TSC1TR_STANDARD_10_MS = 7,
	mpJ1939_TSC1TR_20_MS = 6,
	mpJ1939_TSC1TR_50_MS = 5
} MpJ1939TSC1TREnum;

typedef enum MpJ1939VARLSEnum
{	mpJ1939_VARLS_NOT_AVAILABLE = 3,
	mpJ1939_VARLS_RESERVED = 2,
	mpJ1939_VARLS_LIMIT_ACTIVE = 1,
	mpJ1939_VARLS_LIMIT_NOT_ACTIVE = 0
} MpJ1939VARLSEnum;

typedef enum MpJ1939VLSGDSEnum
{	mpJ1939_VLSGDS_ERROR = 2,
	mpJ1939_VLSGDS_ON_STATE = 1,
	mpJ1939_VLSGDS_OFF_STATE = 0,
	mpJ1939_VLSGDS_NOT_AVAILABLE = 3
} MpJ1939VLSGDSEnum;

typedef enum MpJ1939VLSGESEnum
{	mpJ1939_VLSGES_NOT_AVAILABLE = 3,
	mpJ1939_VLSGES_ERROR = 2,
	mpJ1939_VLSGES_SWITCHED_ENABLED = 1,
	mpJ1939_VLSGES_SWITCH_DISABLED = 0
} MpJ1939VLSGESEnum;

typedef enum MpJ1939VLSGISEnum
{	mpJ1939_VLSGIS_NOT_AVAILABLE = 3,
	mpJ1939_VLSGIS_ERROR = 2,
	mpJ1939_VLSGIS_ON_STATE = 1,
	mpJ1939_VLSGIS_OFF_STATE = 0
} MpJ1939VLSGISEnum;

typedef enum MpJ1939WRPO21RSEnum
{	mpJ1939_WRPO21RS_NOT_AVAILABLE = 3,
	mpJ1939_WRPO21RS_ERROR = 2,
	mpJ1939_WRPO21RS_STABLE = 1,
	mpJ1939_WRPO21RS_NOT_STABLE = 0
} MpJ1939WRPO21RSEnum;

typedef enum MpJ1939ErrorEnum
{	mpJ1939_NO_ERROR = 0,
	mpJ1939_ERR_ACTIVATION = -1064239103,
	mpJ1939_ERR_MPLINK_NULL = -1064239102,
	mpJ1939_ERR_MPLINK_INVALID = -1064239101,
	mpJ1939_ERR_MPLINK_CHANGED = -1064239100,
	mpJ1939_ERR_MPLINK_CORRUPT = -1064239099,
	mpJ1939_ERR_MPLINK_IN_USE = -1064239098,
	mpJ1939_ERR_CONFIG_INVALID = -1064239091,
	mpJ1939_ERR_LIMITS = -1064171520,
	mpJ1939_ERR_INVALID_CAN_IF = -1064171519,
	mpJ1939_ERR_ARSIM_NOT_ALLOWED = -1064171518,
	mpJ1939_ERR_COMMUNICATION = -1064171517,
	mpJ1939_ERR_INVALID_DATA_BUFFER = -1064171516
} MpJ1939ErrorEnum;

typedef struct MpJ1939StatusIDType
{	enum MpJ1939ErrorEnum ID;
	MpComSeveritiesEnum Severity;
} MpJ1939StatusIDType;

typedef struct MpJ1939DiagType
{	struct MpJ1939StatusIDType StatusID;
} MpJ1939DiagType;

typedef struct MpJ193SpecificRequestInfoType
{	struct MpJ1939DiagType Diag;
	unsigned short ReceivedBytes;
} MpJ193SpecificRequestInfoType;

typedef struct MpJ193TransmitInfoType
{	struct MpJ1939DiagType Diag;
} MpJ193TransmitInfoType;

typedef struct MpJ1939AMBType
{	float RoadSurfaceTemp;
	signed short EngAirIntakeTemp;
	float AmbientAirTemp;
	float CabInteriorTemp;
	float BarometricPress;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AMBType;

typedef struct MpJ1939AT1IG1Type
{	enum MpJ1939NOS1SDSEnum NOxSnsr1SelfDiagStatus;
	signed char O2Snsr1PreliminaryFMI;
	signed char SCRInNOxSnsr1PreliminaryFMI;
	enum MpJ1939S1HCEnum Snsr1HtrCtrl;
	signed char Snsr1HtrPreliminaryFMI;
	enum MpJ1939WRPO21RSEnum WRPercentO21ReadingStable;
	enum MpJ1939SCRINO1RSEnum SCRInNOx1ReadingStable;
	enum MpJ1939S1ATEnum Snsr1AtTemp;
	enum MpJ1939S1PIREnum Snsr1PwrInRange;
	float PercentO21;
	float SCRInNOx1;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1IG1Type;

typedef struct MpJ1939AT1IG2Type
{	signed short DPFInTempPreliminaryFMI;
	signed short ExhTemp1PreliminaryFMI;
	float DPFInTemp;
	float ExhTemp1;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1IG2Type;

typedef struct MpJ1939AT1IMGType
{	signed char DPFIntmdTempPreliminaryFMI;
	signed char DPFDiffPressPreliminaryFMI;
	signed char ExhTemp2PreliminaryFMI;
	float DPFDiffPress;
	float DPFIntmdTemp;
	float ExhTemp2;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1IMGType;

typedef struct MpJ1939AT1OG1Type
{	signed char O2Snsr1PreliminaryFMI;
	enum MpJ1939NOS1SDSEnum NOxSnsr1SelfDiagStatus;
	signed char NOxSnsr1PreliminaryFMI;
	enum MpJ1939S1HCEnum Snsr1HtrCtrl;
	signed char Snsr1HtrPreliminaryFMI;
	enum MpJ1939WRPO21RSEnum WRPercentO21ReadingStable;
	enum MpJ1939NO1RSEnum NOx1ReadingStable;
	enum MpJ1939S1ATEnum Snsr1AtTemp;
	enum MpJ1939S1PIREnum Snsr1PwrInRange;
	float PercentO21;
	float NOx1;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1OG1Type;

typedef struct MpJ1939AT1OG2Type
{	signed char DPFOutExhTempPreliminaryFMI;
	signed char ExhTemp3PreliminaryFMI;
	float DPFOutTemp;
	float ExhTemp3;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1OG2Type;

typedef struct MpJ1939AT1S1Type
{	float DPFSootLoadRegenThreshold;
	unsigned long DPFTimeSinceLastActiveRegen;
	unsigned char DPFAshLoadPercent;
	unsigned char DPFSootLoadPercent;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1S1Type;

typedef struct MpJ1939AT1T1I1Type
{	signed char HtrPreliminaryFMI;
	float Htr;
	enum MpJ1939SCROISEnum SCROpIndSev;
	signed char TempPreliminaryFMI;
	enum MpJ1939DEFTLLIEnum DEFTankLowLvlInd;
	signed char LvlVolPreliminaryFMI;
	float Lvl;
	signed short Temp1;
	float Volume;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1T1I1Type;

typedef struct MpJ1939AT1TIType
{	signed short DPFTripNumOfActiveRegenManReq;
	signed short DPFTripNumOfActiveRegenInhReq;
	signed short DPFTripNumOfPassiveRegens;
	signed short DPFTripPassiveRegenTime;
	signed short DPFTripNumOfActiveRegens;
	signed short DPFTripDisdTime;
	signed short DPFTripActiveRegenTime;
	float DPFTripFuelUsed;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939AT1TIType;

typedef struct MpJ1939CCVS1Type
{	enum MpJ1939ESOSEnum EngShutdownOverrideSwitch;
	enum MpJ1939ETMSEnum EngTestModeSwitch;
	enum MpJ1939EIDSEnum EngIdleDecrementSwitch;
	enum MpJ1939EIISEnum EngIdleIncrementSwitch;
	enum MpJ1939CCSEnum CruiseCtrlStates;
	enum MpJ1939PTOGSEnum PTOGovernorState;
	signed short CruiseCtrlSetSpeed;
	enum MpJ1939CCASEnum CruiseCtrlAccelerateSwitch;
	enum MpJ1939CCRSEnum CruiseCtrlResumeSwitch;
	enum MpJ1939CCCSEnum CruiseCtrlCoastSwitch;
	enum MpJ1939CCSSEnum CruiseCtrlSetSwitch;
	enum MpJ1939CSEnum ClutchSwitch;
	enum MpJ1939BSEnum BrakeSwitch;
	enum MpJ1939CCESEnum CruiseCtrlEnableSwitch;
	enum MpJ1939CCAEnum CruiseCtrlActive;
	float WheelBasedVehicleSpeed;
	enum MpJ1939PBRIREnum ParkBrakeReleaseInhibitRq;
	enum MpJ1939CCPSEnum CruiseCtrlPauseSwitch;
	enum MpJ1939PBSEnum ParkingBrakeSwitch;
	enum MpJ1939TSASEnum TwoSpeedAxleSwitch;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CCVS1Type;

typedef struct MpJ1939CCVS2Type
{	enum MpJ1939CCPCEnum CruiseCtrlPauseCmd;
	enum MpJ1939CCRCEnum CruiseCtrlResumeCmd;
	enum MpJ1939CCDCEnum CruiseCtrlDisableCmd;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CCVS2Type;

typedef struct MpJ1939CCVS3Type
{	float CruiseCtrlSpeed;
	float CruiseCtrlSetSpeed;
	enum MpJ1939PCCSSOSEnum PrdctvCrsCtrlStSpeedOffsetStatus;
	enum MpJ1939AEBSRSEnum AEBSReadinessState;
	signed short SrcAddrssOfCntrllngDvcFrPsngCrsC;
	signed short SrcAddrssOfCntrllngDvcFrDsblngCr;
	enum MpJ1939CCSCSEnum CruiseCtrlSystemCmdState;
	enum MpJ1939ACCRSEnum AdptiveCruiseCtrlReadinessStatus;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CCVS3Type;

typedef struct MpJ1939CCVS4Type
{	float CruiseCtrlAdjustedMaxSpeed;
	float AppliedVehicleSpeedLimit;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CCVS4Type;

typedef struct MpJ1939CIType
{	signed short UnitNumber;
	signed short SerialNumber;
	signed short Model;
	signed short Make;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CIType;

typedef struct MpJ1939CM1Type
{	signed short SelectedMaxVehicleSpeedLimit;
	enum MpJ1939RCZHEnum RqCabZoneHeating;
	enum MpJ1939REZHEnum RqEngZoneHeating;
	enum MpJ1939AHMREnum AuxHeaterModeRq;
	enum MpJ1939EASESEnum EngAutomaticStartEnableSwitch;
	enum MpJ1939AGSESEnum AtomaticGearShiftingEnableSwitch;
	enum MpJ1939AFTRFSEnum AFTRegenForceSw;
	enum MpJ1939AFTRISEnum AFTRegenInhSw;
	enum MpJ1939VLSGESEnum VhclLmtngSpdGovernorEnableSwitch;
	enum MpJ1939VLSGISEnum VhclLmtngSpdGvrnrIncrementSwitch;
	enum MpJ1939VLSGDSEnum VhclLmtngSpdGvrnrDecrementSwitch;
	enum MpJ1939PBCEnum ParkBrakeCmd;
	enum MpJ1939SBSEnum SeatBeltSwitch;
	enum MpJ1939OSDSEnum OperatorSeatDirectionSwitch;
	enum MpJ1939BMSHREnum BatteryMainSwitchHoldRq;
	enum MpJ1939AHCPREnum AuxHeaterCoolantPumpRq;
	float CabInteriorTempCmd;
	float RequestedPercentFanSpeed;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939CM1Type;

typedef struct MpJ1939DM01Type
{	enum MpJ1939FRSLEnum FlashRedStopLamp;
	enum MpJ1939FPLEnum FlashProtectLamp;
	enum MpJ1939FMILEnum FlashMalfuncIndicatorLamp;
	enum MpJ1939FAWLEnum FlashAmberWarningLamp;
	enum MpJ1939MILSEnum MalfunctionIndicatorLampStatus;
	enum MpJ1939AWLSEnum AmberWarningLampStatus;
	enum MpJ1939RSLSEnum RedStopLampState;
	enum MpJ1939PLSEnum ProtectLampStatus;
	unsigned long DTC5;
	unsigned long DTC4;
	unsigned long DTC3;
	unsigned long DTC2;
	unsigned long DTC1;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939DM01Type;

typedef struct MpJ1939DPFC1Type
{	enum MpJ1939DPFARI5629Enum DslPrtcltFltrActvRgnrtnInhbt5629;
	enum MpJ1939AFT1DPFCNMFAREnum AFT1DPFCondNotMetForActiveRegen;
	enum MpJ1939HDPEEnum HydrocarbonDoserPurgingEnable;
	enum MpJ1939DPFARFSEnum DslPrtcltFltrActvRgnrtnFrcdSttus;
	enum MpJ1939ESHTLCEnum ExhaustSystemHighTempLampCmd;
	enum MpJ1939DPFAARIEnum DslPrtcltFltrAtmtcActvRgnrtnIntt;
	enum MpJ1939DPFARI3717Enum DslPrtcltFltrActvRgnrtnInhbt3717;
	enum MpJ1939DPFARIDTEEnum DslPrtcltFltrActvRgnrtnInhbtdDTE;
	enum MpJ1939DPFARI3715Enum DslPrtcltFltrActvRgnrtnInhbt3715;
	enum MpJ1939DPFARIDTTEnum DslPrtcltFltrActvRgnrtnInhbtdDTT;
	enum MpJ1939DPFARI3713Enum DslPrtcltFltrActvRgnrtnInhbt3713;
	enum MpJ1939DPFARI3712Enum DslPrtcltFltrActvRgnrtnInhbt3712;
	enum MpJ1939DPFARIDTLEnum DslPrtcltFltrActvRgnrtnInhbtdDTL;
	enum MpJ1939DPFARI3710Enum DslPrtcltFltrActvRgnrtnInhbt3710;
	enum MpJ1939DPFARIDTVEnum DslPrtcltFltrActvRgnrtnInhbtdDTV;
	enum MpJ1939DPFARIDTOEnum DslPrtcltFltrActvRgnrtnInhbtdDTO;
	enum MpJ1939DPFARIDTAEnum DslPrtcltFltrActvRgnrtnInhbtdDTA;
	enum MpJ1939DPFARIDTPEnum DslPrtcltFltrActvRgnrtnInhbtdDTP;
	enum MpJ1939DPFARIDTSEnum DslPrtcltFltrActvRgnrtnInhbtdDTS;
	enum MpJ1939DPFARIDTCEnum DslPrtcltFltrActvRgnrtnInhbtdDTC;
	enum MpJ1939DPFARIDTIEnum DslPrtcltFltrActvRgnrtnInhbtdDTI;
	enum MpJ1939DPFARISEnum DslPrtcltFltrActvRgnrtnInhbtdStt;
	enum MpJ1939AFTDPFSEnum AFTDPFStatus;
	enum MpJ1939AFTDPFARSEnum AFTDPFActiveRegenStatus;
	enum MpJ1939AFTDPFPRSEnum AFTDPFPassiveRegenStatus;
	enum MpJ1939DPFLCEnum DieselParticulateFilterLampCmd;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939DPFC1Type;

typedef struct MpJ1939EC1Type
{	signed char DefaultIdleTrqLmt;
	unsigned char SupportTSC1CtrlPurposeGroup4;
	unsigned char SupportTSC1CtrlPurposeGroup3;
	unsigned char SupportTSC1CtrlPurposeGroup2;
	unsigned char SupportTSC1CtrlPurposeGroup1;
	unsigned char SupportVariableRateTSC1Message;
	unsigned short EngDefaultTorqueLimit;
	float EngMomentOfInertia;
	float EngExRngRqstdSpdCtrlRngUpprLimit;
	signed char EngRqstdTrqueCtrlRangeUpperLimit;
	signed char EngRqstdTrqueCtrlRangeLowerLimit;
	signed short EngRqstdSpeedCtrlRangeUpperLimit;
	signed short EngRqstdSpeedCtrlRangeLowerLimit;
	float EngMaxMomentaryOverrideTimeLimit;
	float EngMxMmentaryOverrideSpeedPoint7;
	unsigned short EngReferenceTorque;
	float EngGain;
	float EngSpeedAtHighIdlePoint6;
	signed char EngPercentTorqueAtPoint5;
	float EngSpeedAtPoint5;
	signed char EngPercentTorqueAtPoint4;
	float EngSpeedAtPoint4;
	signed char EngPercentTorqueAtPoint3;
	float EngSpeedAtPoint3;
	signed char EngPercentTorqueAtPoint2;
	float EngSpeedAtPoint2;
	signed char EngPercentTorqueAtIdlePoint1;
	float EngSpeedAtIdlePoint1;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939EC1Type;

typedef struct MpJ1939EEC1Type
{	signed char EngDemandPercentTorque;
	enum MpJ1939ESMEnum EngStarterMode;
	unsigned char SrcAddrssOfCntrllngDvcForEngCtrl;
	float EngSpeed;
	signed char ActualEngPercentTorque;
	signed char DriversDemandEngPercentTorque;
	float ActlEngPrcntTorqueHighResolution;
	signed char EngTorqueMode;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939EEC1Type;

typedef struct MpJ1939EEC2Type
{	signed char EstPumpingPercentTorque;
	float ActlMaxAvailableEngPercentTorque;
	enum MpJ1939SCRTMAEnum SCRThermalManagementActive;
	enum MpJ1939DPFTMAEnum DPFThermalManagementActive;
	enum MpJ1939MEMPEFEnum MmntaryEngMaxPowerEnableFeedback;
	enum MpJ1939VARLSEnum VhcleAccelerationRateLimitStatus;
	float AccelPedalPos2;
	float RemoteAccelPedalPos;
	unsigned char EngPercentLoadAtCurrentSpeed;
	float AccelPedalPos1;
	enum MpJ1939AP2LISEnum AccelPedal2LowIdleSwitch;
	enum MpJ1939RSLiSEnum RoadSpeedLimitStatus;
	enum MpJ1939APKSEnum AccelPedalKickdownSwitch;
	enum MpJ1939AP1LISEnum AccelPedal1LowIdleSwitch;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939EEC2Type;

typedef struct MpJ1939EEC3Type
{	enum MpJ1939AFT2EDPEnum AFT2ExhDewPoint;
	enum MpJ1939AFT2IDPEnum AFT2InDewPoint;
	enum MpJ1939AFT1EDPEnum AFT1ExhDewPoint;
	enum MpJ1939AFT1IDPEnum AFT1InDewPoint;
	float AFT1ExhGasMFR;
	signed char EstEngPrsiticLossesPercentTorque;
	unsigned char EngnsDsrdOprtngSpdAsymmtryAdjstm;
	float EnginesDesiredOperatingSpeed;
	signed char NominalFrictionPercentTorque;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939EEC3Type;

typedef struct MpJ1939EFL_P1Type
{	float EngCoolantLevel;
	signed short EngCoolantPress;
	float EngCrankcasePress;
	signed short EngOilPress;
	float EngOilLevel;
	float EngExCrankcaseBlowbyPress;
	signed short EngFuelDeliveryPress;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939EFL_P1Type;

typedef struct MpJ1939ET1Type
{	float EngIntercoolerThermostatOpening;
	signed short EngIntercoolerTemp;
	float EngTurboOilTemp;
	float EngOilTemp1;
	signed short EngFuelTemp1;
	signed short EngCoolantTemp;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939ET1Type;

typedef struct MpJ1939HOURSType
{	float EngTotalRevolutions;
	float EngTotalHoursOfOperation;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939HOURSType;

typedef struct MpJ1939IC1Type
{	float EngCoolantFilterDiffPress;
	float EngExhaustGasTemp;
	float EngAirFilter1DiffPress;
	signed short EngAirIntakePress;
	signed short EngIntakeManifold1Temp;
	signed short EngIntakeManifold1Press;
	float AFT1DPFInPress;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939IC1Type;

typedef struct MpJ1939LFC1Type
{	float EngTotalFuelUsed;
	float EngTripFuel;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939LFC1Type;

typedef struct MpJ1939LFC2Type
{	float EngTotalDieselFuelDemand;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939LFC2Type;

typedef struct MpJ1939LFE1Type
{	float EngThrottleValve2Pos;
	float EngThrottleValve1Pos;
	float EngAverageFuelEconomy;
	float EngInstantaneousFuelEconomy;
	float EngFuelRate;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939LFE1Type;

typedef struct MpJ1939LFE2Type
{	float EngDieselFuelDemandRate;
	float HighResolutionEngFuelRate;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939LFE2Type;

typedef struct MpJ1939ReceiveInfoType
{	struct MpJ1939DiagType Diag;
	unsigned short ReceivedBytes;
} MpJ1939ReceiveInfoType;

typedef struct MpJ1939SHUTDNType
{	enum MpJ1939EOPSEnum EngOilPressSw;
	enum MpJ1939CLEPSSEnum ClntLvlEngPrtctionShutdownStatus;
	enum MpJ1939PTOSHSEEnum PTOShutdownHasShutdownEng;
	enum MpJ1939EASSEnum EngAirShutoffStatus;
	enum MpJ1939EOTEnum EngOverspeedTest;
	enum MpJ1939EASCSEnum EngAirShutoffCmdStatus;
	enum MpJ1939EAOCSEnum EngAlarmOutputCmdStatus;
	enum MpJ1939EAAEnum EngAlarmAcknowledge;
	enum MpJ1939EPSCEnum EngProtectionSystemConfig;
	enum MpJ1939EPSTSEnum EngProtectionSystemTimerState;
	enum MpJ1939EPSTOEnum EngProtectionSystemTimerOverride;
	enum MpJ1939EPSASEnum EngPrtctnSystmApprachingShutdown;
	enum MpJ1939EPSHSEEnum EngPrtectionSystemHasShutdownEng;
	enum MpJ1939EWTSLEnum EngWaitToStartLamp;
	enum MpJ1939RHPSEnum RefrigerantHighPressSwitch;
	enum MpJ1939RLPSEnum RefrigerantLowPressSwitch;
	enum MpJ1939ACHPFSEnum A_CHighPressFanSwitch;
	enum MpJ1939EISTFEnum EngIdleShutdownTimerFunction;
	enum MpJ1939EISTSEnum EngIdleShutdownTimerState;
	enum MpJ1939EISTOEnum EngIdleShutdownTimerOverride;
	enum MpJ1939EISDAMEnum EngIdleShutdownDriverAlertMode;
	enum MpJ1939EISHSEEnum EngIdleShutdownHasShutdownEng;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939SHUTDNType;

typedef struct MpJ1939SOFTType
{	unsigned char NmbrOfSftwreIdentificationFields;
	unsigned char SoftwareIdentification;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939SOFTType;

typedef struct MpJ1939TSC1Type
{	signed char MessageChecksum;
	signed char MessageCounter;
	float EngRequestedTorqueHighResolution;
	enum MpJ1939TSC1CPEnum TSC1CtrlPurpose;
	enum MpJ1939TSC1TREnum TSC1TransRate;
	signed char EngRequestedTorque_TorqueLimit;
	float EngRequestedSpeed_SpeedLimit;
	enum MpJ1939OCMPEnum OverrideCtrlModePriority;
	enum MpJ1939ERSCCEnum EngRequestedSpeedCtrlConditions;
	enum MpJ1939EOCMEnum EngOverrideCtrlMode;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939TSC1Type;

typedef struct MpJ1939VEP1Type
{	float KeyswitchBatteryPotential;
	float BatteryPotential_PowerInput1;
	float ChargingSystemPotential;
	unsigned char AltCurrent;
	signed char NetBatteryCurrent;
	enum MpJ1939PGNStatusEnum Status;
} MpJ1939VEP1Type;

typedef struct MpJ1939SpecificRequest
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned long PGN;
	unsigned char Priority;
	unsigned long Data;
	unsigned short DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpJ193SpecificRequestInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[14];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Request;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpJ1939SpecificRequest_typ;

typedef struct MpJ1939Receive
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned long PGN;
	unsigned char Priority;
	unsigned long Data;
	unsigned short DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpJ1939ReceiveInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[14];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Receive;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandDone;
	plcbit CommandBusy;
} MpJ1939Receive_typ;

typedef struct MpJ1939Transmit
{
	/* VAR_INPUT (analog) */
	struct MpComIdentType* MpLink;
	unsigned long PGN;
	unsigned char Priority;
	unsigned long Data;
	unsigned short DataLength;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpJ193TransmitInfoType Info;
	/* VAR (analog) */
	unsigned char InternalState;
	unsigned long InternalData[14];
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit Transmit;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandDone;
	plcbit CommandBusy;
} MpJ1939Transmit_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpJ1939SpecificRequest(struct MpJ1939SpecificRequest* inst);
_BUR_PUBLIC void MpJ1939Receive(struct MpJ1939Receive* inst);
_BUR_PUBLIC void MpJ1939Transmit(struct MpJ1939Transmit* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPJ1939_ */

