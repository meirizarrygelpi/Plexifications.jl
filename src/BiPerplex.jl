"""
    BiPerplex{T <: Real} = Perplexification{Prplex{T}}

A bi-perplex number is a perplexification of the perplex numbers.
"""
const BiPerplex{T <: Real} = Perplexification{Prplex{T}}

function BiPerplex(z::Prplex{T}) where T <: Real
    BiPerplex{T}(z, zero(Prplex{T}))
end

function BiPerplex(a::T, b::T, c::T, d::T) where T <: Real
    BiPerplex{T}(Prplex{T}(a, b), Prplex{T}(c, d))
end

function BiPerplex(a::T, b::T, c::T) where T <: Real
    BiPerplex{T}(Prplex{T}(a, b), Prplex{T}(c, zero(T)))
end

function BiPerplex(a::T, b::T) where T <: Real
    BiPerplex{T}(Prplex{T}(a, b), zero(Prplex{T}))
end

function BiPerplex(a::T) where T <: Real
    BiPerplex{T}(Prplex{T}(a, zero(T)), zero(Prplex{T}))
end

function BiPerplex(a::Real, b::Real)
    BiPerplex(promote(a, b)...)
end

function BiPerplex(a::Real, b::Real, c::Real)
    BiPerplex(promote(a, b, c)...)
end

function BiPerplex(a::Real, b::Real, c::Real, d::Real)
    BiPerplex(promote(a, b, c, d)...)
end

"""
    unreal(z::BiPerplex)

The unreal part of a bi-perplex number is a 3-vector.
"""
function unreal(z::BiPerplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::BiPerplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", R: ")
    print(io, z.l.r)
    print(io, ", Q: ")
    print(io, z.r.l)
    print(io, ", QR: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{BiPerplex{T}}) where T <: Real
    BiPerplex{T}(random(Prplex{T}), random(Prplex{T}))
end

function barR(z::BiComplex{T}) where T <: Real
    BiComplex{T}(barR(z.l), barR(z.r))
end

function barQ(z::BiPerplex{T}) where T <: Real
    BiPerplex{T}(z.l, -(z.r))
end
