/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _VCLIB_
#define _VCLIB_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define NUMERIC_EXCEEDS_LOWER_LIMIT 4113U
 #define NUMERIC_EXCEEDS_UPPER_LIMIT 4112U
 #define VCDP_WRITE_ROUND_OFF 256U
 #define VCDP_WRITE_ADD_FRACTION_DIGITS 128U
 #define VCDP_AUDIT_ENABLE 64U
 #define VCDP_UNIT_TYPE_INTERNAL 32U
 #define VCDP_AUTO_LIMIT_VALUE 16U
 #define VCDP_UNIT_TYPE_PLC 8U
 #define VCDP_UNIT_TYPE_DISPLAY 4U
 #define VCDP_WRITE_TEST_UNIT 2U
 #define VCDP_WRITE_TEST_LIMIT 1U
 #define ERROR_VCEV_NO_VISU_FOUND 8104U
 #define ERROR_VCEV_NOT_SUPPORTED 8103U
 #define ERROR_VCEV_PARAM_ERROR 8102U
 #define ERROR_VCEV_NO_MORE_EVENTS 8101U
 #define ERROR_VCEV_INVALID_ARG 8100U
 #define ERROR_VCDP_NO_VISU_FOUND 8016U
 #define ERROR_VCDP_NOT_SUPPORTED 8015U
 #define ERROR_VCDP_NO_LOCAL_DISPLAY 8014U
 #define ERROR_VCDP_NO_LIMIT_CONFIGURED 8013U
 #define ERROR_VCDP_WRITE_FAILED 8005U
 #define ERROR_VCDP_UNIT_MISMATCH 8003U
 #define ERROR_VCDP_READ_FAILED 8006U
 #define ERROR_VCDP_OVERFLOW 8001U
 #define ERROR_VCDP_OUTSIDE_LIMIT 8004U
 #define ERROR_VCDP_NO_UNIT_CONFIGURED 8002U
 #define ERROR_VCDP_INVALID_DP 8009U
 #define ERROR_VCDP_INVALID_ARGUMENT 8000U
 #define ERROR_VCDP_INTERNAL 8007U
 #define ERROR_VCDP_FORMAT_INVALID 8008U
 #define ERROR_VCDP_BELOW_LIMIT 8011
 #define ERROR_VCDP_ABOVE_LIMIT 8010U
 #define ERROR_VCDP_ARRAY_TO_SMALL 8012U
 #define VCEV_EVENT_FOCUS_GET_SLIDER 4120U
 #define VCEV_EVENT_FOCUS_GET_EDIT 4119U
 #define VCEV_EVENT_FOCUS_GET_PASSWORD 4118U
 #define VCEV_EVENT_FOCUS_GET_DROPDOWN 4117U
 #define VCEV_EVENT_FOCUS_GET_LISTBOX 4116U
 #define VCEV_EVENT_FOCUS_GET_STRING 4115U
 #define VCEV_EVENT_FOCUS_GET_NUMERIC 4114U
 #define EVENT_TYPE_START_EDIT 4107U
 #define EVENT_TYPE_START_PASSWORD 4106U
 #define EVENT_TYPE_START_DDBOX 4105U
 #define EVENT_TYPE_START_LISTBOX 4104U
 #define EVENT_TYPE_START_STRING 4103U
 #define EVENT_TYPE_START_NUMERIC 4102U
 #define EVENT_TYPE_TEXT_OVERRUN 4101U
 #define EVENT_TYPE_SLIDER 4100U
 #define EVENT_TYPE_USER_WRITE 4099U
 #define EVENT_TYPE_STRING 4098U
 #define EVENT_TYPE_NUMERIC 4097U
#else
 _GLOBAL_CONST unsigned long NUMERIC_EXCEEDS_LOWER_LIMIT;
 _GLOBAL_CONST unsigned long NUMERIC_EXCEEDS_UPPER_LIMIT;
 _GLOBAL_CONST unsigned long VCDP_WRITE_ROUND_OFF;
 _GLOBAL_CONST unsigned long VCDP_WRITE_ADD_FRACTION_DIGITS;
 _GLOBAL_CONST unsigned long VCDP_AUDIT_ENABLE;
 _GLOBAL_CONST unsigned long VCDP_UNIT_TYPE_INTERNAL;
 _GLOBAL_CONST unsigned long VCDP_AUTO_LIMIT_VALUE;
 _GLOBAL_CONST unsigned long VCDP_UNIT_TYPE_PLC;
 _GLOBAL_CONST unsigned long VCDP_UNIT_TYPE_DISPLAY;
 _GLOBAL_CONST unsigned long VCDP_WRITE_TEST_UNIT;
 _GLOBAL_CONST unsigned long VCDP_WRITE_TEST_LIMIT;
 _GLOBAL_CONST unsigned long ERROR_VCEV_NO_VISU_FOUND;
 _GLOBAL_CONST unsigned long ERROR_VCEV_NOT_SUPPORTED;
 _GLOBAL_CONST unsigned long ERROR_VCEV_PARAM_ERROR;
 _GLOBAL_CONST unsigned long ERROR_VCEV_NO_MORE_EVENTS;
 _GLOBAL_CONST unsigned long ERROR_VCEV_INVALID_ARG;
 _GLOBAL_CONST unsigned long ERROR_VCDP_NO_VISU_FOUND;
 _GLOBAL_CONST unsigned long ERROR_VCDP_NOT_SUPPORTED;
 _GLOBAL_CONST unsigned long ERROR_VCDP_NO_LOCAL_DISPLAY;
 _GLOBAL_CONST unsigned long ERROR_VCDP_NO_LIMIT_CONFIGURED;
 _GLOBAL_CONST unsigned long ERROR_VCDP_WRITE_FAILED;
 _GLOBAL_CONST unsigned long ERROR_VCDP_UNIT_MISMATCH;
 _GLOBAL_CONST unsigned long ERROR_VCDP_READ_FAILED;
 _GLOBAL_CONST unsigned long ERROR_VCDP_OVERFLOW;
 _GLOBAL_CONST unsigned long ERROR_VCDP_OUTSIDE_LIMIT;
 _GLOBAL_CONST unsigned long ERROR_VCDP_NO_UNIT_CONFIGURED;
 _GLOBAL_CONST unsigned long ERROR_VCDP_INVALID_DP;
 _GLOBAL_CONST unsigned long ERROR_VCDP_INVALID_ARGUMENT;
 _GLOBAL_CONST unsigned long ERROR_VCDP_INTERNAL;
 _GLOBAL_CONST unsigned long ERROR_VCDP_FORMAT_INVALID;
 _GLOBAL_CONST signed long ERROR_VCDP_BELOW_LIMIT;
 _GLOBAL_CONST unsigned long ERROR_VCDP_ABOVE_LIMIT;
 _GLOBAL_CONST unsigned long ERROR_VCDP_ARRAY_TO_SMALL;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_SLIDER;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_EDIT;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_PASSWORD;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_DROPDOWN;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_LISTBOX;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_STRING;
 _GLOBAL_CONST unsigned long VCEV_EVENT_FOCUS_GET_NUMERIC;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_EDIT;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_PASSWORD;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_DDBOX;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_LISTBOX;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_STRING;
 _GLOBAL_CONST unsigned long EVENT_TYPE_START_NUMERIC;
 _GLOBAL_CONST unsigned long EVENT_TYPE_TEXT_OVERRUN;
 _GLOBAL_CONST unsigned long EVENT_TYPE_SLIDER;
 _GLOBAL_CONST unsigned long EVENT_TYPE_USER_WRITE;
 _GLOBAL_CONST unsigned long EVENT_TYPE_STRING;
 _GLOBAL_CONST unsigned long EVENT_TYPE_NUMERIC;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct VCDPInfo
{	signed long iAddFractionDigits;
	unsigned long uiElement;
	unsigned long uiRequiredUnit;
	unsigned long uiStringSize;
	unsigned long uiFlags;
} VCDPInfo;

typedef struct VCPVInfo
{	unsigned short uiUpdateMsecs;
	unsigned short uiUserID;
} VCPVInfo;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC unsigned short VCEV_Count(unsigned long puiCount);
_BUR_PUBLIC unsigned short VCEV_Pop(unsigned long phEvent);
_BUR_PUBLIC unsigned short VCEV_Free(unsigned long hEvent);
_BUR_PUBLIC unsigned short VCEV_DblGet(unsigned long hEvent, unsigned long pszParamName, unsigned long pdValue);
_BUR_PUBLIC unsigned short VCEV_FltGet(unsigned long hEvent, unsigned long pszParamName, unsigned long pfValue);
_BUR_PUBLIC unsigned short VCEV_I32Get(unsigned long hEvent, unsigned long pszParamName, unsigned long piValue);
_BUR_PUBLIC unsigned short VCEV_Utf16Get(unsigned long hEvent, unsigned long pszParamName, unsigned long pTextUtf16, unsigned long puiSize);
_BUR_PUBLIC unsigned short VCEV_Utf8Get(unsigned long hEvent, unsigned long pszParamName, unsigned long pTextUtf8, unsigned long puiSize);
_BUR_PUBLIC unsigned short VCDP_DPID2Index(unsigned long hDP, unsigned long uiDPID, unsigned long puiIndex);
_BUR_PUBLIC unsigned short VCDP_GetDecimalPlaces(unsigned long hDP, unsigned long uiIndex, unsigned long puiDecimalPlaces);
_BUR_PUBLIC unsigned short VCDP_GetUGID(unsigned long hDP, unsigned long uiIndex, unsigned long puiUGID);
_BUR_PUBLIC unsigned short VCDP_GetUnits(unsigned long hDP, unsigned long uiIndex, unsigned long puiPLCUnit, unsigned long puiDisplayUnit);
_BUR_PUBLIC unsigned short VCDP_GetUTextId(unsigned long hDP, unsigned long uiIndex, unsigned long uiUnitDisplayIndex, unsigned long puiTextGroupId, unsigned long puiTextIndexShort, unsigned long puiTextIndexLong);
_BUR_PUBLIC unsigned short VCDP_Initialize(unsigned long phDP);
_BUR_PUBLIC unsigned short VCDP_UserID2Index(unsigned long hDP, unsigned long uiUserID, unsigned long puiIndex);
_BUR_PUBLIC unsigned short VCDP_GetActivePVIndex(unsigned long hDP, unsigned long puiIndex, unsigned short uiIndexSize, unsigned long ulFlags, unsigned long puiCount);
_BUR_PUBLIC unsigned short VCDP_GetPVInfo(unsigned long hDP, unsigned long uiIndex, unsigned long pInfo);
_BUR_PUBLIC unsigned short VCDP_GetPVName(unsigned long hDP, unsigned long uiIndex, unsigned long pTextUtf8, unsigned long uiSize);
_BUR_PUBLIC unsigned short VCDP_Utf16Get(unsigned long hDP, unsigned long uiIndex, unsigned long pTextUtf16, unsigned long puiSize, struct VCDPInfo* Info);
_BUR_PUBLIC unsigned short VCDP_Utf16Set(unsigned long hDP, unsigned long uiIndex, unsigned long pTextUtf16, struct VCDPInfo* Info);
_BUR_PUBLIC unsigned short VCDP_Utf8Get(unsigned long hDP, unsigned long uiIndex, unsigned long pTextUtf8, unsigned long puiSize, struct VCDPInfo* Info);
_BUR_PUBLIC unsigned short VCDP_Utf8Set(unsigned long hDP, unsigned long uiIndex, unsigned long pTextUtf8, struct VCDPInfo* Info);
_BUR_PUBLIC unsigned short VCDP_GetLimits(unsigned long hDP, unsigned long uiIndex, unsigned long pLimitMin, unsigned long pLimitMax, unsigned long pLimitMinText, unsigned long pLimitMinTextLen, unsigned long pLimitMaxText, unsigned long pLimitMaxTextLen);
_BUR_PUBLIC unsigned short VCDP_GetUserIDbyName(unsigned long hVCDP, unsigned long pszPVName, unsigned long puiUserID);
_BUR_PUBLIC unsigned short VCLIB_RegisterEVClient(void);
_BUR_PUBLIC unsigned short VCLIB_RegisterDPClient(void);


#ifdef __cplusplus
};
#endif
#endif /* _VCLIB_ */

