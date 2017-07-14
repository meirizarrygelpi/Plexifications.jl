"""
    Perplexification{T <: Number} <: Plexification{T}

A perplexification as a pair.
"""
struct Perplexification{T <: Number} <: Plexification{T}
    l::T
    r::T
end

function (==)(x::Perplexification, y::Perplexification)
    x.l == y.l && x.r == y.r
end

function real(z::Perplexification)
    real(z.l)
end

function zero(::Type{Perplexification{T}}) where T <: Number
    Perplexification{T}(zero(T), zero(T))
end

function zero(::Perplexification{T}) where T <: Number
    zero(Perplexification{T})
end

function one(::Type{Perplexification{T}}) where T <: Number
    Perplexification{T}(one(T), zero(T))
end

function one(::Perplexification{T}) where T <: Number
    one(Perplexification{T})
end

function (-)(z::Perplexification)
    Perplexification(-(z.l), -(z.r))
end

function conj(z::Perplexification)
    Perplexification(conj(z.l), -(z.r))
end

function (+)(x::Perplexification{T}, y::Perplexification{T}) where T <: Number
    Perplexification{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Perplexification{T}) where T <: Number
    Perplexification{T}(a + z.l, z.r)
end

function (+)(z::Perplexification{T}, a::T) where T <: Number
    Perplexification{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Perplexification)
    Perplexification(a + z.l, z.r)
end

function (+)(z::Perplexification, a::Real)
    Perplexification(z.l + a, z.r)
end

function (-)(x::Perplexification{T}, y::Perplexification{T}) where T <: Number
    Perplexification{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Perplexification{T}) where T <: Number
    Perplexification{T}(a - z.l, -(z.r))
end

function (-)(z::Perplexification{T}, a::T) where T <: Number
    Perplexification{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Perplexification)
    Perplexification(a - z.l, -(z.r))
end

function (-)(z::Perplexification, a::Real)
    Perplexification(z.l - a, z.r)
end

function (*)(x::Perplexification{T}, y::Perplexification{T}) where T <: Number
    Perplexification{T}(
        (x.l * y.l) + (x.r * y.r),
        (x.l * y.r) + (x.r * y.l)
    )
end

function (*)(a::T, z::Perplexification{T}) where T <: Number
    Perplexification{T}(a * z.l, a * z.r)
end

function (*)(z::Perplexification{T}, a::T) where T <: Number
    Perplexification{T}(z.l * a , z.r * a)
end

function (*)(a::Real, z::Perplexification)
    Perplexification(a * z.l, a * z.r)
end

function (*)(z::Perplexification, a::Real)
    Perplexification(z.l * a, z.r * a)
end

function (/)(z::Perplexification, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Perplexification(z.l / a, z.r / a)
end

function (\)(a::Real, z::Perplexification)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Perplexification(a \ z.l, a \ z.r)
end
