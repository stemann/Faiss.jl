module Wrapper

using Faiss_CUDA_jll
export Faiss_CUDA_jll

using CEnum

mutable struct FaissIndex_H end

const FaissIndex = FaissIndex_H

mutable struct FaissSearchParameters_H end

const FaissSearchParameters = FaissSearchParameters_H

const faiss_idx_t = Int64

const idx_t = faiss_idx_t

const faiss_component_t = Cfloat

const faiss_distance_t = Cfloat

function faiss_get_num_gpus(p_output)
    ccall((:faiss_get_num_gpus, libfaiss_c), Cint, (Ptr{Cint},), p_output)
end

# no prototype is found for this function at DeviceUtils_c.h:26:5, please use with caution
function faiss_gpu_profiler_start()
    ccall((:faiss_gpu_profiler_start, libfaiss_c), Cint, ())
end

# no prototype is found for this function at DeviceUtils_c.h:29:5, please use with caution
function faiss_gpu_profiler_stop()
    ccall((:faiss_gpu_profiler_stop, libfaiss_c), Cint, ())
end

# no prototype is found for this function at DeviceUtils_c.h:33:5, please use with caution
function faiss_gpu_sync_all_devices()
    ccall((:faiss_gpu_sync_all_devices, libfaiss_c), Cint, ())
end

mutable struct FaissRangeSearchResult_H end

const FaissRangeSearchResult = FaissRangeSearchResult_H

mutable struct FaissIDSelector_H end

const FaissIDSelector = FaissIDSelector_H

@cenum FaissMetricType::UInt32 begin
    METRIC_INNER_PRODUCT = 0
    METRIC_L2 = 1
    METRIC_L1 = 2
    METRIC_Linf = 3
    METRIC_Lp = 4
    METRIC_Canberra = 20
    METRIC_BrayCurtis = 21
    METRIC_JensenShannon = 22
end

function faiss_SearchParameters_free(obj)
    ccall((:faiss_SearchParameters_free, libfaiss_c), Cvoid, (Ptr{FaissSearchParameters},), obj)
end

function faiss_SearchParameters_new(p_sp, sel)
    ccall((:faiss_SearchParameters_new, libfaiss_c), Cint, (Ptr{Ptr{FaissSearchParameters}}, Ptr{FaissIDSelector}), p_sp, sel)
end

function faiss_Index_free(obj)
    ccall((:faiss_Index_free, libfaiss_c), Cvoid, (Ptr{FaissIndex},), obj)
end

function faiss_Index_d(arg1)
    ccall((:faiss_Index_d, libfaiss_c), Cint, (Ptr{FaissIndex},), arg1)
end

function faiss_Index_is_trained(arg1)
    ccall((:faiss_Index_is_trained, libfaiss_c), Cint, (Ptr{FaissIndex},), arg1)
end

function faiss_Index_ntotal(arg1)
    ccall((:faiss_Index_ntotal, libfaiss_c), idx_t, (Ptr{FaissIndex},), arg1)
end

function faiss_Index_metric_type(arg1)
    ccall((:faiss_Index_metric_type, libfaiss_c), FaissMetricType, (Ptr{FaissIndex},), arg1)
end

function faiss_Index_verbose(arg1)
    ccall((:faiss_Index_verbose, libfaiss_c), Cint, (Ptr{FaissIndex},), arg1)
end

function faiss_Index_set_verbose(arg1, arg2)
    ccall((:faiss_Index_set_verbose, libfaiss_c), Cvoid, (Ptr{FaissIndex}, Cint), arg1, arg2)
end

function faiss_Index_train(index, n, x)
    ccall((:faiss_Index_train, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}), index, n, x)
end

function faiss_Index_add(index, n, x)
    ccall((:faiss_Index_add, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}), index, n, x)
end

function faiss_Index_add_with_ids(index, n, x, xids)
    ccall((:faiss_Index_add_with_ids, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, xids)
end

function faiss_Index_search(index, n, x, k, distances, labels)
    ccall((:faiss_Index_search, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, idx_t, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, k, distances, labels)
end

function faiss_Index_search_with_params(index, n, x, k, params, distances, labels)
    ccall((:faiss_Index_search_with_params, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, idx_t, Ptr{FaissSearchParameters}, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, k, params, distances, labels)
end

function faiss_Index_range_search(index, n, x, radius, result)
    ccall((:faiss_Index_range_search, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, Cfloat, Ptr{FaissRangeSearchResult}), index, n, x, radius, result)
end

function faiss_Index_assign(index, n, x, labels, k)
    ccall((:faiss_Index_assign, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, Ptr{idx_t}, idx_t), index, n, x, labels, k)
end

function faiss_Index_reset(index)
    ccall((:faiss_Index_reset, libfaiss_c), Cint, (Ptr{FaissIndex},), index)
end

function faiss_Index_remove_ids(index, sel, n_removed)
    ccall((:faiss_Index_remove_ids, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{FaissIDSelector}, Ptr{Csize_t}), index, sel, n_removed)
end

function faiss_Index_reconstruct(index, key, recons)
    ccall((:faiss_Index_reconstruct, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}), index, key, recons)
end

function faiss_Index_reconstruct_n(index, i0, ni, recons)
    ccall((:faiss_Index_reconstruct_n, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, idx_t, Ptr{Cfloat}), index, i0, ni, recons)
end

function faiss_Index_compute_residual(index, x, residual, key)
    ccall((:faiss_Index_compute_residual, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Cfloat}, Ptr{Cfloat}, idx_t), index, x, residual, key)
end

function faiss_Index_compute_residual_n(index, n, x, residuals, keys)
    ccall((:faiss_Index_compute_residual_n, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, residuals, keys)
end

function faiss_Index_sa_code_size(index, size)
    ccall((:faiss_Index_sa_code_size, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Csize_t}), index, size)
end

function faiss_Index_sa_encode(index, n, x, bytes)
    ccall((:faiss_Index_sa_encode, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, Ptr{UInt8}), index, n, x, bytes)
end

function faiss_Index_sa_decode(index, n, bytes, x)
    ccall((:faiss_Index_sa_decode, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{UInt8}, Ptr{Cfloat}), index, n, bytes, x)
end

function faiss_index_gpu_to_cpu(gpu_index, p_out)
    ccall((:faiss_index_gpu_to_cpu, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Ptr{FaissIndex}}), gpu_index, p_out)
end

mutable struct FaissGpuResourcesProvider_H end

const FaissGpuResourcesProvider = FaissGpuResourcesProvider_H

const FaissGpuIndex = FaissIndex_H

function faiss_index_cpu_to_gpu(provider, device, index, p_out)
    ccall((:faiss_index_cpu_to_gpu, libfaiss_c), Cint, (Ptr{FaissGpuResourcesProvider}, Cint, Ptr{FaissIndex}, Ptr{Ptr{FaissGpuIndex}}), provider, device, index, p_out)
end

mutable struct FaissGpuClonerOptions_H end

const FaissGpuClonerOptions = FaissGpuClonerOptions_H

function faiss_index_cpu_to_gpu_with_options(provider, device, index, options, p_out)
    ccall((:faiss_index_cpu_to_gpu_with_options, libfaiss_c), Cint, (Ptr{FaissGpuResourcesProvider}, Cint, Ptr{FaissIndex}, Ptr{FaissGpuClonerOptions}, Ptr{Ptr{FaissGpuIndex}}), provider, device, index, options, p_out)
end

function faiss_index_cpu_to_gpu_multiple(providers_vec, devices, devices_size, index, p_out)
    ccall((:faiss_index_cpu_to_gpu_multiple, libfaiss_c), Cint, (Ptr{Ptr{FaissGpuResourcesProvider}}, Ptr{Cint}, Csize_t, Ptr{FaissIndex}, Ptr{Ptr{FaissGpuIndex}}), providers_vec, devices, devices_size, index, p_out)
end

const FaissGpuMultipleClonerOptions = FaissGpuClonerOptions_H

function faiss_index_cpu_to_gpu_multiple_with_options(providers_vec, providers_vec_size, devices, devices_size, index, options, p_out)
    ccall((:faiss_index_cpu_to_gpu_multiple_with_options, libfaiss_c), Cint, (Ptr{Ptr{FaissGpuResourcesProvider}}, Csize_t, Ptr{Cint}, Csize_t, Ptr{FaissIndex}, Ptr{FaissGpuMultipleClonerOptions}, Ptr{Ptr{FaissGpuIndex}}), providers_vec, providers_vec_size, devices, devices_size, index, options, p_out)
end

mutable struct FaissParameterSpace_H end

const FaissGpuParameterSpace = FaissParameterSpace_H

function faiss_GpuClonerOptions_free(obj)
    ccall((:faiss_GpuClonerOptions_free, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions},), obj)
end

function faiss_GpuClonerOptions_new(arg1)
    ccall((:faiss_GpuClonerOptions_new, libfaiss_c), Cint, (Ptr{Ptr{FaissGpuClonerOptions}},), arg1)
end

@cenum FaissIndicesOptions::UInt32 begin
    INDICES_CPU = 0
    INDICES_IVF = 1
    INDICES_32_BIT = 2
    INDICES_64_BIT = 3
end

function faiss_GpuClonerOptions_indicesOptions(arg1)
    ccall((:faiss_GpuClonerOptions_indicesOptions, libfaiss_c), FaissIndicesOptions, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_indicesOptions(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_indicesOptions, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, FaissIndicesOptions), arg1, arg2)
end

function faiss_GpuClonerOptions_useFloat16CoarseQuantizer(arg1)
    ccall((:faiss_GpuClonerOptions_useFloat16CoarseQuantizer, libfaiss_c), Cint, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_useFloat16CoarseQuantizer(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_useFloat16CoarseQuantizer, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuClonerOptions_useFloat16(arg1)
    ccall((:faiss_GpuClonerOptions_useFloat16, libfaiss_c), Cint, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_useFloat16(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_useFloat16, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuClonerOptions_usePrecomputed(arg1)
    ccall((:faiss_GpuClonerOptions_usePrecomputed, libfaiss_c), Cint, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_usePrecomputed(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_usePrecomputed, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuClonerOptions_reserveVecs(arg1)
    ccall((:faiss_GpuClonerOptions_reserveVecs, libfaiss_c), Clong, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_reserveVecs(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_reserveVecs, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Clong), arg1, arg2)
end

function faiss_GpuClonerOptions_storeTransposed(arg1)
    ccall((:faiss_GpuClonerOptions_storeTransposed, libfaiss_c), Cint, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_storeTransposed(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_storeTransposed, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuClonerOptions_verbose(arg1)
    ccall((:faiss_GpuClonerOptions_verbose, libfaiss_c), Cint, (Ptr{FaissGpuClonerOptions},), arg1)
end

function faiss_GpuClonerOptions_set_verbose(arg1, arg2)
    ccall((:faiss_GpuClonerOptions_set_verbose, libfaiss_c), Cvoid, (Ptr{FaissGpuClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuMultipleClonerOptions_free(obj)
    ccall((:faiss_GpuMultipleClonerOptions_free, libfaiss_c), Cvoid, (Ptr{FaissGpuMultipleClonerOptions},), obj)
end

function faiss_GpuMultipleClonerOptions_new(arg1)
    ccall((:faiss_GpuMultipleClonerOptions_new, libfaiss_c), Cint, (Ptr{Ptr{FaissGpuMultipleClonerOptions}},), arg1)
end

function faiss_GpuMultipleClonerOptions_shard(arg1)
    ccall((:faiss_GpuMultipleClonerOptions_shard, libfaiss_c), Cint, (Ptr{FaissGpuMultipleClonerOptions},), arg1)
end

function faiss_GpuMultipleClonerOptions_set_shard(arg1, arg2)
    ccall((:faiss_GpuMultipleClonerOptions_set_shard, libfaiss_c), Cvoid, (Ptr{FaissGpuMultipleClonerOptions}, Cint), arg1, arg2)
end

function faiss_GpuMultipleClonerOptions_shard_type(arg1)
    ccall((:faiss_GpuMultipleClonerOptions_shard_type, libfaiss_c), Cint, (Ptr{FaissGpuMultipleClonerOptions},), arg1)
end

function faiss_GpuMultipleClonerOptions_set_shard_type(arg1, arg2)
    ccall((:faiss_GpuMultipleClonerOptions_set_shard_type, libfaiss_c), Cvoid, (Ptr{FaissGpuMultipleClonerOptions}, Cint), arg1, arg2)
end

mutable struct FaissGpuIndexConfig_H end

const FaissGpuIndexConfig = FaissGpuIndexConfig_H

function faiss_GpuIndexConfig_device(arg1)
    ccall((:faiss_GpuIndexConfig_device, libfaiss_c), Cint, (Ptr{FaissGpuIndexConfig},), arg1)
end

mutable struct FaissGpuResources_H end

const FaissGpuResources = FaissGpuResources_H

function faiss_GpuResources_free(obj)
    ccall((:faiss_GpuResources_free, libfaiss_c), Cvoid, (Ptr{FaissGpuResources},), obj)
end

function faiss_GpuResources_initializeForDevice(arg1, arg2)
    ccall((:faiss_GpuResources_initializeForDevice, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Cint), arg1, arg2)
end

function faiss_GpuResources_getBlasHandle(arg1, arg2, arg3)
    ccall((:faiss_GpuResources_getBlasHandle, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Cint, Ptr{Cint}), arg1, arg2, arg3)
end

function faiss_GpuResources_getDefaultStream(arg1, arg2, arg3)
    ccall((:faiss_GpuResources_getDefaultStream, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Cint, Ptr{Cint}), arg1, arg2, arg3)
end

function faiss_GpuResources_getPinnedMemory(arg1, arg2, arg3)
    ccall((:faiss_GpuResources_getPinnedMemory, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Ptr{Ptr{Cvoid}}, Ptr{Cint}), arg1, arg2, arg3)
end

function faiss_GpuResources_getAsyncCopyStream(arg1, arg2, arg3)
    ccall((:faiss_GpuResources_getAsyncCopyStream, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Cint, Ptr{Cint}), arg1, arg2, arg3)
end

function faiss_GpuResources_getBlasHandleCurrentDevice(arg1, arg2)
    ccall((:faiss_GpuResources_getBlasHandleCurrentDevice, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Ptr{Cint}), arg1, arg2)
end

function faiss_GpuResources_getDefaultStreamCurrentDevice(arg1, arg2)
    ccall((:faiss_GpuResources_getDefaultStreamCurrentDevice, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Ptr{Cint}), arg1, arg2)
end

function faiss_GpuResources_syncDefaultStream(arg1, arg2)
    ccall((:faiss_GpuResources_syncDefaultStream, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Cint), arg1, arg2)
end

function faiss_GpuResources_syncDefaultStreamCurrentDevice(arg1)
    ccall((:faiss_GpuResources_syncDefaultStreamCurrentDevice, libfaiss_c), Cint, (Ptr{FaissGpuResources},), arg1)
end

function faiss_GpuResources_getAsyncCopyStreamCurrentDevice(arg1, arg2)
    ccall((:faiss_GpuResources_getAsyncCopyStreamCurrentDevice, libfaiss_c), Cint, (Ptr{FaissGpuResources}, Ptr{Cint}), arg1, arg2)
end

function faiss_GpuResourcesProvider_free(obj)
    ccall((:faiss_GpuResourcesProvider_free, libfaiss_c), Cvoid, (Ptr{FaissGpuResourcesProvider},), obj)
end

function faiss_GpuResourcesProvider_getResources(arg1, arg2)
    ccall((:faiss_GpuResourcesProvider_getResources, libfaiss_c), Cint, (Ptr{FaissGpuResourcesProvider}, Ptr{Ptr{FaissGpuResources}}), arg1, arg2)
end

const FaissStandardGpuResources = FaissGpuResourcesProvider_H

function faiss_StandardGpuResources_free(obj)
    ccall((:faiss_StandardGpuResources_free, libfaiss_c), Cvoid, (Ptr{FaissStandardGpuResources},), obj)
end

function faiss_StandardGpuResources_new(arg1)
    ccall((:faiss_StandardGpuResources_new, libfaiss_c), Cint, (Ptr{Ptr{FaissStandardGpuResources}},), arg1)
end

function faiss_StandardGpuResources_noTempMemory(arg1)
    ccall((:faiss_StandardGpuResources_noTempMemory, libfaiss_c), Cint, (Ptr{FaissStandardGpuResources},), arg1)
end

function faiss_StandardGpuResources_setTempMemory(arg1, size)
    ccall((:faiss_StandardGpuResources_setTempMemory, libfaiss_c), Cint, (Ptr{FaissStandardGpuResources}, Cint), arg1, size)
end

function faiss_StandardGpuResources_setPinnedMemory(arg1, size)
    ccall((:faiss_StandardGpuResources_setPinnedMemory, libfaiss_c), Cint, (Ptr{FaissStandardGpuResources}, Cint), arg1, size)
end

function faiss_StandardGpuResources_setDefaultStream(arg1, device, stream)
    ccall((:faiss_StandardGpuResources_setDefaultStream, libfaiss_c), Cint, (Ptr{FaissStandardGpuResources}, Cint, Cint), arg1, device, stream)
end

function faiss_StandardGpuResources_setDefaultNullStreamAllDevices(arg1)
    ccall((:faiss_StandardGpuResources_setDefaultNullStreamAllDevices, libfaiss_c), Cint, (Ptr{FaissStandardGpuResources},), arg1)
end

# Skipping MacroDefinition: CATCH_AND_HANDLE catch ( faiss : : FaissException & e ) { std : : cerr << e . what ( ) << '\n' ; faiss_last_exception = std : : make_exception_ptr ( e ) ; return - 2 ; } catch ( std : : exception & e ) { std : : cerr << e . what ( ) << '\n' ; faiss_last_exception = std : : make_exception_ptr ( e ) ; return - 4 ; } catch ( ... ) { std : : cerr << "Unrecognized exception!\n" ; faiss_last_exception = std : : make_exception_ptr ( std : : runtime_error ( "Unknown error" ) ) ; return - 1 ; } return 0 ;

# exports
const PREFIXES = ["faiss"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
