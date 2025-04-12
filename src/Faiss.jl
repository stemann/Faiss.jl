"""
    module Faiss

An interface to the Faiss library for similarity-search of vectors (i.e. nearest-neighbour searching).

For basic usage, see [`Index`](@ref), [`add`](@ref), [`search`](@ref), [`add_with_ids`](@ref), [`local_rank`](@ref).
"""
module Faiss

using OpenBLAS32

export
    add_search_with_ids,
    add_search,
    add_with_ids,
    add,
    index_factory,
    index_factory_gpu,
    local_rank,
    range_search,
    remove_with_ids,
    search

function get_num_gpus end

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
    ptr::Ptr{Wrapper.FaissIndex}

    function Index(ptr::Ptr{Wrapper.FaissIndex})
        this = new(ptr)
        finalizer(idx -> Wrapper.faiss_Index_free(idx.ptr), this)
        return this
    end
end

mutable struct IndexIDMap
    ptr::Ptr{Wrapper.FaissIndexIDMap}

    function IndexIDMap(ptr::Ptr{Wrapper.FaissIndexIDMap})
        this = new(ptr)
        finalizer(idx -> Wrapper.faiss_Index_free(idx.ptr), this) # TODO Not sure if this is correct
        return this
    end
end

function index_factory(dim::Integer, description::AbstractString="Flat"; metric::Metric=MetricL2)
    faiss_index = Ref{Ptr{Wrapper.FaissIndex}}()
    error_code = Wrapper.faiss_index_factory(
        faiss_index,
        Cint(dim),
        String(description),
        Wrapper.FaissMetricType(UInt32(metric))
    )
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    Index(faiss_index[])
end

"""
    index_factory_gpu(dim::Integer; str::AbstractString="Flat", metric::String="L2", gpus::String="")

Create a Faiss index of the given parameters:
- The `dim` is denote dimension of data to Index.
- The `str` is an index factory string describing the type of index to construct. reference:[index-factory](https://github.com/facebookresearch/faiss/wiki/The-index-factory)
- The `metric` is a metric of distance, have "L2", "IP"
- The `gpus` is a string of setting gpu id. if "" denote use cpu.
"""
function index_factory_gpu(dim::Integer; description::AbstractString="Flat", metric::Metric=MetricL2, gpus::String="")
    # feat data is stored here. When the amount of data is huge, it is easy to overflow the GPU memory.
    ENV["CUDA_VISIBLE_DEVICES"] = gpus
    description_list = split(description, ",")
    if "IDMap2" in description_list
        description = join(description_list[description_list .!="IDMap2"] , ",")  # py faiss not support IDMap2.
        cpu_index = index_factory(dim, description; metric)
        cpu_index = Wrapper.faiss_IndexIDMap2_cast(cpu_index.ptr)
    else
        cpu_index = index_factory(dim, description; metric)
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

    if "IDMap2" in description_list || "IDMap" in description_list
        return IndexIDMap(index)
    else
        return Index(index)
    end
end

function Base.getproperty(idx::Index, name::Symbol)
    if name == :d
        return Wrapper.faiss_Index_d(idx.ptr)
    elseif name == :metric
        return Metric(UInt32(Wrapper.faiss_Index_metric_type(idx.ptr)))
    elseif name == :ntotal
        return Wrapper.faiss_Index_ntotal(idx.ptr)
    end
    return getfield(idx, name)
end

Base.propertynames(::Index) = (:d, :metric, :ntotal, fieldnames(Index)...)

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
    ", metric: ", idx.metric)
end

"""
    add(idx::Index, vs::AbstractMatrix{<:AbstractFloat})

Add the columns of `vs` to the index.
"""
function add(idx::Index, vs::AbstractMatrix{<:AbstractFloat})
    size(vs, 1) == idx.d || throw(ArgumentError("Input matrix must have $(idx.d) rows"))
    n = size(vs, 2)
    vs = Float32.(vs)
    error_code = Wrapper.faiss_Index_add(idx.ptr, n, vs)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    return nothing
end

"""
    add_with_ids(idx::IndexIDMap, vs::AbstractMatrix{<:AbstractFloat}, ids::Array{Int64})

"""
function add_with_ids(idx::IndexIDMap, vs::AbstractMatrix{<:AbstractFloat}, ids::Array{Int64})
    size(vs, 1) == idx.d || throw(ArgumentError("Input matrix must have $(idx.d) rows"))
    size(vs, 2) == size(ids, 1) || error("expecting $(size(vs, 1)) rows")
    n = size(vs, 2)
    vs = Float32.(vs)
    error_code = Wrapper.faiss_Index_add_with_ids(idx.ptr, n, vs, ids)
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
    error_code = Wrapper.faiss_Index_remove_ids(idx.ptr, ids, n_removed)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    return n_removed[]
end

"""
    search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix{<:AbstractFloat}, k::Integer)

Search the index for the `k` nearest neighbours of each column of `vs`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix{<:AbstractFloat}, k::Integer)::Tuple{Matrix{Float32}, Matrix{Int64}}
    size(vs, 1) == idx.d || throw(ArgumentError("Input matrix must have $(idx.d) rows"))
    n = size(vs, 2)
    vs = Float32.(vs)
    k = Wrapper.idx_t(k)

    D = zeros(Float32, (k, n))
    I = zeros(Wrapper.idx_t, (k, n))
    if idx.ntotal == 0
        if idx.metric == MetricL2
            D = D .+ 2
        end
    else
        error_code = Wrapper.faiss_Index_search(idx.ptr, n, vs, k, D, I)
        if error_code != Wrapper.OK
            message = unsafe_string(Wrapper.faiss_get_last_error())
            error(message)
        end
    end
    I = I .+ 1
    return D, I
end

"""
    range_search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, threshold::Real=0.0)

Search the index for the distance < radius neighbours of each column of `vs`.

Return `(D, I)` where `I` is a matrix where each column gives the ids of the `k` nearest
neighbours of the corresponding column of `vs` and `D` is the corresponding matrix of distances.
"""
function range_search(idx::Union{Index, IndexIDMap}, vs::AbstractMatrix, threshold::Real=0.0)::Tuple{Matrix{Float32}, Matrix{Int64}}
    size(vs, 2) == size(idx, 1) || error("expecting $(size(idx, 1)) rows")
    vs_ = convert(AbstractMatrix{Float32}, vs)
    th_ = convert(Float32, threshold)

    result = Ref{FaissRangeSearchResult}()
    error_code = Wrapper.faiss_Index_range_search(idx.ptr, n, vs_, th_, result)
    if error_code != Wrapper.OK
        message = unsafe_string(Wrapper.faiss_get_last_error())
        error(message)
    end
    nq = Ref{Csize_t}(0)
    Wrapper.faiss_RangeSearchResult_nq(result, nq)
    size_1 = size(vs, 1)
    D = zeros(Float32, (size_1, nq[]))
    I = zeros(Wrapper.idx_t, (size_1, nq[]))
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
    idx = index_factory_gpu(feat_dim; str=str, metric=metric, gpus=gpus)
    D, I = add_search(idx, vs_query, vs_gallery; k=k)
    return (D, I)
end

end # module
