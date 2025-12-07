using CUDA_Runtime_jll
using Faiss
using Test

@testset "CUDAExt" begin
    device_count = Faiss.get_device_count(Faiss.ComputationalResourceProviderCUDA)
    @info "Number of CUDA devices detected: $device_count"
    @test device_count >= 0
end
