"""
    TriComplex{T <: Real} = Complexification{BiComplex{T}}

A tri-complex number is a complexification of bi-complex numbers.
"""
const TriComplex{T <: Real} = Complexification{BiComplex{T}}

function TriComplex(z::BiComplex{T}) where T <: Real
    TriComplex{T}(z, zero(BiComplex{T}))
end

function TriComplex(z::Cmplex{T}) where T <: Real
    TriComplex{T}(
        BiComplex{T}(z, zero(Cmplex{T})),
        zero(BiComplex{T})
    )
end

function TriComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        BiComplex{T}(
            Cmplex{T}(f, g),
            Cmplex{T}(h, j)
        )
    )
end

function TriComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        BiComplex{T}(
            Cmplex{T}(f, g),
            Cmplex{T}(h, zero(T))
        )
    )
end

function TriComplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        BiComplex{T}(
            Cmplex{T}(f, g),
            zero(Cmplex{T})
        )
    )
end

function TriComplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        BiComplex{T}(
            Cmplex{T}(f, zero(T)),
            zero(Cmplex{T})
        )
    )
end

function TriComplex(a::T, b::T, c::T, d::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        zero(BiComplex{T})
    )
end

function TriComplex(a::T, b::T, c::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, zero(T))
        ),
        zero(BiComplex{T})
    )
end

function TriComplex(a::T, b::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, b),
            zero(Cmplex{T})
        ),
        zero(BiComplex{T})
    )
end

function TriComplex(a::T) where T <: Real
    TriComplex{T}(
        BiComplex{T}(
            Cmplex{T}(a, zero(T)),
            zero(Cmplex{T})
        ),
        zero(BiComplex{T})
    )
end

function TriComplex(a::Real, b::Real)
    TriComplex(promote(a, b)...)
end

function TriComplex(a::Real, b::Real, c::Real)
    TriComplex(promote(a, b, c)...)
end

function TriComplex(a::Real, b::Real, c::Real, d::Real)
    TriComplex(promote(a, b, c, d)...)
end

function TriComplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    TriComplex(promote(a, b, c, d, f)...)
end

function TriComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    TriComplex(promote(a, b, c, d, f, g)...)
end

function TriComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    TriComplex(promote(a, b, c, d, f, g, h)...)
end

function TriComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    TriComplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::TriComplex)

The unreal part of a tri-complex number is a 7-vector.
"""
function unreal(z::TriComplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::TriComplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", i: ")
    print(io, z.l.l.r)
    print(io, ", J: ")
    print(io, z.l.r.l)
    print(io, ", iJ: ")
    print(io, z.l.r.r)
    print(io, ", K: ")
    print(io, z.r.l.l)
    print(io, ", iK: ")
    print(io, z.r.l.r)
    print(io, ", JK: ")
    print(io, z.r.r.l)
    print(io, ", iJK: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{TriComplex{T}}) where T <: Real
    TriComplex{T}(random(BiComplex{T}), random(BiComplex{T}))
end

function bari(z::TriComplex{T}) where T <: Real
    TriComplex{T}(bari(z.l), bari(z.r))
end

function barJ(z::TriComplex{T}) where T <: Real
    TriComplex{T}(barJ(z.l), barJ(z.r))
end

function barK(z::TriComplex{T}) where T <: Real
    TriComplex{T}(z.l, -(z.r))
end
