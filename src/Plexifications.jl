__precompile__()

module Plexifications

import Base: +, -, *, /, \, real, isreal, inv, abs2, norm, show, zero, one, iszero, ==
# import Unreal: unreal

"Error when finding the inverse of a zero divisor."
const ZeroDivisorInverse = "inverse of zero divisor"

"Error when the denominator in a quotient is zero."
const ZeroDenominator = "denominator is zero"

include("Plexification.jl")
include("Complexification.jl")
include("Perplexification.jl")
include("Nilplexification.jl")
include("Cmplex.jl")
include("Prplex.jl")
include("Nlplex.jl")
include("BiComplex.jl")
include("BiPerplex.jl")
include("BiNilplex.jl")
include("DualComplex.jl")
include("DualPerplex.jl")
include("TriComplex.jl")
include("TriPerplex.jl")
include("TriNilplex.jl")
include("HyperComplex.jl")
include("HyperPerplex.jl")
include("random.jl")

# Types
export Plexification, Complexification, Perplexification, Nilplexification,
       Cmplex, Prplex, Nlplex,
       BiComplex, BiPerplex, BiNilplex, DualComplex, DualPerplex,
       TriComplex, TriPerplex, TriNilplex, HyperComplex, HyperPerplex

# Methods
export unreal, array, iszerodivisor, random, quadrance,
       barH, barR, barA,
       barG, barQ, barB,
       barF, barP, barC,
       commutator, associator, jacobiator, alternatorL, alternatorR, flexator

end
