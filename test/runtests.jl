using Plexifications
using Base.Test: @testset

@testset "Cmplex" begin include("cmplex_test.jl") end
@testset "Prplex" begin include("prplex_test.jl") end
@testset "Nlplex" begin include("nlplex_test.jl") end
