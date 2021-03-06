"""
    DualPerplex{T <: Real} = Nilplexification{Prplex{T}}

A dual-perplex number is a nilplexification of the perplex numbers.
"""
const DualPerplex{T <: Real} = Nilplexification{Prplex{T}}

function DualPerplex(z::Prplex{T}) where T <: Real
    DualPerplex{T}(z, zero(Prplex{T}))
end

function DualPerplex(a::T, b::T, c::T, d::T) where T <: Real
    DualPerplex{T}(Prplex{T}(a, b), Prplex{T}(c, d))
end

function DualPerplex(a::T, b::T, c::T) where T <: Real
    DualPerplex{T}(Prplex{T}(a, b), Prplex{T}(c, zero(T)))
end

function DualPerplex(a::T, b::T) where T <: Real
    DualPerplex{T}(Prplex{T}(a, b), zero(Prplex{T}))
end

function DualPerplex(a::T) where T <: Real
    DualPerplex{T}(Prplex{T}(a, zero(T)), zero(Prplex{T}))
end

function DualPerplex(a::Real, b::Real)
    DualPerplex(promote(a, b)...)
end

function DualPerplex(a::Real, b::Real, c::Real)
    DualPerplex(promote(a, b, c)...)
end

function DualPerplex(a::Real, b::Real, c::Real, d::Real)
    DualPerplex(promote(a, b, c, d)...)
end

"""
    unreal(z::DualPerplex)

The unreal part of a dual-perplex number is a 3-vector.
"""
function unreal(z::DualPerplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::DualPerplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", R: ")
    print(io, z.l.r)
    print(io, ", A: ")
    print(io, z.r.l)
    print(io, ", RA: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{DualPerplex{T}}) where T <: Real
    DualPerplex{T}(random(Prplex{T}), random(Prplex{T}))
end

function barR(z::DualPerplex{T}) where T <: Real
    DualPerplex{T}(barR(z.l), barR(z.r))
end

function barA(z::DualPerplex{T}) where T <: Real
    DualPerplex{T}(z.l, -(z.r))
end

function quadrance(z::DualPerplex)
    (z * barA(z)).l
end

function norm(z::DualPerplex)
    abs2(quadrance(z))
end

function iszerodivisor(z::DualPerplex)
    iszerodivisor(quadrance(z))
end

function inv(z::DualPerplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    barA(z) * barR(q) / abs2(q)
end
