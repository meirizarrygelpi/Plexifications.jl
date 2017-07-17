"""
    DualComplex{T <: Real} = Nilplexification{Cmplex{T}}

A dual-complex number is a nilplexification of the complex numbers.
"""
const DualComplex{T <: Real} = Nilplexification{Cmplex{T}}

function DualComplex(z::Cmplex{T}) where T <: Real
    DualComplex{T}(z, zero(Cmplex{T}))
end

function DualComplex(a::T, b::T, c::T, d::T) where T <: Real
    DualComplex{T}(Cmplex{T}(a, b), Cmplex{T}(c, d))
end

function DualComplex(a::T, b::T, c::T) where T <: Real
    DualComplex{T}(Cmplex{T}(a, b), Cmplex{T}(c, zero(T)))
end

function DualComplex(a::T, b::T) where T <: Real
    DualComplex{T}(Cmplex{T}(a, b), zero(Cmplex{T}))
end

function DualComplex(a::T) where T <: Real
    DualComplex{T}(Cmplex{T}(a, zero(T)), zero(Cmplex{T}))
end

function DualComplex(a::Real, b::Real)
    DualComplex(promote(a, b)...)
end

function DualComplex(a::Real, b::Real, c::Real)
    DualComplex(promote(a, b, c)...)
end

function DualComplex(a::Real, b::Real, c::Real, d::Real)
    DualComplex(promote(a, b, c, d)...)
end

"""
    unreal(z::DualComplex)

The unreal part of a dual-complex number is a 3-vector.
"""
function unreal(z::DualComplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::DualComplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", a: ")
    print(io, z.r.l)
    print(io, ", ia: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{DualComplex{T}}) where T <: Real
    DualComplex{T}(random(Cmplex{T}), random(Cmplex{T}))
end

function bari(z::DualComplex{T}) where T <: Real
    DualComplex{T}(bari(z.l), bari(z.r))
end

function bara(z::DualComplex{T}) where T <: Real
    DualComplex{T}(z.l, -(z.r))
end
