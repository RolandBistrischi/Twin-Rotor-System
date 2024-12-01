#include "TRAS_2dof_model_capi_host.h"
static TRAS_2dof_model_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        TRAS_2dof_model_host_InitializeDataMapInfo(&(root), "TRAS_2dof_model");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
