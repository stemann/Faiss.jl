using Random

"""
A dataset that is not completely random but still challenging to
index
"""
function get_dataset_2(d, nt, nb, nq)
    d1 = 10     # intrinsic dimension (more or less)
    n = nb + nt + nq
    rng = MersenneTwister(1338)
    x = randn(rng, d1, n)
    x = rand(rng, d, d1) * x
    # now we have a d1-dim ellipsoid in d-dimensional space
    # higher factor (>4) -> higher frequency -> less linear
    x = x .* (rand(rng, size(x)) .* 4 .+ 0.1)
    x = sin.(x)
    return x[:, 1:nt], x[:, (nt+1):(nt+nb)], x[:, (nt+nb+1):end]
end
