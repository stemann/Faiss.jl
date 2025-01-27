"""
    module Faiss

An interface to the Faiss library for similarity-search of vectors (i.e. nearest-neighbour searching).

For basic usage, see [`Index`](@ref), [`add`](@ref), [`search`](@ref), [`add_with_ids`](@ref), [`local_rank`](@ref).
"""
module Faiss

export Index, add, search, range_search, add_with_ids, remove_with_ids, add_search, 
local_rank, add_search_with_ids

include(joinpath(@__DIR__, "Wrapper.jl"))

@enum Metric::UInt32 begin
    MetricInnerProduct = 0
    MetricL2 = 1
    MetricL1 = 2
    MetricLinf = 3
    MetricLp = 4
    MetricCanberra = 20
    MetricBrayCurtis = 21
    MetricJensenShannon = 22
end

mutable struct Index
    ref::Ref{Wrapper.FaissIndex}

    function Index(ref::Ref{Wrapper.FaissIndex})
        this = new(ref)
        finalizer(idx -> Wrapper.faiss_Index_free(idx.ref), this)
        return this
    end
end

mutable struct IndexIDMap
    ref::Ref{Wrapper.FaissIndexIDMap}

    function IndexIDMap(ref::Ref{Wrapper.FaissIndexIDMap})
        this = new(ref)
        finalizer(idx -> Wrapper.faiss_Index_free(idx.ref), this) # TODO Not sure if this is correct
        return this
    end
end

# cpu index
function Index(dim::Integer, str::AbstractString="Flat", metric::Metric=MetricL2)
    faiss_index = Ref{Wrapper.FaissIndex}()
    error_code = Wrapper.faiss_index_factory(
        pointer_from_objref(faiss_index),
        convert(Cint, dim),
        convert(String, str),
        Wrapper.FaissMetricType(UInt32(metric))
    )
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    Index(faiss_index)
end

"""
    Index(dim::Integer; str::AbstractString="Flat", metric::String="L2", gpus::String="")

Create a Faiss index of the given parameters:
- The `dim` is denote dimension of data to Index.
- The `str` is an index factory string describing the type of index to construct. reference:[index-factory](https://github.com/facebookresearch/faiss/wiki/The-index-factory)
- The `metric` is a metric of distance, have "L2", "IP"
- The `gpus` is a string of setting gpu id. if "" denote use cpu.
"""
function Index(dim::Integer; str::AbstractString="Flat", metric::Metric=MetricL2, gpus::String="")
    # feat data is stored here. When the amount of data is huge, it is easy to overflow the GPU memory.
    ENV["CUDA_VISIBLE_DEVICES"] = gpus
    str_list = split(str, ",")
    if "IDMap2" in str_list
        str = join(str_list[str_list .!="IDMap2"] , ",")  # py faiss not support IDMap2.
        cpu_index = Index(dim, str, metric)
        cpu_index = Wrapper.faiss_IndexIDMap2_cast(cpu_index.ref)
    else
        cpu_index = Index(dim, str, metric)
    end

    if gpus == ""
        ngpus = 0
    else
        ngpus = length(split(ENV["CUDA_VISIBLE_DEVICES"], ","))
    end
    
    if ngpus == 0
        index = cpu_index
    elseif ngpus == 1
        res = faiss.StandardGpuResources()
        index = faiss.index_cpu_to_gpu(res, 0, cpu_index)  # use one gpu. make it into a gpu index
    else
        index = faiss.index_cpu_to_all_gpus(cpu_index)  # use all gpus
    end

    if "IDMap2" in str_list || "IDMap" in str_list
        return IndexIDMap(index)
    else
        return Index(index)
    end
end

function Base.getproperty(idx::Index, name::Symbol)
    if name == :d
        return Wrapper.faiss_Index_d(idx.ref)
    elseif name == :metric_type
        return Metric(UInt32(Wrapper.faiss_Index_metric_type(idx.ref)))
    elseif name == :ntotal
        return Wrapper.faiss_Index_ntotal(idx.ref)
    end
    return getfield(idx, name)
end

Base.propertynames(::Index) = (:d, :metric_type, :ntotal, fieldnames(Index)...)

"""
    size(idx::Union{Index, IndexIDMap})

"""
Base.size(idx::Union{Index, IndexIDMap}) = (size(idx, 1), size(idx, 2))

Base.size(idx::Union{Index, IndexIDMap}, i::Integer) = 
    i == 1 ? idx.d : i == 2 ? idx.ntotal : error()

"""
    show(io::IO, ::MIME"text/plain", idx::Index)

"""
function Base.show(io::IO, ::MIME"text/plain", idx::Index)
    println(io, typeof(idx), " of ", size(idx, 2), " vectors of dimension ", size(idx, 1), 
    ", metric: ", idx.metric_type)
end

"""
    add(idx::Index, vs::AbstractMatrix)

Add the columns of `vs` to the index.
"""
function add(idx::Index, vs::AbstractMatrix)
    size(vs, 2) == size(idx, 1) || error("expecting $(size(idx, 1)) rows")
    vs_ = convert(AbstractMatrix{Float32}, vs)
    # vs_ = np.array(pyrowlist(vs_), dtype=np.float32)
    error_code = Wrapper.faiss_Index_add(idx.ref, n, vs_)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    return nothing
end

"""
    add_with_ids(idx::IndexIDMap, vs::AbstractMatrix, ids::Array{Int64})

"""
function add_with_ids(idx::IndexIDMap, vs::AbstractMatrix, ids::Array{Int64})
    size(vs, 2) == size(idx, 1) || error("expecting $(size(idx, 1)) rows")
    size(vs, 1) == size(ids, 1) || error("expecting $(size(vs, 1)) rows")
    vs_ = convert(AbstractMatrix{Float32}, vs)
    # vs_ = np.array(pyrowlist(vs_), dtype=np.float32)
    # ids_ = np.array(pyrowlist(ids), dtype=np.int64)
    error_code = Wrapper.faiss_Index_add_with_ids(idx.ref, n, vs_, ids)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    return nothing
end

"""
    remove_with_ids(idx::IndexIDMap, ids::Array{Int64})

"""
function remove_with_ids(idx::IndexIDMap, ids::Array{Int64})
    # ids_ = np.array(pyrowlist(ids), dtype=np.int64)
    n_removed = Ref{Csize_t}(0)
    error_code = Wrapper.faiss_Index_remove_ids(idx.ref, ids, n_removed)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
end

"""
    search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, k::Integer)

Search the index for the `k` nearest neighbours of each column of `vs`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, k::Integer)
    size(vs, 2) == size(idx, 1) || error("expecting $(size(idx, 1)) rows")
    vs_ = convert(AbstractMatrix{Float32}, vs)
    # vs_ = np.array(pyrowlist(vs_), dtype=np.float32)
    k_ = convert(Cint, k)

    size_1 = size(vs, 1)
    D = zeros(Float32, (size_1, k))
    I = zeros(Int32, (size_1, k))
    if idx.ntotal == 0
        if idx.metric_type == MetricL2
            D = D .+ 2
        end
    else
        error_code = Wrapper.faiss_Index_search(idx.ref, n, vs_, k_, pointer(D), pointer(I))
        if error_code != Wrapper.OK
            message = unsafe_string(Wrapper.faiss_get_last_error())
            error(message)
        end
    end
    I = I .+ 1
    return (D, I)
end

"""
    range_search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, threshold::Real=0.0)

Search the index for the distance < radius neighbours of each column of `vs`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function range_search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, threshold::Real=0.0)
    size(vs, 2) == size(idx, 1) || error("expecting $(size(idx, 1)) rows")
    vs_ = convert(AbstractMatrix{Float32}, vs)
    # vs_ = np.array(pyrowlist(vs_), dtype=np.float32)
    th_ = convert(Float32, threshold)

    result = Ref{FaissRangeSearchResult}()
    error_code = Wrapper.faiss_Index_range_search(idx.ref, n, vs_, th_, result)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    nq = Ref{Csize_t}(0)
    Wrapper.faiss_RangeSearchResult_nq(result, nq)
    size_1 = size(vs, 1)
    D = zeros(Float32, (size_1, nq[]))
    I = zeros(Int32, (size_1, nq[]))
    Wrapper.faiss_RangeSearchResult_labels(result, pointer_from_objref(D), pointer_from_objref(I))
    I = I .+ 1
    return (D, I)
end

"""
    add_search(idx::Index, vs_query::AbstractMatrix, vs_gallery::AbstractMatrix; 
                k::Integer=100, flag::Bool=true)

Add `vs_gallery` to idx and Search the index for the `k` nearest neighbours of each column of `vs_query`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function add_search(idx::Index, vs_query::AbstractMatrix, vs_gallery::AbstractMatrix; 
                    k::Integer=100, flag::Bool=true)
    if flag
        add(idx, vs_gallery)
    end
    D, I = search(idx, vs_query, k) 

    return (D, I)
end

"""
    add_search_with_ids(idx::IndexIDMap, vs_query::AbstractMatrix, vs_gallery::AbstractMatrix, ids::Array{Int64}; 
                        k::Integer=100, flag::Bool=true)

Add `vs_gallery` with `ids` to idx and Search the index for the `k` nearest neighbours of each column of `vs_query`.

"""
function add_search_with_ids(idx::IndexIDMap, vs_query::AbstractMatrix, vs_gallery::AbstractMatrix, ids::Array{Int64}; 
    k::Integer=100, flag::Bool=true)
    if flag
        add_with_ids(idx, vs_gallery, ids)
    end
    D, I = search(idx, vs_query, k) 
    
    return (D, I)
end

"""
    local_rank(vs_query::AbstractMatrix, vs_gallery::AbstractMatrix; k::Integer=10, 
                str::String="Flat", metric::String="L2", gpus::String="")

Create Index and Add `vs_gallery` to idx and Search the index for the `k` nearest neighbours of each 
column of `vs_query`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function local_rank(vs_query::AbstractMatrix, vs_gallery::AbstractMatrix; k::Integer=10, 
                    str::String="Flat", metric::String="L2", gpus::String="")
    feat_dim = size(vs_query, 2)
    idx = Index(feat_dim; str=str, metric=metric, gpus=gpus)
    D, I = add_search(idx, vs_query, vs_gallery; k=k)
    return (D, I)
end


"""
    downcast(idx::Index)

Return the same index downcasted to its most specific type.
"""
downcast(idx::Index) = Index(faiss.downcast_index(idx.py)) # TODO find downcast_index in C API

end # module
