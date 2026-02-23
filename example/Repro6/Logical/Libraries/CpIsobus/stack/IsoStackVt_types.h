//**********************************************************************************************************************
//! @file        IsoStackVt_types.h
//! @brief       API for accessing virtual terminal functionality
//! @author      Markus Schiffmann (MSCI)
//! @date        02.07.2015
//! @copyright   (c) all rights reserved by OSB connagtive GmbH
//**********************************************************************************************************************

#ifndef ISOAGLIBS_ISO_STACK_VT_TYPES_H
#define ISOAGLIBS_ISO_STACK_VT_TYPES_H

// INCLUDES=============================================================================================================

#include "IsoStackCore_types.h"
#include "IsoStackNw_types.h"

// GLOBAL DEFINES=======================================================================================================

#define VT_NULL_OBJECT_ID 0xFFFFU
#define VERSION_LABEL_SIZE 7U
#define LANGUAGE_CODE_ALL_LANGUAGES 0x2A2AU // as string: "**"

#define MAX_NO_OF_PREFERRED_INPUT_CANDIDATES 5U

// GLOBAL TYPE DEFINITIONS==============================================================================================

typedef struct
{
    TUint32 u32TimeStampLastReceived; // timestamp of last reception (language message)

    // The following data is extracted from one language message.
    TUint16 u16LanguageCode; // 2 ASCII chars packed into 16 bit (e.g. "en" or "de")
    TUint8  u8NumberFormatDecimalPoint;
    TUint8  u8TimeFormat;
    TUint8  u8DateFormat;
    TUint8  u8UnitFormatDistance;
    TUint8  u8UnitFormatArea;
    TUint8  u8UnitFormatVolume;
    TUint8  u8UnitFormatMass;
    TUint8  u8UnitFormatTemperature;
    TUint8  u8UnitFormatPressure;
    TUint8  u8UnitFormatForce;
    TUint8  u8UnitFormatUnitsSystem;
} TLocalSettings;

typedef struct
{
    TUint32 u32TimeStampLastReceivedVersion;
    TUint8 u8Iso11783version;  //!< Here the version number of the terminal gets stored as soon as the "VT Get Memory
                               //!< Response" was received.
} TVtVersion;

typedef struct
{
    TUint32 u32TimeStampLastReceivedSoftkeys;
    TUint8 u8SkPhysical;
    TUint8 u8SkVirtual;
    TUint8 u8SkWidth;
    TUint8 u8SkHeight;
} TVtSoftKeyData;

typedef struct
{
    TUint32 u32TimeStampLastReceivedFont;
    TUint16 u16FontSizes;
    TUint8 u8FontStyles;
} TVtTextFontData;

typedef struct
{
    TUint32 u32TimeStampLastReceivedHardware;
    TUint8 u8BootTime;
    TUint8 u8HwGraphicType; //!< 0, 1 or 2 (2, 16 or 256 colors)

    //! The following describes the bits of "u8HwHardware".
    //! Bit 0 = 1 = VT has a touch screen or pointing device and supports Pointing Event message.
    //! Bit 1 = 1 = VT reports drag operation via Pointing Event message (Bit 0 shall be set to 1)
    //! Bit 2 = 1 = VT has multiple frequency audio output
    //! Bit 3 = 1 = VT has adjustable volume audio output
    //! Bit 4 = 1 = VT supports simultaneous activations of all combinations of physical soft keys (See Clause 4.6.15
    //!             Soft key and button activation)
    //! Bit 5 = 1 = VT supports intermediate coordinates during a drag operation (Bit 1 shall be set to a 1)
    TUint8 u8HwHardware;
    TUint16 u16HwWidth;
} TVtHardwareData;

typedef struct
{
    TVtVersion tVtVersion;
    TVtSoftKeyData tVtSoftKeyData;
    TVtTextFontData tVtTextFontData;
    TVtHardwareData tVtHardwareData;
} TVtCapabilities;

typedef enum
{
    E_REG_POOL_MODE_MASTER_TO_ANY_VT,
    E_REG_POOL_MODE_MASTER_TO_PRIMARY_VT
} ERegisterPoolMode;

typedef struct
{
    const TUint8 ISO_OP_MEMORY_CLASS *cpu8Data; // This data is the data of the object pool and additionally one group
                                                 // function byte for pool upload.
    TUint32 u32DataSize; // size of cpu8Data, i.e. size of object pool + 1
    TUint32 u32SizeOfGraphicsContextObject;
    TUint32 u32ScalingOffset; // all objects before this position are scaled with data mask scaling, the object at this
                              // position and all objects after this position are scaled with soft key scaling
} TVtClientPoolPart;

typedef struct
{
    TUint8 u8Version;
    TUint16 u16LanguageCode; // cast string of length 2 to TUint16; string "**" means all languages
    TVtClientPoolPart tVtClientPoolPart;
} TVtClientCondPoolPart; // conditioned pool part

typedef struct
{
    const TChar *cpchVersionLabel; // length 7, not null-terminated, the last two characters have to be spaces if the
                                   // pool is multi-lingual
    ERegisterPoolMode eRegisterPoolMode;
    TUint16 u16DataMaskSize;
    TUint16 u16SoftKeyWidth;
    TUint16 u16SoftKeyHeight;
    const TVtClientCondPoolPart *catVtClientCondPoolParts; // array of TVtClientCondPoolPart, for each version-
                                                           // language-combination one entry, and after them an entry
                                                           // with version 0 to identify the end of the array
    TUint8 u8Version; // The application can define the pool/VT client version here. It has to be greater than or equal
                      // to the maximum of the pool part versions. If the application does not want to define the
                      // pool/VT client version by itself, it can set this member to 0. In this case ISOAgLib SE uses
                      // the maximum of the pool part versions as pool/VT client version.
} TVtClientObjectPool;

// Default for this structure is "tPreferredVt.boSpecified == FALSE". Don't care for name field and u8BootTimeSeconds
// then!
typedef struct
{
    TNameOption tPreferredVt;
    TUint8 u8BootTime; // unit: s
} TVtClientStorage;

//! This enum describes the reason why the connection request callback is called.
typedef enum
{
    E_VT_CONN_REQ_REASON_FIRST_CONTACT, //!< "normal" connection request
    E_VT_CONN_REQ_REASON_OUT_OF_MEMORY, //!< The VT server has not enough memory available for the object pool that was
                                        //!< provided by the application.
    E_VT_CONN_REQ_REASON_FAULTY_OBJECT_POOL //!< The object pool that was provided by the application has been rejected
                                            //!< by the VT server because it is faulty.
} EVtConnReqReason;

//! This enum describes the key activation code contained in the Soft Key Activation message and the Button Activation
//! message.
typedef enum
{
    E_VT_KEY_ACTIVATION_CODE_RELEASED = 0, //!< key has been released (state change)
    E_VT_KEY_ACTIVATION_CODE_PRESSED  = 1, //!< key has been pressed (state change)
    E_VT_KEY_ACTIVATION_CODE_HELD     = 2, //!< key is still pressed
    E_VT_KEY_ACTIVATION_CODE_ABORTED  = 3, //!< key press aborted
    E_VT_KEY_ACTIVATION_CODE_LAST     = E_VT_KEY_ACTIVATION_CODE_ABORTED
} EVtKeyActivationCode;

//! This enum describes the attributes contained in the VT Select Input Object message.
typedef enum
{
    E_VT_SEL_INPUT_OBJ_ATTR_DESELECTED,        //!< object is deselected
    E_VT_SEL_INPUT_OBJ_ATTR_SELECTED_NOT_OPEN, //!< object is selected but not open for data input
    E_VT_SEL_INPUT_OBJ_ATTR_OPEN               //!< object is open for data input
} EVtSelectInputObjectAttributes;

typedef struct
{
    //------------------------------------------------------------------------------------------------------------------
    //! @brief When a VT is available, we use this callback to ask the application if we shall connect to that server.
    //!        Have a look at the description of the connection mechanism in "IsoStackVt.h" for more detailed
    //!        information.
    //!
    //! @param[in]    eLocalCf             local control function which is acting as VT client
    //! @param[in]    cptVtCapabilities    capabilities of VT server
    //! @param[in]    eVtConnReqReason     connection request reason
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvConnectionRequest)(
        ELocalCf eLocalCf,
        const TVtCapabilities *cptVtCapabilities,
        EVtConnReqReason eVtConnReqReason);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when one of our VT clients has successfully uploaded its object pool to a VT
    //!        server. This VT client is in command handling state then.
    //!
    //! @param[in]    eLocalCf            local control function which is acting as VT client
    //! @param[in]    cptLocalSettings    current local settings of the VT server, i.e. for example the language code
    //!                                   and the unit formats
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvObjectPoolUploadedSuccessfully)(ELocalCf eLocalCf, const TLocalSettings *cptLocalSettings);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when we have already been in command handling state and disconnect from the VT
    //!        server.
    //!
    //! @param[in]    eLocalCf    local control function which is acting as VT client
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvEnterSafeState)(ELocalCf eLocalCf);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when we receive the response to one of the commands we sent. The user ID
    //!        parameter can help to identify the command. It's the same user ID that you gave as parameter when you
    //!        executed the command using one of the functions in "IsoStackVt.h".
    //!
    //! @param[in]    eLocalCf       local control function which is acting as VT client
    //! @param[in]    u8ErrorCode    error code of the response
    //! @param[in]    u32UserId      user ID
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtCommandResponse)(ELocalCf eLocalCf, TUint8 u8ErrorCode, TUint32 u32UserId);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when we receive the response to one of the proprietary VT commands we sent. The
    //!        user ID parameter can help to identify the command. It's the same user ID that you gave as parameter when
    //!        you executed the command using function "eIsoStackVtQPropCmd()".
    //!
    //! @param[in]    eLocalCf        local control function which is acting as VT client
    //! @param[in]    cptCU8Buffer    pointer to buffer for data of command response; responses are handled up to a
    //!                               maximal data size of 259 byte;
    //!                               ATTENTION: parameter "cptCU8Buffer" can also be NULL; if no response is received
    //!                               for a certain command and if the value of "DisconnectIfNoResponse" (set by the
    //!                               application) is FALSE, this callback is called with parameter "cptCU8Buffer" set
    //!                               to NULL
    //! @param[in]    u16UserId       user ID
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtPropCommandResponse)(ELocalCf eLocalCf, const TCU8Buffer *cptCU8Buffer, TUint16 u16UserId);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when we receive a language message from a VT server one of our VT clients is
    //!        connected to and the client is in command handling state.
    //!
    //! @param[in]    eLocalCf            local control function which is acting as VT client
    //! @param[in]    cptLocalSettings    current local settings of the VT server, i.e. for example the language code
    //!                                   and the unit formats
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtEventLanguagePgn)(ELocalCf eLocalCf, const TLocalSettings *cptLocalSettings);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This callback tells the application if the VT client (that is in command handling state) of control
    //!        function "eLocalCf" is the active client on the VT (parameter "boActiveClient") and which data mask
    //!        (parameter "u16DamUid") and soft key mask (parameter "u16SkmUid") is displayed.
    //!        The function is called:
    //!                - On successful VT pool upload.
    //!                - On change reported via a VT status message.
    //!
    //! @param[in]    eLocalCf          local control function which is acting as VT client
    //! @param[in]    boActiveClient    indicates if the VT client (that is in command handling state) of control
    //!                                 function "eLocalCf" is the active client on the VT
    //! @param[in]    u16DamUid         data mask that is displayed
    //! @param[in]    u16SkmUid         soft key mask that is displayed
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvDisplayState)(ELocalCf eLocalCf, TBoolean boActiveClient, TUint16 u16DamUid, TUint16 u16SkmUid);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This callback tells the application if more than just one VT server is available (parameter
    //!        "boMultipleVts"). The function is only called on change. If there are multiple VTs, the application can
    //!        for example display a soft key which the operator can press to move the VT client to the next VT server.
    //!        To move to the next VT, you can use function "eIsoStackVtMoveToNextVt()".
    //!
    //! @param[in]    eLocalCf         local control function which is acting as VT client
    //! @param[in]    boMultipleVts    indicates if more than just one VT server is available
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvMultipleActiveVts)(ELocalCf eLocalCf, TBoolean boMultipleVts);

    // Callbacks for activation messages

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when the operator presses a soft key or the alarm ACK means on the VT. If a key
    //!        is held and the interval between messages exceeds 300 ms, then the ECU working set should process as if
    //!        the key was released. If the VT has a means to abort the key press, it shall send the key press aborted
    //!        activation code instead of the key press released activation code (e.g. press button on touch screen,
    //!        slide finger off side of button, abort is sent). If the operator has pressed the alarm ACK means on the
    //!        VT, parameter "u8KeyCode" is 0, otherwise this parameter has the value that you specified in your object
    //!        pool for that soft key.
    //!
    //! @param[in]    eLocalCf                local control function which is acting as VT client
    //! @param[in]    eVtKeyActivationCode    key activation code
    //! @param[in]    u16ObjId                object ID of soft key
    //! @param[in]    u16ObjIdMask            object ID of soft key mask of soft key
    //! @param[in]    u8KeyCode               key code (0 for alarm ACK)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtSoftKeyActivation)(
        ELocalCf eLocalCf,
        EVtKeyActivationCode eVtKeyActivationCode,
        TUint16 u16ObjId,
        TUint16 u16ObjIdMask,
        TUint8 u8KeyCode);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when the operator presses a button on the VT. If a non-latchable button is held
    //!        and the interval between messages exceeds 300 ms, then the ECU working set should process as if the
    //!        button was released. If the VT has a means to abort the button press, it shall send the button press
    //!        aborted activation code instead of the button press released activation code (e.g. press button on touch
    //!        screen, slide finger off side of button, abort is sent). Parameter "u8KeyCode" has the value that you
    //!        specified in your object pool for that soft key.
    //!
    //! @param[in]    eLocalCf                local control function which is acting as VT client
    //! @param[in]    eVtKeyActivationCode    key activation code
    //! @param[in]    u16ObjId                object ID of button
    //! @param[in]    u16ObjIdMask            object ID of data mask of button
    //! @param[in]    u8KeyCode               key code
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtButtonActivation)(
        ELocalCf eLocalCf,
        EVtKeyActivationCode eVtKeyActivationCode,
        TUint16 u16ObjId,
        TUint16 u16ObjIdMask,
        TUint8 u8KeyCode);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a position in the data mask area was touched, clicked or dragged if the VT
    //!        supports a touch screen or pointing device. The two positions are related to the VT resolution and have
    //!        to be scaled to get the positions related to the object pool resolution. Therefor we have to do the
    //!        calculation reversly compared to the way we have to do it for commands. We have to multiply the values by
    //!        "u16ScalingDenominator" and divide the result by "u16ScalingNumerator" (you can get the scaling factor
    //!        using function "boIsoStackVtGetScalingFactor"). The x-value of a position is 0 on the left end of a data
    //!        mask and increases towards the right end of a data mask, the y-value of a position is 0 on the upper end
    //!        of a data mask and increases towards the lower end of a data mask.
    //!
    //! @param[in]    eLocalCf    local control function which is acting as VT client
    //! @param[in]    u16XPos     x-value of the position
    //! @param[in]    u16YPos     y-value of the position
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtPointingEvent)(ELocalCf eLocalCf, TUint16 u16XPos, TUint16 u16YPos);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when an input field, Button, or Key object is selected (gets focus), deselected
    //!        (loses focus), opened for edit or closed after edit by the operator or an ESC command.
    //!
    //! @param[in]    eLocalCf                          local control function which is acting as VT client
    //! @param[in]    u16ObjectId                       object ID of input object (input field, Button, or Key object)
    //! @param[in]    eVtSelectInputObjectAttributes    attributes (selected, selected but not open, open)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtSelectInputObject)(
        ELocalCf eLocalCf,
        TUint16 u16ObjectId,
        EVtSelectInputObjectAttributes eVtSelectInputObjectAttributes);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when the operator presses the ESC means to close an input field and when the VT
    //!        closes an open input field due to a Change Active Mask command. Parameter "u16ObjectId" tells you the
    //!        object ID of that input field object.
    //!
    //! @param[in]    eLocalCf       local control function which is acting as VT client
    //! @param[in]    u16ObjectId    object ID of input field object
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtEsc)(ELocalCf eLocalCf, TUint16 u16ObjectId);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when the operator enters a numeric value for an input object or variable,
    //!        regardless of whether or not the value changed. The message is not sent if the input was aborted (in this
    //!        case a VT ESC message would be sent instead). For input objects that have a number variable reference,
    //!        the object ID of the Number Variable object is used in the message.
    //!
    //! @param[in]    eLocalCf    local control function which is acting as VT client
    //! @param[in]    u16ObjId    object ID of input object or Number Variable object
    //! @param[in]    u32Value    numeric value entered by the operator
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtNumericValue)(ELocalCf eLocalCf, TUint16 u16ObjId, TUint32 u32Value);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when the operator enters a string value for an input object or variable. If the
    //!        Input String object references a String Variable object, the object ID of the String Variable object is
    //!        used in the message instead of the object ID of the Input String object.\n
    //!        NOTE: "cpchValue" is NOT null-terminated!
    //!
    //! @param[in]    eLocalCf     local control function which is acting as VT client
    //! @param[in]    u16ObjId     object ID of Input String object or String Variable object
    //! @param[in]    u8Length     length of string value entered by the operator
    //! @param[in]    cpchValue    string value entered by the operator (NOT null-terminated!)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvVtStringValue)(ELocalCf eLocalCf, TUint16 u16ObjId, TUint8 u8Length, const TChar *cpchValue);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when an AUX function (type 1) is getting assigned or unassigned (indicated by
    //!        parameter "boAssigned").\n
    //!        NOTE: AUX-O (type 1) is not supported in the standard ISOAgLib SE release, so this callback needs to be
    //!              provided but is not utilized.
    //!
    //! @param[in]    eLocalCf               local control function which is acting as VT client
    //! @param[in]    u16FunctionObjectId    object ID of AUX function that is assigned or unassigned
    //! @param[in]    boAssigned             indicates if the AUX function is either assigned or unassigned
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvAux1AssignmentChanged)(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TBoolean boAssigned);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a value from the assigned AUX input (type 1) of an AUX function (with object
    //!        ID "u16FunctionObjectId") is being received. If the AUX function type is boolean, value 0 for parameter
    //!        "u16Value" means "disabled", value 1 means "enabled" and value 2 means "non-latched boolean held".
    //!        Parameter "u16NoOfTransitions" is the number of transitions from "disabled" to "enabled" (0 if input type
    //!        is analog). This is a running count of transitions since power-on.\n
    //!        NOTE: AUX-O (type 1) is not supported in the standard ISOAgLib SE release, so this callback needs to be
    //!              provided but is not utilized.
    //!
    //! @param[in]    eLocalCf               local control function which is acting as VT client
    //! @param[in]    u16FunctionObjectId    object ID of AUX function whose assigned AUX input has sent a value
    //! @param[in]    u16Value               value from the assigned AUX input of the AUX function (if the AUX function
    //!                                      type is boolean, value 0 means "disabled", value 1 means "enabled" and
    //!                                      value 2 means "non-latched boolean held")
    //! @param[in]    u16NoOfTransitions     number of transitions from "disabled" to "enabled" since power-on (0 if
    //!                                      input type is analog)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvAux1Value)(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TUint16 u16Value, TUint16 u16NoOfTransitions);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when an AUX function (type 2) is getting assigned or unassigned (indicated by
    //!        parameter "boAssigned"). That does not necessarily mean that also a preferred assignment has been
    //!        changed.
    //!        Note: Don't call function "boIsoStackVtGetPreferredAux2Input()" triggered by this callback. That function
    //!              is intended to be used during shutdown only.
    //!
    //! @param[in]    eLocalCf               local control function which is acting as VT client
    //! @param[in]    u16FunctionObjectId    object ID of AUX function that is assigned or unassigned
    //! @param[in]    boAssigned             indicates if the AUX function is either assigned or unassigned
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvAux2AssignmentChanged)(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TBoolean boAssigned);

    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when a value from the assigned AUX input (type 2) of an AUX function (with object
    //!        ID "u16FunctionObjectId") is being received. For further information how parameters "u16Value1" and
    //!        "u16Value2" have to be interpreted, please have a look at "ISO11783-6 J.4.6 Auxiliary Function Type 2
    //!        types".
    //!
    //! @param[in]    eLocalCf               local control function which is acting as VT client
    //! @param[in]    u16FunctionObjectId    object ID of AUX function whose assigned AUX input has sent a value
    //! @param[in]    u16Value1              first value from the assigned AUX input of the AUX function (for further
    //!                                      information how this parameter has to be interpreted, please have a look at
    //!                                      "ISO11783-6 J.4.6 Auxiliary Function Type 2)
    //! @param[in]    u16Value2              second value from the assigned AUX input of the AUX function (for further
    //!                                      information how this parameter has to be interpreted, please have a look at
    //!                                      "ISO11783-6 J.4.6 Auxiliary Function Type 2)
    //------------------------------------------------------------------------------------------------------------------
    TVoid(*fpvAux2Value)(ELocalCf eLocalCf, TUint16 u16FunctionObjectId, TUint16 u16Value1, TUint16 u16Value2);
} TVtClientCallbacks;

typedef struct
{
    //------------------------------------------------------------------------------------------------------------------
    //! @brief This function is called when an AUX input (type 2) is being enabled or disabled by the VT.
    //!
    //! @param[in]    eLocalCf              local control function which is acting as VT client
    //! @param[in]    u16InputObjectId      object ID of AUX input that was enabled or disabled (at pool upload, all 
    //!                                     inputs are disabled)
    //! @param[in]    boEnabled             TRUE  = Enabled
    //!                                     FALSE = Disabled

    TVoid(*fpvAux2EnableDisableInput)(ELocalCf eLocalCf, TUint16 u16InputObjectId, TBoolean boEnabled);
} TVtClientAux2InputCallbacks;

//! These offsets can be supplied as parameter of function "boIsoStackVtDoConnect()" to move objects (typically for
//! centering when object scaling is disabled).
typedef struct
{
    TInt16 i16DmX; //!< X offset for objects in Data Masks (also in Alarm Masks)
    TInt16 i16DmY; //!< Y offset for objects in Data Masks (also in Alarm Masks)
    TInt16 i16SkX; //!< X offset for objects in Soft Keys (also in Working Set Designator and in Auxiliary
                   //!< Functions/Inputs)
    TInt16 i16SkY; //!< Y offset for objects in Soft Keys (also in Working Set Designator and in Auxiliary
                   //!< Functions/Inputs)
} TAdditionalOffsets;

typedef enum
{
    E_SCALING_TYPE_DATA_MASK = 0,
    E_SCALING_TYPE_SOFT_KEY = 1,
    E_SCALING_TYPE_LAST = E_SCALING_TYPE_SOFT_KEY
} EScalingType;

//! This struct describes the scaling factor that has to be used for all commands that have size or position parameters
//! and also for the pointing event callback. For commands we have to scale sizes and positions from the object pool
//! resolution to the VT resolution. Therefor we have to multiply the values by "u16ScalingNumerator" and divide the
//! result by "u16ScalingDenominator". For the position parameters of the pointing event callback we have do the
//! calculation reversely. Here we get the positions related to the VT resolution and have to calculate the positions
//! related to the object pool resolution. Therefor we have to multiply the values by "u16ScalingDenominator" and divide
//! the result by "u16ScalingNumerator".
typedef struct
{
    TUint16 u16ScalingNumerator;
    TUint16 u16ScalingDenominator;
} TScalingFactor;

typedef enum
{
    E_MASK_TYPE_DATA_MASK = 1,
    E_MASK_TYPE_ALARM_MASK = 2
} EMaskType;

typedef enum
{
    E_Q_COMMAND_RESULT_SUCCESS,
    E_Q_COMMAND_RESULT_INVALID_PARAMETER,
    E_Q_COMMAND_RESULT_ISO_STACK_NOT_RUNNING,
    E_Q_COMMAND_RESULT_VT_CONNECTION_NOT_COMMAND_HANDLING,
    E_Q_COMMAND_RESULT_FEATURE_NOT_AVAILABLE,
    E_Q_COMMAND_RESULT_PUSHING_INTO_BUFFER_UNSUCCESSFUL
} EQCommandResult;

typedef struct
{
    TUint16 u16ObjectId;
    TName tName;
    TUint16 u16ModelIdentificationCode;
    TBoolean boPreserve; //!< When there is an assignment that shall be stored as preferred assignment and the maximal
                         //!< number of preferred input candidates has already been reached, first the preferred input
                         //!< candidates, where this flag is FALSE, are removed. Only if there is no preferred input
                         //!< candidate with this flag set to FALSE, one with the flag set to TRUE is removed.
} TPreferredInputCandidate;

//! This structure describes the preferred input candidates of an AUX function.
//! ISOAgLib SE provides the possibility to have not only one preferred input for an AUX function but several preferred
//! input candidates.
//! If for example an implement is used with two tractors alternately, the farmer can assign two different joysticks and
//! then the assignments are made depending on which joystick is currently on the bus. This has the advantage that the
//! farmer does not have to do the assignments manually again each time he changes the tractor.
typedef struct
{
    TUint16 u16Size;
    TPreferredInputCandidate atEntries[MAX_NO_OF_PREFERRED_INPUT_CANDIDATES]; //!< first entry has lowest priority and
                                                                              //!< last entry has highest priority
} TTableOfPreferredInputCandidates;

//! Enum for return values of AUX inputs activation
typedef enum
{
    E_AUX_INPUTS_ACT_RESULT_ACTIVATION_SUCCESSFUL,        //!< activation was successful
    E_AUX_INPUTS_ACT_RESULT_LOCAL_CF_NOT_AVAILABLE,       //!< "eLocalCf" was not available (only the number of local
                                                          //!< control functions "NUM_LOCAL_CF" that are defined in
                                                          //!< AppConfig.h can be used)
    E_AUX_INPUTS_ACT_RESULT_STACK_STATE_NOT_INITIALIZING, //!< the state of the stack was not
                                                          //!< "E_ISO_STACK_STATE_INITIALIZING"
    E_AUX_INPUTS_ACT_RESULT_VT_CLIENT_NOT_YET_ACTIVATED,  //!< VT client had not yet been activated (by calling function
                                                          //!< "boIsoStackVtActivateClient()")
    E_AUX_INPUTS_ACT_RESULT_MIC_OUT_OF_RANGE,             //!< model identification code was not between 0 and 0xFFFE
    E_AUX_INPUTS_ACT_RESULT_POOL_DATA_CORRUPT,            //!< object pool (IOP) data was corrupt
    E_AUX_INPUTS_ACT_RESULT_NO_OBJECTS_FOUND,             //!< no suitable AUX input objects have been found in the
                                                          //!< object pool
    E_AUX_INPUTS_ACT_RESULT_OUT_OF_MEMORY,                //!< AUX inputs memory buffer was too small
    E_AUX_INPUTS_ACT_RESULT_CALLBACKS_INVALID             //!< cptVtClientAux2InputCallbacks or one of its function
                                                          //!< pointers is NULL
} EAuxInputsActivationResult;

typedef enum
{
    E_AUX_2_INPUT_DUAL_BOOL_POS_OFF                      = 0x00,
    E_AUX_2_INPUT_DUAL_BOOL_POS_FORWARD_OR_UP_OR_RIGHT   = 0x01,
    E_AUX_2_INPUT_DUAL_BOOL_POS_BACKWARD_OR_DOWN_OR_LEFT = 0x04,
    E_AUX_2_INPUT_DUAL_BOOL_POS_LAST = E_AUX_2_INPUT_DUAL_BOOL_POS_BACKWARD_OR_DOWN_OR_LEFT
} EAux2InputDualBooleanPosition;

//! Enum for return values of status setter functions for AUX inputs
typedef enum
{
    E_AUX_INP_STATUS_SET_RES_SUCCESSFUL,                             //!< status setting was successful
    E_AUX_INP_STATUS_SET_RES_STACK_STATE_NOT_RUNNING,                //!< the state of the stack was not
                                                                     //!< "E_ISO_STACK_STATE_RUNNING"
    E_AUX_INP_STATUS_SET_RES_AUX_INPUTS_FUNCTIONALITY_NOT_ACTIVATED, //!< AUX inputs functionality had not been
                                                                     //!< activated (by calling function
                                                                     //!< "eIsoStackVtActivateClientAuxInputs()")
    E_AUX_INP_STATUS_SET_RES_LOCAL_CF_NOT_AVAILABLE,                 //!< "eLocalCf" was not available (only the number
                                                                     //!< of local control functions "NUM_LOCAL_CF" that
                                                                     //!< are defined in AppConfig.h can be used)
    E_AUX_INP_STATUS_SET_RES_PARAMETER_OUT_OF_RANGE,                 //!< a function parameter was not within its
                                                                     //!< allowed range
    E_AUX_INP_STATUS_SET_RES_INP_DOES_NOT_EXIST,                     //!< an AUX input with the specified object ID does
                                                                     //!< not exist
    E_AUX_INP_STATUS_SET_RES_INP_HAS_WRONG_FUNCTION_TYPE             //!< the AUX input with the specified object ID has
                                                                     //!< the wrong function type for the used setter
                                                                     //!< function
} EAuxInputStatusSettingResult;

//! Enum for setting of AUX input status "error" or "not available"
typedef enum
{
    E_AUX_INP_STATUS_VALID,        //!< status value "valid"         (range: 0x0000 to 0xFAFF)
    E_AUX_INP_STATUS_ERROR,        //!< status value "error"         (range: 0xFE00 to 0xFEFF, we send 0xFE00)
    E_AUX_INP_STATUS_NOT_AVAILABLE //!< status value "not available" (range: 0xFF00 to 0xFFFF, we send 0xFF00)
} EAuxInputStatusErrorNotAvailable;

//lint -e849 (duplicated numeric values are put here on purpose, please be sure to use the right enum for the corresponding object type)
//! Enum for Set Attributes and Get Attributes
//! *_W is writeable and readable
//! *_R is read only
typedef enum
{
    // Generic VTv2+
    E_VT_AID_TYPE_R                                 = 0,

    // Working Set Designator VTv2+
    E_VT_AID_WSD_BACKGROUND_COLOUR_R                = 1,
    E_VT_AID_WSD_SELECTABLE_R                       = 2,
    E_VT_AID_WSD_ACTIVE_MASK_R                      = 3,

    // Data Mask VTv2+
    E_VT_AID_MSK_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_MSK_SOFTKEY_MASK_W                     = 2,

    // Alarm Mask VTv2+
    E_VT_AID_ALM_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_ALM_SOFTKEY_MASK_W                     = 2,
    E_VT_AID_ALM_PRIORITY_W                         = 3,
    E_VT_AID_ALM_ACOUSTIC_SIGNAL_W                  = 4,

    // Container VTv2+
    E_VT_AID_CTR_WIDTH_R                            = 1,
    E_VT_AID_CTR_HEIGHT_R                           = 2,
    E_VT_AID_CTR_HIDDEN_R                           = 3,

    // Soft Key Mask VTv2+
    E_VT_AID_SKM_BACKGROUND_COLOUR_W                = 1,

    // Soft Key VTv2+
    E_VT_AID_KEY_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_KEY_KEY_CODE_W                         = 2,

    // Button VTv2+
    E_VT_AID_BTN_WIDTH_W                            = 1,
    E_VT_AID_BTN_HEIGHT_W                           = 2,
    E_VT_AID_BTN_BACKGROUND_COLOUR_W                = 3,
    E_VT_AID_BTN_BORDER_COLOUR_W                    = 4,
    E_VT_AID_BTN_KEY_CODE_W                         = 5,
    E_VT_AID_BTN_OPTIONS_W                          = 6,

    // Input Boolean VTv2+
    E_VT_AID_IPB_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_IPB_WIDTH_W                            = 2,
    E_VT_AID_IPB_FOREGROUND_COLOUR_W                = 3,
    E_VT_AID_IPB_VARIABLE_REFERENCE_W               = 4,
    E_VT_AID_IPB_VALUE_R                            = 5,
    E_VT_AID_IPB_ENABLED_R                          = 6,

    // Input String VTv2+
    E_VT_AID_IPS_WIDTH_W                            = 1,
    E_VT_AID_IPS_HEIGHT_W                           = 2,
    E_VT_AID_IPS_BACKGROUND_COLOUR_W                = 3,
    E_VT_AID_IPS_FONT_ATTRIBUTES_W                  = 4,
    E_VT_AID_IPS_INPUT_ATTRIBUTES_W                 = 5,
    E_VT_AID_IPS_OPTIONS_W                          = 6,
    E_VT_AID_IPS_VARIABLE_REFERENCE_W               = 7,
    E_VT_AID_IPS_JUSTIFICATION_W                    = 8,
    E_VT_AID_IPS_ENABLED_R                          = 9,

    // Input Number VTv2+
    E_VT_AID_IPN_WIDTH_W                            = 1,
    E_VT_AID_IPN_HEIGHT_W                           = 2,
    E_VT_AID_IPN_BACKGROUND_COLOUR_W                = 3,
    E_VT_AID_IPN_FONT_ATTRIBUTES_W                  = 4,
    E_VT_AID_IPN_OPTIONS_W                          = 5,
    E_VT_AID_IPN_VARIABLE_REFERENCE_W               = 6,
    E_VT_AID_IPN_MIN_VALUE_W                        = 7,
    E_VT_AID_IPN_MAX_VALUE_W                        = 8,
    E_VT_AID_IPN_OFFSET_W                           = 9,
    E_VT_AID_IPN_SCALE_W                            = 10,
    E_VT_AID_IPN_NUM_OF_DECIMALS_W                  = 11,
    E_VT_AID_IPN_FORMAT_W                           = 12,
    E_VT_AID_IPN_JUSTIFICATION_W                    = 13,
    E_VT_AID_IPN_VALUE_R                            = 14,
    E_VT_AID_IPN_OPTIONS_2_R                        = 15,

    // Input List VTv2+
    E_VT_AID_IPL_WIDTH_W                            = 1,
    E_VT_AID_IPL_HEIGHT_W                           = 2,
    E_VT_AID_IPL_VARIABLE_REFERENCE_W               = 3,
    E_VT_AID_IPL_VALUE_R                            = 4,
    E_VT_AID_IPL_OPTIONS_R                          = 5,

    // Output String VTv2+
    E_VT_AID_OPS_WIDTH_W                            = 1,
    E_VT_AID_OPS_HEIGHT_W                           = 2,
    E_VT_AID_OPS_BACKGROUND_COLOUR_W                = 3,
    E_VT_AID_OPS_FONT_ATTRIBUTES_W                  = 4,
    E_VT_AID_OPS_OPTIONS_W                          = 5,
    E_VT_AID_OPS_VARIABLE_REFERENCE_W               = 6,
    E_VT_AID_OPS_JUSTIFICATION_W                    = 7,

    // Output Number VTv2+
    E_VT_AID_OPN_WIDTH_W                            = 1,
    E_VT_AID_OPN_HEIGHT_W                           = 2,
    E_VT_AID_OPN_BACKGROUND_COLOUR_W                = 3,
    E_VT_AID_OPN_FONT_ATTRIBUTES_W                  = 4,
    E_VT_AID_OPN_OPTIONS_W                          = 5,
    E_VT_AID_OPN_VARIABLE_REFERENCE_W               = 6,
    E_VT_AID_OPN_OFFSET_W                           = 7,
    E_VT_AID_OPN_SCALE_W                            = 8,
    E_VT_AID_OPN_NUM_OF_DECIMALS_W                  = 9,
    E_VT_AID_OPN_FORMAT_W                           = 10,
    E_VT_AID_OPN_JUSTIFICATION_W                    = 11,
    E_VT_AID_OPN_VALUE_R                            = 12,

    // Line VTv2+
    E_VT_AID_LNE_LINE_ATTRIBUTES_W                  = 1,
    E_VT_AID_LNE_WIDTH_W                            = 2,
    E_VT_AID_LNE_HEIGHT_W                           = 3,
    E_VT_AID_LNE_LINE_DIRECTION_W                   = 4,

    // Rectangle VTv2+
    E_VT_AID_RCT_LINE_ATTRIBUTES_W                  = 1,
    E_VT_AID_RCT_WIDTH_W                            = 2,
    E_VT_AID_RCT_HEIGHT_W                           = 3,
    E_VT_AID_RCT_LINE_SUPPRESION_W                  = 4,
    E_VT_AID_RCT_FILL_ATTRIBUTES_W                  = 5,

    // Ellipse VTv2+
    E_VT_AID_EPS_LINE_ATTRIBUTES_W                  = 1,
    E_VT_AID_EPS_WIDTH_W                            = 2,
    E_VT_AID_EPS_HEIGHT_W                           = 3,
    E_VT_AID_EPS_ELLIPSE_TYPE_W                     = 4,
    E_VT_AID_EPS_START_ANGLE_W                      = 5,
    E_VT_AID_EPS_END_ANGLE_W                        = 6,
    E_VT_AID_EPS_FILL_ATTRIBUTES_W                  = 7,

    // Polygon VTv2+
    E_VT_AID_PLN_WIDTH_W                            = 1,
    E_VT_AID_PLN_HEIGHT_W                           = 2,
    E_VT_AID_PLN_LINE_ATTRIBUTES_W                  = 3,
    E_VT_AID_PLN_FILL_ATTRIBUTES_W                  = 4,
    E_VT_AID_PLN_POLYGON_TYPE_W                     = 5,

    // Meter VTv2+
    E_VT_AID_MTR_WIDTH_W                            = 1,
    E_VT_AID_MTR_NEEDLE_COLOUR_W                    = 2,
    E_VT_AID_MTR_BORDER_COLOUR_W                    = 3,
    E_VT_AID_MTR_ARC_AND_TICK_COLOUR_W              = 4,
    E_VT_AID_MTR_OPTIONS_W                          = 5,
    E_VT_AID_MTR_NUM_OF_TICKS_W                     = 6,
    E_VT_AID_MTR_START_ANGLE_W                      = 7,
    E_VT_AID_MTR_END_ANGLE_W                        = 8,
    E_VT_AID_MTR_MIN_VALUE_W                        = 9,
    E_VT_AID_MTR_MAX_VALUE_W                        = 10,
    E_VT_AID_MTR_VARIABLE_REFERENCE_W               = 11,
    E_VT_AID_MTR_VALUE_R                            = 12,

    // Linear Bar Graph VTv2+
    E_VT_AID_LBG_WIDTH_W                            = 1,
    E_VT_AID_LBG_HEIGHT_W                           = 2,
    E_VT_AID_LBG_COLOUR_W                           = 3,
    E_VT_AID_LBG_TARGET_LINE_COLOUR_W               = 4,
    E_VT_AID_LBG_OPTIONS_W                          = 5,
    E_VT_AID_LBG_NUM_OF_TICKS_W                     = 6,
    E_VT_AID_LBG_MIN_VALUE_W                        = 7,
    E_VT_AID_LBG_MAX_VALUE_W                        = 8,
    E_VT_AID_LBG_VARIABLE_REFERENCE_W               = 9,
    E_VT_AID_LBG_TARGET_VALUE_VARIABLE_REFERENCE_W  = 10,
    E_VT_AID_LBG_TARGET_VALUE_W                     = 11,
    E_VT_AID_LBG_VALUE_R                            = 12,

    // Arched Bar Graph VTv2+
    E_VT_AID_ABG_WIDTH_W                            = 1,
    E_VT_AID_ABG_HEIGHT_W                           = 2,
    E_VT_AID_ABG_COLOUR_W                           = 3,
    E_VT_AID_ABG_TARGET_LINE_COLOUR_W               = 4,
    E_VT_AID_ABG_OPTIONS_W                          = 5,
    E_VT_AID_ABG_START_ANGLE_W                      = 6,
    E_VT_AID_ABG_END_ANGLE_W                        = 7,
    E_VT_AID_ABG_BAR_GRAPH_WIDTH_W                  = 8,
    E_VT_AID_ABG_MIN_VALUE_W                        = 9,
    E_VT_AID_ABG_MAX_VALUE_W                        = 10,
    E_VT_AID_ABG_VARIABLE_REFERENCE_W               = 11,
    E_VT_AID_ABG_TARGET_VALUE_VARIABLE_REFERENCE_W  = 12,
    E_VT_AID_ABG_TARGET_VALUE_W                     = 13,
    E_VT_AID_ABG_VALUE_R                            = 14,

    // Picture Graphic VTv2+
    E_VT_AID_PIC_WIDTH_W                            = 1,
    E_VT_AID_PIC_OPTIONS_W                          = 2,
    E_VT_AID_PIC_TRANSPARENCY_COLOUR_W              = 3,
    E_VT_AID_PIC_ACTUAL_WIDTH_R                     = 4,
    E_VT_AID_PIC_ACTUAL_HEIGHT_R                    = 5,
    E_VT_AID_PIC_FORMAT_R                           = 6,

    // Numeric Variable VTv2+
    E_VT_AID_NVA_VALUE_R                            = 1,

    // Font Attributes VTv2+
    E_VT_AID_FTA_FONT_COLOUR_W                      = 1,
    E_VT_AID_FTA_FONT_SIZE_W                        = 2,
    E_VT_AID_FTA_FONT_TYPE_W                        = 3,
    E_VT_AID_FTA_FONT_STYLE_W                       = 4,

    // Line Attribtues VTv2+
    E_VT_AID_LNA_LINE_COLOUR_W                      = 1,
    E_VT_AID_LNA_LINE_WIDTH_W                       = 2,
    E_VT_AID_LNA_LINE_ART_W                         = 3,

    // Fill Attributes VTv2+
    E_VT_AID_FLA_FILL_TYPE_W                        = 1,
    E_VT_AID_FLA_FILL_COLOUR_W                      = 2,
    E_VT_AID_FLA_FILL_PATTERN_W                     = 3,

    // Input Attributes VTv2+
    E_VT_AID_IPA_VALIDATION_TYPE_R                  = 1,

    // Object Pointer VTv2+
    E_VT_AID_PTR_VALUE_R                            = 1,

    // Auxiliary Function type 2 VTv3+
    E_VT_AID_AXF_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_AXF_FUNCTION_ATTRIBUTES_R              = 2,

    // Auxiliary Input type 2 VTv3+
    E_VT_AID_AXI_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_AXI_FUNCTION_ATTRIBUTES_R              = 2,

    // Auxiliary Control Designator Object Pointer VTv3+
    E_VT_AID_ACD_POINTER_TYPE_R                     = 1,
    E_VT_AID_ACD_AUXILIARY_OBJECT_ID_W              = 2,

    // Window Mask VTv4+
    E_VT_AID_WMA_BACKGROUND_COLOUR_W                = 1,
    E_VT_AID_WMA_OPTIONS_W                          = 2,
    E_VT_AID_WMA_NAME_W                             = 3,

    // Key Group VTv4+
    E_VT_AID_KGR_OPTIONS_W                          = 1,
    E_VT_AID_KGR_NAME_W                             = 2,

    // Graphics Context VTv4+
    E_VT_AID_GRC_VIEWPORT_WIDTH_W                   = 1,
    E_VT_AID_GRC_VIEWPORT_HEIGHT_W                  = 2,
    E_VT_AID_GRC_VIEWPORT_X_W                       = 3,
    E_VT_AID_GRC_VIEWPORT_Y_W                       = 4,
    E_VT_AID_GRC_CANVAS_WIDTH_R                     = 5,
    E_VT_AID_GRC_CANVAS_HEIGHT_R                    = 6,
    E_VT_AID_GRC_VIEWPORT_ZOOM_W                    = 7,
    E_VT_AID_GRC_GRAPHICS_CURSOR_X_W                = 8,
    E_VT_AID_GRC_GRAPHICS_CURSOR_Y_W                = 9,
    E_VT_AID_GRC_FOREGROUND_COLOUR_W                = 10,
    E_VT_AID_GRC_BACKGROUND_COLOUR_W                = 11,
    E_VT_AID_GRC_FONT_ATTRIBUTES_W                  = 12,
    E_VT_AID_GRC_LINE_ATTRIBUTES_W                  = 13,
    E_VT_AID_GRC_FILL_ATTRIBUTES_W                  = 14,
    E_VT_AID_GRC_FORMAT_W                           = 15,
    E_VT_AID_GRC_OPTIONS_W                          = 16,
    E_VT_AID_GRC_TRANSPARENCY_COLOUR_W              = 17,

    // Output List VTv4+
    E_VT_AID_OPL_WIDTH_W                            = 1,
    E_VT_AID_OPL_HEIGHT_W                           = 2,
    E_VT_AID_OPL_VARIABLE_REFERENCE_W               = 3,
    E_VT_AID_OPL_VALUE_R                            = 4,

    // Extended Input Attributes VTv4+
    E_VT_AID_EIA_VALIDATION_TYPE_R                  = 1,

    // Object Label Reference List VTv4+
    E_VT_AID_OLR_NUM_OF_LABELLED_OBJECTS_R          = 1,

    // External Object Definition VTv5+
    E_VT_AID_EXD_OPTIONS_W                          = 1,
    E_VT_AID_EXD_NAME_0_W                           = 2,
    E_VT_AID_EXD_NAME_1_W                           = 3,
    
    // External Object Name VTv5+
    E_VT_AID_EXN_OPTIONS_W                          = 1,
    E_VT_AID_EXN_NAME_0_W                           = 2,
    E_VT_AID_EXN_NAME_1_W                           = 3,

    // External Object Pointer VTv5+
    E_VT_AID_EXP_DEFAULT_OBJECT_ID_W                = 1,
    E_VT_AID_EXP_EXT_REF_NAME_ID_W                  = 2,
    E_VT_AID_EXP_EXT_OBJECT_ID_W                    = 3,

    // Animation VTv5+
    E_VT_AID_ANM_WIDTH_W                            = 1,
    E_VT_AID_ANM_HEIGHT_W                           = 2,
    E_VT_AID_ANM_REFRESH_INTERVAL_W                 = 3,
    E_VT_AID_ANM_VALUE_W                            = 4,
    E_VT_AID_ANM_ENABLED_W                          = 5,
    E_VT_AID_ANM_FIRST_CHILD_INDEX_W                = 6,
    E_VT_AID_ANM_LAST_CHILD_INDEX_W                 = 7,
    E_VT_AID_ANM_DEFAULT_CHILD_INDEX_W              = 8,
    E_VT_AID_ANM_OPTIONS_W                          = 9,
    
    // Colour Palette VTv6+
    E_VT_AID_COL_OPTIONS_W                          = 1,

    // Graphic Data VTv6+
    E_VT_AID_GRD_FORMAT_R                           = 1,

    // Working Set Special Controls VTv6+
    E_VT_AID_WSC_NUM_OF_BYTES_TO_FOLLOW_R           = 1,
    E_VT_AID_WSC_OBJ_ID_COLOUR_MAP_R                = 2,
    E_VT_AID_WSC_OBJ_ID_COLOUR_PALETTE_R            = 3,

    // Scaled Graphic VTv6+
    E_VT_AID_SGO_WIDTH_W                            = 1,
    E_VT_AID_SGO_HEIGHT_W                           = 2,
    E_VT_AID_SGO_SCALE_TYPE_W                       = 3,
    E_VT_AID_SGO_OPTIONS_W                          = 4,
    E_VT_AID_SGO_VALUE_W                            = 5
} EVtAttributeId;
//lint +e849

#endif
