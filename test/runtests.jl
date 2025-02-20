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
