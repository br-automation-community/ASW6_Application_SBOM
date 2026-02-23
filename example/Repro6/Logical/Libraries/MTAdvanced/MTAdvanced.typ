(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: MTAdvanced
 * File: MTAdvanced.typ
 * Author: B&R
 ********************************************************************
 * Data types of library MTAdvanced
 * User area of error/warning codes:
 ********************************************************************)

TYPE
  MTAdvancedControllerEnum :
    ( (*Controller type.*)
    mtPROPORTIONAL, (*Proportional controller.*)
    mtPROPORTIONAL_INTEGRAL (*Proportional + Integral controller.*)
    );
  MTAdvancedLoopShapingIntType :  STRUCT  (*Internal variables of function block MTAdvancedLoopShaping.*)
    NbValidExtSystemReferences : USINT; (*Data for internal use.*)
    RiseTimeMin : REAL; (*Data for internal use.*)
    RiseTimeMax : REAL; (*Data for internal use.*)
    CrossOverMagnitude : REAL; (*Data for internal use.*)
    CrossOverPhase : REAL; (*Data for internal use.*)
    CalculateController : BOOL; (*Data for internal use.*)
    CalculateControllerOld : BOOL; (*Data for internal use.*)
    EnableOld : BOOL; (*Data for internal use.*)
  END_STRUCT;
END_TYPE
