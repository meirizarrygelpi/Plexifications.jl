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
    print(io, ", s: ")
    print(io, z.l.r)
    print(io, ", a: ")
    print(io, z.r.l)
    print(io, ", sa: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{DualPerplex{T}}) where T <: Real
    DualPerplex{T}(random(Prplex{T}), random(Prplex{T}))
end

function bars(z::DualPerplex{T}) where T <: Real
    DualPerplex{T}(bars(z.l), bars(z.r))
end

function bara(z::DualPerplex{T}) where T <: Real
    DualPerplex{T}(z.l, -(z.r))
end
