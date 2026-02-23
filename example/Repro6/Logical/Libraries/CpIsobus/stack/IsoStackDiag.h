//**********************************************************************************************************************
//! @file        IsoStackDiag.h
//! @brief       API for accessing diagnostic services functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        01.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_DIAG_H
#define ISOAGLIBS_ISO_STACK_DIAG_H

// INCLUDES=============================================================================================================

#include "IsoStackDiag_types.h"
#include "IsoStackCore_types.h"

// "ISOAGLIBSE_API" can be set to "__declspec(dllexport)" to build the Windows DLL version of ISOAgLib SE and to
// "__declspec(dllimport)" to use the Windows DLL version of ISOAgLib SE (this setting can be done e.g. in file
// "HalTypedef.h" or in project configuration).
#ifndef ISOAGLIBSE_API
#define ISOAGLIBSE_API
#endif

// GLOBAL VARIABLE DECLARATIONS=========================================================================================

// GLOBAL FUNCTION DECLARATIONS=========================================================================================

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u16MaxNoOfActiveDtcs".
//!
//! @param[in]    u16MaxNoOfActiveDtcs    number of elements (maximal 445)
//!
//! @return                               buffer size in byte that is needed for the number of elements given by
//!                                       parameter "u16MaxNoOfActiveDtcs" or 0 if value of parameter
//!                                       "u16MaxNoOfActiveDtcs" was greater than 445
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackDiagGetActiveDtcsConfigMemoryBufferSizeInByte(TUint16 u16MaxNoOfActiveDtcs);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the buffer size in byte that is needed for the number of elements given by parameter
//!        "u16MaxNoOfPreviouslyActiveDtcs".
//!
//! @param[in]    u16MaxNoOfPreviouslyActiveDtcs    number of elements (maximal 445)
//!
//! @return                                         buffer size in byte that is needed for the number of elements given
//!                                                 by parameter "u16MaxNoOfPreviouslyActiveDtcs" or 0 if value of
//!                                                 parameter "u16MaxNoOfPreviouslyActiveDtcs" was greater than 445
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint32 u32IsoStackDiagGetPreviouslyActiveDtcsConfigMemoryBufferSizeInByte(
    TUint16 u16MaxNoOfPreviouslyActiveDtcs);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffer for the active diagnostic trouble codes (DTCs). If you want to use your
//!        own buffer here, you have to call this function. Otherwise the ISOAgLib SE will use its own default buffer.
//!        Call this function only in state "E_ISO_STACK_STATE_CLOSED". Use function
//!        "u32IsoStackDiagGetActiveDtcsConfigMemoryBufferSizeInByte()" to determine the buffer size that you need. Only
//!        use those return values as buffer size. If you used an own buffer here and want to change to the default
//!        buffer after a restart of ISOAgLib SE, you have to explicitely "set the buffer to zero" (size has to be 0 and
//!        buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    cptMemoryBuffer       memory buffer; this pointer is not stored by ISOAgLib SE but the pointer to the
//!                                     buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                             result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackDiagConfigActiveDtcs(ELocalCf eLocalCf, const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function configures the buffer for the previously active diagnostic trouble codes (DTCs). If you want to
//!        use your own buffer here, you have to call this function. Otherwise the ISOAgLib SE will use its own default
//!        buffer. Call this function only in state "E_ISO_STACK_STATE_CLOSED". Use function
//!        "u32IsoStackDiagGetPreviouslyActiveDtcsConfigMemoryBufferSizeInByte()" to determine the buffer size that you
//!        need. Only use those return values as buffer size. If you used an own buffer here and want to change to the
//!        default buffer after a restart of ISOAgLib SE, you have to explicitely "set the buffer to zero" (size has to
//!        be 0 and buffer pointer has to be NULL).
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    cptMemoryBuffer       memory buffer; this pointer is not stored by ISOAgLib SE but the pointer to the
//!                                     buffer itself ("cptMemoryBuffer->pvBuffer")
//!
//! @return                             result of configuring (see definition of "EMemConfigResult")
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         11.12.2019
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API EMemConfigResult eIsoStackDiagConfigPreviouslyActiveDtcs(
    ELocalCf eLocalCf,
    const TMemoryBuffer* cptMemoryBuffer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This functions sets all attributes of the ECU identification.
//!
//! @param[in]    eLocalCf                local control function
//! @param[in]    cpchPartNr              part number
//! @param[in]    cpchSerialNr            serial number
//! @param[in]    cpchLocation            location
//! @param[in]    cpchType                type
//! @param[in]    cpchManufacturerName    manufacturer name
//! @param[in]    cpchHardwareVer         hardware version
//!
//! @retval       TRUE                    The setting was successful.
//! @retval       FALSE                   The setting was not successful because the state of the stack was not
//!                                       "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                       number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                       AppConfig.h, can be used) or one of strings that were given over as parameter
//!                                       were NULL, not valid or too long.
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServStat     table for diagonstics services data
//!
//! @date         23.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagSetEcuIdent(
    ELocalCf eLocalCf,
    const TChar *cpchPartNr,
    const TChar *cpchSerialNr,
    const TChar *cpchLocation,
    const TChar *cpchType,
    const TChar *cpchManufacturerName,
    const TChar *cpchHardwareVer);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This functions sets all attributes of the product identification.
//!
//! @param[in]    eLocalCf               local control function
//! @param[in]    cpchCode               code
//! @param[in]    cpchBrand              brand
//! @param[in]    cpchModel              model
//!
//! @retval       TRUE                   The setting was successful.
//! @retval       FALSE                  The setting was not successful because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                      number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                      AppConfig.h, can be used) or one of strings that were given over as parameter
//!                                      were NULL, not valid or too long.
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServStat    table for diagonstics services data
//!
//! @date         23.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagSetProductIdent(
    ELocalCf eLocalCf,
    const TChar *cpchCode,
    const TChar *cpchBrand,
    const TChar *cpchModel);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This functions sets all attributes of the software identification.
//!
//! @param[in]    eLocalCf               local control function
//! @param[in]    cpchSwIdent            software identification (last character must be '*')
//!
//! @retval       TRUE                   The setting was successful.
//! @retval       FALSE                  The setting was not successful because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                      number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                      AppConfig.h, can be used) or "cpchSwIdent" was NULL, too long, too short or its
//!                                      last character was not '*'.
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServStat    table for diagonstics services data
//!
//! @date         23.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagSetSwIdent(
    ELocalCf eLocalCf,
    const TChar *cpchSwIdent);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This functions sets all attributes of the certification data.
//!
//! @param[in]    eLocalCf               local control function
//! @param[in]    u16Year                certification year as in ISO 11783-7 A.29.1, must be between 2000 and 2061
//! @param[in]    eRev                   certification revision as in ISO 11783-7 A.29.2
//! @param[in]    eLab                   certification laboratory type as in ISO 11783-7 A.29.3
//! @param[in]    u16LabId               certification laboratory ID (11 bits wide) as in ISO 11783-7 A.29.4
//! @param[in]    u16RefNr               compliance certification reference number (as in ISO 11783-7 A.29.18)
//!
//! @retval       TRUE                   The setting was successful.
//! @retval       FALSE                  The setting was not successful because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                      number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                      AppConfig.h, can be used) or "u16Year" was less than 2000 or greater than 2061
//!                                      or "u16LabId" was greater than 2047.
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServStat    table for diagonstics services data
//!
//! @date         23.06.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagSetCertData(
    ELocalCf eLocalCf,
    TUint16 u16Year,
    ECertRev eRev,
    ECertLab eLab,
    TUint16 u16LabId,
    TUint16 u16RefNr);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function sets the service tool verifier.
//!
//! @param[in]    eLocalCf                local control function
//! @param[in]    tServiceToolVerifier    service tool verifier (pointer must not be NULL)
//!
//! @retval       TRUE                    The setting was successful.
//! @retval       FALSE                   The setting was not successful because the state of the stack was not
//!                                       "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                       number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                       AppConfig.h, can be used) or the local control function was not active or
//!                                       "tServiceToolVerifier" was NULL.
//!
//! Static variables affected:\n
//!  -[out]       \b m_atDiagServDyn      array of "DiagServDyn"-information for every control function
//!
//! @date         10.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagSetServiceToolVerifier(
    ELocalCf eLocalCf,
    TServiceToolVerifier tServiceToolVerifier);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function restores an active DTC (diagnostic trouble code).
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    cptDtc                DTC (diagnostic trouble code; pointer must not be NULL)
//!
//! @retval       TRUE                  The DTC was restored.
//! @retval       FALSE                 The DTC could not be restored because the state of the stack was not
//!                                     "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                     number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                     AppConfig.h, can be used) or the local control function was not active or
//!                                     "cptDtc" was NULL or the maximal number of possible entries was reached.
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         08.04.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagRestoreActiveDtc(ELocalCf eLocalCf, const TDtc *cptDtc);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function restores a previously active DTC (diagnostic trouble code).
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    cptDtc                DTC (diagnostic trouble code; pointer must not be NULL)
//!
//! @retval       TRUE                  The DTC was restored.
//! @retval       FALSE                 The DTC could not be restored because the state of the stack was not
//!                                     "E_ISO_STACK_STATE_INITIALIZING" or "eLocalCf" was not available (only the
//!                                     number of local control functions "NUM_LOCAL_CF", that you defined in
//!                                     AppConfig.h, can be used) or the local control function was not active or
//!                                     "cptDtc" was NULL or the maximal number of possible entries was reached.
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         08.04.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagRestorePreviouslyActiveDtc(ELocalCf eLocalCf, const TDtc *cptDtc);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function starts a DTC. It checks if the DTC is already active or if it was previously active and does
//!        the appropriate actions.
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    u32Spn                suspect parameter number
//! @param[in]    eFmi                  failure mode indicator
//!
//! @retval       TRUE                  The DTC is now in the table for active DTCs (may be that it has already been
//!                                     there).
//! @retval       FALSE                 The DTC is not in the table for active DTCs because the state of the stack was
//!                                     not "E_ISO_STACK_STATE_RUNNING" or "eLocalCf" was not available (only the number
//!                                     of local control functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can
//!                                     be used) or the local control function was not active or the maximal number of
//!                                     possible entries was reached.
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         10.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagStartDtc(ELocalCf eLocalCf, TUint32 u32Spn, EFmi eFmi);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function stops a DTC (if it is active). It moves the DTC to the previously active DTCs if there is at
//!        least one free entry in that table.
//!
//! @param[in]    eLocalCf              local control function
//! @param[in]    u32Spn                suspect parameter number
//! @param[in]    eFmi                  failure mode indicator
//!
//! @retval       TRUE                  The DTC was stopped.
//! @retval       FALSE                 The DTC could not be stopped because the state of the stack was not
//!                                     "E_ISO_STACK_STATE_RUNNING" or "eLocalCf" was not available (only the number of
//!                                     local control functions "NUM_LOCAL_CF", that you defined in AppConfig.h, can be
//!                                     used) or the local control function was not active or the DTC was not active.
//!
//! Static variables affected:\n
//!  -[in,out]    \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         10.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagStopDtc(ELocalCf eLocalCf, TUint32 u32Spn, EFmi eFmi);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the active DTC at the index defined by "u16Index" in the table for active DTCs. This
//!        function can be used during run-time but it is especially needed at shutdown to read out the DTCs for
//!        storage.
//!
//! @param[in]     eLocalCf              local control function
//! @param[in]     u16Index              index in range [0 .. u16IsoStackDiagGetNoOfActiveDtcs()-1]
//! @param[out]    ptDtc                 DTC (diagnostic trouble code)
//!
//! @retval        TRUE                  The DTC was written to "ptDtc".
//! @retval        FALSE                 No DTC was written to "ptDtc" because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING" or
//!                                      "eLocalCf" was not available (only the number of local control functions
//!                                      "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used) or "ptDtc" was
//!                                      NULL or "u16Index" was greater or equal to the number of DTCs in the table.
//!
//! Static variables affected:\n
//!  -[in]         \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date          08.04.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagGetActiveDtc(ELocalCf eLocalCf, TUint16 u16Index, TDtc *ptDtc);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function gets the previously active DTC at the index defined by "u16Index" in the table for previously
//!        active DTCs. This function can be used during run-time but it is especially needed at shutdown to read out
//!        the DTCs for storage.
//!
//! @param[in]     eLocalCf              local control function
//! @param[in]     u16Index              index in range [0 .. u16IsoStackDiagGetNoOfPreviouslyActiveDtcs()-1]
//! @param[out]    ptDtc                 DTC (diagnostic trouble code)
//!
//! @retval        TRUE                  The DTC was written to "ptDtc".
//! @retval        FALSE                 No DTC was written to "ptDtc" because the state of the stack was not
//!                                      "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING" or
//!                                      "eLocalCf" was not available (only the number of local control functions
//!                                      "NUM_LOCAL_CF", that you defined in AppConfig.h, can be used) or "ptDtc" was
//!                                      NULL or "u16Index" was greater or equal to the number of DTCs in the table.
//!
//! Static variables affected:\n
//!  -[in]         \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date          08.04.2016
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TBoolean boIsoStackDiagGetPreviouslyActiveDtc(ELocalCf eLocalCf, TUint16 u16Index, TDtc *ptDtc);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the number of active DTCs.
//!
//! @param[in]    eLocalCf              local control function
//!
//! @return                             number of active DTCs or MAX_VALUE_TUINT16 if state of stack was not
//!                                     "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING" or if "eLocalCf"
//!                                     was not available (only the number of local control functions "NUM_LOCAL_CF", that
//!                                     you defined in AppConfig.h, can be used)
//!
//! Static variables affected:\n
//!  -[in]        \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         15.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackDiagGetNoOfActiveDtcs(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the number of previously active DTCs.
//!
//! @param[in]    eLocalCf              local control function
//!
//! @return                             number of previously active DTCs or MAX_VALUE_TUINT16 if state of stack was not
//!                                     "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING" or if "eLocalCf"
//!                                     was not available (only the number of local control functions "NUM_LOCAL_CF",
//!                                     that you defined in AppConfig.h, can be used)
//!
//! Static variables affected:\n
//!  -[in]        \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         15.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackDiagGetNoOfPreviouslyActiveDtcs(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the maximal number of active DTCs.
//!
//! @param[in]    eLocalCf              local control function
//!
//! @return                             maximal number of active DTCs or MAX_VALUE_TUINT16 if state of stack was not
//!                                     "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING"
//!
//! Static variables affected:\n
//!  -[in]        \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         15.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackDiagGetMaxNoOfActiveDtcs(ELocalCf eLocalCf);

//----------------------------------------------------------------------------------------------------------------------
//! @brief This function returns the maximal number of previously active DTCs.
//!
//! @param[in]    eLocalCf              local control function
//!
//! @return                             maximal number of previously active DTCs or MAX_VALUE_TUINT16 if state of stack
//!                                     was not "E_ISO_STACK_STATE_RUNNING" and not "E_ISO_STACK_STATE_CLOSING"
//!
//! Static variables affected:\n
//!  -[in]        \b m_atDiagServDyn    array of "DiagServDyn"-information for every control function
//!
//! @date         15.12.2015
//----------------------------------------------------------------------------------------------------------------------

ISOAGLIBSE_API TUint16 u16IsoStackDiagGetMaxNoOfPreviouslyActiveDtcs(ELocalCf eLocalCf);

#endif
