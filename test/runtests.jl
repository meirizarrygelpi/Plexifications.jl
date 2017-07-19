using Plexifications
using Base.Test: @testset

@testset "Cmplex" begin include("cmplex_test.jl") end
@testset "Prplex" begin include("prplex_test.jl") end
@testset "Nlplex" begin include("nlplex_test.jl") end

@testset "BiComplex" begin include("bicomplex_test.jl") end
@testset "BiPerplex" begin include("biperplex_test.jl") end
@testset "BiNilplex" begin include("binilplex_test.jl") end

@testset "DualComplex" begin include("dualcomplex_test.jl") end
@testset "DualPerplex" begin include("dualperplex_test.jl") end

@testset "TriComplex" begin include("tricomplex_test.jl") end
@testset "TriPerplex" begin include("triperplex_test.jl") end
@testset "TriNilplex" begin include("trinilplex_test.jl") end

@testset "HyperComplex" begin include("hypercomplex_test.jl") end
@testset "HyperPerplex" begin include("hyperperplex_test.jl") end
