using Distances
using Faiss
using Test

include(joinpath(@__DIR__, "common.jl"))

@testset "index" begin
    @testset "tutorial" begin
        d = 5
        nb = 9
        k = 3

        @testset "sanity check" begin
            _, xb, _ = get_dataset_2(d, 0, nb, 0)
            xq = xb

            idx = Faiss.index_factory(d, "Flat"; metric=Faiss.MetricL2)
            Faiss.add(idx, xb)
            D, I = Faiss.search(idx, xq, k)

            @test I[1, :] == 1:nb
            @test all(iszero, D[1,:])
            @test sort(D; dims=1) == D
        end
        
        for metric in [Faiss.MetricL2, Faiss.MetricInnerProduct]
            @testset "$metric" begin
                nq = metric == Faiss.MetricL2 ? 7 : nb
                _, xb, xq = get_dataset_2(d, 0, nb, nq)
                # xb = rand(Float32, d, nb)
                # xq = rand(Float32, d, nq)

                idx = Faiss.index_factory(d, "Flat"; metric)
                Faiss.add(idx, xb)
                D, I = Faiss.search(idx, xq, k)

                if metric == Faiss.MetricL2
                    all_dis = pairwise(SqEuclidean(), xb, xq, dims=2)
                    Dref = sort(all_dis; dims=1)[1:k, :]
                    Iref = mapslices(x -> sortperm(x)[1:k], all_dis; dims=1)
                elseif metric == Faiss.MetricInnerProduct
                    all_dis = xb' * xq
                    Dref = sort(all_dis; dims=1, rev=true)[1:k, :]
                    Iref = mapslices(x -> sortperm(x; rev=true)[1:k], all_dis; dims=1)
                end
                @test isapprox(D, Dref)
                @test I == Iref
            end
        end
    end
    @testset "IndexFlat" begin
        function do_test(nq; metric=Faiss.MetricL2, k=10)
            d = 32
            nb = 1000
            nt = 0
            
            _, xb, xq = get_dataset_2(d, nt, nb, nq)
            index = Faiss.index_factory(d, "Flat"; metric)
            
            @testset "k-NN search, nq = $nq" begin
                add(index, xb)
                D1, I1 = search(index, xq, k)

                if metric == Faiss.MetricL2
                    all_dis = pairwise(SqEuclidean(), xb, xq, dims=2)
                    Dref = sort(all_dis; dims=1)[1:k, :]
                    Iref = mapslices(x -> sortperm(x)[1:k], all_dis; dims=1)
                elseif metric == Faiss.MetricInnerProduct
                    all_dis = xb' * xq
                    Dref = sort(all_dis; dims=1, rev=true)[1:k, :]
                    Iref = mapslices(x -> sortperm(x; rev=true)[1:k], all_dis; dims=1)
                end
                
                # not too many elements are off.
                if metric == Faiss.MetricInnerProduct && k == 150 && nq == 200
                    @test_broken false
                else
                    @test sum(Iref .!= I1) <= size(Iref, 2) * 0.0002
                end

                @test Dref ≈ D1 atol=1e-3
            end
        end

        function set_blas_blocks(; small::Bool)
            if small
                Faiss.Wrapper.faiss_set_distance_compute_blas_query_bs(16)
                Faiss.Wrapper.faiss_set_distance_compute_blas_database_bs(12)
            else
                Faiss.Wrapper.faiss_set_distance_compute_blas_query_bs(4096)
                Faiss.Wrapper.faiss_set_distance_compute_blas_database_bs(1024)
            end
        end

        for with_blas in [true, false],
            metric in [Faiss.MetricL2, Faiss.MetricInnerProduct],
            k in [10, 150]
            @testset "$metric, $(with_blas ? "with" : "without") blas, k=$k" begin
                if with_blas
                    set_blas_blocks(small=true)
                    nq = 200
                else
                    nq = 10
                end
                do_test(nq; metric, k)
                if with_blas
                    set_blas_blocks(small=false)
                end
            end
        end
    end
end
