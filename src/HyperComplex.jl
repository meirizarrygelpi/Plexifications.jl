"""
    HyperComplex{T <: Real} = Nilplexification{DualComplex{T}}

A hyper-complex number is a nilplexification of dual-complex numbers.
"""
const HyperComplex{T <: Real} = Nilplexification{DualComplex{T}}

function HyperComplex(z::DualComplex{T}) where T <: Real
    HyperComplex{T}(z, zero(DualComplex{T}))
end

function HyperComplex(z::Cmplex{T}) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(z, zero(Cmplex{T})),
        zero(DualComplex{T})
    )
end

function HyperComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        DualComplex{T}(
            Cmplex{T}(f, g),
            Cmplex{T}(h, j)
        )
    )
end

function HyperComplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        DualComplex{T}(
            Cmplex{T}(f, g),
            Cmplex{T}(h, zero(T))
        )
    )
end

function HyperComplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        DualComplex{T}(
            Cmplex{T}(f, g),
            zero(Cmplex{T})
        )
    )
end

function HyperComplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        DualComplex{T}(
            Cmplex{T}(f, zero(T)),
            zero(Cmplex{T})
        )
    )
end

function HyperComplex(a::T, b::T, c::T, d::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, d)
        ),
        zero(DualComplex{T})
    )
end

function HyperComplex(a::T, b::T, c::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            Cmplex{T}(c, zero(T))
        ),
        zero(DualComplex{T})
    )
end

function HyperComplex(a::T, b::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, b),
            zero(Cmplex{T})
        ),
        zero(DualComplex{T})
    )
end

function HyperComplex(a::T) where T <: Real
    HyperComplex{T}(
        DualComplex{T}(
            Cmplex{T}(a, zero(T)),
            zero(Cmplex{T})
        ),
        zero(DualComplex{T})
    )
end

function HyperComplex(a::Real, b::Real)
    HyperComplex(promote(a, b)...)
end

function HyperComplex(a::Real, b::Real, c::Real)
    HyperComplex(promote(a, b, c)...)
end

function HyperComplex(a::Real, b::Real, c::Real, d::Real)
    HyperComplex(promote(a, b, c, d)...)
end

function HyperComplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    HyperComplex(promote(a, b, c, d, f)...)
end

function HyperComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    HyperComplex(promote(a, b, c, d, f, g)...)
end

function HyperComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    HyperComplex(promote(a, b, c, d, f, g, h)...)
end

function HyperComplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    HyperComplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::HyperComplex)

The unreal part of a hyper-complex number is a 7-vector.
"""
function unreal(z::HyperComplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::HyperComplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", H: ")
    print(io, z.l.l.r)
    print(io, ", A: ")
    print(io, z.l.r.l)
    print(io, ", HA: ")
    print(io, z.l.r.r)
    print(io, ", B: ")
    print(io, z.r.l.l)
    print(io, ", HB: ")
    print(io, z.r.l.r)
    print(io, ", AB: ")
    print(io, z.r.r.l)
    print(io, ", HAB: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{HyperComplex{T}}) where T <: Real
    HyperComplex{T}(random(DualComplex{T}), random(DualComplex{T}))
end

function barH(z::HyperComplex{T}) where T <: Real
    HyperComplex{T}(barH(z.l), barH(z.r))
end

function barA(z::HyperComplex{T}) where T <: Real
    HyperComplex{T}(barA(z.l), barA(z.r))
end

function barB(z::HyperComplex{T}) where T <: Real
    HyperComplex{T}(z.l, -(z.r))
end

function quadrance(z::HyperComplex)
    (z * barB(z)).l
end

function norm(z::HyperComplex)
    abs2(quadrance(quadrance(z)))
end

function iszerodivisor(z::HyperComplex)
    iszerodivisor(quadrance(z))
end

function inv(z::HyperComplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    qq = quadrance(q)
    barB(z) * (barA(q) * barH(qq)) / abs2(qq)
end
