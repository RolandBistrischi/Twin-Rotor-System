#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "TRAS_2dof_model_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "TRAS_2dof_model.h"
#include "TRAS_2dof_model_capi.h"
#include "TRAS_2dof_model_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"TRAS_2dof_model/Azimuth H22" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 }
, { 1 , 0 , TARGET_STRING ( "TRAS_2dof_model/Pitch H11" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 2 , 0 , TARGET_STRING (
"TRAS_2dof_model/Step11" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 3
, 0 , TARGET_STRING ( "TRAS_2dof_model/Step12" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 1 } , { 4 , 0 , TARGET_STRING ( "TRAS_2dof_model/Sum14" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 5 , 0 , TARGET_STRING (
"TRAS_2dof_model/Sum15" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 6
, 0 , TARGET_STRING ( "TRAS_2dof_model/Sum16" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 7 , 0 , TARGET_STRING ( "TRAS_2dof_model/Sum17" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"TRAS_2dof_model/D12" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 9 ,
0 , TARGET_STRING ( "TRAS_2dof_model/D21" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 10 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Abs" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 11 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Abs1" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 12 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Gain1" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 13 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Gain3" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 14 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_A" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 15 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_A1" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 16 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_A2" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 17 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_P" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 18 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 19 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 20 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 21 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m6" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 22 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m7" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 23 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/ih" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 24 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 25 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 26 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 27 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/+1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 28 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/+2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 29 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/+3" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 30 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Product" ) , TARGET_STRING ( "" ) , 0 , 0
, 0 , 0 , 0 } , { 31 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Product1" ) , TARGET_STRING ( "" ) , 0 ,
0 , 0 , 0 , 0 } , { 32 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/+1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0
, 0 , 0 } , { 33 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/mfv1" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 34 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller1/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 35 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller1/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 36 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller2/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 37 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller2/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 38 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 39 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 40 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller1/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 41 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller1/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 42 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller2/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 43 , 0 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller2/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 44 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP-azimuth/1//Ja" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 0 } , { 45 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP-azimuth/Integrator1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 46 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP-azimuth/Sum1" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 0 } , { 47 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP_pith/1//Jp1" ) , TARGET_STRING ( "" )
, 0 , 0 , 0 , 0 , 0 } , { 48 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP_pith/Integrator" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 49 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP_pith/Sum" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 50 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/q (x2,x6)/+1" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 51 , 0 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/r(x2,x6)/+2" ) , TARGET_STRING ( "" ) , 0
, 0 , 0 , 0 , 0 } , { 52 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/D Gain/Internal Parameters/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 53 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/Filter/Cont. Filter/Filter" ) , TARGET_STRING ( "" )
, 0 , 0 , 0 , 0 , 0 } , { 54 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/Filter/Cont. Filter/SumD" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 55 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/I Gain/Internal Parameters/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 56 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/Integrator/Continuous/Integrator" ) , TARGET_STRING
( "" ) , 0 , 0 , 0 , 0 , 0 } , { 57 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/N Gain/Internal Parameters/Filter Coefficient" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 58 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/Parallel P Gain/Internal Parameters/Proportional Gain"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 59 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H11/Sum/Sum_PID/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 60 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/D Gain/Internal Parameters/Derivative Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 61 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/Filter/Cont. Filter/Filter" ) , TARGET_STRING ( "" )
, 0 , 0 , 0 , 0 , 0 } , { 62 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/Filter/Cont. Filter/SumD" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 63 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/I Gain/Internal Parameters/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 64 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/Integrator/Continuous/Integrator" ) , TARGET_STRING
( "" ) , 0 , 0 , 0 , 0 , 0 } , { 65 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/N Gain/Internal Parameters/Filter Coefficient" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 66 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/Parallel P Gain/Internal Parameters/Proportional Gain"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 67 , 0 , TARGET_STRING (
"TRAS_2dof_model/PID H22/Sum/Sum_PID/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 ,
0 , 0 , 0 } , { 68 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 69 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 70 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 71 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 72 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 73 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 74 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 75 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 76 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 77 , 0 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL
) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 78 , TARGET_STRING ( "TRAS_2dof_model/PID H11" )
, TARGET_STRING ( "P" ) , 0 , 0 , 0 } , { 79 , TARGET_STRING (
"TRAS_2dof_model/PID H11" ) , TARGET_STRING ( "I" ) , 0 , 0 , 0 } , { 80 ,
TARGET_STRING ( "TRAS_2dof_model/PID H11" ) , TARGET_STRING ( "D" ) , 0 , 0 ,
0 } , { 81 , TARGET_STRING ( "TRAS_2dof_model/PID H11" ) , TARGET_STRING (
"N" ) , 0 , 0 , 0 } , { 82 , TARGET_STRING ( "TRAS_2dof_model/PID H11" ) ,
TARGET_STRING ( "InitialConditionForIntegrator" ) , 0 , 0 , 0 } , { 83 ,
TARGET_STRING ( "TRAS_2dof_model/PID H11" ) , TARGET_STRING (
"InitialConditionForFilter" ) , 0 , 0 , 0 } , { 84 , TARGET_STRING (
"TRAS_2dof_model/PID H22" ) , TARGET_STRING ( "P" ) , 0 , 0 , 0 } , { 85 ,
TARGET_STRING ( "TRAS_2dof_model/PID H22" ) , TARGET_STRING ( "I" ) , 0 , 0 ,
0 } , { 86 , TARGET_STRING ( "TRAS_2dof_model/PID H22" ) , TARGET_STRING (
"D" ) , 0 , 0 , 0 } , { 87 , TARGET_STRING ( "TRAS_2dof_model/PID H22" ) ,
TARGET_STRING ( "N" ) , 0 , 0 , 0 } , { 88 , TARGET_STRING (
"TRAS_2dof_model/PID H22" ) , TARGET_STRING ( "InitialConditionForIntegrator"
) , 0 , 0 , 0 } , { 89 , TARGET_STRING ( "TRAS_2dof_model/PID H22" ) ,
TARGET_STRING ( "InitialConditionForFilter" ) , 0 , 0 , 0 } , { 90 ,
TARGET_STRING ( "TRAS_2dof_model/Azimuth H22" ) , TARGET_STRING ( "Gain" ) ,
0 , 0 , 0 } , { 91 , TARGET_STRING ( "TRAS_2dof_model/Pitch H11" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 92 , TARGET_STRING (
"TRAS_2dof_model/Step1" ) , TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 93 ,
TARGET_STRING ( "TRAS_2dof_model/Step1" ) , TARGET_STRING ( "Before" ) , 0 ,
0 , 0 } , { 94 , TARGET_STRING ( "TRAS_2dof_model/Step1" ) , TARGET_STRING (
"After" ) , 0 , 0 , 0 } , { 95 , TARGET_STRING ( "TRAS_2dof_model/Step11" ) ,
TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 96 , TARGET_STRING (
"TRAS_2dof_model/Step11" ) , TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 97
, TARGET_STRING ( "TRAS_2dof_model/Step11" ) , TARGET_STRING ( "After" ) , 0
, 0 , 0 } , { 98 , TARGET_STRING ( "TRAS_2dof_model/Step12" ) , TARGET_STRING
( "Time" ) , 0 , 0 , 0 } , { 99 , TARGET_STRING ( "TRAS_2dof_model/Step12" )
, TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 100 , TARGET_STRING (
"TRAS_2dof_model/Step12" ) , TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 101
, TARGET_STRING ( "TRAS_2dof_model/Step3" ) , TARGET_STRING ( "Time" ) , 0 ,
0 , 0 } , { 102 , TARGET_STRING ( "TRAS_2dof_model/Step3" ) , TARGET_STRING (
"Before" ) , 0 , 0 , 0 } , { 103 , TARGET_STRING ( "TRAS_2dof_model/Step3" )
, TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 104 , TARGET_STRING (
"TRAS_2dof_model/Step4" ) , TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 105 ,
TARGET_STRING ( "TRAS_2dof_model/Step4" ) , TARGET_STRING ( "Before" ) , 0 ,
0 , 0 } , { 106 , TARGET_STRING ( "TRAS_2dof_model/Step4" ) , TARGET_STRING (
"After" ) , 0 , 0 , 0 } , { 107 , TARGET_STRING ( "TRAS_2dof_model/Step5" ) ,
TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 108 , TARGET_STRING (
"TRAS_2dof_model/Step5" ) , TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 109
, TARGET_STRING ( "TRAS_2dof_model/Step5" ) , TARGET_STRING ( "After" ) , 0 ,
0 , 0 } , { 110 , TARGET_STRING ( "TRAS_2dof_model/Step6" ) , TARGET_STRING (
"Time" ) , 0 , 0 , 0 } , { 111 , TARGET_STRING ( "TRAS_2dof_model/Step6" ) ,
TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 112 , TARGET_STRING (
"TRAS_2dof_model/Step6" ) , TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 113 ,
TARGET_STRING ( "TRAS_2dof_model/D12" ) , TARGET_STRING ( "A" ) , 0 , 0 , 0 }
, { 114 , TARGET_STRING ( "TRAS_2dof_model/D12" ) , TARGET_STRING ( "C" ) , 0
, 0 , 0 } , { 115 , TARGET_STRING ( "TRAS_2dof_model/D12" ) , TARGET_STRING (
"D" ) , 0 , 0 , 0 } , { 116 , TARGET_STRING ( "TRAS_2dof_model/D21" ) ,
TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 117 , TARGET_STRING (
"TRAS_2dof_model/D21" ) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 118 ,
TARGET_STRING ( "TRAS_2dof_model/D21" ) , TARGET_STRING ( "D" ) , 0 , 0 , 0 }
, { 119 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller1" ) , TARGET_STRING (
"Ki" ) , 0 , 0 , 0 } , { 120 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller1" ) , TARGET_STRING (
"Kd" ) , 0 , 0 , 0 } , { 121 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller2" ) , TARGET_STRING (
"Ki" ) , 0 , 0 , 0 } , { 122 , TARGET_STRING (
"TRAS_2dof_model/FOPID G11/Fractional PID controller2" ) , TARGET_STRING (
"Kd" ) , 0 , 0 , 0 } , { 123 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller" ) , TARGET_STRING (
"Ki" ) , 0 , 0 , 0 } , { 124 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller" ) , TARGET_STRING (
"Kd" ) , 0 , 0 , 0 } , { 125 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller1" ) , TARGET_STRING (
"Ki" ) , 0 , 0 , 0 } , { 126 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller1" ) , TARGET_STRING (
"Kd" ) , 0 , 0 , 0 } , { 127 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller2" ) , TARGET_STRING (
"Ki" ) , 0 , 0 , 0 } , { 128 , TARGET_STRING (
"TRAS_2dof_model/FOPID G22/Fractional PID controller2" ) , TARGET_STRING (
"Kd" ) , 0 , 0 , 0 } , { 129 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 ,
0 , 0 } , { 130 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/Gain3"
) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 131 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_A" ) , TARGET_STRING ( "Gain" ) , 0 , 0
, 0 } , { 132 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/R_A1" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 133 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/R_A2" ) , TARGET_STRING ( "Gain" ) , 0 ,
0 , 0 } , { 134 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/R_P" )
, TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 135 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m1" ) , TARGET_STRING ( "Gain" ) , 0 , 0
, 0 } , { 136 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/m2" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 137 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m3" ) , TARGET_STRING ( "Gain" ) , 0 , 0
, 0 } , { 138 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/m6" ) ,
TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 139 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/m7" ) , TARGET_STRING ( "Gain" ) , 0 , 0
, 0 } , { 140 , TARGET_STRING ( "TRAS_2dof_model/TRAS 2_dof model 3/ih" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 141 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 142 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv1" ) , TARGET_STRING (
"UpperSaturationLimit" ) , 0 , 0 , 0 } , { 143 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv1" ) , TARGET_STRING (
"LowerSaturationLimit" ) , 0 , 0 , 0 } , { 144 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv2" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 145 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv3" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 146 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv3" ) , TARGET_STRING (
"UpperSaturationLimit" ) , 0 , 0 , 0 } , { 147 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/iv3" ) , TARGET_STRING (
"LowerSaturationLimit" ) , 0 , 0 , 0 } , { 148 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP-azimuth/1//Ja" ) , TARGET_STRING (
"Gain" ) , 0 , 0 , 0 } , { 149 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP-azimuth/Integrator1" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 150 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP_pith/1//Jp1" ) , TARGET_STRING (
"Gain" ) , 0 , 0 , 0 } , { 151 , TARGET_STRING (
"TRAS_2dof_model/TRAS 2_dof model 3/DCP_pith/Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 152 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 153 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 154 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 155 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 156 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 157 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 158 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 159 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 160 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 161 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 162 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 163 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 164 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 165 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 166 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 167 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 168 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 169 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 170 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "A" ) , 0 , 0 , 0 } , { 171 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/Transfer Fcn1"
) , TARGET_STRING ( "C" ) , 0 , 0 , 0 } , { 172 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_pr" ) , 0 , 0 , 0 } , { 173 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_ir" ) , 1 , 0 , 0 } , { 174 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_jc" ) , 1 , 1 , 0 } , { 175 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 0 , 0 } , { 176 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 0 , 0 } , { 177 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 178 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 0 , 0 } , { 179 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 0 , 0 } , { 180 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 1 , 0 } , { 181 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 182 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 183 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 184 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 185 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "A_pr" ) , 0 , 2 , 0 } , { 186 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "A_ir" ) , 1 , 2 , 0 } , { 187 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "A_jc" ) , 1 , 3 , 0 } , { 188 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 4 , 0 } , { 189 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 4 , 0 } , { 190 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 191 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 4 , 0 } , { 192 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 4 , 0 } , { 193 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 3 , 0 } , { 194 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 195 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 196 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 197 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 198 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 199 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 200 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 201 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 202 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 0 , 0 } , { 203 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 0 , 0 } , { 204 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 205 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 0 , 0 } , { 206 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 0 , 0 } , { 207 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 1 , 0 } , { 208 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G11/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 209 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_pr" ) , 0 , 2 , 0 } , { 210 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_ir" ) , 1 , 2 , 0 } , { 211 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "A_jc" ) , 1 , 3 , 0 } , { 212 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 4 , 0 } , { 213 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 4 , 0 } , { 214 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 215 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 4 , 0 } , { 216 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 4 , 0 } , { 217 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 3 , 0 } , { 218 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 219 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 220 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 221 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 222 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 223 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 224 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 225 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 226 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 227 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 228 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 229 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 230 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 0 , 0 } , { 231 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 0 , 0 } , { 232 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 233 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 0 , 0 } , { 234 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 0 , 0 } , { 235 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 1 , 0 } , { 236 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller1/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 237 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_pr" ) , 0 , 0 , 0 } , { 238 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_ir" ) , 1 , 0 , 0 } , { 239 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "D_jc" ) , 1 , 1 , 0 } , { 240 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional derivative1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 241 ,
TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_pr" ) , 0 , 0 , 0 } , { 242 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_ir" ) , 1 , 0 , 0 } , { 243 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "B_jc" ) , 1 , 1 , 0 } , { 244 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_pr" ) , 0 , 0 , 0 } , { 245 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_ir" ) , 1 , 0 , 0 } , { 246 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "C_jc" ) , 1 , 1 , 0 } , { 247 , TARGET_STRING (
 "TRAS_2dof_model/FOPID G22/Fractional PID controller2/Fractional integrator1/LTI System/Internal"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , (
NULL ) , 0 , 0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ;
static const rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL
) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] =
{ { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_ModelParameters rtModelParameters [ ] = { { 248 , TARGET_STRING (
"control_a" ) , 0 , 5 , 0 } , { 249 , TARGET_STRING ( "control_p" ) , 0 , 5 ,
0 } , { 250 , TARGET_STRING ( "force_a" ) , 0 , 5 , 0 } , { 251 ,
TARGET_STRING ( "force_p" ) , 0 , 5 , 0 } , { 252 , TARGET_STRING ( "rpm_a" )
, 0 , 5 , 0 } , { 253 , TARGET_STRING ( "rpm_p" ) , 0 , 5 , 0 } , { 0 , (
NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . ldhi2fpbxl , & rtB . irz4j1sojy ,
& rtB . aqs4oxuwyl , & rtB . erpxqhxk00 , & rtB . bouweblsab , & rtB .
c5kx2oh2se , & rtB . mot5vgcutr , & rtB . cd4wpzwctw , & rtB . hsrvh1wvsr , &
rtB . demaor1dik , & rtB . nnyvg3ewi2 , & rtB . pdb2nsllfb , & rtB .
pqw0bmbvyh , & rtB . eubeamzge2 , & rtB . mnoyv4c1oi , & rtB . fphc0a1yof , &
rtB . lyilqbdoth , & rtB . jsze1vkano , & rtB . k4zikws1lv , & rtB .
ne0icjjiea , & rtB . mznss5gtji , & rtB . fek5cpgpxc , & rtB . giyyztgrks , &
rtB . lmvs3x222n , & rtB . krxu1qmwom , & rtB . bwqaarfcvc , & rtB .
fet3qizh0j , & rtB . d2iamzdwvx , & rtB . o0tumhunrv , & rtB . dzp5kslu0y , &
rtB . oi4rz33jw2 , & rtB . dyebmkbotq , & rtB . a2xogmmrwy , & rtB .
mjovcv0cli , & rtB . nda511k3pz , & rtB . kqlvxbvvpq , & rtB . mogw3m3ole , &
rtB . hjkoaew1qn , & rtB . m0yxj5xmvn , & rtB . n4gzkqwnjl , & rtB .
jicgqcymkr , & rtB . enxktml03x , & rtB . pju2nswxhr , & rtB . ldvf4d0xaa , &
rtB . e2qxpult0l , & rtB . erbrcq20ws , & rtB . jmkmxy13ke , & rtB .
kt41jradvt , & rtB . by5ff02b5y , & rtB . hffy2x0mio , & rtB . jvxhhdzj44 , &
rtB . jex533xe4y , & rtB . hkxcz5n3u4 , & rtB . fboo2yk1af , & rtB .
musqjdo1j0 , & rtB . mxr3hlwucz , & rtB . jm4vpunmvn , & rtB . lqggrcs4ug , &
rtB . oxflnbwtba , & rtB . mkzdlh0qin , & rtB . iwxxthzuqe , & rtB .
dmvry52sf0 , & rtB . ouiqsk0vmf , & rtB . gajroozbt2 , & rtB . cmmyyeec03 , &
rtB . puxd3yedqm , & rtB . offfk3higa , & rtB . ftgxcyqkjl , & rtB .
ezwu5kevjn , & rtB . n4oygy2keq , & rtB . blj1vvf5bz , & rtB . gz52pym3ld , &
rtB . dn1kv0lvn1 , & rtB . gpw5rttvyx , & rtB . ctrfw1tj5m , & rtB .
ml0fw5n3jm , & rtB . dabmhed4kp , & rtB . ixdslxr1wi , & rtP . PIDH11_P , &
rtP . PIDH11_I , & rtP . PIDH11_D , & rtP . PIDH11_N , & rtP .
PIDH11_InitialConditionForIntegrator , & rtP .
PIDH11_InitialConditionForFilter , & rtP . PIDH22_P , & rtP . PIDH22_I , &
rtP . PIDH22_D , & rtP . PIDH22_N , & rtP .
PIDH22_InitialConditionForIntegrator , & rtP .
PIDH22_InitialConditionForFilter , & rtP . AzimuthH22_Gain , & rtP .
PitchH11_Gain , & rtP . Step1_Time , & rtP . Step1_Y0 , & rtP . Step1_YFinal
, & rtP . Step11_Time , & rtP . Step11_Y0 , & rtP . Step11_YFinal , & rtP .
Step12_Time , & rtP . Step12_Y0 , & rtP . Step12_YFinal , & rtP . Step3_Time
, & rtP . Step3_Y0 , & rtP . Step3_YFinal , & rtP . Step4_Time , & rtP .
Step4_Y0 , & rtP . Step4_YFinal , & rtP . Step5_Time , & rtP . Step5_Y0 , &
rtP . Step5_YFinal , & rtP . Step6_Time , & rtP . Step6_Y0 , & rtP .
Step6_YFinal , & rtP . D12_A , & rtP . D12_C , & rtP . D12_D , & rtP . D21_A
, & rtP . D21_C , & rtP . D21_D , & rtP . FractionalPIDcontroller1_Ki , & rtP
. FractionalPIDcontroller1_Kd , & rtP . FractionalPIDcontroller2_Ki , & rtP .
FractionalPIDcontroller2_Kd , & rtP . FractionalPIDcontroller_Ki , & rtP .
FractionalPIDcontroller_Kd , & rtP . FractionalPIDcontroller1_Ki_fcgp0ssxe2 ,
& rtP . FractionalPIDcontroller1_Kd_cktyldyb5v , & rtP .
FractionalPIDcontroller2_Ki_kjwg1dqtj5 , & rtP .
FractionalPIDcontroller2_Kd_adfdsts2cz , & rtP . Gain1_Gain , & rtP .
Gain3_Gain , & rtP . R_A_Gain , & rtP . R_A1_Gain , & rtP . R_A2_Gain , & rtP
. R_P_Gain , & rtP . m1_Gain , & rtP . m2_Gain , & rtP . m3_Gain , & rtP .
m6_Gain , & rtP . m7_Gain , & rtP . ih_IC , & rtP . iv1_IC , & rtP .
iv1_UpperSat , & rtP . iv1_LowerSat , & rtP . iv2_IC , & rtP . iv3_IC , & rtP
. iv3_UpperSat , & rtP . iv3_LowerSat , & rtP . uJa_Gain , & rtP .
Integrator1_IC , & rtP . uJp1_Gain , & rtP . Integrator_IC , & rtP .
TransferFcn1_A , & rtP . TransferFcn1_C , & rtP . TransferFcn1_A_jvoyunirms ,
& rtP . TransferFcn1_C_p1qztopeoo , & rtP . TransferFcn1_A_jvo420osds , & rtP
. TransferFcn1_C_pa1znp5ici , & rtP . TransferFcn1_A_eawc3pddjy , & rtP .
TransferFcn1_C_kwqvw5jbah , & rtP . TransferFcn1_A_ae4vnndsdi , & rtP .
TransferFcn1_C_dufn3b2avs , & rtP . TransferFcn1_A_kuxz443wdc , & rtP .
TransferFcn1_C_myrb2vgz0p , & rtP . TransferFcn1_A_ioqoub3d3t , & rtP .
TransferFcn1_C_dcpqblfb10 , & rtP . TransferFcn1_A_jqrwj4rpz1 , & rtP .
TransferFcn1_C_hgyeuf33te , & rtP . TransferFcn1_A_gwfeakisgo , & rtP .
TransferFcn1_C_ha4knw45mi , & rtP . TransferFcn1_A_gnicpt3yph , & rtP .
TransferFcn1_C_kwn2svax3p , & rtP . Internal_A_pr , & rtP . Internal_A_ir , &
rtP . Internal_A_jc [ 0 ] , & rtP . Internal_B_pr , & rtP . Internal_B_ir , &
rtP . Internal_B_jc [ 0 ] , & rtP . Internal_C_pr , & rtP . Internal_C_ir , &
rtP . Internal_C_jc [ 0 ] , & rtP . Internal_D_pr , & rtP . Internal_D_ir , &
rtP . Internal_D_jc [ 0 ] , & rtP . Internal_InitialCondition , & rtP .
Internal_A_pr_oyjjirm1kx [ 0 ] , & rtP . Internal_A_ir_lt0mujnoco [ 0 ] , &
rtP . Internal_A_jc_mhpguuqiql [ 0 ] , & rtP . Internal_B_pr_au0fet3yzl [ 0 ]
, & rtP . Internal_B_ir_kknoqxu3xf [ 0 ] , & rtP . Internal_B_jc_di4ygjrrxp [
0 ] , & rtP . Internal_C_pr_enpotgrtpz [ 0 ] , & rtP .
Internal_C_ir_bpvpjyhh50 [ 0 ] , & rtP . Internal_C_jc_nfs5nawamg [ 0 ] , &
rtP . Internal_D_pr_cbnbxjghfm , & rtP . Internal_D_ir_nimtudfqvy , & rtP .
Internal_D_jc_njabwzxsbu [ 0 ] , & rtP . Internal_InitialCondition_gkuj4oapel
, & rtP . Internal_D_pr_ftkigkd45s , & rtP . Internal_D_ir_c1n1ecqg5e , & rtP
. Internal_D_jc_msslbhppgh [ 0 ] , & rtP .
Internal_InitialCondition_gtzyyjaguu , & rtP . Internal_B_pr_fwnutaqvgl , &
rtP . Internal_B_ir_e5q2ielz0k , & rtP . Internal_B_jc_b5uitas21k [ 0 ] , &
rtP . Internal_C_pr_n03rjhdezu , & rtP . Internal_C_ir_dj54yvrj3y , & rtP .
Internal_C_jc_atzel0anhk [ 0 ] , & rtP . Internal_InitialCondition_omefaxkung
, & rtP . Internal_A_pr_mwq41kchyr [ 0 ] , & rtP . Internal_A_ir_k3rmsjspu3 [
0 ] , & rtP . Internal_A_jc_ico2ix4g3r [ 0 ] , & rtP .
Internal_B_pr_ablmqrrv5r [ 0 ] , & rtP . Internal_B_ir_kgt0n55ea0 [ 0 ] , &
rtP . Internal_B_jc_ncvbnp5zed [ 0 ] , & rtP . Internal_C_pr_l1ivnrijnm [ 0 ]
, & rtP . Internal_C_ir_cjnkvshnhd [ 0 ] , & rtP . Internal_C_jc_idimqapynj [
0 ] , & rtP . Internal_D_pr_aaq4ww0rsb , & rtP . Internal_D_ir_cvjj3ujewj , &
rtP . Internal_D_jc_gvthc55kni [ 0 ] , & rtP .
Internal_InitialCondition_n5v5kawmah , & rtP . Internal_D_pr_p02i25wy0b , &
rtP . Internal_D_ir_prlosd5dyu , & rtP . Internal_D_jc_m2cl305t1t [ 0 ] , &
rtP . Internal_InitialCondition_m0lfmfz0iu , & rtP . Internal_D_pr_ilyqvmletq
, & rtP . Internal_D_ir_ohygarzx4s , & rtP . Internal_D_jc_b3x1llq0ff [ 0 ] ,
& rtP . Internal_InitialCondition_c1yrfy3gzu , & rtP .
Internal_B_pr_oeuh3vjlwu , & rtP . Internal_B_ir_opjqujg5gf , & rtP .
Internal_B_jc_o3szusvxkw [ 0 ] , & rtP . Internal_C_pr_eie2kt4des , & rtP .
Internal_C_ir_jqy55xbh3j , & rtP . Internal_C_jc_gcbznjcfuo [ 0 ] , & rtP .
Internal_InitialCondition_j1fjpgtl3n , & rtP . Internal_D_pr_howwo5ykxk , &
rtP . Internal_D_ir_mvufke4m5s , & rtP . Internal_D_jc_kderkjhrwv [ 0 ] , &
rtP . Internal_InitialCondition_npozeerkwd , & rtP . Internal_B_pr_kmyvpbbyrv
, & rtP . Internal_B_ir_oegikg3rp3 , & rtP . Internal_B_jc_cjygwe2rdv [ 0 ] ,
& rtP . Internal_C_pr_nb42sbyzoo , & rtP . Internal_C_ir_lma0c15mon , & rtP .
Internal_C_jc_aa5fiqedwy [ 0 ] , & rtP . Internal_InitialCondition_ba1cnq4dlp
, & rtP . control_a [ 0 ] , & rtP . control_p [ 0 ] , & rtP . force_a [ 0 ] ,
& rtP . force_p [ 0 ] , & rtP . rpm_a [ 0 ] , & rtP . rpm_p [ 0 ] , } ;
static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } ,
{ "unsigned int" , "uint32_T" , 0 , 0 , sizeof ( uint32_T ) , ( uint8_T )
SS_UINT32 , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } , { rtwCAPI_VECTOR , 10 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 2 , 1 , 66 , 1 , 12 , 1 , 11 ,
1 , 1 , 81 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 , 1.0 } ;
static const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static const
rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , (
int8_T ) 0 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 0 ]
, ( const void * ) & rtcapiStoredFloats [ 1 ] , ( int8_T ) 1 , ( uint8_T ) 0
} , { ( NULL ) , ( NULL ) , 2 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 78 , rtRootInputs , 0 , rtRootOutputs , 0 }
, { rtBlockParameters , 170 , rtModelParameters , 6 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 2406384959U , 3323145849U , 1788149093U ,
2002023803U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ;
const rtwCAPI_ModelMappingStaticInfo * TRAS_2dof_model_GetCAPIStaticMap (
void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void TRAS_2dof_model_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( (
* rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void TRAS_2dof_model_host_InitializeDataMapInfo (
TRAS_2dof_model_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap ->
mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
