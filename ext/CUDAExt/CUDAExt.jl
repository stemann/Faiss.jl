module CUDAExt

using Faiss

@info "Loading CUDAExt.jl"

include(joinpath(@__DIR__, "Wrapper.jl"))

function Faiss.get_device_count(::Type{Faiss.ComputationalResourceProviderCUDA})
    num_gpus = Ref{Cint}(-1)
    Wrapper.faiss_get_num_gpus(num_gpus)
    return num_gpus[]
end

end
