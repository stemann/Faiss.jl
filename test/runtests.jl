using Faiss
using LinearAlgebra
using Test

function run_tests()
    blas_config = BLAS.get_config()
    @info "Running tests using BLAS config: $blas_config"
    @testset "Faiss.jl" begin
        include(joinpath(@__DIR__, "index_tests.jl"))
    end
end


function run_cuda_ext_tests()
    @info "Running tests with CUDA extension"

    # Hack to use CUDA 12.1
    preferences = Dict("CUDA_Runtime_jll" => Dict("version" => "12.1"))
    preferences_path = joinpath(pwd(), "LocalPreferences.toml")
    open(preferences_path, "w") do io
      write(io, raw"""
[CUDA_Runtime_jll]
version = "12.1"
""")
    end

    include("cuda_ext_tests.jl")
end

blas_defined = haskey(ENV, "BLAS")
if blas_defined
    blas = ENV["BLAS"]
    @info "Ensuring selected BLAS is loaded: $blas"
    if blas == "AppleAccelerate"
        using AppleAccelerate
    elseif blas == "MKL"
        using MKL
    elseif blas == "OpenBLAS"
        # OpenBLAS should already be loaded
    end
end

run_tests()

if !blas_defined
    if Sys.ARCH == :x86_64 && (Sys.islinux() || Sys.iswindows())
        using MKL
        run_tests()
    elseif Sys.isapple()
        using AppleAccelerate
        run_tests()
    end
end

run_cuda_ext_tests()
