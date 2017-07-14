"""
    Plexification{T <: Number} <: Number

An abstract plexification.
"""
abstract type Plexification{T <: Number} <: Number end

"""
    unreal(::T) where T <: Real

The unreal part of a real number is an empty array.
"""
function unreal(::T) where T <: Real
    T[]
end

"""
    array(z::Plexification) -> Array

Return an array with all the `Real` components of `z`.
"""
function array(z::Plexification)
    vcat(real(z), unreal(z))
end

"""
    iszerodivisor(a::Real) -> Bool

Return `true` if a is zero. Equivalent to `iszero(a)`.
"""
function iszerodivisor(a::Real)
    iszero(a)
end

"""
    iszero(z::Plexification) -> Bool

Return `true` if all `Real` components of `z` are zero.
"""
function iszero(z::Plexification)
    iszero(array(z))
end

"""
    isreal(z::Plexification) -> Bool

Return `true` if the unreal part of `z` is zero.
"""
function isreal(z::Plexification)
    iszero(unreal(z))
end

"""
    (+)(z::Plexification)

The identity operation on Cayley-Dickson constructs.
"""
function (+)(z::Plexification)
    z
end

"""
    commutator(x::Plexification, y::Plexification)

Measure the failure of commutativity of the multiplication operation:
```julia
    (x * y) - (y * x)
```
If `commutator(x, y)` is zero, then the multiplication operation is commutative.
"""
function commutator(x::Plexification, y::Plexification)
    (x * y) - (y * x)
end

"""
    associator(x::Plexification, y::Plexification, z::Plexification)

Measure the failure of associativity of the multiplication operation:
```julia
    ((x * y) * z) - (x * (y * z))
```
If `associator(x, y, z)` is zero, then the multiplication operation is associative.
"""
function associator(x::Plexification, y::Plexification, z::Plexification)
    ((x * y) * z) - (x * (y * z))
end

"""
    jacobiator(x::Plexification, y::Plexification, z::Plexification)

Measure the failure of the multiplication operation to satisfy the Jacobi identity:
```julia
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
```
If `jacobiator(x, y, z)` is zero, then the multiplication operation satisfies the Jacobi
identity.
"""
function jacobiator(x::Plexification, y::Plexification, z::Plexification)
    ((x * y) * z) + ((z * x) * y) + ((y * z) * x)
end

"""
    alternatorL(x::Plexification, y::Plexification)

Measure the failure of the multiplication operation to be left-alternative:
```julia
    ((x * x) * y) - (x * (x * y))
```
If `alternatorL(x, y)` is zero, then the multiplication operation is left-alternative.
"""
function alternatorL(x::Plexification, y::Plexification)
    associator(x, x, y)
end

"""
    alternatorR(x::Plexification, y::Plexification)

Measure the failure of the multiplication operation to be right-alternative:
```julia
    ((x * y) * y) - (x * (y * y))
```
If `alternatorR(x, y)` is zero, then the multiplication operation is right-alternative.
"""
function alternatorR(x::Plexification, y::Plexification)
    associator(x, y, y)
end

"""
    flexator(x::Plexification, y::Plexification)

Measure the failure of the multiplication operation to be flexible:
```julia
    ((x * y) * x) - (x * (y * x))
```
If `flexator(x, y)` is zero, then the multiplication operation is flexible.
"""
function flexator(x::Plexification, y::Plexification)
    associator(x, y, x)
end

"""
    (/)(x::Plexification, y::Plexification)

Naive right quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the right by the inverse of `y`.
"""
function (/)(x::Plexification, y::Plexification)
    x * inv(y)
end

"""
    (\\)(y::Plexification, x::Plexification)

Naive left quotient of two Cayley-Dickson constructs.
Equivalent to multiplying `x` on the left by the inverse of `y`.
"""
function (\)(y::Plexification, x::Plexification)
    inv(y) * x
end

"""
    (/)(a::Real, z::Plexification)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (/)(a::Real, z::Plexification)
    a * inv(z)
end

"""
    (\\)(z::Plexification, a::Real)

Equivalent to multiplying the inverse of `z` by `a`.
"""
function (\)(z::Plexification, a::Real)
    inv(z) * a
end
