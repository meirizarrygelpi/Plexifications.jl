"""
    BiComplex{T <: Real} = Complexification{Cmplex{T}}

A bi-complex number is a complexification of the complex numbers.
"""
const BiComplex{T <: Real} = Complexification{Cmplex{T}}

function BiComplex(z::Cmplex{T}) where T <: Real
    BiComplex{T}(z, zero(Cmplex{T}))
end

function BiComplex(a::T, b::T, c::T, d::T) where T <: Real
    BiComplex{T}(Cmplex{T}(a, b), Cmplex{T}(c, d))
end

function BiComplex(a::T, b::T, c::T) where T <: Real
    BiComplex{T}(Cmplex{T}(a, b), Cmplex{T}(c, zero(T)))
end

function BiComplex(a::T, b::T) where T <: Real
    BiComplex{T}(Cmplex{T}(a, b), zero(Cmplex{T}))
end

function BiComplex(a::T) where T <: Real
    BiComplex{T}(Cmplex{T}(a, zero(T)), zero(Cmplex{T}))
end

function BiComplex(a::Real, b::Real)
    BiComplex(promote(a, b)...)
end

function BiComplex(a::Real, b::Real, c::Real)
    BiComplex(promote(a, b, c)...)
end

function BiComplex(a::Real, b::Real, c::Real, d::Real)
    BiComplex(promote(a, b, c, d)...)
end

"""
    unreal(z::BiComplex)

The unreal part of a bi-complex number is a 3-vector.
"""
function unreal(z::BiComplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::BiComplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", H: ")
    print(io, z.l.r)
    print(io, ", G: ")
    print(io, z.r.l)
    print(io, ", GH: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{BiComplex{T}}) where T <: Real
    BiComplex{T}(random(Cmplex{T}), random(Cmplex{T}))
end

function barH(z::BiComplex{T}) where T <: Real
    BiComplex{T}(barH(z.l), barH(z.r))
end

function barG(z::BiComplex{T}) where T <: Real
    BiComplex{T}(z.l, -(z.r))
end

function quadrance(z::BiComplex)
    (z * barG(z)).l
end

function norm(z::BiComplex)
    abs2(quadrance(z))
end

function iszerodivisor(z::BiComplex)
    iszero(quadrance(z))
end

function inv(z::BiComplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    barG(z) * barH(q) / abs2(q)
end