using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(HyperPerplex(0, 0.0))
end

@test begin
    iszerodivisor(HyperPerplex(1,1,3,2))
end

@test begin
    !iszerodivisor(HyperPerplex(1,2,3,5))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(HyperPerplex(a))
end

@test begin
    a = 1
    !isreal(HyperPerplex(a, a))
end

@test begin
    z = random(HyperPerplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(HyperPerplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, HyperPerplex(1, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1, R: 2, A: 3, RA: 4, B: 5, RB: 6, AB: 7, RAB: 8]"
    l == r
end

@test begin
    x = random(HyperPerplex{BigFloat})
    y = random(HyperPerplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(HyperPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(HyperPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(HyperPerplex{BigInt})
    barB(barB(x)) == x
end

@test begin
    x = random(HyperPerplex{BigInt})
    barR(barR(x)) == x
end

@test begin
    x = random(HyperPerplex{BigInt})
    barB(barA(x)) == barA(barB(x))
end

@test begin
    x = random(HyperPerplex{BigInt})
    barR(barA(x)) == barA(barR(x))
end

@test begin
    x = random(HyperPerplex{BigInt})
    barB(barR(x)) == barR(barB(x))
end

@test begin
    x = random(HyperPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barB(x * y)
    r = barB(x) * barB(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barB(x + y)
    r = barB(x) + barB(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barB(x - y)
    r = barB(x) - barB(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barR(x * y)
    r = barR(x) * barR(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barR(x + y)
    r = barR(x) + barR(y)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = barR(x - y)
    r = barR(x) - barR(y)
    l == r
end

@test begin
    x = random(HyperPerplex{Rational{BigInt}})
    y = random(HyperPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(HyperPerplex{Rational{BigInt}})
    y = random(HyperPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(HyperPerplex{Rational{BigInt}})
    y = random(HyperPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(HyperPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(HyperPerplex(0, 0.0))
end

@test_throws ErrorException begin
    random(HyperPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(HyperPerplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(HyperPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(HyperPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(HyperPerplex{BigInt})
    z == z + zero(HyperPerplex{BigInt})
end

@test begin
    z = random(HyperPerplex{BigInt})
    z == z * one(HyperPerplex{BigInt})
end

@test begin
    z = random(HyperPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(HyperPerplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = commutator(x, y)
    r = zero(HyperPerplex{BigInt})
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = alternatorL(x, y)
    r = zero(HyperPerplex{BigInt})
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = alternatorR(x, y)
    r = zero(HyperPerplex{BigInt})
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    l = flexator(x, y)
    r = zero(HyperPerplex{BigInt})
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = associator(x, y, z)
    r = zero(HyperPerplex{BigInt})
    l == r
end

@test begin
    x = random(HyperPerplex{BigInt})
    y = random(HyperPerplex{BigInt})
    z = random(HyperPerplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = HyperPerplex(Prplex(1,2))
    r = HyperPerplex(1,2)
    l == r
end

@test begin
    l = HyperPerplex(DualPerplex(1,2))
    r = HyperPerplex(1,2,0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3.0)
    r = HyperPerplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3, 4.0)
    r = HyperPerplex(1.0, 2.0, 3.0, 4.0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3, 4, 5.0)
    r = HyperPerplex(1.0, 2.0, 3.0, 4.0, 5.0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3, 4, 5, 6.0)
    r = HyperPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3, 4, 5, 6, 7.0)
    r = HyperPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0)
    l == r
end

@test begin
    l = HyperPerplex(1, 2, 3, 4, 5, 6, 7, 8.0)
    r = HyperPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    l == r
end
