"""
    TriNilplex{T <: Real} = Nilplexification{BiNilplex{T}}

A tri-nilplex number is a complexification of bi-nilplex numbers.
"""
const TriNilplex{T <: Real} = Nilplexification{BiNilplex{T}}

function TriNilplex(z::BiNilplex{T}) where T <: Real
    TriNilplex{T}(z, zero(BiNilplex{T}))
end

function TriNilplex(z::Nlplex{T}) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(z, zero(Nlplex{T})),
        zero(BiNilplex{T})
    )
end

function TriNilplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, d)
        ),
        BiNilplex{T}(
            Nlplex{T}(f, g),
            Nlplex{T}(h, j)
        )
    )
end

function TriNilplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, d)
        ),
        BiNilplex{T}(
            Nlplex{T}(f, g),
            Nlplex{T}(h, zero(T))
        )
    )
end

function TriNilplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, d)
        ),
        BiNilplex{T}(
            Nlplex{T}(f, g),
            zero(Nlplex{T})
        )
    )
end

function TriNilplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, d)
        ),
        BiNilplex{T}(
            Nlplex{T}(f, zero(T)),
            zero(Nlplex{T})
        )
    )
end

function TriNilplex(a::T, b::T, c::T, d::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, d)
        ),
        zero(BiNilplex{T})
    )
end

function TriNilplex(a::T, b::T, c::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            Nlplex{T}(c, zero(T))
        ),
        zero(BiNilplex{T})
    )
end

function TriNilplex(a::T, b::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, b),
            zero(Nlplex{T})
        ),
        zero(BiNilplex{T})
    )
end

function TriNilplex(a::T) where T <: Real
    TriNilplex{T}(
        BiNilplex{T}(
            Nlplex{T}(a, zero(T)),
            zero(Nlplex{T})
        ),
        zero(BiNilplex{T})
    )
end

function TriNilplex(a::Real, b::Real)
    TriNilplex(promote(a, b)...)
end

function TriNilplex(a::Real, b::Real, c::Real)
    TriNilplex(promote(a, b, c)...)
end

function TriNilplex(a::Real, b::Real, c::Real, d::Real)
    TriNilplex(promote(a, b, c, d)...)
end

function TriNilplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    TriNilplex(promote(a, b, c, d, f)...)
end

function TriNilplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    TriNilplex(promote(a, b, c, d, f, g)...)
end

function TriNilplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    TriNilplex(promote(a, b, c, d, f, g, h)...)
end

function TriNilplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    TriNilplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::TriNilplex)

The unreal part of a tri-nilplex number is a 7-vector.
"""
function unreal(z::TriNilplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::TriNilplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", A: ")
    print(io, z.l.l.r)
    print(io, ", B: ")
    print(io, z.l.r.l)
    print(io, ", AB: ")
    print(io, z.l.r.r)
    print(io, ", C: ")
    print(io, z.r.l.l)
    print(io, ", AC: ")
    print(io, z.r.l.r)
    print(io, ", BC: ")
    print(io, z.r.r.l)
    print(io, ", ABC: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{TriNilplex{T}}) where T <: Real
    TriNilplex{T}(random(BiNilplex{T}), random(BiNilplex{T}))
end

function barA(z::TriNilplex{T}) where T <: Real
    TriNilplex{T}(barA(z.l), barA(z.r))
end

function barB(z::TriNilplex{T}) where T <: Real
    TriNilplex{T}(barB(z.l), barB(z.r))
end

function barC(z::TriNilplex{T}) where T <: Real
    TriNilplex{T}(z.l, -(z.r))
end

function quadrance(z::TriNilplex)
    (z * barC(z)).l
end

function norm(z::TriNilplex)
    abs2(quadrance(quadrance(z)))
end

function iszerodivisor(z::TriNilplex)
    iszerodivisor(quadrance(z))
end

function inv(z::TriNilplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    qq = quadrance(q)
    barC(z) * (barB(q) * barA(qq)) / abs2(qq)
end
