module Wrapper

using Faiss_jll
export Faiss_jll

using CEnum

mutable struct FaissParameterRange_H end

const FaissParameterRange = FaissParameterRange_H

function faiss_ParameterRange_name(arg1)
    ccall((:faiss_ParameterRange_name, libfaiss_c), Ptr{Cchar}, (Ptr{FaissParameterRange},), arg1)
end

function faiss_ParameterRange_values(arg1, arg2, arg3)
    ccall((:faiss_ParameterRange_values, libfaiss_c), Cvoid, (Ptr{FaissParameterRange}, Ptr{Ptr{Cdouble}}, Ptr{Csize_t}), arg1, arg2, arg3)
end

mutable struct FaissParameterSpace_H end

const FaissParameterSpace = FaissParameterSpace_H

function faiss_ParameterSpace_free(obj)
    ccall((:faiss_ParameterSpace_free, libfaiss_c), Cvoid, (Ptr{FaissParameterSpace},), obj)
end

function faiss_ParameterSpace_new(space)
    ccall((:faiss_ParameterSpace_new, libfaiss_c), Cint, (Ptr{Ptr{FaissParameterSpace}},), space)
end

function faiss_ParameterSpace_n_combinations(arg1)
    ccall((:faiss_ParameterSpace_n_combinations, libfaiss_c), Csize_t, (Ptr{FaissParameterSpace},), arg1)
end

function faiss_ParameterSpace_combination_name(arg1, arg2, arg3, arg4)
    ccall((:faiss_ParameterSpace_combination_name, libfaiss_c), Cint, (Ptr{FaissParameterSpace}, Csize_t, Ptr{Cchar}, Csize_t), arg1, arg2, arg3, arg4)
end

mutable struct FaissIndex_H end

const FaissIndex = FaissIndex_H

function faiss_ParameterSpace_set_index_parameters(arg1, arg2, arg3)
    ccall((:faiss_ParameterSpace_set_index_parameters, libfaiss_c), Cint, (Ptr{FaissParameterSpace}, Ptr{FaissIndex}, Ptr{Cchar}), arg1, arg2, arg3)
end

function faiss_ParameterSpace_set_index_parameters_cno(arg1, arg2, arg3)
    ccall((:faiss_ParameterSpace_set_index_parameters_cno, libfaiss_c), Cint, (Ptr{FaissParameterSpace}, Ptr{FaissIndex}, Csize_t), arg1, arg2, arg3)
end

function faiss_ParameterSpace_set_index_parameter(arg1, arg2, arg3, arg4)
    ccall((:faiss_ParameterSpace_set_index_parameter, libfaiss_c), Cint, (Ptr{FaissParameterSpace}, Ptr{FaissIndex}, Ptr{Cchar}, Cdouble), arg1, arg2, arg3, arg4)
end

function faiss_ParameterSpace_display(arg1)
    ccall((:faiss_ParameterSpace_display, libfaiss_c), Cvoid, (Ptr{FaissParameterSpace},), arg1)
end

function faiss_ParameterSpace_add_range(arg1, arg2, arg3)
    ccall((:faiss_ParameterSpace_add_range, libfaiss_c), Cint, (Ptr{FaissParameterSpace}, Ptr{Cchar}, Ptr{Ptr{FaissParameterRange}}), arg1, arg2, arg3)
end

struct FaissClusteringParameters
    niter::Cint
    nredo::Cint
    verbose::Cint
    spherical::Cint
    int_centroids::Cint
    update_index::Cint
    frozen_centroids::Cint
    min_points_per_centroid::Cint
    max_points_per_centroid::Cint
    seed::Cint
    decode_block_size::Csize_t
end

function faiss_ClusteringParameters_init(params)
    ccall((:faiss_ClusteringParameters_init, libfaiss_c), Cvoid, (Ptr{FaissClusteringParameters},), params)
end

mutable struct FaissClustering_H end

const FaissClustering = FaissClustering_H

function faiss_Clustering_niter(arg1)
    ccall((:faiss_Clustering_niter, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_nredo(arg1)
    ccall((:faiss_Clustering_nredo, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_verbose(arg1)
    ccall((:faiss_Clustering_verbose, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_spherical(arg1)
    ccall((:faiss_Clustering_spherical, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_int_centroids(arg1)
    ccall((:faiss_Clustering_int_centroids, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_update_index(arg1)
    ccall((:faiss_Clustering_update_index, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_frozen_centroids(arg1)
    ccall((:faiss_Clustering_frozen_centroids, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_min_points_per_centroid(arg1)
    ccall((:faiss_Clustering_min_points_per_centroid, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_max_points_per_centroid(arg1)
    ccall((:faiss_Clustering_max_points_per_centroid, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_seed(arg1)
    ccall((:faiss_Clustering_seed, libfaiss_c), Cint, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_decode_block_size(arg1)
    ccall((:faiss_Clustering_decode_block_size, libfaiss_c), Csize_t, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_d(arg1)
    ccall((:faiss_Clustering_d, libfaiss_c), Csize_t, (Ptr{FaissClustering},), arg1)
end

function faiss_Clustering_k(arg1)
    ccall((:faiss_Clustering_k, libfaiss_c), Csize_t, (Ptr{FaissClustering},), arg1)
end

mutable struct FaissClusteringIterationStats_H end

const FaissClusteringIterationStats = FaissClusteringIterationStats_H

function faiss_ClusteringIterationStats_obj(arg1)
    ccall((:faiss_ClusteringIterationStats_obj, libfaiss_c), Cfloat, (Ptr{FaissClusteringIterationStats},), arg1)
end

function faiss_ClusteringIterationStats_time(arg1)
    ccall((:faiss_ClusteringIterationStats_time, libfaiss_c), Cdouble, (Ptr{FaissClusteringIterationStats},), arg1)
end

function faiss_ClusteringIterationStats_time_search(arg1)
    ccall((:faiss_ClusteringIterationStats_time_search, libfaiss_c), Cdouble, (Ptr{FaissClusteringIterationStats},), arg1)
end

function faiss_ClusteringIterationStats_imbalance_factor(arg1)
    ccall((:faiss_ClusteringIterationStats_imbalance_factor, libfaiss_c), Cdouble, (Ptr{FaissClusteringIterationStats},), arg1)
end

function faiss_ClusteringIterationStats_nsplit(arg1)
    ccall((:faiss_ClusteringIterationStats_nsplit, libfaiss_c), Cint, (Ptr{FaissClusteringIterationStats},), arg1)
end

function faiss_Clustering_centroids(clustering, centroids, size)
    ccall((:faiss_Clustering_centroids, libfaiss_c), Cvoid, (Ptr{FaissClustering}, Ptr{Ptr{Cfloat}}, Ptr{Csize_t}), clustering, centroids, size)
end

function faiss_Clustering_iteration_stats(clustering, iteration_stats, size)
    ccall((:faiss_Clustering_iteration_stats, libfaiss_c), Cvoid, (Ptr{FaissClustering}, Ptr{Ptr{FaissClusteringIterationStats}}, Ptr{Csize_t}), clustering, iteration_stats, size)
end

function faiss_Clustering_new(p_clustering, d, k)
    ccall((:faiss_Clustering_new, libfaiss_c), Cint, (Ptr{Ptr{FaissClustering}}, Cint, Cint), p_clustering, d, k)
end

function faiss_Clustering_new_with_params(p_clustering, d, k, cp)
    ccall((:faiss_Clustering_new_with_params, libfaiss_c), Cint, (Ptr{Ptr{FaissClustering}}, Cint, Cint, Ptr{FaissClusteringParameters}), p_clustering, d, k, cp)
end

const faiss_idx_t = Int64

const idx_t = faiss_idx_t

function faiss_Clustering_train(clustering, n, x, index)
    ccall((:faiss_Clustering_train, libfaiss_c), Cint, (Ptr{FaissClustering}, idx_t, Ptr{Cfloat}, Ptr{FaissIndex}), clustering, n, x, index)
end

function faiss_Clustering_free(clustering)
    ccall((:faiss_Clustering_free, libfaiss_c), Cvoid, (Ptr{FaissClustering},), clustering)
end

function faiss_kmeans_clustering(d, n, k, x, centroids, q_error)
    ccall((:faiss_kmeans_clustering, libfaiss_c), Cint, (Csize_t, Csize_t, Csize_t, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}), d, n, k, x, centroids, q_error)
end

mutable struct FaissRangeSearchResult_H end

const FaissRangeSearchResult = FaissRangeSearchResult_H

mutable struct FaissIDSelector_H end

const FaissIDSelector = FaissIDSelector_H

mutable struct FaissIndexBinary_H end

const FaissIndexBinary = FaissIndexBinary_H

function faiss_IndexBinary_free(obj)
    ccall((:faiss_IndexBinary_free, libfaiss_c), Cvoid, (Ptr{FaissIndexBinary},), obj)
end

function faiss_IndexBinary_d(arg1)
    ccall((:faiss_IndexBinary_d, libfaiss_c), Cint, (Ptr{FaissIndexBinary},), arg1)
end

function faiss_IndexBinary_is_trained(arg1)
    ccall((:faiss_IndexBinary_is_trained, libfaiss_c), Cint, (Ptr{FaissIndexBinary},), arg1)
end

function faiss_IndexBinary_ntotal(arg1)
    ccall((:faiss_IndexBinary_ntotal, libfaiss_c), idx_t, (Ptr{FaissIndexBinary},), arg1)
end

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

function faiss_IndexBinary_metric_type(arg1)
    ccall((:faiss_IndexBinary_metric_type, libfaiss_c), FaissMetricType, (Ptr{FaissIndexBinary},), arg1)
end

function faiss_IndexBinary_verbose(arg1)
    ccall((:faiss_IndexBinary_verbose, libfaiss_c), Cint, (Ptr{FaissIndexBinary},), arg1)
end

function faiss_IndexBinary_set_verbose(arg1, arg2)
    ccall((:faiss_IndexBinary_set_verbose, libfaiss_c), Cvoid, (Ptr{FaissIndexBinary}, Cint), arg1, arg2)
end

function faiss_IndexBinary_train(index, n, x)
    ccall((:faiss_IndexBinary_train, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}), index, n, x)
end

function faiss_IndexBinary_add(index, n, x)
    ccall((:faiss_IndexBinary_add, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}), index, n, x)
end

function faiss_IndexBinary_add_with_ids(index, n, x, xids)
    ccall((:faiss_IndexBinary_add_with_ids, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}, Ptr{idx_t}), index, n, x, xids)
end

function faiss_IndexBinary_search(index, n, x, k, distances, labels)
    ccall((:faiss_IndexBinary_search, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}, idx_t, Ptr{Int32}, Ptr{idx_t}), index, n, x, k, distances, labels)
end

function faiss_IndexBinary_range_search(index, n, x, radius, result)
    ccall((:faiss_IndexBinary_range_search, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}, Cint, Ptr{FaissRangeSearchResult}), index, n, x, radius, result)
end

function faiss_IndexBinary_assign(index, n, x, labels, k)
    ccall((:faiss_IndexBinary_assign, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}, Ptr{idx_t}, idx_t), index, n, x, labels, k)
end

function faiss_IndexBinary_reset(index)
    ccall((:faiss_IndexBinary_reset, libfaiss_c), Cint, (Ptr{FaissIndexBinary},), index)
end

function faiss_IndexBinary_remove_ids(index, sel, n_removed)
    ccall((:faiss_IndexBinary_remove_ids, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, Ptr{FaissIDSelector}, Ptr{Csize_t}), index, sel, n_removed)
end

function faiss_IndexBinary_reconstruct(index, key, recons)
    ccall((:faiss_IndexBinary_reconstruct, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, Ptr{UInt8}), index, key, recons)
end

function faiss_IndexBinary_reconstruct_n(index, i0, ni, recons)
    ccall((:faiss_IndexBinary_reconstruct_n, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, idx_t, idx_t, Ptr{UInt8}), index, i0, ni, recons)
end

const FaissIndexFlat = FaissIndex_H

function faiss_IndexFlat_new(p_index)
    ccall((:faiss_IndexFlat_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlat}},), p_index)
end

function faiss_IndexFlat_new_with(p_index, d, metric)
    ccall((:faiss_IndexFlat_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlat}}, idx_t, FaissMetricType), p_index, d, metric)
end

function faiss_IndexFlat_xb(index, p_xb, p_size)
    ccall((:faiss_IndexFlat_xb, libfaiss_c), Cvoid, (Ptr{FaissIndexFlat}, Ptr{Ptr{Cfloat}}, Ptr{Csize_t}), index, p_xb, p_size)
end

function faiss_IndexFlat_cast(arg1)
    ccall((:faiss_IndexFlat_cast, libfaiss_c), Ptr{FaissIndexFlat}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexFlat_free(obj)
    ccall((:faiss_IndexFlat_free, libfaiss_c), Cvoid, (Ptr{FaissIndexFlat},), obj)
end

function faiss_IndexFlat_compute_distance_subset(index, n, x, k, distances, labels)
    ccall((:faiss_IndexFlat_compute_distance_subset, libfaiss_c), Cint, (Ptr{FaissIndex}, idx_t, Ptr{Cfloat}, idx_t, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, k, distances, labels)
end

const FaissIndexFlatIP = FaissIndex_H

function faiss_IndexFlatIP_cast(arg1)
    ccall((:faiss_IndexFlatIP_cast, libfaiss_c), Ptr{FaissIndexFlatIP}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexFlatIP_free(obj)
    ccall((:faiss_IndexFlatIP_free, libfaiss_c), Cvoid, (Ptr{FaissIndexFlatIP},), obj)
end

function faiss_IndexFlatIP_new(p_index)
    ccall((:faiss_IndexFlatIP_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlatIP}},), p_index)
end

function faiss_IndexFlatIP_new_with(p_index, d)
    ccall((:faiss_IndexFlatIP_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlatIP}}, idx_t), p_index, d)
end

const FaissIndexFlatL2 = FaissIndex_H

function faiss_IndexFlatL2_cast(arg1)
    ccall((:faiss_IndexFlatL2_cast, libfaiss_c), Ptr{FaissIndexFlatL2}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexFlatL2_free(obj)
    ccall((:faiss_IndexFlatL2_free, libfaiss_c), Cvoid, (Ptr{FaissIndexFlatL2},), obj)
end

function faiss_IndexFlatL2_new(p_index)
    ccall((:faiss_IndexFlatL2_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlatL2}},), p_index)
end

function faiss_IndexFlatL2_new_with(p_index, d)
    ccall((:faiss_IndexFlatL2_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlatL2}}, idx_t), p_index, d)
end

const FaissIndexRefineFlat = FaissIndex_H

function faiss_IndexRefineFlat_new(p_index, base_index)
    ccall((:faiss_IndexRefineFlat_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexRefineFlat}}, Ptr{FaissIndex}), p_index, base_index)
end

function faiss_IndexRefineFlat_free(obj)
    ccall((:faiss_IndexRefineFlat_free, libfaiss_c), Cvoid, (Ptr{FaissIndexRefineFlat},), obj)
end

function faiss_IndexRefineFlat_cast(arg1)
    ccall((:faiss_IndexRefineFlat_cast, libfaiss_c), Ptr{FaissIndexRefineFlat}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexRefineFlat_own_fields(arg1)
    ccall((:faiss_IndexRefineFlat_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexRefineFlat},), arg1)
end

function faiss_IndexRefineFlat_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexRefineFlat_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexRefineFlat}, Cint), arg1, arg2)
end

function faiss_IndexRefineFlat_k_factor(arg1)
    ccall((:faiss_IndexRefineFlat_k_factor, libfaiss_c), Cfloat, (Ptr{FaissIndexRefineFlat},), arg1)
end

function faiss_IndexRefineFlat_set_k_factor(arg1, arg2)
    ccall((:faiss_IndexRefineFlat_set_k_factor, libfaiss_c), Cvoid, (Ptr{FaissIndexRefineFlat}, Cfloat), arg1, arg2)
end

const FaissIndexFlat1D = FaissIndex_H

function faiss_IndexFlat1D_cast(arg1)
    ccall((:faiss_IndexFlat1D_cast, libfaiss_c), Ptr{FaissIndexFlat1D}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexFlat1D_free(obj)
    ccall((:faiss_IndexFlat1D_free, libfaiss_c), Cvoid, (Ptr{FaissIndexFlat1D},), obj)
end

function faiss_IndexFlat1D_new(p_index)
    ccall((:faiss_IndexFlat1D_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlat1D}},), p_index)
end

function faiss_IndexFlat1D_new_with(p_index, continuous_update)
    ccall((:faiss_IndexFlat1D_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexFlat1D}}, Cint), p_index, continuous_update)
end

function faiss_IndexFlat1D_update_permutation(index)
    ccall((:faiss_IndexFlat1D_update_permutation, libfaiss_c), Cint, (Ptr{FaissIndexFlat1D},), index)
end

const FaissIndexIVFFlat = FaissIndex_H

function faiss_IndexIVFFlat_free(obj)
    ccall((:faiss_IndexIVFFlat_free, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFFlat},), obj)
end

function faiss_IndexIVFFlat_cast(arg1)
    ccall((:faiss_IndexIVFFlat_cast, libfaiss_c), Ptr{FaissIndexIVFFlat}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexIVFFlat_nlist(arg1)
    ccall((:faiss_IndexIVFFlat_nlist, libfaiss_c), Csize_t, (Ptr{FaissIndexIVFFlat},), arg1)
end

function faiss_IndexIVFFlat_nprobe(arg1)
    ccall((:faiss_IndexIVFFlat_nprobe, libfaiss_c), Csize_t, (Ptr{FaissIndexIVFFlat},), arg1)
end

function faiss_IndexIVFFlat_set_nprobe(arg1, arg2)
    ccall((:faiss_IndexIVFFlat_set_nprobe, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFFlat}, Csize_t), arg1, arg2)
end

function faiss_IndexIVFFlat_quantizer(arg1)
    ccall((:faiss_IndexIVFFlat_quantizer, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexIVFFlat},), arg1)
end

function faiss_IndexIVFFlat_quantizer_trains_alone(arg1)
    ccall((:faiss_IndexIVFFlat_quantizer_trains_alone, libfaiss_c), Cchar, (Ptr{FaissIndexIVFFlat},), arg1)
end

function faiss_IndexIVFFlat_own_fields(arg1)
    ccall((:faiss_IndexIVFFlat_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexIVFFlat},), arg1)
end

function faiss_IndexIVFFlat_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexIVFFlat_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFFlat}, Cint), arg1, arg2)
end

function faiss_IndexIVFFlat_new(p_index)
    ccall((:faiss_IndexIVFFlat_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFFlat}},), p_index)
end

function faiss_IndexIVFFlat_new_with(p_index, quantizer, d, nlist)
    ccall((:faiss_IndexIVFFlat_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFFlat}}, Ptr{FaissIndex}, Csize_t, Csize_t), p_index, quantizer, d, nlist)
end

function faiss_IndexIVFFlat_new_with_metric(p_index, quantizer, d, nlist, metric)
    ccall((:faiss_IndexIVFFlat_new_with_metric, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFFlat}}, Ptr{FaissIndex}, Csize_t, Csize_t, FaissMetricType), p_index, quantizer, d, nlist, metric)
end

function faiss_IndexIVFFlat_add_core(index, n, x, xids, precomputed_idx)
    ccall((:faiss_IndexIVFFlat_add_core, libfaiss_c), Cint, (Ptr{FaissIndexIVFFlat}, idx_t, Ptr{Cfloat}, Ptr{idx_t}, Ptr{Int64}), index, n, x, xids, precomputed_idx)
end

function faiss_IndexIVFFlat_update_vectors(index, nv, idx, v)
    ccall((:faiss_IndexIVFFlat_update_vectors, libfaiss_c), Cint, (Ptr{FaissIndexIVFFlat}, Cint, Ptr{idx_t}, Ptr{Cfloat}), index, nv, idx, v)
end

function faiss_RangeSearchResult_nq(arg1)
    ccall((:faiss_RangeSearchResult_nq, libfaiss_c), Csize_t, (Ptr{FaissRangeSearchResult},), arg1)
end

function faiss_RangeSearchResult_new(p_rsr, nq)
    ccall((:faiss_RangeSearchResult_new, libfaiss_c), Cint, (Ptr{Ptr{FaissRangeSearchResult}}, idx_t), p_rsr, nq)
end

function faiss_RangeSearchResult_new_with(p_rsr, nq, alloc_lims)
    ccall((:faiss_RangeSearchResult_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissRangeSearchResult}}, idx_t, Cint), p_rsr, nq, alloc_lims)
end

function faiss_RangeSearchResult_do_allocation(rsr)
    ccall((:faiss_RangeSearchResult_do_allocation, libfaiss_c), Cint, (Ptr{FaissRangeSearchResult},), rsr)
end

function faiss_RangeSearchResult_free(obj)
    ccall((:faiss_RangeSearchResult_free, libfaiss_c), Cvoid, (Ptr{FaissRangeSearchResult},), obj)
end

function faiss_RangeSearchResult_buffer_size(arg1)
    ccall((:faiss_RangeSearchResult_buffer_size, libfaiss_c), Csize_t, (Ptr{FaissRangeSearchResult},), arg1)
end

function faiss_RangeSearchResult_lims(rsr, lims)
    ccall((:faiss_RangeSearchResult_lims, libfaiss_c), Cvoid, (Ptr{FaissRangeSearchResult}, Ptr{Ptr{Csize_t}}), rsr, lims)
end

function faiss_RangeSearchResult_labels(rsr, labels, distances)
    ccall((:faiss_RangeSearchResult_labels, libfaiss_c), Cvoid, (Ptr{FaissRangeSearchResult}, Ptr{Ptr{idx_t}}, Ptr{Ptr{Cfloat}}), rsr, labels, distances)
end

function faiss_IDSelector_free(obj)
    ccall((:faiss_IDSelector_free, libfaiss_c), Cvoid, (Ptr{FaissIDSelector},), obj)
end

function faiss_IDSelector_is_member(sel, id)
    ccall((:faiss_IDSelector_is_member, libfaiss_c), Cint, (Ptr{FaissIDSelector}, idx_t), sel, id)
end

mutable struct FaissIDSelectorRange_H end

const FaissIDSelectorRange = FaissIDSelectorRange_H

function faiss_IDSelectorRange_free(obj)
    ccall((:faiss_IDSelectorRange_free, libfaiss_c), Cvoid, (Ptr{FaissIDSelectorRange},), obj)
end

function faiss_IDSelectorRange_imin(arg1)
    ccall((:faiss_IDSelectorRange_imin, libfaiss_c), idx_t, (Ptr{FaissIDSelectorRange},), arg1)
end

function faiss_IDSelectorRange_imax(arg1)
    ccall((:faiss_IDSelectorRange_imax, libfaiss_c), idx_t, (Ptr{FaissIDSelectorRange},), arg1)
end

function faiss_IDSelectorRange_new(p_sel, imin, imax)
    ccall((:faiss_IDSelectorRange_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorRange}}, idx_t, idx_t), p_sel, imin, imax)
end

mutable struct FaissIDSelectorBatch_H end

const FaissIDSelectorBatch = FaissIDSelectorBatch_H

function faiss_IDSelectorBatch_nbits(arg1)
    ccall((:faiss_IDSelectorBatch_nbits, libfaiss_c), Cint, (Ptr{FaissIDSelectorBatch},), arg1)
end

function faiss_IDSelectorBatch_mask(arg1)
    ccall((:faiss_IDSelectorBatch_mask, libfaiss_c), idx_t, (Ptr{FaissIDSelectorBatch},), arg1)
end

function faiss_IDSelectorBatch_new(p_sel, n, indices)
    ccall((:faiss_IDSelectorBatch_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorBatch}}, Csize_t, Ptr{idx_t}), p_sel, n, indices)
end

mutable struct FaissIDSelectorNot_H end

const FaissIDSelectorNot = FaissIDSelectorNot_H

function faiss_IDSelectorNot_new(p_sel, sel)
    ccall((:faiss_IDSelectorNot_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorNot}}, Ptr{FaissIDSelector}), p_sel, sel)
end

mutable struct FaissIDSelectorAnd_H end

const FaissIDSelectorAnd = FaissIDSelectorAnd_H

function faiss_IDSelectorAnd_new(p_sel, lhs_sel, rhs_sel)
    ccall((:faiss_IDSelectorAnd_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorAnd}}, Ptr{FaissIDSelector}, Ptr{FaissIDSelector}), p_sel, lhs_sel, rhs_sel)
end

mutable struct FaissIDSelectorOr_H end

const FaissIDSelectorOr = FaissIDSelectorOr_H

function faiss_IDSelectorOr_new(p_sel, lhs_sel, rhs_sel)
    ccall((:faiss_IDSelectorOr_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorOr}}, Ptr{FaissIDSelector}, Ptr{FaissIDSelector}), p_sel, lhs_sel, rhs_sel)
end

mutable struct FaissIDSelectorXOr_H end

const FaissIDSelectorXOr = FaissIDSelectorXOr_H

function faiss_IDSelectorXOr_new(p_sel, lhs_sel, rhs_sel)
    ccall((:faiss_IDSelectorXOr_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIDSelectorXOr}}, Ptr{FaissIDSelector}, Ptr{FaissIDSelector}), p_sel, lhs_sel, rhs_sel)
end

mutable struct FaissBufferList_H end

const FaissBufferList = FaissBufferList_H

function faiss_BufferList_free(obj)
    ccall((:faiss_BufferList_free, libfaiss_c), Cvoid, (Ptr{FaissBufferList},), obj)
end

function faiss_BufferList_buffer_size(arg1)
    ccall((:faiss_BufferList_buffer_size, libfaiss_c), Csize_t, (Ptr{FaissBufferList},), arg1)
end

function faiss_BufferList_wp(arg1)
    ccall((:faiss_BufferList_wp, libfaiss_c), Csize_t, (Ptr{FaissBufferList},), arg1)
end

struct FaissBuffer
    ids::Ptr{idx_t}
    dis::Ptr{Cfloat}
end

function faiss_BufferList_append_buffer(bl)
    ccall((:faiss_BufferList_append_buffer, libfaiss_c), Cint, (Ptr{FaissBufferList},), bl)
end

function faiss_BufferList_new(p_bl, buffer_size)
    ccall((:faiss_BufferList_new, libfaiss_c), Cint, (Ptr{Ptr{FaissBufferList}}, Csize_t), p_bl, buffer_size)
end

function faiss_BufferList_add(bl, id, dis)
    ccall((:faiss_BufferList_add, libfaiss_c), Cint, (Ptr{FaissBufferList}, idx_t, Cfloat), bl, id, dis)
end

function faiss_BufferList_copy_range(bl, ofs, n, dest_ids, dest_dis)
    ccall((:faiss_BufferList_copy_range, libfaiss_c), Cint, (Ptr{FaissBufferList}, Csize_t, Csize_t, Ptr{idx_t}, Ptr{Cfloat}), bl, ofs, n, dest_ids, dest_dis)
end

mutable struct FaissRangeSearchPartialResult_H end

const FaissRangeSearchPartialResult = FaissRangeSearchPartialResult_H

mutable struct FaissRangeQueryResult_H end

const FaissRangeQueryResult = FaissRangeQueryResult_H

function faiss_RangeQueryResult_qno(arg1)
    ccall((:faiss_RangeQueryResult_qno, libfaiss_c), idx_t, (Ptr{FaissRangeQueryResult},), arg1)
end

function faiss_RangeQueryResult_nres(arg1)
    ccall((:faiss_RangeQueryResult_nres, libfaiss_c), Csize_t, (Ptr{FaissRangeQueryResult},), arg1)
end

function faiss_RangeQueryResult_pres(arg1)
    ccall((:faiss_RangeQueryResult_pres, libfaiss_c), Ptr{FaissRangeSearchPartialResult}, (Ptr{FaissRangeQueryResult},), arg1)
end

function faiss_RangeQueryResult_add(qr, dis, id)
    ccall((:faiss_RangeQueryResult_add, libfaiss_c), Cint, (Ptr{FaissRangeQueryResult}, Cfloat, idx_t), qr, dis, id)
end

function faiss_RangeSearchPartialResult_res(arg1)
    ccall((:faiss_RangeSearchPartialResult_res, libfaiss_c), Ptr{FaissRangeSearchResult}, (Ptr{FaissRangeSearchPartialResult},), arg1)
end

function faiss_RangeSearchPartialResult_new(p_res, res_in)
    ccall((:faiss_RangeSearchPartialResult_new, libfaiss_c), Cint, (Ptr{Ptr{FaissRangeSearchPartialResult}}, Ptr{FaissRangeSearchResult}), p_res, res_in)
end

function faiss_RangeSearchPartialResult_finalize(res)
    ccall((:faiss_RangeSearchPartialResult_finalize, libfaiss_c), Cint, (Ptr{FaissRangeSearchPartialResult},), res)
end

function faiss_RangeSearchPartialResult_set_lims(res)
    ccall((:faiss_RangeSearchPartialResult_set_lims, libfaiss_c), Cint, (Ptr{FaissRangeSearchPartialResult},), res)
end

function faiss_RangeSearchPartialResult_new_result(res, qno, qr)
    ccall((:faiss_RangeSearchPartialResult_new_result, libfaiss_c), Cint, (Ptr{FaissRangeSearchPartialResult}, idx_t, Ptr{Ptr{FaissRangeQueryResult}}), res, qno, qr)
end

mutable struct FaissDistanceComputer_H end

const FaissDistanceComputer = FaissDistanceComputer_H

function faiss_DistanceComputer_set_query(dc, x)
    ccall((:faiss_DistanceComputer_set_query, libfaiss_c), Cint, (Ptr{FaissDistanceComputer}, Ptr{Cfloat}), dc, x)
end

function faiss_DistanceComputer_vector_to_query_dis(dc, i, qd)
    ccall((:faiss_DistanceComputer_vector_to_query_dis, libfaiss_c), Cint, (Ptr{FaissDistanceComputer}, idx_t, Ptr{Cfloat}), dc, i, qd)
end

function faiss_DistanceComputer_symmetric_dis(dc, i, j, vd)
    ccall((:faiss_DistanceComputer_symmetric_dis, libfaiss_c), Cint, (Ptr{FaissDistanceComputer}, idx_t, idx_t, Ptr{Cfloat}), dc, i, j, vd)
end

function faiss_DistanceComputer_free(obj)
    ccall((:faiss_DistanceComputer_free, libfaiss_c), Cvoid, (Ptr{FaissDistanceComputer},), obj)
end

mutable struct FaissSearchParameters_H end

const FaissSearchParametersIVF = FaissSearchParameters_H

function faiss_SearchParametersIVF_free(obj)
    ccall((:faiss_SearchParametersIVF_free, libfaiss_c), Cvoid, (Ptr{FaissSearchParametersIVF},), obj)
end

const FaissSearchParameters = FaissSearchParameters_H

function faiss_SearchParametersIVF_cast(arg1)
    ccall((:faiss_SearchParametersIVF_cast, libfaiss_c), Ptr{FaissSearchParametersIVF}, (Ptr{FaissSearchParameters},), arg1)
end

function faiss_SearchParametersIVF_new(p_sp)
    ccall((:faiss_SearchParametersIVF_new, libfaiss_c), Cint, (Ptr{Ptr{FaissSearchParametersIVF}},), p_sp)
end

function faiss_SearchParametersIVF_new_with(p_sp, sel, nprobe, max_codes)
    ccall((:faiss_SearchParametersIVF_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissSearchParametersIVF}}, Ptr{FaissIDSelector}, Csize_t, Csize_t), p_sp, sel, nprobe, max_codes)
end

function faiss_SearchParametersIVF_sel(arg1)
    ccall((:faiss_SearchParametersIVF_sel, libfaiss_c), Ptr{FaissIDSelector}, (Ptr{FaissSearchParametersIVF},), arg1)
end

function faiss_SearchParametersIVF_nprobe(arg1)
    ccall((:faiss_SearchParametersIVF_nprobe, libfaiss_c), Csize_t, (Ptr{FaissSearchParametersIVF},), arg1)
end

function faiss_SearchParametersIVF_set_nprobe(arg1, arg2)
    ccall((:faiss_SearchParametersIVF_set_nprobe, libfaiss_c), Cvoid, (Ptr{FaissSearchParametersIVF}, Csize_t), arg1, arg2)
end

function faiss_SearchParametersIVF_max_codes(arg1)
    ccall((:faiss_SearchParametersIVF_max_codes, libfaiss_c), Csize_t, (Ptr{FaissSearchParametersIVF},), arg1)
end

function faiss_SearchParametersIVF_set_max_codes(arg1, arg2)
    ccall((:faiss_SearchParametersIVF_set_max_codes, libfaiss_c), Cvoid, (Ptr{FaissSearchParametersIVF}, Csize_t), arg1, arg2)
end

const FaissIndexIVF = FaissIndex_H

function faiss_IndexIVF_free(obj)
    ccall((:faiss_IndexIVF_free, libfaiss_c), Cvoid, (Ptr{FaissIndexIVF},), obj)
end

function faiss_IndexIVF_cast(arg1)
    ccall((:faiss_IndexIVF_cast, libfaiss_c), Ptr{FaissIndexIVF}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexIVF_nlist(arg1)
    ccall((:faiss_IndexIVF_nlist, libfaiss_c), Csize_t, (Ptr{FaissIndexIVF},), arg1)
end

function faiss_IndexIVF_nprobe(arg1)
    ccall((:faiss_IndexIVF_nprobe, libfaiss_c), Csize_t, (Ptr{FaissIndexIVF},), arg1)
end

function faiss_IndexIVF_set_nprobe(arg1, arg2)
    ccall((:faiss_IndexIVF_set_nprobe, libfaiss_c), Cvoid, (Ptr{FaissIndexIVF}, Csize_t), arg1, arg2)
end

function faiss_IndexIVF_quantizer(arg1)
    ccall((:faiss_IndexIVF_quantizer, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexIVF},), arg1)
end

function faiss_IndexIVF_quantizer_trains_alone(arg1)
    ccall((:faiss_IndexIVF_quantizer_trains_alone, libfaiss_c), Cchar, (Ptr{FaissIndexIVF},), arg1)
end

function faiss_IndexIVF_own_fields(arg1)
    ccall((:faiss_IndexIVF_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexIVF},), arg1)
end

function faiss_IndexIVF_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexIVF_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexIVF}, Cint), arg1, arg2)
end

function faiss_IndexIVF_merge_from(index, other, add_id)
    ccall((:faiss_IndexIVF_merge_from, libfaiss_c), Cint, (Ptr{FaissIndexIVF}, Ptr{FaissIndexIVF}, idx_t), index, other, add_id)
end

function faiss_IndexIVF_copy_subset_to(index, other, subset_type, a1, a2)
    ccall((:faiss_IndexIVF_copy_subset_to, libfaiss_c), Cint, (Ptr{FaissIndexIVF}, Ptr{FaissIndexIVF}, Cint, idx_t, idx_t), index, other, subset_type, a1, a2)
end

function faiss_IndexIVF_search_preassigned(index, n, x, k, assign, centroid_dis, distances, labels, store_pairs)
    ccall((:faiss_IndexIVF_search_preassigned, libfaiss_c), Cint, (Ptr{FaissIndexIVF}, idx_t, Ptr{Cfloat}, idx_t, Ptr{idx_t}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{idx_t}, Cint), index, n, x, k, assign, centroid_dis, distances, labels, store_pairs)
end

function faiss_IndexIVF_get_list_size(index, list_no)
    ccall((:faiss_IndexIVF_get_list_size, libfaiss_c), Csize_t, (Ptr{FaissIndexIVF}, Csize_t), index, list_no)
end

function faiss_IndexIVF_make_direct_map(index, new_maintain_direct_map)
    ccall((:faiss_IndexIVF_make_direct_map, libfaiss_c), Cint, (Ptr{FaissIndexIVF}, Cint), index, new_maintain_direct_map)
end

function faiss_IndexIVF_imbalance_factor(index)
    ccall((:faiss_IndexIVF_imbalance_factor, libfaiss_c), Cdouble, (Ptr{FaissIndexIVF},), index)
end

function faiss_IndexIVF_print_stats(index)
    ccall((:faiss_IndexIVF_print_stats, libfaiss_c), Cvoid, (Ptr{FaissIndexIVF},), index)
end

function faiss_IndexIVF_invlists_get_ids(index, list_no, invlist)
    ccall((:faiss_IndexIVF_invlists_get_ids, libfaiss_c), Cvoid, (Ptr{FaissIndexIVF}, Csize_t, Ptr{idx_t}), index, list_no, invlist)
end

function faiss_IndexIVF_train_encoder(index, n, x, assign)
    ccall((:faiss_IndexIVF_train_encoder, libfaiss_c), Cint, (Ptr{FaissIndexIVF}, idx_t, Ptr{Cfloat}, Ptr{idx_t}), index, n, x, assign)
end

struct FaissIndexIVFStats
    nq::Csize_t
    nlist::Csize_t
    ndis::Csize_t
    nheap_updates::Csize_t
    quantization_time::Cdouble
    search_time::Cdouble
end

function faiss_IndexIVFStats_reset(stats)
    ccall((:faiss_IndexIVFStats_reset, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFStats},), stats)
end

function faiss_IndexIVFStats_init(stats)
    ccall((:faiss_IndexIVFStats_init, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFStats},), stats)
end

# no prototype is found for this function at IndexIVF_c.h:179:21, please use with caution
function faiss_get_indexIVF_stats()
    ccall((:faiss_get_indexIVF_stats, libfaiss_c), Ptr{FaissIndexIVFStats}, ())
end

const FaissIndexLSH = FaissIndex_H

function faiss_IndexLSH_free(obj)
    ccall((:faiss_IndexLSH_free, libfaiss_c), Cvoid, (Ptr{FaissIndexLSH},), obj)
end

function faiss_IndexLSH_cast(arg1)
    ccall((:faiss_IndexLSH_cast, libfaiss_c), Ptr{FaissIndexLSH}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexLSH_nbits(arg1)
    ccall((:faiss_IndexLSH_nbits, libfaiss_c), Cint, (Ptr{FaissIndexLSH},), arg1)
end

function faiss_IndexLSH_code_size(arg1)
    ccall((:faiss_IndexLSH_code_size, libfaiss_c), Cint, (Ptr{FaissIndexLSH},), arg1)
end

function faiss_IndexLSH_rotate_data(arg1)
    ccall((:faiss_IndexLSH_rotate_data, libfaiss_c), Cint, (Ptr{FaissIndexLSH},), arg1)
end

function faiss_IndexLSH_train_thresholds(arg1)
    ccall((:faiss_IndexLSH_train_thresholds, libfaiss_c), Cint, (Ptr{FaissIndexLSH},), arg1)
end

function faiss_IndexLSH_new(p_index, d, nbits)
    ccall((:faiss_IndexLSH_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexLSH}}, idx_t, Cint), p_index, d, nbits)
end

function faiss_IndexLSH_new_with_options(p_index, d, nbits, rotate_data, train_thresholds)
    ccall((:faiss_IndexLSH_new_with_options, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexLSH}}, idx_t, Cint, Cint, Cint), p_index, d, nbits, rotate_data, train_thresholds)
end

const FaissIndexPreTransform = FaissIndex_H

function faiss_IndexPreTransform_free(obj)
    ccall((:faiss_IndexPreTransform_free, libfaiss_c), Cvoid, (Ptr{FaissIndexPreTransform},), obj)
end

function faiss_IndexPreTransform_cast(arg1)
    ccall((:faiss_IndexPreTransform_cast, libfaiss_c), Ptr{FaissIndexPreTransform}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexPreTransform_index(arg1)
    ccall((:faiss_IndexPreTransform_index, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexPreTransform},), arg1)
end

function faiss_IndexPreTransform_own_fields(arg1)
    ccall((:faiss_IndexPreTransform_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexPreTransform},), arg1)
end

function faiss_IndexPreTransform_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexPreTransform_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexPreTransform}, Cint), arg1, arg2)
end

function faiss_IndexPreTransform_new(p_index)
    ccall((:faiss_IndexPreTransform_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexPreTransform}},), p_index)
end

function faiss_IndexPreTransform_new_with(p_index, index)
    ccall((:faiss_IndexPreTransform_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexPreTransform}}, Ptr{FaissIndex}), p_index, index)
end

mutable struct FaissVectorTransform_H end

const FaissVectorTransform = FaissVectorTransform_H

function faiss_IndexPreTransform_new_with_transform(p_index, ltrans, index)
    ccall((:faiss_IndexPreTransform_new_with_transform, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexPreTransform}}, Ptr{FaissVectorTransform}, Ptr{FaissIndex}), p_index, ltrans, index)
end

function faiss_IndexPreTransform_prepend_transform(index, ltrans)
    ccall((:faiss_IndexPreTransform_prepend_transform, libfaiss_c), Cint, (Ptr{FaissIndexPreTransform}, Ptr{FaissVectorTransform}), index, ltrans)
end

const FaissIndexReplicas = FaissIndex_H

function faiss_IndexReplicas_free(obj)
    ccall((:faiss_IndexReplicas_free, libfaiss_c), Cvoid, (Ptr{FaissIndexReplicas},), obj)
end

function faiss_IndexReplicas_own_fields(arg1)
    ccall((:faiss_IndexReplicas_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexReplicas},), arg1)
end

function faiss_IndexReplicas_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexReplicas_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexReplicas}, Cint), arg1, arg2)
end

function faiss_IndexReplicas_new(p_index, d)
    ccall((:faiss_IndexReplicas_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexReplicas}}, idx_t), p_index, d)
end

function faiss_IndexReplicas_new_with_options(p_index, d, threaded)
    ccall((:faiss_IndexReplicas_new_with_options, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexReplicas}}, idx_t, Cint), p_index, d, threaded)
end

function faiss_IndexReplicas_add_replica(index, replica)
    ccall((:faiss_IndexReplicas_add_replica, libfaiss_c), Cint, (Ptr{FaissIndexReplicas}, Ptr{FaissIndex}), index, replica)
end

function faiss_IndexReplicas_remove_replica(index, replica)
    ccall((:faiss_IndexReplicas_remove_replica, libfaiss_c), Cint, (Ptr{FaissIndexReplicas}, Ptr{FaissIndex}), index, replica)
end

function faiss_IndexReplicas_at(index, i)
    ccall((:faiss_IndexReplicas_at, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexReplicas}, Cint), index, i)
end

@cenum FaissQuantizerType::UInt32 begin
    QT_8bit = 0
    QT_4bit = 1
    QT_8bit_uniform = 2
    QT_4bit_uniform = 3
    QT_fp16 = 4
    QT_8bit_direct = 5
    QT_6bit = 6
    QT_bf16 = 7
    QT_8bit_direct_signed = 8
end

const FaissIndexScalarQuantizer = FaissIndex_H

function faiss_IndexScalarQuantizer_new(p_index)
    ccall((:faiss_IndexScalarQuantizer_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexScalarQuantizer}},), p_index)
end

function faiss_IndexScalarQuantizer_new_with(p_index, d, qt, metric)
    ccall((:faiss_IndexScalarQuantizer_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexScalarQuantizer}}, idx_t, FaissQuantizerType, FaissMetricType), p_index, d, qt, metric)
end

function faiss_IndexScalarQuantizer_cast(arg1)
    ccall((:faiss_IndexScalarQuantizer_cast, libfaiss_c), Ptr{FaissIndexScalarQuantizer}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexScalarQuantizer_free(obj)
    ccall((:faiss_IndexScalarQuantizer_free, libfaiss_c), Cvoid, (Ptr{FaissIndexScalarQuantizer},), obj)
end

const FaissIndexIVFScalarQuantizer = FaissIndex_H

function faiss_IndexIVFScalarQuantizer_cast(arg1)
    ccall((:faiss_IndexIVFScalarQuantizer_cast, libfaiss_c), Ptr{FaissIndexIVFScalarQuantizer}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexIVFScalarQuantizer_free(obj)
    ccall((:faiss_IndexIVFScalarQuantizer_free, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFScalarQuantizer},), obj)
end

function faiss_IndexIVFScalarQuantizer_new(p_index)
    ccall((:faiss_IndexIVFScalarQuantizer_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFScalarQuantizer}},), p_index)
end

function faiss_IndexIVFScalarQuantizer_new_with(p_index, quantizer, d, nlist, qt)
    ccall((:faiss_IndexIVFScalarQuantizer_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFScalarQuantizer}}, Ptr{FaissIndex}, idx_t, Csize_t, FaissQuantizerType), p_index, quantizer, d, nlist, qt)
end

function faiss_IndexIVFScalarQuantizer_new_with_metric(p_index, quantizer, d, nlist, qt, metric, encode_residual)
    ccall((:faiss_IndexIVFScalarQuantizer_new_with_metric, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIVFScalarQuantizer}}, Ptr{FaissIndex}, Csize_t, Csize_t, FaissQuantizerType, FaissMetricType, Cint), p_index, quantizer, d, nlist, qt, metric, encode_residual)
end

function faiss_IndexIVFScalarQuantizer_nlist(arg1)
    ccall((:faiss_IndexIVFScalarQuantizer_nlist, libfaiss_c), Csize_t, (Ptr{FaissIndexIVFScalarQuantizer},), arg1)
end

function faiss_IndexIVFScalarQuantizer_nprobe(arg1)
    ccall((:faiss_IndexIVFScalarQuantizer_nprobe, libfaiss_c), Csize_t, (Ptr{FaissIndexIVFScalarQuantizer},), arg1)
end

function faiss_IndexIVFScalarQuantizer_set_nprobe(arg1, arg2)
    ccall((:faiss_IndexIVFScalarQuantizer_set_nprobe, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFScalarQuantizer}, Csize_t), arg1, arg2)
end

function faiss_IndexIVFScalarQuantizer_quantizer(arg1)
    ccall((:faiss_IndexIVFScalarQuantizer_quantizer, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexIVFScalarQuantizer},), arg1)
end

function faiss_IndexIVFScalarQuantizer_own_fields(arg1)
    ccall((:faiss_IndexIVFScalarQuantizer_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexIVFScalarQuantizer},), arg1)
end

function faiss_IndexIVFScalarQuantizer_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexIVFScalarQuantizer_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexIVFScalarQuantizer}, Cint), arg1, arg2)
end

function faiss_IndexIVFScalarQuantizer_add_core(index, n, x, xids, precomputed_idx)
    ccall((:faiss_IndexIVFScalarQuantizer_add_core, libfaiss_c), Cint, (Ptr{FaissIndexIVFScalarQuantizer}, idx_t, Ptr{Cfloat}, Ptr{idx_t}, Ptr{idx_t}), index, n, x, xids, precomputed_idx)
end

const FaissIndexShards = FaissIndex_H

function faiss_IndexShards_free(obj)
    ccall((:faiss_IndexShards_free, libfaiss_c), Cvoid, (Ptr{FaissIndexShards},), obj)
end

function faiss_IndexShards_own_fields(arg1)
    ccall((:faiss_IndexShards_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexShards},), arg1)
end

function faiss_IndexShards_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexShards_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexShards}, Cint), arg1, arg2)
end

function faiss_IndexShards_successive_ids(arg1)
    ccall((:faiss_IndexShards_successive_ids, libfaiss_c), Cint, (Ptr{FaissIndexShards},), arg1)
end

function faiss_IndexShards_set_successive_ids(arg1, arg2)
    ccall((:faiss_IndexShards_set_successive_ids, libfaiss_c), Cvoid, (Ptr{FaissIndexShards}, Cint), arg1, arg2)
end

function faiss_IndexShards_new(p_index, d)
    ccall((:faiss_IndexShards_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexShards}}, idx_t), p_index, d)
end

function faiss_IndexShards_new_with_options(p_index, d, threaded, successive_ids)
    ccall((:faiss_IndexShards_new_with_options, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexShards}}, idx_t, Cint, Cint), p_index, d, threaded, successive_ids)
end

function faiss_IndexShards_add_shard(index, shard)
    ccall((:faiss_IndexShards_add_shard, libfaiss_c), Cint, (Ptr{FaissIndexShards}, Ptr{FaissIndex}), index, shard)
end

function faiss_IndexShards_remove_shard(index, shard)
    ccall((:faiss_IndexShards_remove_shard, libfaiss_c), Cint, (Ptr{FaissIndexShards}, Ptr{FaissIndex}), index, shard)
end

function faiss_IndexShards_at(index, i)
    ccall((:faiss_IndexShards_at, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexShards}, Cint), index, i)
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

const FaissIndexIDMap = FaissIndex_H

function faiss_IndexIDMap_own_fields(arg1)
    ccall((:faiss_IndexIDMap_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexIDMap},), arg1)
end

function faiss_IndexIDMap_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexIDMap_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexIDMap}, Cint), arg1, arg2)
end

function faiss_IndexIDMap_new(p_index, index)
    ccall((:faiss_IndexIDMap_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIDMap}}, Ptr{FaissIndex}), p_index, index)
end

function faiss_IndexIDMap_cast(arg1)
    ccall((:faiss_IndexIDMap_cast, libfaiss_c), Ptr{FaissIndexIDMap}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexIDMap_id_map(index, p_id_map, p_size)
    ccall((:faiss_IndexIDMap_id_map, libfaiss_c), Cvoid, (Ptr{FaissIndexIDMap}, Ptr{Ptr{idx_t}}, Ptr{Csize_t}), index, p_id_map, p_size)
end

function faiss_IndexIDMap_sub_index(index)
    ccall((:faiss_IndexIDMap_sub_index, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexIDMap},), index)
end

const FaissIndexIDMap2 = FaissIndex_H

function faiss_IndexIDMap2_own_fields(arg1)
    ccall((:faiss_IndexIDMap2_own_fields, libfaiss_c), Cint, (Ptr{FaissIndexIDMap2},), arg1)
end

function faiss_IndexIDMap2_set_own_fields(arg1, arg2)
    ccall((:faiss_IndexIDMap2_set_own_fields, libfaiss_c), Cvoid, (Ptr{FaissIndexIDMap2}, Cint), arg1, arg2)
end

function faiss_IndexIDMap2_new(p_index, index)
    ccall((:faiss_IndexIDMap2_new, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexIDMap2}}, Ptr{FaissIndex}), p_index, index)
end

function faiss_IndexIDMap2_construct_rev_map(index)
    ccall((:faiss_IndexIDMap2_construct_rev_map, libfaiss_c), Cint, (Ptr{FaissIndexIDMap2},), index)
end

function faiss_IndexIDMap2_cast(arg1)
    ccall((:faiss_IndexIDMap2_cast, libfaiss_c), Ptr{FaissIndexIDMap2}, (Ptr{FaissIndex},), arg1)
end

function faiss_IndexIDMap2_id_map(index, p_id_map, p_size)
    ccall((:faiss_IndexIDMap2_id_map, libfaiss_c), Cvoid, (Ptr{FaissIndexIDMap2}, Ptr{Ptr{idx_t}}, Ptr{Csize_t}), index, p_id_map, p_size)
end

function faiss_IndexIDMap2_sub_index(index)
    ccall((:faiss_IndexIDMap2_sub_index, libfaiss_c), Ptr{FaissIndex}, (Ptr{FaissIndexIDMap2},), index)
end

function faiss_VectorTransform_free(obj)
    ccall((:faiss_VectorTransform_free, libfaiss_c), Cvoid, (Ptr{FaissVectorTransform},), obj)
end

function faiss_VectorTransform_is_trained(arg1)
    ccall((:faiss_VectorTransform_is_trained, libfaiss_c), Cint, (Ptr{FaissVectorTransform},), arg1)
end

function faiss_VectorTransform_d_in(arg1)
    ccall((:faiss_VectorTransform_d_in, libfaiss_c), Cint, (Ptr{FaissVectorTransform},), arg1)
end

function faiss_VectorTransform_d_out(arg1)
    ccall((:faiss_VectorTransform_d_out, libfaiss_c), Cint, (Ptr{FaissVectorTransform},), arg1)
end

function faiss_VectorTransform_train(vt, n, x)
    ccall((:faiss_VectorTransform_train, libfaiss_c), Cint, (Ptr{FaissVectorTransform}, idx_t, Ptr{Cfloat}), vt, n, x)
end

function faiss_VectorTransform_apply(vt, n, x)
    ccall((:faiss_VectorTransform_apply, libfaiss_c), Ptr{Cfloat}, (Ptr{FaissVectorTransform}, idx_t, Ptr{Cfloat}), vt, n, x)
end

function faiss_VectorTransform_apply_noalloc(vt, n, x, xt)
    ccall((:faiss_VectorTransform_apply_noalloc, libfaiss_c), Cvoid, (Ptr{FaissVectorTransform}, idx_t, Ptr{Cfloat}, Ptr{Cfloat}), vt, n, x, xt)
end

function faiss_VectorTransform_reverse_transform(vt, n, xt, x)
    ccall((:faiss_VectorTransform_reverse_transform, libfaiss_c), Cvoid, (Ptr{FaissVectorTransform}, idx_t, Ptr{Cfloat}, Ptr{Cfloat}), vt, n, xt, x)
end

const FaissLinearTransform = FaissVectorTransform_H

function faiss_LinearTransform_free(obj)
    ccall((:faiss_LinearTransform_free, libfaiss_c), Cvoid, (Ptr{FaissLinearTransform},), obj)
end

function faiss_LinearTransform_transform_transpose(vt, n, y, x)
    ccall((:faiss_LinearTransform_transform_transpose, libfaiss_c), Cvoid, (Ptr{FaissLinearTransform}, idx_t, Ptr{Cfloat}, Ptr{Cfloat}), vt, n, y, x)
end

function faiss_LinearTransform_set_is_orthonormal(vt)
    ccall((:faiss_LinearTransform_set_is_orthonormal, libfaiss_c), Cvoid, (Ptr{FaissLinearTransform},), vt)
end

function faiss_LinearTransform_have_bias(arg1)
    ccall((:faiss_LinearTransform_have_bias, libfaiss_c), Cint, (Ptr{FaissLinearTransform},), arg1)
end

function faiss_LinearTransform_is_orthonormal(arg1)
    ccall((:faiss_LinearTransform_is_orthonormal, libfaiss_c), Cint, (Ptr{FaissLinearTransform},), arg1)
end

const FaissRandomRotationMatrix = FaissVectorTransform_H

function faiss_RandomRotationMatrix_free(obj)
    ccall((:faiss_RandomRotationMatrix_free, libfaiss_c), Cvoid, (Ptr{FaissRandomRotationMatrix},), obj)
end

function faiss_RandomRotationMatrix_new_with(p_vt, d_in, d_out)
    ccall((:faiss_RandomRotationMatrix_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissRandomRotationMatrix}}, Cint, Cint), p_vt, d_in, d_out)
end

const FaissPCAMatrix = FaissVectorTransform_H

function faiss_PCAMatrix_free(obj)
    ccall((:faiss_PCAMatrix_free, libfaiss_c), Cvoid, (Ptr{FaissPCAMatrix},), obj)
end

function faiss_PCAMatrix_new_with(p_vt, d_in, d_out, eigen_power, random_rotation)
    ccall((:faiss_PCAMatrix_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissPCAMatrix}}, Cint, Cint, Cfloat, Cint), p_vt, d_in, d_out, eigen_power, random_rotation)
end

function faiss_PCAMatrix_eigen_power(arg1)
    ccall((:faiss_PCAMatrix_eigen_power, libfaiss_c), Cfloat, (Ptr{FaissPCAMatrix},), arg1)
end

function faiss_PCAMatrix_random_rotation(arg1)
    ccall((:faiss_PCAMatrix_random_rotation, libfaiss_c), Cint, (Ptr{FaissPCAMatrix},), arg1)
end

const FaissITQMatrix = FaissVectorTransform_H

function faiss_ITQMatrix_free(obj)
    ccall((:faiss_ITQMatrix_free, libfaiss_c), Cvoid, (Ptr{FaissITQMatrix},), obj)
end

function faiss_ITQMatrix_new_with(p_vt, d)
    ccall((:faiss_ITQMatrix_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissITQMatrix}}, Cint), p_vt, d)
end

const FaissITQTransform = FaissVectorTransform_H

function faiss_ITQTransform_free(obj)
    ccall((:faiss_ITQTransform_free, libfaiss_c), Cvoid, (Ptr{FaissITQTransform},), obj)
end

function faiss_ITQTransform_new_with(p_vt, d_in, d_out, do_pca)
    ccall((:faiss_ITQTransform_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissITQTransform}}, Cint, Cint, Cint), p_vt, d_in, d_out, do_pca)
end

function faiss_ITQTransform_do_pca(arg1)
    ccall((:faiss_ITQTransform_do_pca, libfaiss_c), Cint, (Ptr{FaissITQTransform},), arg1)
end

const FaissOPQMatrix = FaissVectorTransform_H

function faiss_OPQMatrix_free(obj)
    ccall((:faiss_OPQMatrix_free, libfaiss_c), Cvoid, (Ptr{FaissOPQMatrix},), obj)
end

function faiss_OPQMatrix_new_with(p_vt, d, M, d2)
    ccall((:faiss_OPQMatrix_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissOPQMatrix}}, Cint, Cint, Cint), p_vt, d, M, d2)
end

function faiss_OPQMatrix_verbose(arg1)
    ccall((:faiss_OPQMatrix_verbose, libfaiss_c), Cint, (Ptr{FaissOPQMatrix},), arg1)
end

function faiss_OPQMatrix_set_verbose(arg1, arg2)
    ccall((:faiss_OPQMatrix_set_verbose, libfaiss_c), Cvoid, (Ptr{FaissOPQMatrix}, Cint), arg1, arg2)
end

function faiss_OPQMatrix_niter(arg1)
    ccall((:faiss_OPQMatrix_niter, libfaiss_c), Cint, (Ptr{FaissOPQMatrix},), arg1)
end

function faiss_OPQMatrix_set_niter(arg1, arg2)
    ccall((:faiss_OPQMatrix_set_niter, libfaiss_c), Cvoid, (Ptr{FaissOPQMatrix}, Cint), arg1, arg2)
end

function faiss_OPQMatrix_niter_pq(arg1)
    ccall((:faiss_OPQMatrix_niter_pq, libfaiss_c), Cint, (Ptr{FaissOPQMatrix},), arg1)
end

function faiss_OPQMatrix_set_niter_pq(arg1, arg2)
    ccall((:faiss_OPQMatrix_set_niter_pq, libfaiss_c), Cvoid, (Ptr{FaissOPQMatrix}, Cint), arg1, arg2)
end

const FaissRemapDimensionsTransform = FaissVectorTransform_H

function faiss_RemapDimensionsTransform_free(obj)
    ccall((:faiss_RemapDimensionsTransform_free, libfaiss_c), Cvoid, (Ptr{FaissRemapDimensionsTransform},), obj)
end

function faiss_RemapDimensionsTransform_new_with(p_vt, d_in, d_out, uniform)
    ccall((:faiss_RemapDimensionsTransform_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissRemapDimensionsTransform}}, Cint, Cint, Cint), p_vt, d_in, d_out, uniform)
end

const FaissNormalizationTransform = FaissVectorTransform_H

function faiss_NormalizationTransform_free(obj)
    ccall((:faiss_NormalizationTransform_free, libfaiss_c), Cvoid, (Ptr{FaissNormalizationTransform},), obj)
end

function faiss_NormalizationTransform_new_with(p_vt, d, norm)
    ccall((:faiss_NormalizationTransform_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissNormalizationTransform}}, Cint, Cfloat), p_vt, d, norm)
end

function faiss_NormalizationTransform_norm(arg1)
    ccall((:faiss_NormalizationTransform_norm, libfaiss_c), Cfloat, (Ptr{FaissNormalizationTransform},), arg1)
end

const FaissCenteringTransform = FaissVectorTransform_H

function faiss_CenteringTransform_free(obj)
    ccall((:faiss_CenteringTransform_free, libfaiss_c), Cvoid, (Ptr{FaissCenteringTransform},), obj)
end

function faiss_CenteringTransform_new_with(p_vt, d)
    ccall((:faiss_CenteringTransform_new_with, libfaiss_c), Cint, (Ptr{Ptr{FaissCenteringTransform}}, Cint), p_vt, d)
end

function faiss_clone_index(arg1, p_out)
    ccall((:faiss_clone_index, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Ptr{FaissIndex}}), arg1, p_out)
end

function faiss_clone_index_binary(arg1, p_out)
    ccall((:faiss_clone_index_binary, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, Ptr{Ptr{FaissIndexBinary}}), arg1, p_out)
end

@cenum FaissErrorCode::Int32 begin
    OK = 0
    UNKNOWN_EXCEPT = -1
    FAISS_EXCEPT = -2
    STD_EXCEPT = -4
end

# no prototype is found for this function at error_c.h:36:13, please use with caution
function faiss_get_last_error()
    ccall((:faiss_get_last_error, libfaiss_c), Ptr{Cchar}, ())
end

const faiss_component_t = Cfloat

const faiss_distance_t = Cfloat

function faiss_index_factory(p_index, d, description, metric)
    ccall((:faiss_index_factory, libfaiss_c), Cint, (Ptr{Ptr{FaissIndex}}, Cint, Ptr{Cchar}, FaissMetricType), p_index, d, description, metric)
end

function faiss_index_binary_factory(p_index, d, description)
    ccall((:faiss_index_binary_factory, libfaiss_c), Cint, (Ptr{Ptr{FaissIndexBinary}}, Cint, Ptr{Cchar}), p_index, d, description)
end

function faiss_write_index(idx, f)
    ccall((:faiss_write_index, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Libc.FILE}), idx, f)
end

function faiss_write_index_fname(idx, fname)
    ccall((:faiss_write_index_fname, libfaiss_c), Cint, (Ptr{FaissIndex}, Ptr{Cchar}), idx, fname)
end

function faiss_read_index(f, io_flags, p_out)
    ccall((:faiss_read_index, libfaiss_c), Cint, (Ptr{Libc.FILE}, Cint, Ptr{Ptr{FaissIndex}}), f, io_flags, p_out)
end

function faiss_read_index_fname(fname, io_flags, p_out)
    ccall((:faiss_read_index_fname, libfaiss_c), Cint, (Ptr{Cchar}, Cint, Ptr{Ptr{FaissIndex}}), fname, io_flags, p_out)
end

function faiss_write_index_binary(idx, f)
    ccall((:faiss_write_index_binary, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, Ptr{Libc.FILE}), idx, f)
end

function faiss_write_index_binary_fname(idx, fname)
    ccall((:faiss_write_index_binary_fname, libfaiss_c), Cint, (Ptr{FaissIndexBinary}, Ptr{Cchar}), idx, fname)
end

function faiss_read_index_binary(f, io_flags, p_out)
    ccall((:faiss_read_index_binary, libfaiss_c), Cint, (Ptr{Libc.FILE}, Cint, Ptr{Ptr{FaissIndexBinary}}), f, io_flags, p_out)
end

function faiss_read_index_binary_fname(fname, io_flags, p_out)
    ccall((:faiss_read_index_binary_fname, libfaiss_c), Cint, (Ptr{Cchar}, Cint, Ptr{Ptr{FaissIndexBinary}}), fname, io_flags, p_out)
end

const FAISS_IO_FLAG_MMAP = 1

const FAISS_IO_FLAG_READ_ONLY = 2

# Skipping MacroDefinition: CATCH_AND_HANDLE catch ( faiss : : FaissException & e ) { std : : cerr << e . what ( ) << '\n' ; faiss_last_exception = std : : make_exception_ptr ( e ) ; return - 2 ; } catch ( std : : exception & e ) { std : : cerr << e . what ( ) << '\n' ; faiss_last_exception = std : : make_exception_ptr ( e ) ; return - 4 ; } catch ( ... ) { std : : cerr << "Unrecognized exception!\n" ; faiss_last_exception = std : : make_exception_ptr ( std : : runtime_error ( "Unknown error" ) ) ; return - 1 ; } return 0 ;

# exports
const PREFIXES = ["faiss"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
