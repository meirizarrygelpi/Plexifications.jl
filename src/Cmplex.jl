"""
    Cmplex{T <: Real} = Complexification{T}

A complex number is a complexification of the real numbers.
"""
const Cmplex{T <: Real} = Complexification{T}

function Cmplex(a::T, b::T) where T <: Real
    Cmplex{T}(a, b)
end

function Cmplex(a::T) where T <: Real
    Cmplex{T}(a, zero(T))
end

function Cmplex(a::Real, b::Real)
    Cmplex(promote(a, b)...)
end

"""
    unreal(z::Cmplex)

The unreal part of a complex number is a 1-vector.
"""
function unreal(z::Cmplex{T}) where T <: Real
    T[z.r]
end

function show(io::IO, z::Cmplex)
    print(io, "[1: ")
    print(io, z.l)
    print(io, ", H: ")
    print(io, z.r)
    print(io, "]")
end

function random(::Type{Cmplex{T}}) where T <: Real
    Cmplex{T}(rand(T), rand(T))
end

function random(::Type{Cmplex{BigInt}})
    Cmplex{BigInt}(randomBigInt(), randomBigInt())
end

function random(::Type{Cmplex{BigFloat}})
    Cmplex{BigFloat}(randomBigFloat(), randomBigFloat())
end

function random(::Type{Cmplex{Rational{BigInt}}})
    Cmplex{Rational{BigInt}}(randomBigRational(), randomBigRational())
end

function abs2(z::Cmplex)
    abs2(z.l) + abs2(z.r)
end

function barH(z::Cmplex)
    Cmplex(z.l, -(z.r))
end

function iszerodivisor(z::Cmplex)
    iszero(z)
end

function inv(z::Cmplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end
    
    barH(z) / abs2(z)
end
