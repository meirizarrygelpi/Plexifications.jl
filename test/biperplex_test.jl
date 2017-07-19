using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(BiPerplex(0, 0.0))
end

@test begin
    !iszerodivisor(BiPerplex(0,1,2,0))
end

@test begin
    iszerodivisor(BiPerplex(1,2,3,4))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(BiPerplex(a))
end

@test begin
    a = 1
    !isreal(BiPerplex(a, a))
end

@test begin
    z = random(BiPerplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(BiPerplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, BiPerplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, R: 2, Q: 3, QR: 4]"
    l == r
end

@test begin
    x = random(BiPerplex{BigFloat})
    y = random(BiPerplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    barR(barR(x)) == x
end

@test begin
    x = random(BiPerplex{BigInt})
    barQ(barQ(x)) == x
end

@test begin
    x = random(BiPerplex{BigInt})
    barQ(barR(x)) == barR(barQ(x))
end

@test begin
    x = random(BiPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barR(x * y)
    r = barR(x) * barR(y)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barR(x + y)
    r = barR(x) + barR(y)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barR(x - y)
    r = barR(x) - barR(y)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barQ(x * y)
    r = barQ(x) * barQ(y)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barQ(x + y)
    r = barQ(x) + barQ(y)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = barQ(x - y)
    r = barQ(x) - barQ(y)
    l == r
end

@test begin
    x = random(BiPerplex{Rational{BigInt}})
    y = random(BiPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiPerplex{Rational{BigInt}})
    y = random(BiPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiPerplex{Rational{BigInt}})
    y = random(BiPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    n = norm(x)
    n > big(0) || n < big(0) || n == big(0)
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiPerplex(0, 0.0))
end

@test_throws ErrorException begin
    random(BiPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiPerplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiPerplex{BigInt})
    z == z + zero(BiPerplex{BigInt})
end

@test begin
    z = random(BiPerplex{BigInt})
    z == z * one(BiPerplex{BigInt})
end

@test begin
    z = random(BiPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiPerplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = commutator(x, y)
    r = zero(BiPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = alternatorL(x, y)
    r = zero(BiPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = alternatorR(x, y)
    r = zero(BiPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    l = flexator(x, y)
    r = zero(BiPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = associator(x, y, z)
    r = zero(BiPerplex{BigInt})
    l == r
end

@test begin
    x = random(BiPerplex{BigInt})
    y = random(BiPerplex{BigInt})
    z = random(BiPerplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = BiPerplex(Prplex(1,2))
    r = BiPerplex(1,2,0)
    l == r
end

@test begin
    l = BiPerplex(1, 2, 3.0)
    r = BiPerplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = BiPerplex(1, 2, 3, 4.0)
    r = BiPerplex(1.0, 2.0, 3.0, 4.0)
    l == r
end
