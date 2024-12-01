#include "TRAS_2dof_model.h"
#include "mwmathutil.h"
#include "rt_look.h"
#include "rt_look1d.h"
#include "rtwtypes.h"
#include "TRAS_2dof_model_private.h"
#include <string.h>
#include "rt_logging_mmi.h"
#include "TRAS_2dof_model_capi.h"
#include "TRAS_2dof_model_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; extern ssExecutionInfo gblExecutionInfo ; RTWExtModeInfo *
gblRTWExtModeInfo = NULL ; void raccelForceExtModeShutdown ( boolean_T
extModeStartPktReceived ) { if ( ! extModeStartPktReceived ) { boolean_T
stopRequested = false ; rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , &
stopRequested ) ; } rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_engine_exec.h"
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "24.1 (R2024a) 19-Nov-2023" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; int_T enableFcnCallFlag [ ] = { 1 , 1 , 1 } ; const
char * raccelLoadInputsAndAperiodicHitTimes ( SimStruct * S , const char *
inportFileName , int * matFileFormat ) { return rt_RAccelReadInportsMatFile (
S , inportFileName , matFileFormat ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_engine_exec.h"
#include "simtarget/slSimTgtSLExecSimBridge.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void MdlInitialize ( void ) { int_T is ; rtX . aminfxpiey = rtP .
Integrator1_IC ; rtX . lm4tnlgi0b = rtP . iv3_IC ; rtX . hx2uqr2ddc = rtP .
Integrator_IC ; rtX . h1krndgpjn = rtP . PIDH11_InitialConditionForIntegrator
; rtX . ezzfxe3zjf = rtP . PIDH11_InitialConditionForFilter ; rtX .
gzsibhoxzs = 0.0 ; rtX . ne4t1fjjfm = rtP .
PIDH22_InitialConditionForIntegrator ; rtX . lrtk244ibj = rtP .
PIDH22_InitialConditionForFilter ; rtX . jssu3to0dh = rtP . iv1_IC ; rtX .
mqsw1lgcxp = 0.0 ; rtX . kgbuyci2df = rtP . ih_IC ; rtX . gqvnvitpjj = rtP .
iv2_IC ; rtX . iw3vpw53mc = rtP . Internal_InitialCondition ; rtX .
hgjn3ummij = 0.0 ; rtX . kerux15bcw = 0.0 ; rtX . kc54dxc05x = 0.0 ; rtX .
nhfkorig1m = rtP . Internal_InitialCondition_omefaxkung ; rtX . e32d3r1biu =
0.0 ; for ( is = 0 ; is < 11 ; is ++ ) { rtX . jcsdrzipfa [ is ] = rtP .
Internal_InitialCondition_gkuj4oapel ; rtX . pfnfogk5ox [ is ] = rtP .
Internal_InitialCondition_n5v5kawmah ; } rtX . a1dj2minkv = 0.0 ; rtX .
cm0lyo1fqx = 0.0 ; rtX . gh0zecqhyv = 0.0 ; rtX . ebccughyzq = rtP .
Internal_InitialCondition_j1fjpgtl3n ; rtX . f25t2yldvr = 0.0 ; rtX .
jf0hg4tz5n = 0.0 ; rtX . n3fnmjmy41 = rtP .
Internal_InitialCondition_ba1cnq4dlp ; rtX . iorcha3xwp = 0.0 ; } void
MdlStart ( void ) { { bool externalInputIsInDatasetFormat = false ; void *
pISigstreamManager = rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { real_T pewqwjxglo ;
int32_T ci ; uint32_T ri ; rtB . erbrcq20ws = rtX . aminfxpiey ; rtB .
e2qxpult0l = rtP . uJa_Gain * rtB . erbrcq20ws ; if ( ssIsModeUpdateTimeStep
( rtS ) ) { if ( rtX . lm4tnlgi0b >= rtP . iv3_UpperSat ) { if ( rtX .
lm4tnlgi0b != rtP . iv3_UpperSat ) { rtX . lm4tnlgi0b = rtP . iv3_UpperSat ;
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } rtDW . pn4vsggslw = 3
; } else if ( rtX . lm4tnlgi0b <= rtP . iv3_LowerSat ) { if ( rtX .
lm4tnlgi0b != rtP . iv3_LowerSat ) { rtX . lm4tnlgi0b = rtP . iv3_LowerSat ;
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } rtDW . pn4vsggslw = 4
; } else { if ( rtDW . pn4vsggslw != 0 ) {
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } rtDW . pn4vsggslw = 0
; } rtB . fet3qizh0j = rtX . lm4tnlgi0b ; } else { rtB . fet3qizh0j = rtX .
lm4tnlgi0b ; } rtB . by5ff02b5y = rtX . hx2uqr2ddc ; rtB . kt41jradvt = rtP .
uJp1_Gain * rtB . by5ff02b5y ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW .
mu4n3ns15f = ( ssGetTaskTime ( rtS , 1 ) >= rtP . Step11_Time ) ; if ( rtDW .
mu4n3ns15f == 1 ) { rtB . aqs4oxuwyl = rtP . Step11_YFinal ; } else { rtB .
aqs4oxuwyl = rtP . Step11_Y0 ; } rtDW . elxrpmovlm = ( ssGetTaskTime ( rtS ,
1 ) >= rtP . Step12_Time ) ; if ( rtDW . elxrpmovlm == 1 ) { rtB . erpxqhxk00
= rtP . Step12_YFinal ; } else { rtB . erpxqhxk00 = rtP . Step12_Y0 ; } } rtB
. cd4wpzwctw = rtB . aqs4oxuwyl - rtB . kt41jradvt ; rtB . oxflnbwtba = rtP .
PIDH11_P * rtB . cd4wpzwctw ; rtB . jm4vpunmvn = rtX . h1krndgpjn ; rtB .
hkxcz5n3u4 = rtP . PIDH11_D * rtB . cd4wpzwctw ; rtB . fboo2yk1af = rtX .
ezzfxe3zjf ; rtB . musqjdo1j0 = rtB . hkxcz5n3u4 - rtB . fboo2yk1af ; rtB .
lqggrcs4ug = rtP . PIDH11_N * rtB . musqjdo1j0 ; rtB . mkzdlh0qin = ( rtB .
oxflnbwtba + rtB . jm4vpunmvn ) + rtB . lqggrcs4ug ; rtB . demaor1dik = 0.0 ;
rtB . demaor1dik += rtP . D21_C * rtX . gzsibhoxzs ; rtB . demaor1dik += rtP
. D21_D * rtB . mkzdlh0qin ; rtB . c5kx2oh2se = rtB . erpxqhxk00 - rtB .
e2qxpult0l ; rtB . offfk3higa = rtP . PIDH22_P * rtB . c5kx2oh2se ; rtB .
cmmyyeec03 = rtX . ne4t1fjjfm ; rtB . iwxxthzuqe = rtP . PIDH22_D * rtB .
c5kx2oh2se ; rtB . dmvry52sf0 = rtX . lrtk244ibj ; rtB . ouiqsk0vmf = rtB .
iwxxthzuqe - rtB . dmvry52sf0 ; rtB . puxd3yedqm = rtP . PIDH22_N * rtB .
ouiqsk0vmf ; rtB . ftgxcyqkjl = ( rtB . offfk3higa + rtB . cmmyyeec03 ) + rtB
. puxd3yedqm ; rtB . mot5vgcutr = rtB . demaor1dik + rtB . ftgxcyqkjl ; rtB .
ldhi2fpbxl = rtP . AzimuthH22_Gain * rtB . mot5vgcutr ; if (
ssIsModeUpdateTimeStep ( rtS ) ) { if ( rtX . jssu3to0dh >= rtP .
iv1_UpperSat ) { if ( rtX . jssu3to0dh != rtP . iv1_UpperSat ) { rtX .
jssu3to0dh = rtP . iv1_UpperSat ; ssSetBlockStateForSolverChangedAtMajorStep
( rtS ) ; } rtDW . invv4ejzdr = 3 ; } else if ( rtX . jssu3to0dh <= rtP .
iv1_LowerSat ) { if ( rtX . jssu3to0dh != rtP . iv1_LowerSat ) { rtX .
jssu3to0dh = rtP . iv1_LowerSat ; ssSetBlockStateForSolverChangedAtMajorStep
( rtS ) ; } rtDW . invv4ejzdr = 4 ; } else { if ( rtDW . invv4ejzdr != 0 ) {
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } rtDW . invv4ejzdr = 0
; } rtB . krxu1qmwom = rtX . jssu3to0dh ; } else { rtB . krxu1qmwom = rtX .
jssu3to0dh ; } rtB . hsrvh1wvsr = 0.0 ; rtB . hsrvh1wvsr += rtP . D12_C * rtX
. mqsw1lgcxp ; rtB . hsrvh1wvsr += rtP . D12_D * rtB . ftgxcyqkjl ; rtB .
bouweblsab = rtB . mkzdlh0qin + rtB . hsrvh1wvsr ; rtB . irz4j1sojy = rtP .
PitchH11_Gain * rtB . bouweblsab ; rtB . mxr3hlwucz = rtP . PIDH11_I * rtB .
cd4wpzwctw ; rtB . gajroozbt2 = rtP . PIDH22_I * rtB . c5kx2oh2se ; if (
ssIsModeUpdateTimeStep ( rtS ) ) { rtDW . ohuy4ui33e = ( rtB . e2qxpult0l >=
0.0 ) ; } if ( rtDW . ohuy4ui33e > 0 ) { rtB . nnyvg3ewi2 = rtB . e2qxpult0l
; } else { rtB . nnyvg3ewi2 = - rtB . e2qxpult0l ; } rtB . fphc0a1yof = rtP .
R_A1_Gain * rtB . nnyvg3ewi2 ; rtB . lmvs3x222n = rtX . kgbuyci2df ; rtB .
jvxhhdzj44 = rtB . lmvs3x222n / ( 0.023790379333500002 * muDoubleScalarPower
( muDoubleScalarCos ( rtB . krxu1qmwom ) , 2.0 ) + 0.0030096206665 ) ; rtB .
lyilqbdoth = rtP . R_A2_Gain * rtB . jvxhhdzj44 ; rtB . oi4rz33jw2 = rtB .
fphc0a1yof * rtB . lyilqbdoth ; pewqwjxglo = muDoubleScalarCos ( rtB .
krxu1qmwom ) ; rtB . d2iamzdwvx = rtB . oi4rz33jw2 * pewqwjxglo ; rtB .
mnoyv4c1oi = rtP . R_A_Gain * rt_Lookup ( & rtP . rpm_a [ 0 ] , 81 , rtB .
e2qxpult0l , & rtP . force_a [ 0 ] ) ; rtB . o0tumhunrv = rtB . mnoyv4c1oi *
pewqwjxglo ; rtB . eubeamzge2 = rtP . Gain3_Gain * rtB . irz4j1sojy ; rtB .
dzp5kslu0y = rtB . eubeamzge2 * pewqwjxglo ; rtB . mznss5gtji = rtP . m3_Gain
* rtB . jvxhhdzj44 ; rtB . a2xogmmrwy = ( ( rtB . o0tumhunrv - rtB .
mznss5gtji ) - rtB . d2iamzdwvx ) - rtB . dzp5kslu0y ; if (
ssIsModeUpdateTimeStep ( rtS ) ) { rtDW . ngukhbswzj = ( rtB . kt41jradvt >=
0.0 ) ; } if ( rtDW . ngukhbswzj > 0 ) { rtB . pdb2nsllfb = rtB . kt41jradvt
; } else { rtB . pdb2nsllfb = - rtB . kt41jradvt ; } rtB . jmkmxy13ke = rtB .
ldhi2fpbxl - rt_Lookup ( & rtP . rpm_a [ 0 ] , 81 , rtB . e2qxpult0l , & rtP
. control_a [ 0 ] ) ; rtB . hffy2x0mio = rtB . irz4j1sojy - rt_Lookup ( & rtP
. rpm_p [ 0 ] , 81 , rtB . kt41jradvt , & rtP . control_p [ 0 ] ) ; rtB .
pqw0bmbvyh = rtP . Gain1_Gain * rtB . ldhi2fpbxl ; rtB . ne0icjjiea = rtP .
m2_Gain * rtB . pdb2nsllfb ; rtB . bwqaarfcvc = rtX . gqvnvitpjj ; rtB .
giyyztgrks = rtP . m7_Gain * rtB . bwqaarfcvc ; rtB . k4zikws1lv = rtP .
m1_Gain * rtB . giyyztgrks ; rtB . dyebmkbotq = rtB . ne0icjjiea * rtB .
k4zikws1lv ; rtB . jsze1vkano = rtP . R_P_Gain * rt_Lookup ( & rtP . rpm_p [
0 ] , 81 , rtB . kt41jradvt , & rtP . force_p [ 0 ] ) ; rtB . fek5cpgpxc =
rtP . m6_Gain * rtB . giyyztgrks ; rtB . jex533xe4y = - ( 0.0292 *
muDoubleScalarCos ( rtB . krxu1qmwom ) + 0.0546 * muDoubleScalarSin ( rtB .
krxu1qmwom ) ) * 1.7143 + - 0.021248478614648719 * muDoubleScalarSin ( rtB .
krxu1qmwom ) * muDoubleScalarCos ( rtB . krxu1qmwom ) * muDoubleScalarPower (
rtB . jvxhhdzj44 , 2.0 ) ; rtB . mjovcv0cli = ( ( ( rtB . jex533xe4y + rtB .
pqw0bmbvyh ) + rtB . jsze1vkano ) - rtB . fek5cpgpxc ) - rtB . dyebmkbotq ;
rtB . ezwu5kevjn = 0.0 ; for ( ri = rtP . Internal_C_jc [ 0U ] ; ri < rtP .
Internal_C_jc [ 1U ] ; ri ++ ) { rtB . ezwu5kevjn += rtP . Internal_C_pr *
rtX . iw3vpw53mc ; } for ( ri = rtP . Internal_D_jc [ 0U ] ; ri < rtP .
Internal_D_jc [ 1U ] ; ri ++ ) { rtB . ezwu5kevjn += rtP . Internal_D_pr *
rtB . nda511k3pz ; } rtB . n4oygy2keq = 0.0 ; for ( ci = 0 ; ci < 11 ; ci ++
) { for ( ri = rtP . Internal_C_jc_nfs5nawamg [ ( uint32_T ) ci ] ; ri < rtP
. Internal_C_jc_nfs5nawamg [ ( uint32_T ) ci + 1U ] ; ri ++ ) { rtB .
n4oygy2keq += rtP . Internal_C_pr_enpotgrtpz [ ri ] * rtX . jcsdrzipfa [ (
uint32_T ) ci ] ; } } for ( ri = rtP . Internal_D_jc_njabwzxsbu [ 0U ] ; ri <
rtP . Internal_D_jc_njabwzxsbu [ 1U ] ; ri ++ ) { rtB . n4oygy2keq += rtP .
Internal_D_pr_cbnbxjghfm * rtB . kqlvxbvvpq ; } rtB . blj1vvf5bz = 0.0 ; for
( ri = rtP . Internal_D_jc_msslbhppgh [ 0U ] ; ri < rtP .
Internal_D_jc_msslbhppgh [ 1U ] ; ri ++ ) { rtB . blj1vvf5bz += rtP .
Internal_D_pr_ftkigkd45s * rtB . mogw3m3ole ; } rtB . gz52pym3ld = 0.0 ; for
( ri = rtP . Internal_C_jc_atzel0anhk [ 0U ] ; ri < rtP .
Internal_C_jc_atzel0anhk [ 1U ] ; ri ++ ) { rtB . gz52pym3ld += rtP .
Internal_C_pr_n03rjhdezu * rtX . nhfkorig1m ; } rtB . dn1kv0lvn1 = 0.0 ; for
( ci = 0 ; ci < 11 ; ci ++ ) { for ( ri = rtP . Internal_C_jc_idimqapynj [ (
uint32_T ) ci ] ; ri < rtP . Internal_C_jc_idimqapynj [ ( uint32_T ) ci + 1U
] ; ri ++ ) { rtB . dn1kv0lvn1 += rtP . Internal_C_pr_l1ivnrijnm [ ri ] * rtX
. pfnfogk5ox [ ( uint32_T ) ci ] ; } } for ( ri = rtP .
Internal_D_jc_gvthc55kni [ 0U ] ; ri < rtP . Internal_D_jc_gvthc55kni [ 1U ]
; ri ++ ) { rtB . dn1kv0lvn1 += rtP . Internal_D_pr_aaq4ww0rsb * rtB .
m0yxj5xmvn ; } rtB . gpw5rttvyx = 0.0 ; for ( ri = rtP .
Internal_D_jc_m2cl305t1t [ 0U ] ; ri < rtP . Internal_D_jc_m2cl305t1t [ 1U ]
; ri ++ ) { rtB . gpw5rttvyx += rtP . Internal_D_pr_p02i25wy0b * rtB .
n4gzkqwnjl ; } rtB . ctrfw1tj5m = 0.0 ; for ( ri = rtP .
Internal_D_jc_b3x1llq0ff [ 0U ] ; ri < rtP . Internal_D_jc_b3x1llq0ff [ 1U ]
; ri ++ ) { rtB . ctrfw1tj5m += rtP . Internal_D_pr_ilyqvmletq * rtB .
jicgqcymkr ; } rtB . ml0fw5n3jm = 0.0 ; for ( ri = rtP .
Internal_C_jc_gcbznjcfuo [ 0U ] ; ri < rtP . Internal_C_jc_gcbznjcfuo [ 1U ]
; ri ++ ) { rtB . ml0fw5n3jm += rtP . Internal_C_pr_eie2kt4des * rtX .
ebccughyzq ; } rtB . dabmhed4kp = 0.0 ; for ( ri = rtP .
Internal_D_jc_kderkjhrwv [ 0U ] ; ri < rtP . Internal_D_jc_kderkjhrwv [ 1U ]
; ri ++ ) { rtB . dabmhed4kp += rtP . Internal_D_pr_howwo5ykxk * rtB .
pju2nswxhr ; } rtB . ixdslxr1wi = 0.0 ; for ( ri = rtP .
Internal_C_jc_aa5fiqedwy [ 0U ] ; ri < rtP . Internal_C_jc_aa5fiqedwy [ 1U ]
; ri ++ ) { rtB . ixdslxr1wi += rtP . Internal_C_pr_nb42sbyzoo * rtX .
n3fnmjmy41 ; } if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW . d4cvoix4ms = (
ssGetTaskTime ( rtS , 1 ) >= rtP . Step1_Time ) ; rtDW . cw1ttcuebj = (
ssGetTaskTime ( rtS , 1 ) >= rtP . Step3_Time ) ; rtDW . kgwf2z5yp1 = (
ssGetTaskTime ( rtS , 1 ) >= rtP . Step4_Time ) ; rtDW . nq14rtfxrv = (
ssGetTaskTime ( rtS , 1 ) >= rtP . Step5_Time ) ; rtDW . nvpqsiifnq = (
ssGetTaskTime ( rtS , 1 ) >= rtP . Step6_Time ) ; } UNUSED_PARAMETER ( tid )
; } void MdlOutputsTID2 ( int_T tid ) { rtB . nda511k3pz = rtP .
FractionalPIDcontroller1_Kd * 0.0 ; rtB . kqlvxbvvpq = rtP .
FractionalPIDcontroller1_Ki * 0.0 ; rtB . mogw3m3ole = rtP .
FractionalPIDcontroller2_Kd * 0.0 ; rtB . hjkoaew1qn = rtP .
FractionalPIDcontroller2_Ki * 0.0 ; rtB . m0yxj5xmvn = rtP .
FractionalPIDcontroller_Kd * 0.0 ; rtB . n4gzkqwnjl = rtP .
FractionalPIDcontroller_Ki * 0.0 ; rtB . jicgqcymkr = rtP .
FractionalPIDcontroller1_Kd_cktyldyb5v * 0.0 ; rtB . enxktml03x = rtP .
FractionalPIDcontroller1_Ki_fcgp0ssxe2 * 0.0 ; rtB . pju2nswxhr = rtP .
FractionalPIDcontroller2_Kd_adfdsts2cz * 0.0 ; rtB . ldvf4d0xaa = rtP .
FractionalPIDcontroller2_Ki_kjwg1dqtj5 * 0.0 ; UNUSED_PARAMETER ( tid ) ; }
void MdlUpdate ( int_T tid ) { XDis * _rtXdis ; _rtXdis = ( ( XDis * )
ssGetContStateDisabled ( rtS ) ) ; switch ( rtDW . pn4vsggslw ) { case 3 : if
( rtB . jvxhhdzj44 < 0.0 ) { rtDW . pn4vsggslw = 1 ;
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } break ; case 4 : if (
rtB . jvxhhdzj44 > 0.0 ) { rtDW . pn4vsggslw = 2 ;
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } break ; } _rtXdis ->
lm4tnlgi0b = ( ( rtDW . pn4vsggslw == 3 ) || ( rtDW . pn4vsggslw == 4 ) ) ;
switch ( rtDW . invv4ejzdr ) { case 3 : if ( rtB . giyyztgrks < 0.0 ) { rtDW
. invv4ejzdr = 1 ; ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; }
break ; case 4 : if ( rtB . giyyztgrks > 0.0 ) { rtDW . invv4ejzdr = 2 ;
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } break ; } _rtXdis ->
jssu3to0dh = ( ( rtDW . invv4ejzdr == 3 ) || ( rtDW . invv4ejzdr == 4 ) ) ;
UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T tid ) {
UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) { XDis * _rtXdis ;
XDot * _rtXdot ; int_T iS ; uint32_T ri ; _rtXdis = ( ( XDis * )
ssGetContStateDisabled ( rtS ) ) ; _rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ;
_rtXdot -> aminfxpiey = rtB . jmkmxy13ke ; if ( _rtXdis -> lm4tnlgi0b ) {
_rtXdot -> lm4tnlgi0b = 0.0 ; } else { _rtXdot -> lm4tnlgi0b = rtB .
jvxhhdzj44 ; } _rtXdot -> hx2uqr2ddc = rtB . hffy2x0mio ; _rtXdot ->
h1krndgpjn = rtB . mxr3hlwucz ; _rtXdot -> ezzfxe3zjf = rtB . lqggrcs4ug ;
_rtXdot -> gzsibhoxzs = rtP . D21_A * rtX . gzsibhoxzs ; _rtXdot ->
gzsibhoxzs += rtB . mkzdlh0qin ; _rtXdot -> ne4t1fjjfm = rtB . gajroozbt2 ;
_rtXdot -> lrtk244ibj = rtB . puxd3yedqm ; if ( _rtXdis -> jssu3to0dh ) {
_rtXdot -> jssu3to0dh = 0.0 ; } else { _rtXdot -> jssu3to0dh = rtB .
giyyztgrks ; } _rtXdot -> mqsw1lgcxp = rtP . D12_A * rtX . mqsw1lgcxp ;
_rtXdot -> mqsw1lgcxp += rtB . ftgxcyqkjl ; _rtXdot -> kgbuyci2df = rtB .
a2xogmmrwy ; _rtXdot -> gqvnvitpjj = rtB . mjovcv0cli ; _rtXdot -> iw3vpw53mc
= 0.0 ; for ( ri = rtP . Internal_A_jc [ 0U ] ; ri < rtP . Internal_A_jc [ 1U
] ; ri ++ ) { _rtXdot -> iw3vpw53mc += rtP . Internal_A_pr * rtX . iw3vpw53mc
; } for ( ri = rtP . Internal_B_jc [ 0U ] ; ri < rtP . Internal_B_jc [ 1U ] ;
ri ++ ) { _rtXdot -> iw3vpw53mc += rtP . Internal_B_pr * rtB . nda511k3pz ; }
_rtXdot -> hgjn3ummij = rtP . TransferFcn1_A * rtX . hgjn3ummij ; _rtXdot ->
hgjn3ummij += rtB . ezwu5kevjn ; memset ( & _rtXdot -> jcsdrzipfa [ 0 ] , 0 ,
11U * sizeof ( real_T ) ) ; for ( iS = 0 ; iS < 11 ; iS ++ ) { for ( ri = rtP
. Internal_A_jc_mhpguuqiql [ ( uint32_T ) iS ] ; ri < rtP .
Internal_A_jc_mhpguuqiql [ ( uint32_T ) iS + 1U ] ; ri ++ ) { _rtXdot ->
jcsdrzipfa [ rtP . Internal_A_ir_lt0mujnoco [ ri ] ] += rtP .
Internal_A_pr_oyjjirm1kx [ ri ] * rtX . jcsdrzipfa [ ( uint32_T ) iS ] ; } }
for ( ri = rtP . Internal_B_jc_di4ygjrrxp [ 0U ] ; ri < rtP .
Internal_B_jc_di4ygjrrxp [ 1U ] ; ri ++ ) { _rtXdot -> jcsdrzipfa [ rtP .
Internal_B_ir_kknoqxu3xf [ ri ] ] += rtP . Internal_B_pr_au0fet3yzl [ ri ] *
rtB . kqlvxbvvpq ; } _rtXdot -> kerux15bcw = rtP . TransferFcn1_A_jvoyunirms
* rtX . kerux15bcw ; _rtXdot -> kerux15bcw += rtB . n4oygy2keq ; _rtXdot ->
kc54dxc05x = rtP . TransferFcn1_A_jvo420osds * rtX . kc54dxc05x ; _rtXdot ->
kc54dxc05x += rtB . blj1vvf5bz ; _rtXdot -> nhfkorig1m = 0.0 ; for ( ri = rtP
. Internal_B_jc_b5uitas21k [ 0U ] ; ri < rtP . Internal_B_jc_b5uitas21k [ 1U
] ; ri ++ ) { _rtXdot -> nhfkorig1m += rtP . Internal_B_pr_fwnutaqvgl * rtB .
hjkoaew1qn ; } _rtXdot -> e32d3r1biu = rtP . TransferFcn1_A_eawc3pddjy * rtX
. e32d3r1biu ; _rtXdot -> e32d3r1biu += rtB . gz52pym3ld ; memset ( & _rtXdot
-> pfnfogk5ox [ 0 ] , 0 , 11U * sizeof ( real_T ) ) ; for ( iS = 0 ; iS < 11
; iS ++ ) { for ( ri = rtP . Internal_A_jc_ico2ix4g3r [ ( uint32_T ) iS ] ;
ri < rtP . Internal_A_jc_ico2ix4g3r [ ( uint32_T ) iS + 1U ] ; ri ++ ) {
_rtXdot -> pfnfogk5ox [ rtP . Internal_A_ir_k3rmsjspu3 [ ri ] ] += rtP .
Internal_A_pr_mwq41kchyr [ ri ] * rtX . pfnfogk5ox [ ( uint32_T ) iS ] ; } }
for ( ri = rtP . Internal_B_jc_ncvbnp5zed [ 0U ] ; ri < rtP .
Internal_B_jc_ncvbnp5zed [ 1U ] ; ri ++ ) { _rtXdot -> pfnfogk5ox [ rtP .
Internal_B_ir_kgt0n55ea0 [ ri ] ] += rtP . Internal_B_pr_ablmqrrv5r [ ri ] *
rtB . m0yxj5xmvn ; } _rtXdot -> a1dj2minkv = rtP . TransferFcn1_A_ae4vnndsdi
* rtX . a1dj2minkv ; _rtXdot -> a1dj2minkv += rtB . dn1kv0lvn1 ; _rtXdot ->
cm0lyo1fqx = rtP . TransferFcn1_A_kuxz443wdc * rtX . cm0lyo1fqx ; _rtXdot ->
cm0lyo1fqx += rtB . gpw5rttvyx ; _rtXdot -> gh0zecqhyv = rtP .
TransferFcn1_A_ioqoub3d3t * rtX . gh0zecqhyv ; _rtXdot -> gh0zecqhyv += rtB .
ctrfw1tj5m ; _rtXdot -> ebccughyzq = 0.0 ; for ( ri = rtP .
Internal_B_jc_o3szusvxkw [ 0U ] ; ri < rtP . Internal_B_jc_o3szusvxkw [ 1U ]
; ri ++ ) { _rtXdot -> ebccughyzq += rtP . Internal_B_pr_oeuh3vjlwu * rtB .
enxktml03x ; } _rtXdot -> f25t2yldvr = rtP . TransferFcn1_A_jqrwj4rpz1 * rtX
. f25t2yldvr ; _rtXdot -> f25t2yldvr += rtB . ml0fw5n3jm ; _rtXdot ->
jf0hg4tz5n = rtP . TransferFcn1_A_gwfeakisgo * rtX . jf0hg4tz5n ; _rtXdot ->
jf0hg4tz5n += rtB . dabmhed4kp ; _rtXdot -> n3fnmjmy41 = 0.0 ; for ( ri = rtP
. Internal_B_jc_cjygwe2rdv [ 0U ] ; ri < rtP . Internal_B_jc_cjygwe2rdv [ 1U
] ; ri ++ ) { _rtXdot -> n3fnmjmy41 += rtP . Internal_B_pr_kmyvpbbyrv * rtB .
ldvf4d0xaa ; } _rtXdot -> iorcha3xwp = rtP . TransferFcn1_A_gnicpt3yph * rtX
. iorcha3xwp ; _rtXdot -> iorcha3xwp += rtB . ixdslxr1wi ; } void
MdlProjection ( void ) { } void MdlZeroCrossings ( void ) { ZCV * _rtZCSV ;
_rtZCSV = ( ( ZCV * ) ssGetSolverZcSignalVector ( rtS ) ) ; switch ( rtDW .
pn4vsggslw ) { case 1 : _rtZCSV -> p1nevxqlvf = 0.0 ; _rtZCSV -> kfaiibec2x =
rtP . iv3_UpperSat - rtP . iv3_LowerSat ; break ; case 2 : _rtZCSV ->
p1nevxqlvf = rtP . iv3_LowerSat - rtP . iv3_UpperSat ; _rtZCSV -> kfaiibec2x
= 0.0 ; break ; default : _rtZCSV -> p1nevxqlvf = rtX . lm4tnlgi0b - rtP .
iv3_UpperSat ; _rtZCSV -> kfaiibec2x = rtX . lm4tnlgi0b - rtP . iv3_LowerSat
; break ; } if ( ( rtDW . pn4vsggslw == 3 ) || ( rtDW . pn4vsggslw == 4 ) ) {
_rtZCSV -> fwtc0ayerf = rtB . jvxhhdzj44 ; } else { _rtZCSV -> fwtc0ayerf =
0.0 ; } _rtZCSV -> o3zs1hcdkj = ssGetT ( rtS ) - rtP . Step11_Time ; _rtZCSV
-> kpcn0z2aam = ssGetT ( rtS ) - rtP . Step12_Time ; switch ( rtDW .
invv4ejzdr ) { case 1 : _rtZCSV -> kfami334hq = 0.0 ; _rtZCSV -> ak5fegkz2x =
rtP . iv1_UpperSat - rtP . iv1_LowerSat ; break ; case 2 : _rtZCSV ->
kfami334hq = rtP . iv1_LowerSat - rtP . iv1_UpperSat ; _rtZCSV -> ak5fegkz2x
= 0.0 ; break ; default : _rtZCSV -> kfami334hq = rtX . jssu3to0dh - rtP .
iv1_UpperSat ; _rtZCSV -> ak5fegkz2x = rtX . jssu3to0dh - rtP . iv1_LowerSat
; break ; } if ( ( rtDW . invv4ejzdr == 3 ) || ( rtDW . invv4ejzdr == 4 ) ) {
_rtZCSV -> f41wbkn4ep = rtB . giyyztgrks ; } else { _rtZCSV -> f41wbkn4ep =
0.0 ; } _rtZCSV -> gll1icvfxt = rtB . e2qxpult0l ; _rtZCSV -> pfaij3n04q =
rtB . kt41jradvt ; _rtZCSV -> oqt2pen0fw = ssGetT ( rtS ) - rtP . Step1_Time
; _rtZCSV -> kohn351acs = ssGetT ( rtS ) - rtP . Step3_Time ; _rtZCSV ->
e3yu1ol30z = ssGetT ( rtS ) - rtP . Step4_Time ; _rtZCSV -> g3dpg104wg =
ssGetT ( rtS ) - rtP . Step5_Time ; _rtZCSV -> cx05kfl0xt = ssGetT ( rtS ) -
rtP . Step6_Time ; } void MdlTerminate ( void ) { } static void
mr_TRAS_2dof_model_cacheDataAsMxArray ( mxArray * destArray , mwIndex i , int
j , const void * srcData , size_t numBytes ) ; static void
mr_TRAS_2dof_model_cacheDataAsMxArray ( mxArray * destArray , mwIndex i , int
j , const void * srcData , size_t numBytes ) { mxArray * newArray =
mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes , mxUINT8_CLASS ,
mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , ( const uint8_T *
) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i , j , newArray )
; } static void mr_TRAS_2dof_model_restoreDataFromMxArray ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ; static
void mr_TRAS_2dof_model_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( (
uint8_T * ) destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber (
srcArray , i , j ) ) , numBytes ) ; } static void
mr_TRAS_2dof_model_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i ,
int j , uint_T bitVal ) ; static void
mr_TRAS_2dof_model_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i ,
int j , uint_T bitVal ) { mxSetFieldByNumber ( destArray , i , j ,
mxCreateDoubleScalar ( ( real_T ) bitVal ) ) ; } static uint_T
mr_TRAS_2dof_model_extractBitFieldFromMxArray ( const mxArray * srcArray ,
mwIndex i , int j , uint_T numBits ) ; static uint_T
mr_TRAS_2dof_model_extractBitFieldFromMxArray ( const mxArray * srcArray ,
mwIndex i , int j , uint_T numBits ) { const uint_T varVal = ( uint_T )
mxGetScalar ( mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( (
1u << numBits ) - 1u ) ; } static void
mr_TRAS_2dof_model_cacheDataToMxArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , const void * srcData , size_t numBytes )
; static void mr_TRAS_2dof_model_cacheDataToMxArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_TRAS_2dof_model_restoreDataFromMxArrayWithOffset ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) ; static void mr_TRAS_2dof_model_restoreDataFromMxArrayWithOffset
( void * destData , const mxArray * srcArray , mwIndex i , int j , mwIndex
offset , size_t numBytes ) { const uint8_T * varData = ( const uint8_T * )
mxGetData ( mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T *
) destData , ( const uint8_T * ) & varData [ offset * numBytes ] , numBytes )
; } static void mr_TRAS_2dof_model_cacheBitFieldToCellArrayWithOffset (
mxArray * destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal )
; static void mr_TRAS_2dof_model_cacheBitFieldToCellArrayWithOffset ( mxArray
* destArray , mwIndex i , int j , mwIndex offset , uint_T fieldVal ) {
mxSetCell ( mxGetFieldByNumber ( destArray , i , j ) , offset ,
mxCreateDoubleScalar ( ( real_T ) fieldVal ) ) ; } static uint_T
mr_TRAS_2dof_model_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ; static
uint_T mr_TRAS_2dof_model_extractBitFieldFromCellArrayWithOffset ( const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) {
const uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell (
mxGetFieldByNumber ( srcArray , i , j ) , offset ) ) ; return fieldVal & ( (
1u << numBits ) - 1u ) ; } mxArray * mr_TRAS_2dof_model_GetDWork ( ) { static
const char_T * ssDWFieldNames [ 3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX" , } ;
mxArray * ssDW = mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) & (
rtB ) , sizeof ( rtB ) ) ; { static const char_T * rtdwDataFieldNames [ 11 ]
= { "rtDW.pn4vsggslw" , "rtDW.mu4n3ns15f" , "rtDW.elxrpmovlm" ,
"rtDW.invv4ejzdr" , "rtDW.ohuy4ui33e" , "rtDW.ngukhbswzj" , "rtDW.d4cvoix4ms"
, "rtDW.cw1ttcuebj" , "rtDW.kgwf2z5yp1" , "rtDW.nq14rtfxrv" ,
"rtDW.nvpqsiifnq" , } ; mxArray * rtdwData = mxCreateStructMatrix ( 1 , 1 ,
11 , rtdwDataFieldNames ) ; mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData
, 0 , 0 , ( const void * ) & ( rtDW . pn4vsggslw ) , sizeof ( rtDW .
pn4vsggslw ) ) ; mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 1 , (
const void * ) & ( rtDW . mu4n3ns15f ) , sizeof ( rtDW . mu4n3ns15f ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void * ) &
( rtDW . elxrpmovlm ) , sizeof ( rtDW . elxrpmovlm ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 3 , ( const void * ) &
( rtDW . invv4ejzdr ) , sizeof ( rtDW . invv4ejzdr ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 4 , ( const void * ) &
( rtDW . ohuy4ui33e ) , sizeof ( rtDW . ohuy4ui33e ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 5 , ( const void * ) &
( rtDW . ngukhbswzj ) , sizeof ( rtDW . ngukhbswzj ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 6 , ( const void * ) &
( rtDW . d4cvoix4ms ) , sizeof ( rtDW . d4cvoix4ms ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 7 , ( const void * ) &
( rtDW . cw1ttcuebj ) , sizeof ( rtDW . cw1ttcuebj ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 8 , ( const void * ) &
( rtDW . kgwf2z5yp1 ) , sizeof ( rtDW . kgwf2z5yp1 ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 9 , ( const void * ) &
( rtDW . nq14rtfxrv ) , sizeof ( rtDW . nq14rtfxrv ) ) ;
mr_TRAS_2dof_model_cacheDataAsMxArray ( rtdwData , 0 , 10 , ( const void * )
& ( rtDW . nvpqsiifnq ) , sizeof ( rtDW . nvpqsiifnq ) ) ; mxSetFieldByNumber
( ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void
mr_TRAS_2dof_model_SetDWork ( const mxArray * ssDW ) { ( void ) ssDW ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtB ) , ssDW , 0 ,
0 , sizeof ( rtB ) ) ; { const mxArray * rtdwData = mxGetFieldByNumber ( ssDW
, 0 , 1 ) ; mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW .
pn4vsggslw ) , rtdwData , 0 , 0 , sizeof ( rtDW . pn4vsggslw ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . mu4n3ns15f
) , rtdwData , 0 , 1 , sizeof ( rtDW . mu4n3ns15f ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . elxrpmovlm
) , rtdwData , 0 , 2 , sizeof ( rtDW . elxrpmovlm ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . invv4ejzdr
) , rtdwData , 0 , 3 , sizeof ( rtDW . invv4ejzdr ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . ohuy4ui33e
) , rtdwData , 0 , 4 , sizeof ( rtDW . ohuy4ui33e ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . ngukhbswzj
) , rtdwData , 0 , 5 , sizeof ( rtDW . ngukhbswzj ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . d4cvoix4ms
) , rtdwData , 0 , 6 , sizeof ( rtDW . d4cvoix4ms ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . cw1ttcuebj
) , rtdwData , 0 , 7 , sizeof ( rtDW . cw1ttcuebj ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . kgwf2z5yp1
) , rtdwData , 0 , 8 , sizeof ( rtDW . kgwf2z5yp1 ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . nq14rtfxrv
) , rtdwData , 0 , 9 , sizeof ( rtDW . nq14rtfxrv ) ) ;
mr_TRAS_2dof_model_restoreDataFromMxArray ( ( void * ) & ( rtDW . nvpqsiifnq
) , rtdwData , 0 , 10 , sizeof ( rtDW . nvpqsiifnq ) ) ; } } mxArray *
mr_TRAS_2dof_model_GetSimStateDisallowedBlocks ( ) { mxArray * data =
mxCreateCellMatrix ( 3 , 3 ) ; mwIndex subs [ 2 ] , offset ; { static const
char_T * blockType [ 3 ] = { "Scope" , "Scope" , "Scope" , } ; static const
char_T * blockPath [ 3 ] = { "TRAS_2dof_model/AZIMUTH2" ,
"TRAS_2dof_model/Comanda" , "TRAS_2dof_model/PITCH2" , } ; static const int
reason [ 3 ] = { 0 , 0 , 0 , } ; for ( subs [ 0 ] = 0 ; subs [ 0 ] < 3 ; ++ (
subs [ 0 ] ) ) { subs [ 1 ] = 0 ; offset = mxCalcSingleSubscript ( data , 2 ,
subs ) ; mxSetCell ( data , offset , mxCreateString ( blockType [ subs [ 0 ]
] ) ) ; subs [ 1 ] = 1 ; offset = mxCalcSingleSubscript ( data , 2 , subs ) ;
mxSetCell ( data , offset , mxCreateString ( blockPath [ subs [ 0 ] ] ) ) ;
subs [ 1 ] = 2 ; offset = mxCalcSingleSubscript ( data , 2 , subs ) ;
mxSetCell ( data , offset , mxCreateDoubleScalar ( ( real_T ) reason [ subs [
0 ] ] ) ) ; } } return data ; } void MdlInitializeSizes ( void ) {
ssSetNumContStates ( rtS , 48 ) ; ssSetNumPeriodicContStates ( rtS , 0 ) ;
ssSetNumY ( rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS
, 0 ) ; ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 104 ) ;
ssSetNumBlockIO ( rtS , 78 ) ; ssSetNumBlockParams ( rtS , 1058 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.0 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 1.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 2406384959U ) ; ssSetChecksumVal ( rtS , 1 ,
3323145849U ) ; ssSetChecksumVal ( rtS , 2 , 1788149093U ) ; ssSetChecksumVal
( rtS , 3 , 2002023803U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; static struct _ssBlkInfo2 blkInfo2 ;
static struct _ssBlkInfoSLSize blkInfoSLSize ; rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; executionInfo -> gblObjects_ . numToFiles = 0 ;
executionInfo -> gblObjects_ . numFrFiles = 0 ; executionInfo -> gblObjects_
. numFrWksBlocks = 0 ; executionInfo -> gblObjects_ . numModelInputs = 0 ;
executionInfo -> gblObjects_ . numRootInportBlks = 0 ; executionInfo ->
gblObjects_ . inportDataTypeIdx = NULL ; executionInfo -> gblObjects_ .
inportDims = NULL ; executionInfo -> gblObjects_ . inportComplex = NULL ;
executionInfo -> gblObjects_ . inportInterpoFlag = NULL ; executionInfo ->
gblObjects_ . inportContinuous = NULL ; ( void ) memset ( ( char_T * ) rtS ,
0 , sizeof ( SimStruct ) ) ; ( void ) memset ( ( char_T * ) & mdlInfo , 0 ,
sizeof ( struct _ssMdlInfo ) ) ; ( void ) memset ( ( char_T * ) & blkInfo2 ,
0 , sizeof ( struct _ssBlkInfo2 ) ) ; ( void ) memset ( ( char_T * ) &
blkInfoSLSize , 0 , sizeof ( struct _ssBlkInfoSLSize ) ) ; ssSetBlkInfo2Ptr (
rtS , & blkInfo2 ) ; ssSetBlkInfoSLSizePtr ( rtS , & blkInfoSLSize ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; ssSetExecutionInfo ( rtS ,
executionInfo ) ; slsaAllocOPModelData ( rtS ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ;
( void ) memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = (
void * ) & rtDW ; ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork ,
0 , sizeof ( DW ) ) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset (
( char_T * ) & dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS
, & dtInfo ) ; dtInfo . numDataTypes = 23 ; dtInfo . dataTypeSizes = &
rtDataTypeSizes [ 0 ] ; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ;
dtInfo . BTransTable = & rtBTransTable ; dtInfo . PTransTable = &
rtPTransTable ; dtInfo . dataTypeInfoTable = rtDataTypeInfoTable ; }
TRAS_2dof_model_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive (
rtS , true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "TRAS_2dof_model" ) ;
ssSetPath ( rtS , "TRAS_2dof_model" ) ; ssSetTStart ( rtS , 0.0 ) ;
ssSetTFinal ( rtS , 20.0 ) ; { static RTWLogInfo rt_DataLoggingInfo ;
rt_DataLoggingInfo . loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { { static int_T rt_LoggedStateWidths [ ] = { 1 , 1
, 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 11 , 1 , 1 , 1 , 1 , 11 , 1
, 1 , 1 , 1 , 1 , 1 , 1 , 1 } ; static int_T rt_LoggedStateNumDimensions [ ]
= { 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1
, 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 } ; static int_T rt_LoggedStateDimensions
[ ] = { 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 11 , 1 , 1 ,
1 , 1 , 11 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
, 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } ; static
BuiltInDTypeId rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE } ; static int_T rt_LoggedStateComplexSignals [ ] = { 0
, 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } ; static RTWPreprocessingFcnPtr
rt_LoggingStatePreprocessingFcnPtrs [ ] = { ( NULL ) , ( NULL ) , ( NULL ) ,
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) ,
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) ,
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) ,
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ; static const char_T *
rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" } ; static const char_T *
rt_LoggedStateBlockNames [ ] = {
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/DCP-azimuth/Integrator1" ,
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/iv3" ,
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/DCP_pith/Integrator" ,
"TRAS_2dof_model/PID H11/Integrator/Continuous/Integrator" ,
"TRAS_2dof_model/PID H11/Filter/Cont. Filter/Filter" , "TRAS_2dof_model/D21"
, "TRAS_2dof_model/PID H22/Integrator/Continuous/Integrator" ,
"TRAS_2dof_model/PID H22/Filter/Cont. Filter/Filter" ,
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/iv1" , "TRAS_2dof_model/D12" ,
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/ih" ,
"TRAS_2dof_model/TRAS\n2_dof\nmodel\n3/iv2" ,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller1/Fractional derivative1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller1/Fractional derivative1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller1/Fractional integrator1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller1/Fractional integrator1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller2/Fractional derivative1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller2/Fractional integrator1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G11/Fractional PID\ncontroller2/Fractional integrator1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller/Fractional derivative1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller/Fractional derivative1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller/Fractional integrator1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller1/Fractional derivative1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller1/Fractional integrator1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller1/Fractional integrator1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller2/Fractional derivative1/Transfer Fcn1"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller2/Fractional integrator1/LTI System/Internal"
,
 "TRAS_2dof_model/FOPID G22/Fractional PID\ncontroller2/Fractional integrator1/Transfer Fcn1"
} ; static const char_T * rt_LoggedStateNames [ ] = { "" , "" , "" , "" , ""
, "" , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" , "" ,
"" , "" , "" , "" , "" , "" , "" , "" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } ; static
RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } } ; static int_T rt_LoggedStateIdxList [ ] = { 0 , 1 , 2 , 3 , 4 , 5 ,
6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 ,
22 , 23 , 24 , 25 , 26 , 27 } ; static RTWLogSignalInfo
rt_LoggedStateSignalInfo = { 28 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 28 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . aminfxpiey ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . lm4tnlgi0b ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . hx2uqr2ddc ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtX . h1krndgpjn ;
rt_LoggedStateSignalPtrs [ 4 ] = ( void * ) & rtX . ezzfxe3zjf ;
rt_LoggedStateSignalPtrs [ 5 ] = ( void * ) & rtX . gzsibhoxzs ;
rt_LoggedStateSignalPtrs [ 6 ] = ( void * ) & rtX . ne4t1fjjfm ;
rt_LoggedStateSignalPtrs [ 7 ] = ( void * ) & rtX . lrtk244ibj ;
rt_LoggedStateSignalPtrs [ 8 ] = ( void * ) & rtX . jssu3to0dh ;
rt_LoggedStateSignalPtrs [ 9 ] = ( void * ) & rtX . mqsw1lgcxp ;
rt_LoggedStateSignalPtrs [ 10 ] = ( void * ) & rtX . kgbuyci2df ;
rt_LoggedStateSignalPtrs [ 11 ] = ( void * ) & rtX . gqvnvitpjj ;
rt_LoggedStateSignalPtrs [ 12 ] = ( void * ) & rtX . iw3vpw53mc ;
rt_LoggedStateSignalPtrs [ 13 ] = ( void * ) & rtX . hgjn3ummij ;
rt_LoggedStateSignalPtrs [ 14 ] = ( void * ) & rtX . jcsdrzipfa [ 0 ] ;
rt_LoggedStateSignalPtrs [ 15 ] = ( void * ) & rtX . kerux15bcw ;
rt_LoggedStateSignalPtrs [ 16 ] = ( void * ) & rtX . kc54dxc05x ;
rt_LoggedStateSignalPtrs [ 17 ] = ( void * ) & rtX . nhfkorig1m ;
rt_LoggedStateSignalPtrs [ 18 ] = ( void * ) & rtX . e32d3r1biu ;
rt_LoggedStateSignalPtrs [ 19 ] = ( void * ) & rtX . pfnfogk5ox [ 0 ] ;
rt_LoggedStateSignalPtrs [ 20 ] = ( void * ) & rtX . a1dj2minkv ;
rt_LoggedStateSignalPtrs [ 21 ] = ( void * ) & rtX . cm0lyo1fqx ;
rt_LoggedStateSignalPtrs [ 22 ] = ( void * ) & rtX . gh0zecqhyv ;
rt_LoggedStateSignalPtrs [ 23 ] = ( void * ) & rtX . ebccughyzq ;
rt_LoggedStateSignalPtrs [ 24 ] = ( void * ) & rtX . f25t2yldvr ;
rt_LoggedStateSignalPtrs [ 25 ] = ( void * ) & rtX . jf0hg4tz5n ;
rt_LoggedStateSignalPtrs [ 26 ] = ( void * ) & rtX . n3fnmjmy41 ;
rt_LoggedStateSignalPtrs [ 27 ] = ( void * ) & rtX . iorcha3xwp ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "tmp_raccel_xout" ) ; rtliSetLogXFinal (
ssGetRTWLogInfo ( rtS ) , "xFinal" ) ; rtliSetLogVarNameModifier (
ssGetRTWLogInfo ( rtS ) , "none" ) ; rtliSetLogFormat ( ssGetRTWLogInfo ( rtS
) , 2 ) ; rtliSetLogMaxRows ( ssGetRTWLogInfo ( rtS ) , 1000 ) ;
rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS ) , 1 ) ; rtliSetLogY (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogYSignalInfo ( ssGetRTWLogInfo (
rtS ) , ( NULL ) ) ; rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL
) ) ; } { static struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS ,
& statesInfo2 ) ; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 48 ] ;
static real_T absTol [ 48 ] = { 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 , 1.0E-8 ,
1.0E-8 , 1.0E-8 , 1.0E-8 } ; static uint8_T absTolControl [ 48 ] = { 0U , 0U
, 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U ,
0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U
, 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U }
; static real_T contStateJacPerturbBoundMinVec [ 48 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 48 ] ; static uint8_T zcAttributes [ 15 ] =
{ ( ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_DN ) , ( ZC_EVENT_ALL ) , (
ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) , (
ZC_EVENT_ALL_DN ) , ( ZC_EVENT_ALL ) , ( ZC_EVENT_ALL ) , ( ZC_EVENT_ALL ) ,
( ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) , (
ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) } ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 2 ] = { { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
erpxqhxk00 ) , ( NULL ) } , { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
aqs4oxuwyl ) , ( NULL ) } } ; { int i ; for ( i = 0 ; i < 48 ; ++ i ) {
contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [ i
] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 1.0E-5 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 0.4 )
; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 2 ) ; ssSetNonContDerivSigInfos ( rtS ,
nonContDerivSigInfo ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS
, 1 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol ) ; ssSetAbsTolControlVector (
rtS , absTolControl ) ; ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverZcSignalAttrib ( rtS , zcAttributes ) ;
ssSetSolverNumZcSignals ( rtS , 15 ) ; ssSetModelZeroCrossings ( rtS ,
MdlZeroCrossings ) ; ssSetSolverConsecutiveZCsStepRelTol ( rtS ,
2.8421709430404007E-13 ) ; ssSetSolverMaxConsecutiveZCs ( rtS , 1000 ) ;
ssSetSolverConsecutiveZCsError ( rtS , 2 ) ; ssSetSolverMaskedZcDiagnostic (
rtS , 1 ) ; ssSetSolverIgnoredZcDiagnostic ( rtS , 1 ) ;
ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 15 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 2406384959U ) ; ssSetChecksumVal ( rtS , 1 ,
3323145849U ) ; ssSetChecksumVal ( rtS , 2 , 1788149093U ) ; ssSetChecksumVal
( rtS , 3 , 2002023803U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 1 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_TRAS_2dof_model_GetSimStateDisallowedBlocks ) ;
slsaGetWorkFcnForSimTargetOP ( rtS , mr_TRAS_2dof_model_GetDWork ) ;
slsaSetWorkFcnForSimTargetOP ( rtS , mr_TRAS_2dof_model_SetDWork ) ;
rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if ( ssGetErrorStatus ( rtS ) )
{ return rtS ; } executionInfo -> simulationOptions_ . stateSaveName_ =
rtliGetLogX ( ssGetRTWLogInfo ( rtS ) ) ; executionInfo -> simulationOptions_
. finalStateName_ = rtliGetLogXFinal ( ssGetRTWLogInfo ( rtS ) ) ;
executionInfo -> simulationOptions_ . outputSaveName_ = rtliGetLogY (
ssGetRTWLogInfo ( rtS ) ) ; return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
void MdlOutputsParameterSampleTime ( int_T tid ) { MdlOutputsTID2 ( tid ) ; }
