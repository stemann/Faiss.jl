using Test

@testset "Faiss.jl" begin
    include(joinpath(@__DIR__, "index_tests.jl"))
end
