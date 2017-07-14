"""
    Nilplexification{T <: Number} <: Plexification{T}

A nilplexification as a pair.
"""
struct Nilplexification{T <: Number} <: Plexification{T}
    l::T
    r::T
end

function (==)(x::Nilplexification, y::Nilplexification)
    x.l == y.l && x.r == y.r
end

function real(z::Nilplexification)
    real(z.l)
end

function zero(::Type{Nilplexification{T}}) where T <: Number
    Nilplexification{T}(zero(T), zero(T))
end

function zero(::Nilplexification{T}) where T <: Number
    zero(Nilplexification{T})
end

function one(::Type{Nilplexification{T}}) where T <: Number
    Nilplexification{T}(one(T), zero(T))
end

function one(::Nilplexification{T}) where T <: Number
    one(Nilplexification{T})
end

function (-)(z::Nilplexification)
    Nilplexification(-(z.l), -(z.r))
end

function conj(z::Nilplexification)
    Nilplexification(conj(z.l), -(z.r))
end

function (+)(x::Nilplexification{T}, y::Nilplexification{T}) where T <: Number
    Nilplexification{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Nilplexification{T}) where T <: Number
    Nilplexification{T}(a + z.l, z.r)
end

function (+)(z::Nilplexification{T}, a::T) where T <: Number
    Nilplexification{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Nilplexification)
    Nilplexification(a + z.l, z.r)
end

function (+)(z::Nilplexification, a::Real)
    Nilplexification(z.l + a, z.r)
end

function (-)(x::Nilplexification{T}, y::Nilplexification{T}) where T <: Number
    Nilplexification{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Nilplexification{T}) where T <: Number
    Nilplexification{T}(a - z.l, -(z.r))
end

function (-)(z::Nilplexification{T}, a::T) where T <: Number
    Nilplexification{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Nilplexification)
    Nilplexification(a - z.l, -(z.r))
end

function (-)(z::Nilplexification, a::Real)
    Nilplexification(z.l - a, z.r)
end

function (*)(x::Nilplexification{T}, y::Nilplexification{T}) where T <: Number
    Nilplexification{T}(
        (x.l * y.l),
        (x.l * y.r) + (x.r * y.l)
    )
end

function (*)(a::T, z::Nilplexification{T}) where T <: Number
    Nilplexification{T}(a * z.l, a * z.r)
end

function (*)(z::Nilplexification{T}, a::T) where T <: Number
    Nilplexification{T}(z.l * a , z.r * a)
end

function (*)(a::Real, z::Nilplexification)
    Nilplexification(a * z.l, a * z.r)
end

function (*)(z::Nilplexification, a::Real)
    Nilplexification(z.l * a, z.r * a)
end

function (/)(z::Nilplexification, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Nilplexification(z.l / a, z.r / a)
end

function (\)(a::Real, z::Nilplexification)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Nilplexification(a \ z.l, a \ z.r)
end
