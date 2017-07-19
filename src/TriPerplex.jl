"""
    TriPerplex{T <: Real} = Perplexification{BiPerplex{T}}

A tri-perplex number is a complexification of bi-perplex numbers.
"""
const TriPerplex{T <: Real} = Perplexification{BiPerplex{T}}

function TriPerplex(z::BiPerplex{T}) where T <: Real
    TriPerplex{T}(z, zero(BiPerplex{T}))
end

function TriPerplex(z::Prplex{T}) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(z, zero(Prplex{T})),
        zero(BiPerplex{T})
    )
end

function TriPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T, j::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        BiPerplex{T}(
            Prplex{T}(f, g),
            Prplex{T}(h, j)
        )
    )
end

function TriPerplex(a::T, b::T, c::T, d::T, f::T, g::T, h::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        BiPerplex{T}(
            Prplex{T}(f, g),
            Prplex{T}(h, zero(T))
        )
    )
end

function TriPerplex(a::T, b::T, c::T, d::T, f::T, g::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        BiPerplex{T}(
            Prplex{T}(f, g),
            zero(Prplex{T})
        )
    )
end

function TriPerplex(a::T, b::T, c::T, d::T, f::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        BiPerplex{T}(
            Prplex{T}(f, zero(T)),
            zero(Prplex{T})
        )
    )
end

function TriPerplex(a::T, b::T, c::T, d::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, d)
        ),
        zero(BiPerplex{T})
    )
end

function TriPerplex(a::T, b::T, c::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            Prplex{T}(c, zero(T))
        ),
        zero(BiPerplex{T})
    )
end

function TriPerplex(a::T, b::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, b),
            zero(Prplex{T})
        ),
        zero(BiPerplex{T})
    )
end

function TriPerplex(a::T) where T <: Real
    TriPerplex{T}(
        BiPerplex{T}(
            Prplex{T}(a, zero(T)),
            zero(Prplex{T})
        ),
        zero(BiPerplex{T})
    )
end

function TriPerplex(a::Real, b::Real)
    TriPerplex(promote(a, b)...)
end

function TriPerplex(a::Real, b::Real, c::Real)
    TriPerplex(promote(a, b, c)...)
end

function TriPerplex(a::Real, b::Real, c::Real, d::Real)
    TriPerplex(promote(a, b, c, d)...)
end

function TriPerplex(a::Real, b::Real, c::Real, d::Real, f::Real)
    TriPerplex(promote(a, b, c, d, f)...)
end

function TriPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real)
    TriPerplex(promote(a, b, c, d, f, g)...)
end

function TriPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real)
    TriPerplex(promote(a, b, c, d, f, g, h)...)
end

function TriPerplex(a::Real, b::Real, c::Real, d::Real, f::Real, g::Real, h::Real, j::Real)
    TriPerplex(promote(a, b, c, d, f, g, h, j)...)
end

"""
    unreal(z::TriPerplex)

The unreal part of a tri-perplex number is a 7-vector.
"""
function unreal(z::TriPerplex)
    vcat(unreal(z.l), array(z.r))
end

function show(io::IO, z::TriPerplex)
    print(io, "[1: ")
    print(io, z.l.l.l)
    print(io, ", R: ")
    print(io, z.l.l.r)
    print(io, ", Q: ")
    print(io, z.l.r.l)
    print(io, ", QR: ")
    print(io, z.l.r.r)
    print(io, ", P: ")
    print(io, z.r.l.l)
    print(io, ", PR: ")
    print(io, z.r.l.r)
    print(io, ", PQ: ")
    print(io, z.r.r.l)
    print(io, ", PQR: ")
    print(io, z.r.r.r)
    print(io, "]")
end

function random(::Type{TriPerplex{T}}) where T <: Real
    TriPerplex{T}(random(BiPerplex{T}), random(BiPerplex{T}))
end

function barR(z::TriPerplex{T}) where T <: Real
    TriPerplex{T}(barR(z.l), barR(z.r))
end

function barQ(z::TriPerplex{T}) where T <: Real
    TriPerplex{T}(barQ(z.l), barQ(z.r))
end

function barP(z::TriPerplex{T}) where T <: Real
    TriPerplex{T}(z.l, -(z.r))
end

function quadrance(z::TriPerplex)
    (z * barP(z)).l
end

function norm(z::TriPerplex)
    abs2(quadrance(quadrance(z)))
end

function iszerodivisor(z::TriPerplex)
    iszerodivisor(quadrance(z))
end

function inv(z::TriPerplex)
    if iszerodivisor(z)
        error(ZeroDivisorInverse)
    end

    q = quadrance(z)
    qq = quadrance(q)
    barP(z) * (barQ(q) * barR(qq)) / abs2(qq)
end
