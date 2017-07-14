"""
    Complexification{T <: Number} <: Plexification{T}

A complexification as a pair.
"""
struct Complexification{T <: Number} <: Plexification{T}
    l::T
    r::T
end

function (==)(x::Complexification, y::Complexification)
    x.l == y.l && x.r == y.r
end

function real(z::Complexification)
    real(z.l)
end

function zero(::Type{Complexification{T}}) where T <: Number
    Complexification{T}(zero(T), zero(T))
end

function zero(::Complexification{T}) where T <: Number
    zero(Complexification{T})
end

function one(::Type{Complexification{T}}) where T <: Number
    Complexification{T}(one(T), zero(T))
end

function one(::Complexification{T}) where T <: Number
    one(Complexification{T})
end

function (-)(z::Complexification)
    Complexification(-(z.l), -(z.r))
end

function conj(z::Complexification)
    Complexification(conj(z.l), -(z.r))
end

function (+)(x::Complexification{T}, y::Complexification{T}) where T <: Number
    Complexification{T}(x.l + y.l, x.r + y.r)
end

function (+)(a::T, z::Complexification{T}) where T <: Number
    Complexification{T}(a + z.l, z.r)
end

function (+)(z::Complexification{T}, a::T) where T <: Number
    Complexification{T}(z.l + a, z.r)
end

function (+)(a::Real, z::Complexification)
    Complexification(a + z.l, z.r)
end

function (+)(z::Complexification, a::Real)
    Complexification(z.l + a, z.r)
end

function (-)(x::Complexification{T}, y::Complexification{T}) where T <: Number
    Complexification{T}(x.l - y.l, x.r - y.r)
end

function (-)(a::T, z::Complexification{T}) where T <: Number
    Complexification{T}(a - z.l, -(z.r))
end

function (-)(z::Complexification{T}, a::T) where T <: Number
    Complexification{T}(z.l - a, z.r)
end

function (-)(a::Real, z::Complexification)
    Complexification(a - z.l, -(z.r))
end

function (-)(z::Complexification, a::Real)
    Complexification(z.l - a, z.r)
end

function (*)(x::Complexification{T}, y::Complexification{T}) where T <: Number
    Complexification{T}(
        (x.l * y.l) - (x.r * y.r),
        (x.l * y.r) + (x.r * y.l)
    )
end

function (*)(a::T, z::Complexification{T}) where T <: Number
    Complexification{T}(a * z.l, a * z.r)
end

function (*)(z::Complexification{T}, a::T) where T <: Number
    Complexification{T}(z.l * a , z.r * a)
end

function (*)(a::Real, z::Complexification)
    Complexification(a * z.l, a * z.r)
end

function (*)(z::Complexification, a::Real)
    Complexification(z.l * a, z.r * a)
end

function (/)(z::Complexification, a::Real)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Complexification(z.l / a, z.r / a)
end

function (\)(a::Real, z::Complexification)
    if iszero(a)
        error(ZeroDenominator)
    end
    
    Complexification(a \ z.l, a \ z.r)
end
