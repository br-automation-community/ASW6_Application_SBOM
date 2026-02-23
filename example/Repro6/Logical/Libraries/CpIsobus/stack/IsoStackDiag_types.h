//**********************************************************************************************************************
//! @file        IsoStackDiag_types.h
//! @brief       API for accessing diagnostic services functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        02.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_DIAG_TYPES_H
#define ISOAGLIBS_ISO_STACK_DIAG_TYPES_H

// INCLUDES=============================================================================================================

#include "IsoStackNw_types.h"

// GLOBAL DEFINES=======================================================================================================

// GLOBAL TYPE DEFINITIONS==============================================================================================

//! This enum describes the FMI (failure mode indicator).
typedef enum
{
    E_FMI_VALID_ABOVE_NORMAL_MOST_SEVERE_LEVEL = 0,
    E_FMI_VALID_BELOW_NORMAL_MOST_SEVERE_LEVEL = 1,
    E_FMI_DATA_ERRATIC_INTERMITTENT_OR_INCORRECT = 2,
    E_FMI_VOLTAGE_ABOVE_NORMAL_OR_SHORTED_TO_HIGH_SOURCE = 3,
    E_FMI_VOLTAGE_BELOW_NORMAL_OR_SHORTED_TO_LOW_SOURCE = 4,
    E_FMI_CURRENT_BELOW_NORMAL_OR_OPEN_CIRCUIT = 5,
    E_FMI_CURRENT_ABOVE_NORMAL_OR_GROUNDED_CIRCUIT = 6,
    E_FMI_MECHANICAL_SYSTEM_NOT_RESPONDING_OR_IMPROPERLY_ADJUSTED = 7,
    E_FMI_ABNORMAL_FREQUENCY_OR_PULSE_WIDTH_OR_PERIOD = 8,
    E_FMI_ABNORMAL_UPDATE_RATE = 9,
    E_FMI_ABNORMAL_RATE_OF_CHANGE = 10,
    E_FMI_ROOT_CAUSE_NOT_KNOWN = 11,
    E_FMI_BAD_INTELLIGENT_UNIT_OR_COMPONENT = 12,
    E_FMI_OUT_OF_CALIBRATION = 13,
    E_FMI_SPECIAL_INSTRUCTIONS = 14,
    E_FMI_VALID_ABOVE_NORMAL_LEAST_SEVERE_LEVEL = 15,
    E_FMI_VALID_ABOVE_NORMAL_MODERATELY_SEVERE_LEVEL = 16,
    E_FMI_VALID_BELOW_NORMAL_LEAST_SEVERE_LEVEL = 17,
    E_FMI_VALID_BELOW_NORMAL_MODERATELY_SEVERE_LEVEL = 18,
    E_FMI_RECEIVED_NETWORK_DATA_IN_ERROR = 19,
    E_FMI_CONDITION_EXISTS = 31
} EFmi;

//! This structure describes the DTC (diagnostic trouble code).
typedef struct
{
    TUint32 u32Spn;           //!< suspect parameter number
    EFmi eFmi;                //!< failure mode indicator
    TUint8 u8OccurrenceCount; //!< occurrence count (indicates how often the DTC has been active)
} TDtc;

typedef enum
{
    E_CERT_REV_1ST_REVISION  =  0,
    E_CERT_REV_2ND_REVISION  =  1,
    E_CERT_REV_3RD_REVISION  =  2,
    E_CERT_REV_4TH_REVISION  =  3,
    E_CERT_REV_5TH_REVISION  =  4,
    E_CERT_REV_6TH_REVISION  =  5,
    E_CERT_REV_7TH_REVISION  =  6,
    E_CERT_REV_8TH_REVISION  =  7,
    E_CERT_REV_9TH_REVISION  =  8,
    E_CERT_REV_10TH_REVISION =  9,
    E_CERT_REV_11TH_REVISION = 10,
    E_CERT_REV_12TH_REVISION = 11,
    E_CERT_REV_13TH_REVISION = 12,
    E_CERT_REV_14TH_REVISION = 13,
    E_CERT_REV_15TH_REVISION = 14,
    E_CERT_REV_16TH_REVISION = 15,
    E_CERT_REV_17TH_REVISION = 16,
    E_CERT_REV_18TH_REVISION = 17,
    E_CERT_REV_19TH_REVISION = 18,
    E_CERT_REV_20TH_REVISION = 19,
    E_CERT_REV_21ST_REVISION = 20,
    E_CERT_REV_22ND_REVISION = 21,
    E_CERT_REV_23RD_REVISION = 22,
    E_CERT_REV_24TH_REVISION = 23,
    E_CERT_REV_25TH_REVISION = 24,
    E_CERT_REV_26TH_REVISION = 25,
    E_CERT_REV_27TH_REVISION = 26,
    E_CERT_REV_28TH_REVISION = 27,
    E_CERT_REV_29TH_REVISION = 28,
    E_CERT_REV_30TH_REVISION = 29,
    E_CERT_REV_31ST_REVISION = 30,
    E_CERT_REV_NOT_AVAILABLE = 31
} ECertRev;

//! This enum lists the available certification laboratories.
typedef enum
{
    E_CERT_LAB_NON_CERTIFIED_LAB = 0,
    E_CERT_LAB_AEF_CERTIFIED_LAB = 1,
    E_CERT_LAB_SELF_CERTIFIED    = 2, //!< Self-certified based on existing certification.
    E_CERT_LAB_NOT_AVAILABLE     = 3
} ECertLab;

//! This is a callback the application can use to tell if it accepts the control function with name "cptNameToCheck" as
//! a service tool (return value "TRUE" means "application accepts CF as service tool", return value "FALSE" means
//! "application doesn't accept CF as service tool"). The callback is used if a service tool sends a DM3 request. In
//! that case the previously active DTCs are not removed if the callback is set and returns "FALSE".
typedef TBoolean(*TServiceToolVerifier)(const TName *cptNameToCheck);

#endif
