#ifndef TRAS_2dof_model_h_
#define TRAS_2dof_model_h_
#ifndef TRAS_2dof_model_COMMON_INCLUDES_
#define TRAS_2dof_model_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "TRAS_2dof_model_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#define MODEL_NAME TRAS_2dof_model
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (78) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (48)   
#elif NCSTATES != 48
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T erbrcq20ws ; real_T e2qxpult0l ; real_T fet3qizh0j ;
real_T by5ff02b5y ; real_T kt41jradvt ; real_T aqs4oxuwyl ; real_T cd4wpzwctw
; real_T oxflnbwtba ; real_T jm4vpunmvn ; real_T hkxcz5n3u4 ; real_T
fboo2yk1af ; real_T musqjdo1j0 ; real_T lqggrcs4ug ; real_T mkzdlh0qin ;
real_T demaor1dik ; real_T erpxqhxk00 ; real_T c5kx2oh2se ; real_T offfk3higa
; real_T cmmyyeec03 ; real_T iwxxthzuqe ; real_T dmvry52sf0 ; real_T
ouiqsk0vmf ; real_T puxd3yedqm ; real_T ftgxcyqkjl ; real_T mot5vgcutr ;
real_T ldhi2fpbxl ; real_T krxu1qmwom ; real_T hsrvh1wvsr ; real_T bouweblsab
; real_T irz4j1sojy ; real_T mxr3hlwucz ; real_T gajroozbt2 ; real_T
nnyvg3ewi2 ; real_T fphc0a1yof ; real_T lmvs3x222n ; real_T jvxhhdzj44 ;
real_T lyilqbdoth ; real_T oi4rz33jw2 ; real_T d2iamzdwvx ; real_T mnoyv4c1oi
; real_T o0tumhunrv ; real_T eubeamzge2 ; real_T dzp5kslu0y ; real_T
mznss5gtji ; real_T a2xogmmrwy ; real_T pdb2nsllfb ; real_T jmkmxy13ke ;
real_T hffy2x0mio ; real_T pqw0bmbvyh ; real_T ne0icjjiea ; real_T bwqaarfcvc
; real_T giyyztgrks ; real_T k4zikws1lv ; real_T dyebmkbotq ; real_T
jsze1vkano ; real_T fek5cpgpxc ; real_T jex533xe4y ; real_T mjovcv0cli ;
real_T ezwu5kevjn ; real_T n4oygy2keq ; real_T blj1vvf5bz ; real_T gz52pym3ld
; real_T dn1kv0lvn1 ; real_T gpw5rttvyx ; real_T ctrfw1tj5m ; real_T
ml0fw5n3jm ; real_T dabmhed4kp ; real_T ixdslxr1wi ; real_T nda511k3pz ;
real_T kqlvxbvvpq ; real_T mogw3m3ole ; real_T hjkoaew1qn ; real_T m0yxj5xmvn
; real_T n4gzkqwnjl ; real_T jicgqcymkr ; real_T enxktml03x ; real_T
pju2nswxhr ; real_T ldvf4d0xaa ; } B ; typedef struct { struct { void *
LoggedData [ 3 ] ; } di3vciqhvk ; struct { void * LoggedData [ 3 ] ; }
l5agenf1h4 ; struct { void * LoggedData [ 3 ] ; } jxva0kkoia ; int_T
pn4vsggslw ; int_T mu4n3ns15f ; int_T elxrpmovlm ; int_T invv4ejzdr ; int_T
ohuy4ui33e ; int_T ngukhbswzj ; int_T d4cvoix4ms ; int_T cw1ttcuebj ; int_T
kgwf2z5yp1 ; int_T nq14rtfxrv ; int_T nvpqsiifnq ; } DW ; typedef struct {
real_T aminfxpiey ; real_T lm4tnlgi0b ; real_T hx2uqr2ddc ; real_T h1krndgpjn
; real_T ezzfxe3zjf ; real_T gzsibhoxzs ; real_T ne4t1fjjfm ; real_T
lrtk244ibj ; real_T jssu3to0dh ; real_T mqsw1lgcxp ; real_T kgbuyci2df ;
real_T gqvnvitpjj ; real_T iw3vpw53mc ; real_T hgjn3ummij ; real_T jcsdrzipfa
[ 11 ] ; real_T kerux15bcw ; real_T kc54dxc05x ; real_T nhfkorig1m ; real_T
e32d3r1biu ; real_T pfnfogk5ox [ 11 ] ; real_T a1dj2minkv ; real_T cm0lyo1fqx
; real_T gh0zecqhyv ; real_T ebccughyzq ; real_T f25t2yldvr ; real_T
jf0hg4tz5n ; real_T n3fnmjmy41 ; real_T iorcha3xwp ; } X ; typedef struct {
real_T aminfxpiey ; real_T lm4tnlgi0b ; real_T hx2uqr2ddc ; real_T h1krndgpjn
; real_T ezzfxe3zjf ; real_T gzsibhoxzs ; real_T ne4t1fjjfm ; real_T
lrtk244ibj ; real_T jssu3to0dh ; real_T mqsw1lgcxp ; real_T kgbuyci2df ;
real_T gqvnvitpjj ; real_T iw3vpw53mc ; real_T hgjn3ummij ; real_T jcsdrzipfa
[ 11 ] ; real_T kerux15bcw ; real_T kc54dxc05x ; real_T nhfkorig1m ; real_T
e32d3r1biu ; real_T pfnfogk5ox [ 11 ] ; real_T a1dj2minkv ; real_T cm0lyo1fqx
; real_T gh0zecqhyv ; real_T ebccughyzq ; real_T f25t2yldvr ; real_T
jf0hg4tz5n ; real_T n3fnmjmy41 ; real_T iorcha3xwp ; } XDot ; typedef struct
{ boolean_T aminfxpiey ; boolean_T lm4tnlgi0b ; boolean_T hx2uqr2ddc ;
boolean_T h1krndgpjn ; boolean_T ezzfxe3zjf ; boolean_T gzsibhoxzs ;
boolean_T ne4t1fjjfm ; boolean_T lrtk244ibj ; boolean_T jssu3to0dh ;
boolean_T mqsw1lgcxp ; boolean_T kgbuyci2df ; boolean_T gqvnvitpjj ;
boolean_T iw3vpw53mc ; boolean_T hgjn3ummij ; boolean_T jcsdrzipfa [ 11 ] ;
boolean_T kerux15bcw ; boolean_T kc54dxc05x ; boolean_T nhfkorig1m ;
boolean_T e32d3r1biu ; boolean_T pfnfogk5ox [ 11 ] ; boolean_T a1dj2minkv ;
boolean_T cm0lyo1fqx ; boolean_T gh0zecqhyv ; boolean_T ebccughyzq ;
boolean_T f25t2yldvr ; boolean_T jf0hg4tz5n ; boolean_T n3fnmjmy41 ;
boolean_T iorcha3xwp ; } XDis ; typedef struct { real_T aminfxpiey ; real_T
lm4tnlgi0b ; real_T hx2uqr2ddc ; real_T h1krndgpjn ; real_T ezzfxe3zjf ;
real_T gzsibhoxzs ; real_T ne4t1fjjfm ; real_T lrtk244ibj ; real_T jssu3to0dh
; real_T mqsw1lgcxp ; real_T kgbuyci2df ; real_T gqvnvitpjj ; real_T
iw3vpw53mc ; real_T hgjn3ummij ; real_T jcsdrzipfa [ 11 ] ; real_T kerux15bcw
; real_T kc54dxc05x ; real_T nhfkorig1m ; real_T e32d3r1biu ; real_T
pfnfogk5ox [ 11 ] ; real_T a1dj2minkv ; real_T cm0lyo1fqx ; real_T gh0zecqhyv
; real_T ebccughyzq ; real_T f25t2yldvr ; real_T jf0hg4tz5n ; real_T
n3fnmjmy41 ; real_T iorcha3xwp ; } CStateAbsTol ; typedef struct { real_T
aminfxpiey ; real_T lm4tnlgi0b ; real_T hx2uqr2ddc ; real_T h1krndgpjn ;
real_T ezzfxe3zjf ; real_T gzsibhoxzs ; real_T ne4t1fjjfm ; real_T lrtk244ibj
; real_T jssu3to0dh ; real_T mqsw1lgcxp ; real_T kgbuyci2df ; real_T
gqvnvitpjj ; real_T iw3vpw53mc ; real_T hgjn3ummij ; real_T jcsdrzipfa [ 11 ]
; real_T kerux15bcw ; real_T kc54dxc05x ; real_T nhfkorig1m ; real_T
e32d3r1biu ; real_T pfnfogk5ox [ 11 ] ; real_T a1dj2minkv ; real_T cm0lyo1fqx
; real_T gh0zecqhyv ; real_T ebccughyzq ; real_T f25t2yldvr ; real_T
jf0hg4tz5n ; real_T n3fnmjmy41 ; real_T iorcha3xwp ; } CXPtMin ; typedef
struct { real_T aminfxpiey ; real_T lm4tnlgi0b ; real_T hx2uqr2ddc ; real_T
h1krndgpjn ; real_T ezzfxe3zjf ; real_T gzsibhoxzs ; real_T ne4t1fjjfm ;
real_T lrtk244ibj ; real_T jssu3to0dh ; real_T mqsw1lgcxp ; real_T kgbuyci2df
; real_T gqvnvitpjj ; real_T iw3vpw53mc ; real_T hgjn3ummij ; real_T
jcsdrzipfa [ 11 ] ; real_T kerux15bcw ; real_T kc54dxc05x ; real_T nhfkorig1m
; real_T e32d3r1biu ; real_T pfnfogk5ox [ 11 ] ; real_T a1dj2minkv ; real_T
cm0lyo1fqx ; real_T gh0zecqhyv ; real_T ebccughyzq ; real_T f25t2yldvr ;
real_T jf0hg4tz5n ; real_T n3fnmjmy41 ; real_T iorcha3xwp ; } CXPtMax ;
typedef struct { real_T p1nevxqlvf ; real_T kfaiibec2x ; real_T fwtc0ayerf ;
real_T o3zs1hcdkj ; real_T kpcn0z2aam ; real_T kfami334hq ; real_T ak5fegkz2x
; real_T f41wbkn4ep ; real_T gll1icvfxt ; real_T pfaij3n04q ; real_T
oqt2pen0fw ; real_T kohn351acs ; real_T e3yu1ol30z ; real_T g3dpg104wg ;
real_T cx05kfl0xt ; } ZCV ; typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
DataMapInfo ; struct P_ { real_T control_a [ 81 ] ; real_T control_p [ 81 ] ;
real_T force_a [ 81 ] ; real_T force_p [ 81 ] ; real_T rpm_a [ 81 ] ; real_T
rpm_p [ 81 ] ; real_T PIDH11_D ; real_T PIDH22_D ; real_T PIDH11_I ; real_T
PIDH22_I ; real_T PIDH11_InitialConditionForFilter ; real_T
PIDH22_InitialConditionForFilter ; real_T
PIDH11_InitialConditionForIntegrator ; real_T
PIDH22_InitialConditionForIntegrator ; real_T FractionalPIDcontroller1_Kd ;
real_T FractionalPIDcontroller2_Kd ; real_T FractionalPIDcontroller_Kd ;
real_T FractionalPIDcontroller1_Kd_cktyldyb5v ; real_T
FractionalPIDcontroller2_Kd_adfdsts2cz ; real_T FractionalPIDcontroller1_Ki ;
real_T FractionalPIDcontroller2_Ki ; real_T FractionalPIDcontroller_Ki ;
real_T FractionalPIDcontroller1_Ki_fcgp0ssxe2 ; real_T
FractionalPIDcontroller2_Ki_kjwg1dqtj5 ; real_T PIDH11_N ; real_T PIDH22_N ;
real_T PIDH11_P ; real_T PIDH22_P ; real_T Integrator1_IC ; real_T uJa_Gain ;
real_T iv3_IC ; real_T iv3_UpperSat ; real_T iv3_LowerSat ; real_T
Integrator_IC ; real_T uJp1_Gain ; real_T Step11_Time ; real_T Step11_Y0 ;
real_T Step11_YFinal ; real_T D21_A ; real_T D21_C ; real_T D21_D ; real_T
Step12_Time ; real_T Step12_Y0 ; real_T Step12_YFinal ; real_T
AzimuthH22_Gain ; real_T iv1_IC ; real_T iv1_UpperSat ; real_T iv1_LowerSat ;
real_T D12_A ; real_T D12_C ; real_T D12_D ; real_T PitchH11_Gain ; real_T
R_A1_Gain ; real_T ih_IC ; real_T R_A2_Gain ; real_T R_A_Gain ; real_T
Gain3_Gain ; real_T m3_Gain ; real_T Gain1_Gain ; real_T m2_Gain ; real_T
iv2_IC ; real_T m7_Gain ; real_T m1_Gain ; real_T R_P_Gain ; real_T m6_Gain ;
real_T Internal_A_pr ; real_T Internal_B_pr ; real_T Internal_C_pr ; real_T
Internal_D_pr ; real_T Internal_InitialCondition ; real_T TransferFcn1_A ;
real_T TransferFcn1_C ; real_T Internal_A_pr_oyjjirm1kx [ 66 ] ; real_T
Internal_B_pr_au0fet3yzl [ 11 ] ; real_T Internal_C_pr_enpotgrtpz [ 11 ] ;
real_T Internal_D_pr_cbnbxjghfm ; real_T Internal_InitialCondition_gkuj4oapel
; real_T TransferFcn1_A_jvoyunirms ; real_T TransferFcn1_C_p1qztopeoo ;
real_T Internal_D_pr_ftkigkd45s ; real_T Internal_InitialCondition_gtzyyjaguu
; real_T TransferFcn1_A_jvo420osds ; real_T TransferFcn1_C_pa1znp5ici ;
real_T Internal_B_pr_fwnutaqvgl ; real_T Internal_C_pr_n03rjhdezu ; real_T
Internal_InitialCondition_omefaxkung ; real_T TransferFcn1_A_eawc3pddjy ;
real_T TransferFcn1_C_kwqvw5jbah ; real_T Internal_A_pr_mwq41kchyr [ 66 ] ;
real_T Internal_B_pr_ablmqrrv5r [ 11 ] ; real_T Internal_C_pr_l1ivnrijnm [ 11
] ; real_T Internal_D_pr_aaq4ww0rsb ; real_T
Internal_InitialCondition_n5v5kawmah ; real_T TransferFcn1_A_ae4vnndsdi ;
real_T TransferFcn1_C_dufn3b2avs ; real_T Internal_D_pr_p02i25wy0b ; real_T
Internal_InitialCondition_m0lfmfz0iu ; real_T TransferFcn1_A_kuxz443wdc ;
real_T TransferFcn1_C_myrb2vgz0p ; real_T Internal_D_pr_ilyqvmletq ; real_T
Internal_InitialCondition_c1yrfy3gzu ; real_T TransferFcn1_A_ioqoub3d3t ;
real_T TransferFcn1_C_dcpqblfb10 ; real_T Internal_B_pr_oeuh3vjlwu ; real_T
Internal_C_pr_eie2kt4des ; real_T Internal_InitialCondition_j1fjpgtl3n ;
real_T TransferFcn1_A_jqrwj4rpz1 ; real_T TransferFcn1_C_hgyeuf33te ; real_T
Internal_D_pr_howwo5ykxk ; real_T Internal_InitialCondition_npozeerkwd ;
real_T TransferFcn1_A_gwfeakisgo ; real_T TransferFcn1_C_ha4knw45mi ; real_T
Internal_B_pr_kmyvpbbyrv ; real_T Internal_C_pr_nb42sbyzoo ; real_T
Internal_InitialCondition_ba1cnq4dlp ; real_T TransferFcn1_A_gnicpt3yph ;
real_T TransferFcn1_C_kwn2svax3p ; real_T Step1_Time ; real_T Step1_Y0 ;
real_T Step1_YFinal ; real_T Step3_Time ; real_T Step3_Y0 ; real_T
Step3_YFinal ; real_T Step4_Time ; real_T Step4_Y0 ; real_T Step4_YFinal ;
real_T Step5_Time ; real_T Step5_Y0 ; real_T Step5_YFinal ; real_T Step6_Time
; real_T Step6_Y0 ; real_T Step6_YFinal ; uint32_T Internal_A_ir ; uint32_T
Internal_A_jc [ 2 ] ; uint32_T Internal_B_ir ; uint32_T Internal_B_jc [ 2 ] ;
uint32_T Internal_C_ir ; uint32_T Internal_C_jc [ 2 ] ; uint32_T
Internal_D_ir ; uint32_T Internal_D_jc [ 2 ] ; uint32_T
Internal_A_ir_lt0mujnoco [ 66 ] ; uint32_T Internal_A_jc_mhpguuqiql [ 12 ] ;
uint32_T Internal_B_ir_kknoqxu3xf [ 11 ] ; uint32_T Internal_B_jc_di4ygjrrxp
[ 2 ] ; uint32_T Internal_C_ir_bpvpjyhh50 [ 11 ] ; uint32_T
Internal_C_jc_nfs5nawamg [ 12 ] ; uint32_T Internal_D_ir_nimtudfqvy ;
uint32_T Internal_D_jc_njabwzxsbu [ 2 ] ; uint32_T Internal_D_ir_c1n1ecqg5e ;
uint32_T Internal_D_jc_msslbhppgh [ 2 ] ; uint32_T Internal_B_ir_e5q2ielz0k ;
uint32_T Internal_B_jc_b5uitas21k [ 2 ] ; uint32_T Internal_C_ir_dj54yvrj3y ;
uint32_T Internal_C_jc_atzel0anhk [ 2 ] ; uint32_T Internal_A_ir_k3rmsjspu3 [
66 ] ; uint32_T Internal_A_jc_ico2ix4g3r [ 12 ] ; uint32_T
Internal_B_ir_kgt0n55ea0 [ 11 ] ; uint32_T Internal_B_jc_ncvbnp5zed [ 2 ] ;
uint32_T Internal_C_ir_cjnkvshnhd [ 11 ] ; uint32_T Internal_C_jc_idimqapynj
[ 12 ] ; uint32_T Internal_D_ir_cvjj3ujewj ; uint32_T
Internal_D_jc_gvthc55kni [ 2 ] ; uint32_T Internal_D_ir_prlosd5dyu ; uint32_T
Internal_D_jc_m2cl305t1t [ 2 ] ; uint32_T Internal_D_ir_ohygarzx4s ; uint32_T
Internal_D_jc_b3x1llq0ff [ 2 ] ; uint32_T Internal_B_ir_opjqujg5gf ; uint32_T
Internal_B_jc_o3szusvxkw [ 2 ] ; uint32_T Internal_C_ir_jqy55xbh3j ; uint32_T
Internal_C_jc_gcbznjcfuo [ 2 ] ; uint32_T Internal_D_ir_mvufke4m5s ; uint32_T
Internal_D_jc_kderkjhrwv [ 2 ] ; uint32_T Internal_B_ir_oegikg3rp3 ; uint32_T
Internal_B_jc_cjygwe2rdv [ 2 ] ; uint32_T Internal_C_ir_lma0c15mon ; uint32_T
Internal_C_jc_aa5fiqedwy [ 2 ] ; } ; extern const char_T *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_TRAS_2dof_model_GetDWork ( ) ; extern void
mr_TRAS_2dof_model_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_TRAS_2dof_model_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * TRAS_2dof_model_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs (
int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void
MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
