
FUNCTION_BLOCK rtiABCnt {ReActionFunctionNr 6}  {ReActionPhysical Channel} {ReActionPhysicalUnique ABR} (*AB Counter with latch*)
	VAR_INPUT
		Channel : INT;
		Mode : DINT;
		LatchEnable : DINT;
		LatchConfig : DINT;
		ForceOn : DINT;
		ForceCnt : DINT;
		ForceLatch : DINT;
		SimulCnt : {ReActionSimulParam} DINT;
		SimulLatch : {ReActionSimulParam} BOOL;
	END_VAR
	VAR_OUTPUT
		Cnt : DINT;
		CntTs : DINT;
		Latch : DINT;
		LatchTs : DINT;
		Status : DINT;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiABRPos {ReActionFunctionNr 7}  {ReActionPhysical Channel} {ReActionPhysicalUnique ABR} (*ABR Counter*)
	VAR_INPUT
		Channel : INT;
		Mode : DINT;
		RefEnable : DINT;
		RefConfig : DINT;
		RefPos : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
		SimulPos : {ReActionSimulParam} DINT;
		SimulRef : {ReActionSimulParam} BOOL;
	END_VAR
	VAR_OUTPUT
		Pos : DINT;
		PosTs : DINT;
		Status : DINT;
	END_VAR
	VAR
		LocRefPos : DINT;
		LocRefDone : DINT;
		LocRefIn : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAbs {ReActionFunctionNr 121}		(*absolute value of signed value*)
	VAR_INPUT
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAdd {ReActionFunctionNr 107}		(*add In1 and In2*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAddSubReal {ReActionFunctionNr 130}	(*add or sub  In1 and In2*)
	VAR_INPUT
		In1 : REAL;
		In2 : REAL;
		Mode : DINT;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAin {ReActionFunctionNr 4}  {ReActionPhysical Channel} {ReActionPhysicalUnique}	(*read analog input channel*)
	VAR_INPUT
		Channel : INT;
		Filter : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
		Simul : {ReActionSimulParam} DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAnd {ReActionFunctionNr 100}	(*bitwise AND*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
	END_VAR
	VAR_OUTPUT
		OutTsEdge : DINT;
		Out : DINT;
		OutN : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAnLimit {ReActionFunctionNr 118}	(*limit analog input value*)
	VAR_INPUT
		In : DINT;
		StatusIn : DINT;
		LowLimit : DINT;
		HighLimit : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiAout {ReActionFunctionNr 5}  {ReActionPhysical Channel} {ReActionPhysicalUnique} (*write analog output channel*)
	VAR_INPUT
		Channel : INT;
		Enable : DINT;
		In : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
	END_VAR
	VAR_OUTPUT
		OutRef : DINT;
		Simul : {ReActionSimulParam} DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiBit2Byte {ReActionFunctionNr 119}	(*combines 8 bits into 1 byte*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
		In5 : DINT;
		In6 : DINT;
		In7 : DINT;
		In8 : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiByte2Bit {ReActionFunctionNr 120}	(*splits 1 byte into 8 bits*)
	VAR_INPUT
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Out1 : DINT;
		Out2 : DINT;
		Out3 : DINT;
		Out4 : DINT;
		Out5 : DINT;
		Out6 : DINT;
		Out7 : DINT;
		Out8 : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiComp {ReActionFunctionNr 104}	(*compares In1 and In2 depending on the Mode*)
	VAR_INPUT
		Mode : UDINT;
		In1 : DINT;
		In2 : DINT;
	END_VAR
	VAR_OUTPUT
		StatusTsEdgePos : DINT;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiCompReal {ReActionFunctionNr 133}	(*compares In1 and In2 depending on the Mode*)
	VAR_INPUT
		Mode : UDINT;
		In1 : REAL;
		In2 : REAL;
	END_VAR
	VAR_OUTPUT
		StatusTsEdgePos : DINT;
		Status : DINT;
		Result : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiCount {ReActionFunctionNr 115}	(*Up-Down counter or Clock-Direction counter, level sensitive*)
	VAR_INPUT
		Mode : UDINT;
		Up_Clk : DINT;
		Down_Dir : DINT;
		Clear : DINT;
	END_VAR
	VAR_OUTPUT
		OvlTsEdgePos : DINT;
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDelay {ReActionFunctionNr 113}	(*delay signal for 1 reACTION cycle*)
	VAR_INPUT
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
		Out1 : DINT;
		Out2 : DINT;
		Out3 : DINT;
		Out4 : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDelayReal {ReActionFunctionNr 113}	(*delay signal for 1 reACTION cycle*)
	VAR_INPUT
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Out1 : REAL;
		Out2 : REAL;
		Out3 : REAL;
		Out4 : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDeMux {ReActionFunctionNr 117}	(*demultiplexer for 4 outputs*)
	VAR_INPUT
		Mux : DINT;
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Out1 : DINT;
		Out2 : DINT;
		Out3 : DINT;
		Out4 : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDeMuxReal {ReActionFunctionNr 117}	(*demultiplexer for 4 outputs*)
	VAR_INPUT
		Mux : DINT;
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Out1 : REAL;
		Out2 : REAL;
		Out3 : REAL;
		Out4 : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDin {ReActionFunctionNr 1} {ReActionPhysical Channel} {ReActionPhysicalUnique}	(*read digital input channel*)
	VAR_INPUT
		Channel : INT;
		Mode : UDINT;
		Filter : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
		Simul : {ReActionSimulParam} BOOL;
	END_VAR
	VAR_OUTPUT
		OutTsEdgePos : DINT;
		OutTsEdgeNeg : DINT;
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDiv {ReActionFunctionNr 110}	(*division*)
	VAR_INPUT
		Mode : UDINT;
		In1 : DINT;
		In2 : DINT;
	END_VAR
	VAR_OUTPUT
		Quotient : DINT;
		Remainder : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDivReal {ReActionFunctionNr 132}	(*division*)
	VAR_INPUT
		In1 : REAL;
		In2 : REAL;
	END_VAR
	VAR_OUTPUT
		Quotient : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDout {ReActionFunctionNr 2} {ReActionPhysical Channel}  {ReActionPhysicalUnique DigitalOutputs}	(*write digital output channel*)
	VAR_INPUT
		Channel : INT;
		Enable : DINT;
		In : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
	END_VAR
	VAR_OUTPUT
		Simul : {ReActionSimulParam} BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiDoutTime {ReActionFunctionNr 3} {ReActionPhysical Channel} {ReActionPhysicalUnique DigitalOutputs}	(*write digital output channel*)
	VAR_INPUT
		Channel : INT;
		Mode : UDINT;
		Comp1 : DINT;
		Comp2 : DINT;
		Base : DINT;
		Period : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
	END_VAR
	VAR_OUTPUT
		EdgeCount : DINT;
		Simul : {ReActionSimulParam} BOOL;
	END_VAR
	VAR
		LocLatch : DINT;
		LocStat : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiIntToReal {ReActionFunctionNr 128}	 (*convert int to real with decimal point offset*)
	VAR_INPUT
		In : DINT;
		Shift : DINT;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiInvertReal {ReActionFunctionNr 134}   (*invert input*)
	VAR_INPUT
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiLatch {ReActionFunctionNr 105}	(*latch value*)
	VAR_INPUT
		In : DINT;
		Latch : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiLatchReal {ReActionFunctionNr 105}	(*latch value*)
	VAR_INPUT
		In : REAL;
		Latch : DINT;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiMul {ReActionFunctionNr 109}	(*multiplication*)
	VAR_INPUT
		Mode : UDINT;
		In1 : DINT;
		In2 : DINT;
	END_VAR
	VAR_OUTPUT
		OutL : DINT;
		OutH : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiMulReal {ReActionFunctionNr 131}	(*multiplication*)
	VAR_INPUT
		In1 : REAL;
		In2 : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiMux {ReActionFunctionNr 116}	(*select a value from 4 input values*)
	VAR_INPUT
		Mux : DINT;
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiMuxReal {ReActionFunctionNr 116}	(*select a value from 4 input values*)
	VAR_INPUT
		Mux : DINT;
		In1 : REAL;
		In2 : REAL;
		In3 : REAL;
		In4 : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiNot {ReActionFunctionNr 103}	(*bitwise NOT*)
	VAR_INPUT
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiOr {ReActionFunctionNr 101}	(*bitwise OR*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
	END_VAR
	VAR_OUTPUT
		OutTsEdge : DINT;
		Out : DINT;
		OutN : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiPar {ReActionPhysical DpNr}	(*read parameter from cyclic datapoint*)
	VAR_INPUT
		DpNr : INT;
		Simul : {ReActionSimulParam} DINT;
	END_VAR
	VAR_OUTPUT
		Data : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiParReal {ReActionPhysical DpNr}	 (*read parameter from cyclic datapoint*)
	VAR_INPUT
		DpNr : INT;
		Simul : {ReActionSimulParam} REAL;
	END_VAR
	VAR_OUTPUT
		Data : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiPwm {ReActionFunctionNr 114}	(*generate PWM signal, must be followed by rtiDoutTime*)
	VAR_INPUT
		Mode : UDINT;
		Start : DINT;
		Period : DINT;
		Duty : DINT;
		DeadB : DINT;
	END_VAR
	VAR_OUTPUT
		ModeOut : UDINT;
		OutTsEdgePos : DINT;
		OutTsEdgeNeg : DINT;
		Base : DINT;
		PeriodOut : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiRealToInt  {ReActionFunctionNr 129}  (*convert real to int with decimal point offset*)
	VAR_INPUT
		In : REAL;
		Shift : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiRegister  {ReActionFunctionNr 124} (*register values*)
	VAR_INPUT
		Mode : UDINT;
		Latch : DINT;
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
	END_VAR
	VAR_OUTPUT
		OutTsLatch : DINT;
		Out1 : DINT;
		Out2 : DINT;
		Out3 : DINT;
		Out4 : DINT;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiRegisterReal  {ReActionFunctionNr 124} (*register values*)
	VAR_INPUT
		Mode : UDINT;
		Latch : DINT;
		In1 : REAL;
		In2 : REAL;
		In3 : REAL;
		In4 : REAL;
	END_VAR
	VAR_OUTPUT
		OutTsLatch : DINT;
		Out1 : REAL;
		Out2 : REAL;
		Out3 : REAL;
		Out4 : REAL;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiRes {ReActionPhysical DpNr}  {ReActionPhysicalUnique Results}	(*write results to cyclic datapoint*)
	VAR_INPUT
		DpNr : INT;
		Data : DINT;
	END_VAR
	VAR_OUTPUT
		Simul : {ReActionSimulParam} DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiResReal {ReActionPhysical DpNr}  {ReActionPhysicalUnique Results}	(*write results to cyclic datapoint*)
	VAR_INPUT
		DpNr : INT;
		Data : REAL;
	END_VAR
	VAR_OUTPUT
		Simul : {ReActionSimulParam} REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiRF_TRIG {ReActionFunctionNr 122}	(*detect rising/falling edge of input signal*)
	VAR_INPUT
		CLK : DINT;
	END_VAR
	VAR_OUTPUT
		OutEdge : DINT;
		OutEdgePos : DINT;
		OutEdgeNeg : DINT;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiShift {ReActionFunctionNr 111}	(*arithmetic or logical shift*)
	VAR_INPUT
		In : DINT;
		Shl : DINT;
		Shr : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSineReal {ReActionFunctionNr 136} (*sine*)
	VAR_INPUT
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSqrtReal {ReActionFunctionNr 135}	(*square root*)
	VAR_INPUT
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSRff {ReActionFunctionNr 106}	(*SR flipflop*)
	VAR_INPUT
		InS : DINT;
		InR : DINT;
	END_VAR
	VAR_OUTPUT
		OutTsEdge : DINT;
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSSI {ReActionFunctionNr 8}  {ReActionPhysical Channel} {ReActionPhysicalUnique} (*SSI Encoder*)
	VAR_INPUT
		Channel : INT;
		Mode : DINT;
		Trigger : DINT;
		ForceOn : DINT;
		ForceVal : DINT;
		SimulPos : {ReActionSimulParam} DINT;
	END_VAR
	VAR_OUTPUT
		Pos : DINT;
		PosTs : DINT;
		Status : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSub {ReActionFunctionNr 108}	(*subtraction*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiTDel {ReActionFunctionNr 112}	(*compare time delays*)
	VAR_INPUT
		Enable : DINT;
		Comp1 : DINT;
		Comp2 : DINT;
		Comp3 : DINT;
		Comp4 : DINT;
		Comp5 : DINT;
		Comp6 : DINT;
		Base : DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
	VAR
		LocStat : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiTime {ReActionFunctionNr 252}	(*get time of cycle start and last parameter refresh*)
	VAR_OUTPUT
		TsPar : DINT;
		TsCycle : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiTimeLoc2Net {ReActionFunctionNr 250}	(*converts local time [10ns] to NetTime [1/256us]*)
	VAR_INPUT
		LocTime : DINT;
	END_VAR
	VAR_OUTPUT
		NetTime : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiTimeNet2Loc {ReActionFunctionNr 251}	(*converts NetTime [1/256us] to local time [10ns]*)
	VAR_INPUT
		NetTime : DINT;
	END_VAR
	VAR_OUTPUT
		LocTime : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiTP {ReActionFunctionNr 123}	(*generates TRUE-pulse on rising edge of input signal*)
	VAR_INPUT
		IN : DINT;
		PT : DINT;
	END_VAR
	VAR_OUTPUT
		Q : DINT;
		ET : DINT;
	END_VAR
	VAR
		LocLatch : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiVarRead {ReActionPhysical DpNr}	(*reads from internal variable*)
	VAR_INPUT
		DpNr : INT;
		Simul : {ReActionSimulParam} DINT;
	END_VAR
	VAR_OUTPUT
		Out : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiVarReadReal {ReActionPhysical DpNr}	(*reads from internal variable*)
	VAR_INPUT
		DpNr : INT;
		Simul : {ReActionSimulParam} REAL;
	END_VAR
	VAR_OUTPUT
		Out : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiVarWrite {ReActionPhysical DpNr}  {ReActionPhysicalUnique VarWrite}	(*writes to internal variable*)
	VAR_INPUT
		DpNr : INT;
		In : DINT;
	END_VAR
	VAR_OUTPUT
		Simul : {ReActionSimulParam} DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiVarWriteReal {ReActionPhysical DpNr}  {ReActionPhysicalUnique VarWrite}	(*writes to internal variable*)
	VAR_INPUT
		DpNr : INT;
		In : REAL;
	END_VAR
	VAR_OUTPUT
		Simul : {ReActionSimulParam} REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiXor {ReActionFunctionNr 102}	(*bitwise XOR*)
	VAR_INPUT
		In1 : DINT;
		In2 : DINT;
		In3 : DINT;
		In4 : DINT;
	END_VAR
	VAR_OUTPUT
		OutTsEdge : DINT;
		Out : DINT;
		OutN : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK rtiSim (*control simulation mode (no effect on reACTION IO module)*)
	VAR_INPUT
		Enable : {ReActionSimulParam} BOOL;
		Mode : {ReActionSimulParam} UDINT;
		Clear : {ReActionSimulParam} BOOL;
	END_VAR
	VAR_OUTPUT
		Cycles : {ReActionSimulParam} UDINT;
		Status : {ReActionSimulParam} UINT;
	END_VAR
END_FUNCTION_BLOCK
