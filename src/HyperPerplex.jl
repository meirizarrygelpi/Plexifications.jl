"""
    HyperPerplex{T <: Real} = Nilplexification{DualPerplex{T}}

A hyper-perplex number is a nilplexification of dual-perplex numbers.
"""
const HyperPerplex{T <: Real} = Nilplexification{DualPerplex{T}}

function HyperPerplex(z::DualPerplex{T}) where T <: Real
    HyperPerplex{T}(z, zero(DualPerplex{T}))
end

function HyperPerplex(z::Prplex{T}) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(z, zero(Prplex{T})),
        zero(DualPerplex{T})
    )
end

function HyperPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        DualPerplex{T}(
            Prplex{T}(f, g),
            Prplex{T}(h, j)
        )
    )
end

function HyperPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        DualPerplex{T}(
            Prplex{T}(f, g),
            Prplex{T}(h, zero(T))
        )
    )
end

function HyperPerplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        DualPerplex{T}(
            Prplex{T}(f, g),
            zero(Prplex{T})
        )
    )
end

function HyperPerplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        DualPerplex{T}(
            Prplex{T}(f, zero(T)),
            zero(Prplex{T})
        )
    )
end

function HyperPerplex(a::T, b::T, c::T, d::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        zero(DualPerplex{T})
    )
end

function HyperPerplex(a::T, b::T, c::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, zero(T))
        ),
        zero(DualPerplex{T})
    )
end

function HyperPerplex(a::T, b::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, b),
            zero(Prplex{T})
        ),
        zero(DualPerplex{T})
    )
end

function HyperPerplex(a::T) where T <: Real
    HyperPerplex{T}(
        DualPerplex{T}(
            Prplex{T}(a, zero(T)),
            zero(Prplex{T})
        ),
        zero(DualPerplex{T})
    )
end

function HyperPerplex(a::Real, b::Real)
    HyperPerplex(promote(a, b)...)
end

function HyperPerplex(a::Real, b::Real, c::Real)
    HyperPerplex(promote(a, b, c)...)
end

function HyperPerplex(a::Real, b::Real, c::Real, d::Real)
    HyperPerplex(promote(a, b, c, d)...)
end

function HyperPerplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    HyperPerplex(promote(a, b, c, d, f)...)
end

function HyperPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    HyperPerplex(promote(a, b, c, d, f, g)...)
end

function HyperPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    HyperPerplex(promote(a, b, c, d, f, g, h)...)
end

function HyperPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    HyperPerplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::HyperPerplex)

The unreal part of a hyper-perplex number is a 7-vector.
"""
function unreal(z::HyperPerplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::HyperPerplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", R: ")
    print(io, z.l.l.r)
    print(io, ", A: ")
    print(io, z.l.r.l)
    print(io, ", RA: ")
    print(io, z.l.r.r)
    print(io, ", B: ")
    print(io, z.r.l.l)
    print(io, ", RB: ")
    print(io, z.r.l.r)
    print(io, ", AB: ")
    print(io, z.r.r.l)
    print(io, ", RAB: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{HyperPerplex{T}}) where T <: Real
    HyperPerplex{T}(random(DualPerplex{T}), random(DualPerplex{T}))
end

function barR(z::HyperPerplex{T}) where T <: Real
    HyperPerplex{T}(barR(z.l), barR(z.r))
end

function barA(z::HyperPerplex{T}) where T <: Real
    HyperPerplex{T}(barA(z.l), barA(z.r))
end

function barB(z::HyperPerplex{T}) where T <: Real
    HyperPerplex{T}(z.l, -(z.r))
end

function quadrance(z::HyperPerplex)
    (z * barB(z)).l
end

function norm(z::HyperPerplex)
    abs2(quadrance(quadrance(z)))
end

function iszerodivisor(z::HyperPerplex)
    iszerodivisor(quadrance(z))
end

function inv(z::HyperPerplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    qq = quadrance(q)
    barB(z) * (barA(q) * barR(qq)) / abs2(qq)
end
