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
    print(io, ", i: ")
    print(io, z.l.r)
    print(io, ", J: ")
    print(io, z.r.l)
    print(io, ", iJ: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{BiComplex{T}}) where T <: Real
    BiComplex{T}(random(Cmplex{T}), random(Cmplex{T}))
end

function bari(z::BiComplex{T}) where T <: Real
    BiComplex{T}(bari(z.l), bari(z.r))
end

function barJ(z::BiComplex{T}) where T <: Real
    BiComplex{T}(z.l, -(z.r))
end
