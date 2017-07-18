"""
    Nlplex{T <: Real} = Nilplexification{T}

A nilplex number is a nilplexification of the real numbers.
"""
const Nlplex{T <: Real} = Nilplexification{T}

function Nlplex(a::T, b::T) where T <: Real
    Nlplex{T}(a, b)
end

function Nlplex(a::T) where T <: Real
    Nlplex{T}(a, zero(T))
end

function Nlplex(a::Real, b::Real)
    Nlplex(promote(a, b)...)
end

"""
    unreal(z::Nlplex)

The unreal part of a nilplex number is a 1-vector.
"""
function unreal(z::Nlplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Nlplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", A: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Nlplex{T}}) where T <: Real
    Nlplex{T}(rand(T), rand(T))
end

function random(::Type{Nlplex{BigInt}})
    Nlplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Nlplex{BigFloat}})
    Nlplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Nlplex{Rational{BigInt}}})
    Nlplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function abs2(z::Nlplex)
    abs2(z.l)
end

function barA(z::Nlplex)
    Nlplex(z.l, -(z.r))
end

function iszerodivisor(z::Nlplex)
    iszero(z.l)
end

function inv(z::Nlplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    barA(z) / abs2(z)
end
