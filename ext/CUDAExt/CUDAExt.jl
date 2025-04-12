module CUDAExt

@info "Loading CUDAExt.jl"

foo() = "bar"

include(joinpath(@__DIR__, "Wrapper.jl"))

get_num_gpus() = let num_gpus = Ref{Cint}(-1)
    Wrapper.faiss_get_num_gpus(num_gpus)
    num_gpus[]
end

end
