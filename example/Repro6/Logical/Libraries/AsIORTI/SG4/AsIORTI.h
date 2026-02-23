/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASIORTI_
#define _ASIORTI_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct IORTI_DOUTTIME
{	unsigned long MODE_INACT;
	unsigned long MODE_BOOL;
	unsigned long MODE_BASE_OFFS;
	unsigned long MODE_BASE_OFFS_PER;
	unsigned long MODE_ABSOLUT;
	unsigned long MODE_BOOL_INV;
	unsigned long MODE_BASE_OFFS_INV;
	unsigned long MODE_BASE_OFFS_PER_INV;
	unsigned long MODE_ABSOLUT_INV;
} IORTI_DOUTTIME;

typedef struct IORTI_COMP
{	unsigned long MODE_DISABLE;
	unsigned long MODE_ENABLE;
	unsigned long MODE_EQ;
	unsigned long MODE_NE;
	unsigned long MODE_GTU;
	unsigned long MODE_GEU;
	unsigned long MODE_LTU;
	unsigned long MODE_LEU;
	unsigned long MODE_GT;
	unsigned long MODE_GE;
	unsigned long MODE_LT;
	unsigned long MODE_LE;
} IORTI_COMP;

typedef struct IORTI_MUL
{	unsigned long MODE_UNSIGNED;
	unsigned long MODE_SIGNED;
} IORTI_MUL;

typedef struct IORTI_DIV
{	unsigned long MODE_UNSIGNED;
	unsigned long MODE_SIGNED;
} IORTI_DIV;

typedef struct IORTI_PWM
{	unsigned long MODE_INACT;
	unsigned long MODE_LEFT_PROC;
	unsigned long MODE_LEFT_PROC_DB;
	unsigned long MODE_LEFT_PROC_INV;
	unsigned long MODE_LEFT_PROC_DB_INV;
	unsigned long MODE_LEFT_TIME;
	unsigned long MODE_LEFT_TIME_DB;
	unsigned long MODE_LEFT_TIME_INV;
	unsigned long MODE_LEFT_TIME_DB_INV;
	unsigned long MODE_CENT_PROC;
	unsigned long MODE_CENT_PROC_DB;
	unsigned long MODE_CENT_PROC_INV;
	unsigned long MODE_CENT_PROC_DB_INV;
	unsigned long MODE_CENT_TIME;
	unsigned long MODE_CENT_TIME_DB;
	unsigned long MODE_CENT_TIME_INV;
	unsigned long MODE_CENT_TIME_DB_INV;
	unsigned long MODE_USE_START_AS_BASE;
} IORTI_PWM;

typedef struct IORTI_COUNT
{	unsigned long MODE_UPDWN_NOSTOP;
	unsigned long MODE_CLKDIR_NOSTOP;
	unsigned long MODE_UPDWN_STOP;
	unsigned long MODE_CLKDIR_STOP;
} IORTI_COUNT;

typedef struct IORTI_REGISTER
{	unsigned long MODE_FREEZED;
	unsigned long MODE_TRANSPARENT;
	unsigned long MODE_EDGE_RISING;
	unsigned long MODE_EDGE_FALLING;
	unsigned long MODE_EDGE_BOTH;
	unsigned long MODE_LEVEL_LOW;
	unsigned long MODE_LEVEL_HIGH;
} IORTI_REGISTER;

typedef struct IORTI_REAL
{	signed long TYPE_NORM;
	signed long TYPE_ZERO;
	signed long TYPE_NAN;
	signed long TYPE_UNDER;
	signed long TYPE_OVER;
	signed long TYPE_DIVZERO;
	signed long TYPE_INFINITE;
} IORTI_REAL;

typedef struct rtiABCnt
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Mode;
	signed long LatchEnable;
	signed long LatchConfig;
	signed long ForceOn;
	signed long ForceCnt;
	signed long ForceLatch;
	signed long SimulCnt;
	/* VAR_OUTPUT (analog) */
	signed long Cnt;
	signed long CntTs;
	signed long Latch;
	signed long LatchTs;
	signed long Status;
	/* VAR (analog) */
	signed long LocLatch;
	/* VAR_INPUT (digital) */
	plcbit SimulLatch;
} rtiABCnt_typ;

typedef struct rtiABRPos
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Mode;
	signed long RefEnable;
	signed long RefConfig;
	signed long RefPos;
	signed long ForceOn;
	signed long ForceVal;
	signed long SimulPos;
	/* VAR_OUTPUT (analog) */
	signed long Pos;
	signed long PosTs;
	signed long Status;
	/* VAR (analog) */
	signed long LocRefPos;
	signed long LocRefDone;
	/* VAR_INPUT (digital) */
	plcbit SimulRef;
	/* VAR (digital) */
	plcbit LocRefIn;
} rtiABRPos_typ;

typedef struct rtiAbs
{
	/* VAR_INPUT (analog) */
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiAbs_typ;

typedef struct rtiAdd
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiAdd_typ;

typedef struct rtiAddSubReal
{
	/* VAR_INPUT (analog) */
	float In1;
	float In2;
	signed long Mode;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiAddSubReal_typ;

typedef struct rtiAin
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Filter;
	signed long ForceOn;
	signed long ForceVal;
	signed long Simul;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	signed long Status;
} rtiAin_typ;

typedef struct rtiAnd
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	/* VAR_OUTPUT (analog) */
	signed long OutTsEdge;
	signed long Out;
	signed long OutN;
} rtiAnd_typ;

typedef struct rtiAnLimit
{
	/* VAR_INPUT (analog) */
	signed long In;
	signed long StatusIn;
	signed long LowLimit;
	signed long HighLimit;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	signed long Status;
} rtiAnLimit_typ;

typedef struct rtiAout
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Enable;
	signed long In;
	signed long ForceOn;
	signed long ForceVal;
	/* VAR_OUTPUT (analog) */
	signed long OutRef;
	signed long Simul;
} rtiAout_typ;

typedef struct rtiBit2Byte
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	signed long In5;
	signed long In6;
	signed long In7;
	signed long In8;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiBit2Byte_typ;

typedef struct rtiByte2Bit
{
	/* VAR_INPUT (analog) */
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Out1;
	signed long Out2;
	signed long Out3;
	signed long Out4;
	signed long Out5;
	signed long Out6;
	signed long Out7;
	signed long Out8;
} rtiByte2Bit_typ;

typedef struct rtiComp
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long In1;
	signed long In2;
	/* VAR_OUTPUT (analog) */
	signed long StatusTsEdgePos;
	signed long Status;
} rtiComp_typ;

typedef struct rtiCompReal
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	float In1;
	float In2;
	/* VAR_OUTPUT (analog) */
	signed long StatusTsEdgePos;
	signed long Status;
	signed long Result;
} rtiCompReal_typ;

typedef struct rtiCount
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long Up_Clk;
	signed long Down_Dir;
	signed long Clear;
	/* VAR_OUTPUT (analog) */
	signed long OvlTsEdgePos;
	signed long Out;
} rtiCount_typ;

typedef struct rtiDelay
{
	/* VAR_INPUT (analog) */
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	signed long Out1;
	signed long Out2;
	signed long Out3;
	signed long Out4;
} rtiDelay_typ;

typedef struct rtiDelayReal
{
	/* VAR_INPUT (analog) */
	float In;
	/* VAR_OUTPUT (analog) */
	float Out;
	float Out1;
	float Out2;
	float Out3;
	float Out4;
} rtiDelayReal_typ;

typedef struct rtiDeMux
{
	/* VAR_INPUT (analog) */
	signed long Mux;
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Out1;
	signed long Out2;
	signed long Out3;
	signed long Out4;
} rtiDeMux_typ;

typedef struct rtiDeMuxReal
{
	/* VAR_INPUT (analog) */
	signed long Mux;
	float In;
	/* VAR_OUTPUT (analog) */
	float Out1;
	float Out2;
	float Out3;
	float Out4;
} rtiDeMuxReal_typ;

typedef struct rtiDin
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	unsigned long Mode;
	signed long Filter;
	signed long ForceOn;
	signed long ForceVal;
	/* VAR_OUTPUT (analog) */
	signed long OutTsEdgePos;
	signed long OutTsEdgeNeg;
	signed long Out;
	/* VAR_INPUT (digital) */
	plcbit Simul;
} rtiDin_typ;

typedef struct rtiDiv
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long In1;
	signed long In2;
	/* VAR_OUTPUT (analog) */
	signed long Quotient;
	signed long Remainder;
} rtiDiv_typ;

typedef struct rtiDivReal
{
	/* VAR_INPUT (analog) */
	float In1;
	float In2;
	/* VAR_OUTPUT (analog) */
	float Quotient;
	signed long Status;
} rtiDivReal_typ;

typedef struct rtiDout
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Enable;
	signed long In;
	signed long ForceOn;
	signed long ForceVal;
	/* VAR_OUTPUT (digital) */
	plcbit Simul;
} rtiDout_typ;

typedef struct rtiDoutTime
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	unsigned long Mode;
	signed long Comp1;
	signed long Comp2;
	signed long Base;
	signed long Period;
	signed long ForceOn;
	signed long ForceVal;
	/* VAR_OUTPUT (analog) */
	signed long EdgeCount;
	/* VAR (analog) */
	signed long LocLatch;
	signed long LocStat;
	/* VAR_OUTPUT (digital) */
	plcbit Simul;
} rtiDoutTime_typ;

typedef struct rtiIntToReal
{
	/* VAR_INPUT (analog) */
	signed long In;
	signed long Shift;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiIntToReal_typ;

typedef struct rtiInvertReal
{
	/* VAR_INPUT (analog) */
	float In;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiInvertReal_typ;

typedef struct rtiLatch
{
	/* VAR_INPUT (analog) */
	signed long In;
	signed long Latch;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	/* VAR (analog) */
	signed long LocLatch;
} rtiLatch_typ;

typedef struct rtiLatchReal
{
	/* VAR_INPUT (analog) */
	float In;
	signed long Latch;
	/* VAR_OUTPUT (analog) */
	float Out;
} rtiLatchReal_typ;

typedef struct rtiMul
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long In1;
	signed long In2;
	/* VAR_OUTPUT (analog) */
	signed long OutL;
	signed long OutH;
} rtiMul_typ;

typedef struct rtiMulReal
{
	/* VAR_INPUT (analog) */
	float In1;
	float In2;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiMulReal_typ;

typedef struct rtiMux
{
	/* VAR_INPUT (analog) */
	signed long Mux;
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiMux_typ;

typedef struct rtiMuxReal
{
	/* VAR_INPUT (analog) */
	signed long Mux;
	float In1;
	float In2;
	float In3;
	float In4;
	/* VAR_OUTPUT (analog) */
	float Out;
} rtiMuxReal_typ;

typedef struct rtiNot
{
	/* VAR_INPUT (analog) */
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiNot_typ;

typedef struct rtiOr
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	/* VAR_OUTPUT (analog) */
	signed long OutTsEdge;
	signed long Out;
	signed long OutN;
} rtiOr_typ;

typedef struct rtiPar
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	signed long Simul;
	/* VAR_OUTPUT (analog) */
	signed long Data;
} rtiPar_typ;

typedef struct rtiParReal
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	float Simul;
	/* VAR_OUTPUT (analog) */
	float Data;
} rtiParReal_typ;

typedef struct rtiPwm
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long Start;
	signed long Period;
	signed long Duty;
	signed long DeadB;
	/* VAR_OUTPUT (analog) */
	unsigned long ModeOut;
	signed long OutTsEdgePos;
	signed long OutTsEdgeNeg;
	signed long Base;
	signed long PeriodOut;
} rtiPwm_typ;

typedef struct rtiRealToInt
{
	/* VAR_INPUT (analog) */
	float In;
	signed long Shift;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	signed long Status;
} rtiRealToInt_typ;

typedef struct rtiRegister
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long Latch;
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	/* VAR_OUTPUT (analog) */
	signed long OutTsLatch;
	signed long Out1;
	signed long Out2;
	signed long Out3;
	signed long Out4;
	/* VAR (analog) */
	signed long LocLatch;
} rtiRegister_typ;

typedef struct rtiRegisterReal
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	signed long Latch;
	float In1;
	float In2;
	float In3;
	float In4;
	/* VAR_OUTPUT (analog) */
	signed long OutTsLatch;
	float Out1;
	float Out2;
	float Out3;
	float Out4;
	/* VAR (analog) */
	signed long LocLatch;
} rtiRegisterReal_typ;

typedef struct rtiRes
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	signed long Data;
	/* VAR_OUTPUT (analog) */
	signed long Simul;
} rtiRes_typ;

typedef struct rtiResReal
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	float Data;
	/* VAR_OUTPUT (analog) */
	float Simul;
} rtiResReal_typ;

typedef struct rtiRF_TRIG
{
	/* VAR_INPUT (analog) */
	signed long CLK;
	/* VAR_OUTPUT (analog) */
	signed long OutEdge;
	signed long OutEdgePos;
	signed long OutEdgeNeg;
	/* VAR (analog) */
	signed long LocLatch;
} rtiRF_TRIG_typ;

typedef struct rtiShift
{
	/* VAR_INPUT (analog) */
	signed long In;
	signed long Shl;
	signed long Shr;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiShift_typ;

typedef struct rtiSineReal
{
	/* VAR_INPUT (analog) */
	float In;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiSineReal_typ;

typedef struct rtiSqrtReal
{
	/* VAR_INPUT (analog) */
	float In;
	/* VAR_OUTPUT (analog) */
	float Out;
	signed long Status;
} rtiSqrtReal_typ;

typedef struct rtiSRff
{
	/* VAR_INPUT (analog) */
	signed long InS;
	signed long InR;
	/* VAR_OUTPUT (analog) */
	signed long OutTsEdge;
	signed long Out;
} rtiSRff_typ;

typedef struct rtiSSI
{
	/* VAR_INPUT (analog) */
	signed short Channel;
	signed long Mode;
	signed long Trigger;
	signed long ForceOn;
	signed long ForceVal;
	signed long SimulPos;
	/* VAR_OUTPUT (analog) */
	signed long Pos;
	signed long PosTs;
	signed long Status;
} rtiSSI_typ;

typedef struct rtiSub
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiSub_typ;

typedef struct rtiTDel
{
	/* VAR_INPUT (analog) */
	signed long Enable;
	signed long Comp1;
	signed long Comp2;
	signed long Comp3;
	signed long Comp4;
	signed long Comp5;
	signed long Comp6;
	signed long Base;
	/* VAR_OUTPUT (analog) */
	signed long Out;
	/* VAR (analog) */
	signed long LocStat;
} rtiTDel_typ;

typedef struct rtiTime
{
	/* VAR_OUTPUT (analog) */
	signed long TsPar;
	signed long TsCycle;
} rtiTime_typ;

typedef struct rtiTimeLoc2Net
{
	/* VAR_INPUT (analog) */
	signed long LocTime;
	/* VAR_OUTPUT (analog) */
	signed long NetTime;
} rtiTimeLoc2Net_typ;

typedef struct rtiTimeNet2Loc
{
	/* VAR_INPUT (analog) */
	signed long NetTime;
	/* VAR_OUTPUT (analog) */
	signed long LocTime;
} rtiTimeNet2Loc_typ;

typedef struct rtiTP
{
	/* VAR_INPUT (analog) */
	signed long IN;
	signed long PT;
	/* VAR_OUTPUT (analog) */
	signed long Q;
	signed long ET;
	/* VAR (analog) */
	signed long LocLatch;
} rtiTP_typ;

typedef struct rtiVarRead
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	signed long Simul;
	/* VAR_OUTPUT (analog) */
	signed long Out;
} rtiVarRead_typ;

typedef struct rtiVarReadReal
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	float Simul;
	/* VAR_OUTPUT (analog) */
	float Out;
} rtiVarReadReal_typ;

typedef struct rtiVarWrite
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	signed long In;
	/* VAR_OUTPUT (analog) */
	signed long Simul;
} rtiVarWrite_typ;

typedef struct rtiVarWriteReal
{
	/* VAR_INPUT (analog) */
	signed short DpNr;
	float In;
	/* VAR_OUTPUT (analog) */
	float Simul;
} rtiVarWriteReal_typ;

typedef struct rtiXor
{
	/* VAR_INPUT (analog) */
	signed long In1;
	signed long In2;
	signed long In3;
	signed long In4;
	/* VAR_OUTPUT (analog) */
	signed long OutTsEdge;
	signed long Out;
	signed long OutN;
} rtiXor_typ;

typedef struct rtiSim
{
	/* VAR_INPUT (analog) */
	unsigned long Mode;
	/* VAR_OUTPUT (analog) */
	unsigned long Cycles;
	unsigned short Status;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Clear;
} rtiSim_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void rtiABCnt(struct rtiABCnt* inst);
_BUR_PUBLIC void rtiABRPos(struct rtiABRPos* inst);
_BUR_PUBLIC void rtiAbs(struct rtiAbs* inst);
_BUR_PUBLIC void rtiAdd(struct rtiAdd* inst);
_BUR_PUBLIC void rtiAddSubReal(struct rtiAddSubReal* inst);
_BUR_PUBLIC void rtiAin(struct rtiAin* inst);
_BUR_PUBLIC void rtiAnd(struct rtiAnd* inst);
_BUR_PUBLIC void rtiAnLimit(struct rtiAnLimit* inst);
_BUR_PUBLIC void rtiAout(struct rtiAout* inst);
_BUR_PUBLIC void rtiBit2Byte(struct rtiBit2Byte* inst);
_BUR_PUBLIC void rtiByte2Bit(struct rtiByte2Bit* inst);
_BUR_PUBLIC void rtiComp(struct rtiComp* inst);
_BUR_PUBLIC void rtiCompReal(struct rtiCompReal* inst);
_BUR_PUBLIC void rtiCount(struct rtiCount* inst);
_BUR_PUBLIC void rtiDelay(struct rtiDelay* inst);
_BUR_PUBLIC void rtiDelayReal(struct rtiDelayReal* inst);
_BUR_PUBLIC void rtiDeMux(struct rtiDeMux* inst);
_BUR_PUBLIC void rtiDeMuxReal(struct rtiDeMuxReal* inst);
_BUR_PUBLIC void rtiDin(struct rtiDin* inst);
_BUR_PUBLIC void rtiDiv(struct rtiDiv* inst);
_BUR_PUBLIC void rtiDivReal(struct rtiDivReal* inst);
_BUR_PUBLIC void rtiDout(struct rtiDout* inst);
_BUR_PUBLIC void rtiDoutTime(struct rtiDoutTime* inst);
_BUR_PUBLIC void rtiIntToReal(struct rtiIntToReal* inst);
_BUR_PUBLIC void rtiInvertReal(struct rtiInvertReal* inst);
_BUR_PUBLIC void rtiLatch(struct rtiLatch* inst);
_BUR_PUBLIC void rtiLatchReal(struct rtiLatchReal* inst);
_BUR_PUBLIC void rtiMul(struct rtiMul* inst);
_BUR_PUBLIC void rtiMulReal(struct rtiMulReal* inst);
_BUR_PUBLIC void rtiMux(struct rtiMux* inst);
_BUR_PUBLIC void rtiMuxReal(struct rtiMuxReal* inst);
_BUR_PUBLIC void rtiNot(struct rtiNot* inst);
_BUR_PUBLIC void rtiOr(struct rtiOr* inst);
_BUR_PUBLIC void rtiPar(struct rtiPar* inst);
_BUR_PUBLIC void rtiParReal(struct rtiParReal* inst);
_BUR_PUBLIC void rtiPwm(struct rtiPwm* inst);
_BUR_PUBLIC void rtiRealToInt(struct rtiRealToInt* inst);
_BUR_PUBLIC void rtiRegister(struct rtiRegister* inst);
_BUR_PUBLIC void rtiRegisterReal(struct rtiRegisterReal* inst);
_BUR_PUBLIC void rtiRes(struct rtiRes* inst);
_BUR_PUBLIC void rtiResReal(struct rtiResReal* inst);
_BUR_PUBLIC void rtiRF_TRIG(struct rtiRF_TRIG* inst);
_BUR_PUBLIC void rtiShift(struct rtiShift* inst);
_BUR_PUBLIC void rtiSineReal(struct rtiSineReal* inst);
_BUR_PUBLIC void rtiSqrtReal(struct rtiSqrtReal* inst);
_BUR_PUBLIC void rtiSRff(struct rtiSRff* inst);
_BUR_PUBLIC void rtiSSI(struct rtiSSI* inst);
_BUR_PUBLIC void rtiSub(struct rtiSub* inst);
_BUR_PUBLIC void rtiTDel(struct rtiTDel* inst);
_BUR_PUBLIC void rtiTime(struct rtiTime* inst);
_BUR_PUBLIC void rtiTimeLoc2Net(struct rtiTimeLoc2Net* inst);
_BUR_PUBLIC void rtiTimeNet2Loc(struct rtiTimeNet2Loc* inst);
_BUR_PUBLIC void rtiTP(struct rtiTP* inst);
_BUR_PUBLIC void rtiVarRead(struct rtiVarRead* inst);
_BUR_PUBLIC void rtiVarReadReal(struct rtiVarReadReal* inst);
_BUR_PUBLIC void rtiVarWrite(struct rtiVarWrite* inst);
_BUR_PUBLIC void rtiVarWriteReal(struct rtiVarWriteReal* inst);
_BUR_PUBLIC void rtiXor(struct rtiXor* inst);
_BUR_PUBLIC void rtiSim(struct rtiSim* inst);


/* Constants */
#ifdef _REPLACE_CONST
 #define IORTI_SIM_ERR_VAR_SIMUL_VALUE 37914U
 #define IORTI_SIM_ERR_PAR_SIMUL_VALUE 37913U
 #define IORTI_SIM_ERR_INVALID_DPNR 37912U
 #define IORTI_SIM_ERR_OUT_OF_MEMORY 37911U
 #define IORTI_SIM_ERR_UNKNOWN_MODE 37910U
 #define IORTI_SIM_MODE_DEFAULT 1U
#else
 _GLOBAL_CONST unsigned long IORTI_SIM_ERR_VAR_SIMUL_VALUE;
 _GLOBAL_CONST unsigned long IORTI_SIM_ERR_PAR_SIMUL_VALUE;
 _GLOBAL_CONST unsigned long IORTI_SIM_ERR_INVALID_DPNR;
 _GLOBAL_CONST unsigned long IORTI_SIM_ERR_OUT_OF_MEMORY;
 _GLOBAL_CONST unsigned long IORTI_SIM_ERR_UNKNOWN_MODE;
 _GLOBAL_CONST unsigned long IORTI_SIM_MODE_DEFAULT;
#endif




#ifdef __cplusplus
};
#endif
#endif /* _ASIORTI_ */

