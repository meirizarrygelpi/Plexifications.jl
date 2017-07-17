"""
    BiNilplex{T <: Real} = Nilplexification{Nlplex{T}}

A bi-nilplex number is a nilplexification of the nilplex numbers.
"""
const BiNilplex{T <: Real} = Nilplexification{Nlplex{T}}

function BiNilplex(z::Nlplex{T}) where T <: Real
    BiNilplex{T}(z, zero(Nlplex{T}))
end

function BiNilplex(a::T, b::T, c::T, d::T) where T <: Real
    BiNilplex{T}(Nlplex{T}(a, b), Nlplex{T}(c, d))
end

function BiNilplex(a::T, b::T, c::T) where T <: Real
    BiNilplex{T}(Nlplex{T}(a, b), Nlplex{T}(c, zero(T)))
end

function BiNilplex(a::T, b::T) where T <: Real
    BiNilplex{T}(Nlplex{T}(a, b), zero(Nlplex{T}))
end

function BiNilplex(a::T) where T <: Real
    BiNilplex{T}(Nlplex{T}(a, zero(T)), zero(Nlplex{T}))
end

function BiNilplex(a::Real, b::Real)
    BiNilplex(promote(a, b)...)
end

function BiNilplex(a::Real, b::Real, c::Real)
    BiNilplex(promote(a, b, c)...)
end

function BiNilplex(a::Real, b::Real, c::Real, d::Real)
    BiNilplex(promote(a, b, c, d)...)
end

"""
    unreal(z::BiNilplex)

The unreal part of a bi-nilplex number is a 3-vector.
"""
function unreal(z::BiNilplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::BiNilplex)
    print(io, "[1: ")
    print(io, z.l.l)
    print(io, ", a: ")
    print(io, z.l.r)
    print(io, ", b: ")
    print(io, z.r.l)
    print(io, ", ab: ")
    print(io, z.r.r)
    print(io, "]")
end

function random(::Type{BiNilplex{T}}) where T <: Real
    BiNilplex{T}(random(Nlplex{T}), random(Nlplex{T}))
end

function bara(z::BiNilplex{T}) where T <: Real
    BiNilplex{T}(bara(z.l), bara(z.r))
end

function barb(z::BiNilplex{T}) where T <: Real
    BiNilplex{T}(z.l, -(z.r))
end
