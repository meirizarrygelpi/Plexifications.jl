using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(TriPerplex(0, 0.0))
end

@test begin
    iszerodivisor(TriPerplex(0,1,1,0))
end

@test begin
    !iszerodivisor(TriPerplex(1,2,3,5))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(TriPerplex(a))
end

@test begin
    a = 1
    !isreal(TriPerplex(a, a))
end

@test begin
    z = random(TriPerplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(TriPerplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, TriPerplex(1, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1, R: 2, Q: 3, QR: 4, P: 5, PR: 6, PQ: 7, PQR: 8]"
    l == r
end

@test begin
    x = random(TriPerplex{BigFloat})
    y = random(TriPerplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    barR(barR(x)) == x
end

@test begin
    x = random(TriPerplex{BigInt})
    barQ(barQ(x)) == x
end

@test begin
    x = random(TriPerplex{BigInt})
    barP(barP(x)) == x
end

@test begin
    x = random(TriPerplex{BigInt})
    barQ(barR(x)) == barR(barQ(x))
end

@test begin
    x = random(TriPerplex{BigInt})
    barP(barR(x)) == barR(barP(x))
end

@test begin
    x = random(TriPerplex{BigInt})
    barQ(barP(x)) == barP(barQ(x))
end

@test begin
    x = random(TriPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barR(x * y)
    r = barR(x) * barR(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barR(x + y)
    r = barR(x) + barR(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barR(x - y)
    r = barR(x) - barR(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barQ(x * y)
    r = barQ(x) * barQ(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barQ(x + y)
    r = barQ(x) + barQ(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barQ(x - y)
    r = barQ(x) - barQ(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barP(x * y)
    r = barP(x) * barP(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barP(x + y)
    r = barP(x) + barP(y)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = barP(x - y)
    r = barP(x) - barP(y)
    l == r
end

@test begin
    x = random(TriPerplex{Rational{BigInt}})
    y = random(TriPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(TriPerplex{Rational{BigInt}})
    y = random(TriPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(TriPerplex{Rational{BigInt}})
    y = random(TriPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    n = norm(x)
    n > big(0) || n < big(0) || n == big(0)
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(TriPerplex(0, 0.0))
end

@test_throws ErrorException begin
    random(TriPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(TriPerplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(TriPerplex{BigInt})
    z == z + zero(TriPerplex{BigInt})
end

@test begin
    z = random(TriPerplex{BigInt})
    z == z * one(TriPerplex{BigInt})
end

@test begin
    z = random(TriPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(TriPerplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = commutator(x, y)
    r = zero(TriPerplex{BigInt})
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = alternatorL(x, y)
    r = zero(TriPerplex{BigInt})
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = alternatorR(x, y)
    r = zero(TriPerplex{BigInt})
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    l = flexator(x, y)
    r = zero(TriPerplex{BigInt})
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = associator(x, y, z)
    r = zero(TriPerplex{BigInt})
    l == r
end

@test begin
    x = random(TriPerplex{BigInt})
    y = random(TriPerplex{BigInt})
    z = random(TriPerplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = TriPerplex(Prplex(1,2))
    r = TriPerplex(1,2)
    l == r
end

@test begin
    l = TriPerplex(BiPerplex(1,2))
    r = TriPerplex(1,2,0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3.0)
    r = TriPerplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3, 4.0)
    r = TriPerplex(1.0, 2.0, 3.0, 4.0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3, 4, 5.0)
    r = TriPerplex(1.0, 2.0, 3.0, 4.0, 5.0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3, 4, 5, 6.0)
    r = TriPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3, 4, 5, 6, 7.0)
    r = TriPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0)
    l == r
end

@test begin
    l = TriPerplex(1, 2, 3, 4, 5, 6, 7, 8.0)
    r = TriPerplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    l == r
end
