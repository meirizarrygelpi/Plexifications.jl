"""
    Prplex{T <: Real} = Perplexification{T}

A perplex number is a perplexification of the real numbers.
"""
const Prplex{T <: Real} = Perplexification{T}

function Prplex(a::T, b::T) where T <: Real
    Prplex{T}(a, b)
end

function Prplex(a::T) where T <: Real
    Prplex{T}(a, zero(T))
end

function Prplex(a::Real, b::Real)
    Prplex(promote(a, b)...)
end

"""
    unreal(z::Prplex)

The unreal part of a perplex number is a 1-vector.
"""
function unreal(z::Prplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Prplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", R: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Prplex{T}}) where T <: Real
    Prplex{T}(rand(T), rand(T))
end

function random(::Type{Prplex{BigInt}})
    Prplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Prplex{BigFloat}})
    Prplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Prplex{Rational{BigInt}}})
    Prplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function abs2(z::Prplex)
    abs2(z.l) - abs2(z.r)
end

function barR(z::Prplex)
    Prplex(z.l, -(z.r))
end

function inv(z::Prplex)
    barR(z) / abs2(z)
end
