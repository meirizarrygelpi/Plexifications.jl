using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(DualComplex(0, 0.0))
end

@test begin
    !iszerodivisor(DualComplex(1,2,3,4))
end

@test begin
    iszerodivisor(DualComplex(0,0,3,4))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(DualComplex(a))
end

@test begin
    a = 1
    !isreal(DualComplex(a, a))
end

@test begin
    z = random(DualComplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(DualComplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, DualComplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, H: 2, A: 3, HA: 4]"
    l == r
end

@test begin
    x = random(DualComplex{BigFloat})
    y = random(DualComplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(DualComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(DualComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(DualComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(DualComplex{BigInt})
    barH(barH(x)) == x
end

@test begin
    x = random(DualComplex{BigInt})
    barH(barA(x)) == barA(barH(x))
end

@test begin
    x = random(DualComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barH(x * y)
    r = barH(x) * barH(y)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barH(x + y)
    r = barH(x) + barH(y)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = barH(x - y)
    r = barH(x) - barH(y)
    l == r
end

@test begin
    x = random(DualComplex{Rational{BigInt}})
    y = random(DualComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(DualComplex{Rational{BigInt}})
    y = random(DualComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(DualComplex{Rational{BigInt}})
    y = random(DualComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(DualComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(DualComplex(0, 0.0))
end

@test_throws ErrorException begin
    random(DualComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(DualComplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(DualComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(DualComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(DualComplex{BigInt})
    z == z + zero(DualComplex{BigInt})
end

@test begin
    z = random(DualComplex{BigInt})
    z == z * one(DualComplex{BigInt})
end

@test begin
    z = random(DualComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(DualComplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = commutator(x, y)
    r = zero(DualComplex{BigInt})
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = alternatorL(x, y)
    r = zero(DualComplex{BigInt})
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = alternatorR(x, y)
    r = zero(DualComplex{BigInt})
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    l = flexator(x, y)
    r = zero(DualComplex{BigInt})
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = associator(x, y, z)
    r = zero(DualComplex{BigInt})
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(DualComplex{BigInt})
    z = random(DualComplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = DualComplex(Cmplex(1,2))
    r = DualComplex(1,2,0)
    l == r
end

@test begin
    l = DualComplex(1, 2, 3, 4.0)
    r = DualComplex(1.0, 2.0, 3.0, 4.0)
    l == r
end
