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
    print(io, ", H: ")
    print(io, z.l.l.r)
    print(io, ", G: ")
    print(io, z.l.r.l)
    print(io, ", GH: ")
    print(io, z.l.r.r)
    print(io, ", F: ")
    print(io, z.r.l.l)
    print(io, ", FH: ")
    print(io, z.r.l.r)
    print(io, ", FG: ")
    print(io, z.r.r.l)
    print(io, ", FGH: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{TriComplex{T}}) where T <: Real
    TriComplex{T}(random(BiComplex{T}), random(BiComplex{T}))
end

function barH(z::TriComplex{T}) where T <: Real
    TriComplex{T}(barH(z.l), barH(z.r))
end

function barG(z::TriComplex{T}) where T <: Real
    TriComplex{T}(barG(z.l), barG(z.r))
end

function barF(z::TriComplex{T}) where T <: Real
    TriComplex{T}(z.l, -(z.r))
end

function quadrance(z::TriComplex)
    (z * barF(z)).l
end

function norm(z::TriComplex)
    abs2(quadrance(quadrance(z)))
end

function iszerodivisor(z::TriComplex)
    iszerodivisor(quadrance(z))
end

function inv(z::TriComplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    qq = quadrance(q)
    barF(z) * (barG(q) * barH(qq)) / abs2(qq)
end
