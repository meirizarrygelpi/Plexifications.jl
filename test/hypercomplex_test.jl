using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(HyperComplex(0, 0.0))
end

@test begin
    iszerodivisor(HyperComplex(0,0,1,2))
end

@test begin
    !iszerodivisor(HyperComplex(1,2,3,5))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(HyperComplex(a))
end

@test begin
    a = 1
    !isreal(HyperComplex(a, a))
end

@test begin
    z = random(HyperComplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(HyperComplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, HyperComplex(1, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1, H: 2, A: 3, HA: 4, B: 5, HB: 6, AB: 7, HAB: 8]"
    l == r
end

@test begin
    x = random(HyperComplex{BigFloat})
    y = random(HyperComplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(HyperComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(HyperComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(DualComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(HyperComplex{BigInt})
    barB(barB(x)) == x
end

@test begin
    x = random(HyperComplex{BigInt})
    barH(barH(x)) == x
end

@test begin
    x = random(HyperComplex{BigInt})
    barB(barA(x)) == barA(barB(x))
end

@test begin
    x = random(HyperComplex{BigInt})
    barH(barA(x)) == barA(barH(x))
end

@test begin
    x = random(HyperComplex{BigInt})
    barB(barH(x)) == barH(barB(x))
end

@test begin
    x = random(HyperComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barB(x * y)
    r = barB(x) * barB(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barB(x + y)
    r = barB(x) + barB(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barB(x - y)
    r = barB(x) - barB(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barH(x * y)
    r = barH(x) * barH(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barH(x + y)
    r = barH(x) + barH(y)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = barH(x - y)
    r = barH(x) - barH(y)
    l == r
end

@test begin
    x = random(HyperComplex{Rational{BigInt}})
    y = random(HyperComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(HyperComplex{Rational{BigInt}})
    y = random(HyperComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(HyperComplex{Rational{BigInt}})
    y = random(HyperComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(HyperComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(HyperComplex(0, 0.0))
end

@test_throws ErrorException begin
    random(HyperComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(HyperComplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(HyperComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(HyperComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(HyperComplex{BigInt})
    z == z + zero(HyperComplex{BigInt})
end

@test begin
    z = random(HyperComplex{BigInt})
    z == z * one(HyperComplex{BigInt})
end

@test begin
    z = random(HyperComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(HyperComplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = commutator(x, y)
    r = zero(HyperComplex{BigInt})
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = alternatorL(x, y)
    r = zero(HyperComplex{BigInt})
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = alternatorR(x, y)
    r = zero(HyperComplex{BigInt})
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    l = flexator(x, y)
    r = zero(HyperComplex{BigInt})
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = associator(x, y, z)
    r = zero(HyperComplex{BigInt})
    l == r
end

@test begin
    x = random(HyperComplex{BigInt})
    y = random(HyperComplex{BigInt})
    z = random(HyperComplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = HyperComplex(Cmplex(1,2))
    r = HyperComplex(1,2)
    l == r
end

@test begin
    l = HyperComplex(DualComplex(1,2))
    r = HyperComplex(1,2,0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3.0)
    r = HyperComplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3, 4.0)
    r = HyperComplex(1.0, 2.0, 3.0, 4.0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3, 4, 5.0)
    r = HyperComplex(1.0, 2.0, 3.0, 4.0, 5.0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3, 4, 5, 6.0)
    r = HyperComplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3, 4, 5, 6, 7.0)
    r = HyperComplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0)
    l == r
end

@test begin
    l = HyperComplex(1, 2, 3, 4, 5, 6, 7, 8.0)
    r = HyperComplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    l == r
end
